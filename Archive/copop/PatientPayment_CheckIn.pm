# $ATHENA_HOME/perllib/Athena/PatientPayment/CheckIn.pm (GenerateCollectPaymentHTML)

sub GenerateCollectPaymentHTML : CoveredByAPI("Athena::View::Collector::API::PassThrough::GenerateCollectPaymentHTML") {
	my ($dbh, $args) = @_;
	AssertFields($args, ["PATIENTID"], [qw(APPOINTMENTID PRIMARYPATIENTINSURANCEID PAGE EPAYMENT PATIENTSTATEMENTDATA OUTSTANDINGDATA ISVISIT)]);

	my $patientid = $args->{PATIENTID};
	my $appointmentid = $args->{APPOINTMENTID};
	my $primarypatientinsuranceid = $args->{PRIMARYPATIENTINSURANCEID};
	my $page =  $args->{PAGE};
	my $epayment = $args->{EPAYMENT};
	my $patientstatementdata = $args->{PATIENTSTATEMENTDATA};
	my $outstandingdata = $args->{OUTSTANDINGDATA};
	my $isvisit = $args->{ISVISIT};

	use Data::Dumper;
	warn "percy: CheckIn.pm: GenerateCollectPaymentHTML: patientid: ",Dumper($patientid),"\n";
	warn "percy: CheckIn.pm: GenerateCollectPaymentHTML: appointmentid: ",Dumper($appointmentid),"\n";
	warn "percy: CheckIn.pm: GenerateCollectPaymentHTML: primarypatientinsuranceid: ",Dumper($primarypatientinsuranceid),"\n";
	warn "percy: CheckIn.pm: GenerateCollectPaymentHTML: page: ",Dumper($page),"\n";
	warn "percy: CheckIn.pm: GenerateCollectPaymentHTML: epayment: ",Dumper($epayment),"\n";
	warn "percy: CheckIn.pm: GenerateCollectPaymentHTML: isvisit: ",Dumper($isvisit),"\n";

	my $isbaddebtpaymentenabled = IsBadDebtPaymentEnabled($dbh);

	if (!AthenaSecurity::ResourceSecure($Global::session{USERNAME}, "/billing/unappliedpayment.esp")) {
		# The user doesn't have permission to collect patient payments

		# Return a hidden input to allow check in to procced if they can't collect/
		my $nocollectionpermissionhtml = Input({
			id => 'paymentmade',
			type => 'hidden',
			name => 'paymentmade',
			value => 1,
		});
		return $nocollectionpermissionhtml;
	}

	# Prepare to render template
	my $template = Athena::Whiskers::Loader->new()->Load('checkin/main');
	warn "percy: CheckIn.pm: GenerateCollectPaymentHTML: Whiskers Load\n";

	my $todayschargestext = $isvisit ? "Current Visit" : "Today's Visit";

	my %data = (
		PAGE => $page,
		APPOINTMENTID => $appointmentid,
		PRIMARYPATIENTINSURANCEID => $primarypatientinsuranceid,
		EPAYMENT => $epayment,
		PATIENTID => $patientid,
		TODAYSCHARGESTEXT => $todayschargestext,
		ISVISIT => $isvisit,
	);
	my $tostoggle = 0;
	$data{TOSSTARTTIME} = 0;
	try {
		$tostoggle = Athena::Conf::AthenaNet::Rollout('SECOLFDP_423_EPAYMENT_WINDOW_STARTTIME');
		if ($tostoggle) {
			my $dt = DateTime->now();
			my $now_seconds = $dt->epoch * 1000 + $dt->millisecond;
			$data{TOSSTARTTIME} = $now_seconds || 0;
		}
	}
	catch {
		$tostoggle = 0;
	};
	my $appointmentdepartmentid = SQL->Select(
			'appointment.departmentid',
		)->From(
			'appointment',
		)->Where(
			['appointment.id = ?', $appointmentid],
	)->Values($dbh);

	my $departmentid = $appointmentdepartmentid || $Global::session{DEPARTMENTID};
	$data{APPOINTMENTDEPARTMENTID} = $departmentid;

	# Get whether collection is required on the page
	my $collectionrequiredpage = GetTablespaceValueWithDefault($dbh, {
		KEY => COLLECTIONREQUIREDPRACTICESETTING,
		DEPARTMENTID => $departmentid,
	});

	my $collectionrequired = GetTablespaceValueWithDefault($dbh, {
		KEY => 'Patient-Pay: TOS Collection Required',
		DEPARTMENTID => $departmentid,
	});

	$data{COLLECTIONREQUIRED} = $collectionrequired eq 'ON' ? $collectionrequiredpage : $collectionrequired;
	#TODO merge these template keys?
	$data{REQUIRED} = ($collectionrequired eq 'ON' && $page eq $collectionrequiredpage) ? 1 : 0;

	if ($isvisit) {
		$data{COLLECTIONREQUIRED} = 0;
		$data{REQUIRED} = 0;
	}

	# Get the current provider group
	my $providergroupidbydepartmentid = BusCall::PracticeStructure::GetDepartmentProviderGroupIDs($dbh, { DEPARTMENTIDS => [$departmentid] });
	my $providergroupid = $providergroupidbydepartmentid->{$departmentid};

	# Get the providergroups accessible to the user (undefined, if all providergroups)
	my %userprovidergroup;
	if (GetTablespaceValue("Provider-Group-Based Data Permissions",$dbh) eq 'ON') {
		my @userprovidergroups = AthenaSecurity::GetProviderGroups($Global::session{USERNAME}, $dbh);

		%userprovidergroup = map {
			$_->{ID} => {
				ID => $_->{ID},
				NAME => $_->{NAME},
			}
		} @userprovidergroups;
	}

	# Get branded posting practice setting value
	# (some data from "inacessible" provider groups made accessible)
	my $brandsetting = GetTablespaceValueWithDefault($dbh, {KEY => 'Branded Patient Statements'});

	# Get patient ids, names for family members of patient, if Family Billing ON
	my %familymembername;
	if (GetTablespaceValueWithDefault($dbh, {KEY => 'Family Billing'}) eq 'ON') {
		my @familymemberids = BusCall::PatientDemographics::FamilyGetFamilyMemberIDs($dbh, {
			PATIENTID => $patientid,
			#EXCLUDESELF => 1,
		});
		if($brandsetting){
			my @fambrandids;
			foreach my $id (@familymemberids){
				my $brandids = BusCall::PatientDemographics::GetAllPatientIDs($dbh, {
					PATIENTID => $id,
					SAMECOMMUNICATORBRAND => 1,
				});

				push @fambrandids, @$brandids;
			}
			push @familymemberids, @fambrandids;
		}
		%familymembername = SQL->Select(
				"id",
				"firstname || ' ' || lastname name",
			)->From(
				"client",
			)->Where(
				["id in (??)", \@familymemberids],
		)->ColumnValues($dbh);
	}

	# Get data for charges (incuding family members)
	# (including copay, oustanding balance, payment plans, collections)
	my $patientids;
	if($brandsetting){
		$patientids = BusCall::PatientDemographics::GetAllPatientIDs($dbh, {
			PATIENTID => $patientid,
			SAMECOMMUNICATORBRAND => 1,
		});
	} else {
		$patientids = [$patientid];
	}

	my %chargedata = GetPatientChargeData($dbh, {
		PATIENTID => $patientid,
		PATIENTIDS => $patientids,
		APPOINTMENTID => $appointmentid,
		FAMILYNAMESBYID => \%familymembername,
		USERPROVIDERGROUPIDS => [keys %userprovidergroup],
		BRANDSETTING => $brandsetting,
		PROVIDERGROUPID => $providergroupid,
		ISVISIT => $isvisit,
		ISBADDEBTPAYMENTENABLED => $isbaddebtpaymentenabled,
	});
	@data{keys %chargedata} = values %chargedata;

	if($patientstatementdata){
		# TODO merge this into Get Patient Charge Data?
		%data = %{ GetPatientStatementData($dbh, {
			DATA => \%data,
			PATIENTID => $patientid,
			PATIENTSTATEMENTDATA => $patientstatementdata,
			USERPROVIDERGROUPIDS => [keys %userprovidergroup],
			FAMILYNAMESBYID => \%familymembername,
		}) };
	}

	# Get data for pre-payment plans
	if(GetTablespaceValueWithDefault($dbh, {KEY => 'FCS - automatic prepayment plans at check-in'}) eq 'OFF') {
		my @prepaymentplandata = GetPrePaymentPlanData($dbh, {
			PATIENTID => $patientid,
			ISBADDEBTPAYMENTENABLED => $isbaddebtpaymentenabled,
		});

		if (@prepaymentplandata) {
			$data{FUTUREVISITS}{PREPAYMENTPLANS} = \@prepaymentplandata;
		}
	}

	# Get payment method data (including COF data)
	my %paymentmethoddata = GetPaymentMethodData($dbh, {
		PATIENTID => $patientid,
		APPOINTMENTID => $appointmentid,
		USERPROVIDERGROUPIDS => [keys %userprovidergroup],
	});
	@data{keys %paymentmethoddata} = values %paymentmethoddata;

	if ($appointmentid) {
		$data{ALREADYMADEPAYMENT} = CheckIfAppointmentHasPaymentAlready($dbh, {
			APPOINTMENTID => $appointmentid,
			ISBADDEBTPAYMENTENABLED => $isbaddebtpaymentenabled,
		});
	}

	if ($outstandingdata) {
		$data{OUTSTANDINGSECTION} = $outstandingdata->{SECTION};
		$data{OUTSTANDINGLINKGROUP} = $outstandingdata->{LINKGROUP};
		$data{ENTERPRISEBALANCES} = $outstandingdata->{ENTERPRISEBALANCES};
		$data{ADDITIONALTABLE}{HOLDSTATEMENTS} = $outstandingdata->{HOLDSTATEMENTS};
		if (!$isbaddebtpaymentenabled) {
			$data{ADDITIONALTABLE}{PATBADDEBTS} = $outstandingdata->{PATBADDEBTS};
			$data{ADDITIONALTABLE}{FAMBADDEBTS} = $outstandingdata->{FAMBADDEBTS};
		}
	}

	%data = GetCheckOutNotificationData($dbh, {
		DATA => \%data,
		APPOINTMENTID => $appointmentid,
		ISBADDEBTPAYMENTENABLED => $isbaddebtpaymentenabled,
	});

	if ($appointmentid && GetTablespaceValueWithDefault($dbh, {KEY => 'Patient-Pay: TOS liability estimation', DEPARTMENTID => $Global::session{DEPARTMENTID},}) eq 'ON') {
		my $monthlycoflimit = GetTablespaceValueWithDefault($dbh, {KEY => 'Patient-Pay: Card on File monthly limits feature'}) eq 'ON' ? 1 : 0;
		my $showinput = 0;
		$showinput = 1 if ($epayment);

		my $estimateinfo = BusCall::PatientInsurance::GetPatientLiabilityEstimate($dbh, {APPOINTMENTID => $args->{APPOINTMENTID}});
		my $copay = $estimateinfo->{COPAYESTIMATE};
		my $thresholdpercent = 0.6;
		my $estimate = $estimateinfo->{PATIENTLIABILITYESTIMATE}-$estimateinfo->{COPAYESTIMATE};
		my $cofexists = 0;
		my $paymentduewarning;
		$paymentduewarning = $data{SHOWPAYMENTDUEWARNING};

		my $upperbound = ceil( ($estimate + 2 * $estimateinfo->{STANDARDDEVIATION}) / 10 ) * 10;
		$upperbound = max($upperbound, 0);

		my $lowerbound = floor( ($estimate * 0.8) / 10 ) * 10;
		$lowerbound = max($lowerbound,0);

		my $range;
		if($lowerbound == $upperbound){
			$range = qq{\$$lowerbound};
		}
		else{
			$range = qq{\$$lowerbound - \$$upperbound};
		}

		my $cardonfileinfotitle = HTML::Pattern::PageTitle->new({
		TITLE => 'Card on File'
		});

		my $defaultliabilitymonthlylimit = ($estimate > 150) ? int($estimate/3) : 50;
		my $monthlimitinfotext = $monthlycoflimit ? qq{A monthly limit can also be set to limit charges each month.} : '';
		my $structuredtext = HTML::Pattern::StructuredText->new();
		my $delayoverride = GetTablespaceValueWithDefault($dbh, {KEY => 'CCP: Notification/Charge delay override'});
		$delayoverride ||= 5;
		$structuredtext->AddParagraph({text => {
			CONTENT => qq{Card on File is an agreement in which patients authorize a card to be automatically charged for any balance resulting from today's visit. The card will not be charged more than the maximum limit over the course of the agreement. }.$monthlimitinfotext,
		}});
		$structuredtext->AddParagraph({text => {
			CONTENT => qq{Patients will be notified via email }.$delayoverride.qq{ days prior to any charge. Patients can choose to cancel the agreement at any time.},
		}});

		my $cardonfileinfo = HTML::Pattern::Popup->new({
			TEMPLATE => 'Field Definition',
			ANCHOR => {
				SPRITE => 'info-16x16',
			},
			CONTENTPATTERNS => {
				PAGETITLE => $cardonfileinfotitle,
				STRUCTUREDBODYTEXT => $structuredtext,
			},
		})->HTML();

		if (defined $estimateinfo->{PATIENTLIABILITYESTIMATE} && ($estimate < 5 || $upperbound == 0) && $estimateinfo->{PATIENTLIABILITYESTIMATE} > -1) {
			$data{PATIENTLIABILITYESTIMATE} = {
				RANGE => '$0',
				OVERRIDEELIGCOPAY => ($copay < 1) ? 1 : '',
			};
		}
		elsif (defined $estimateinfo->{PATIENTLIABILITYESTIMATE} && defined $estimateinfo->{COPAYESTIMATE} && defined $estimateinfo->{STANDARDDEVIATION} && ($estimateinfo->{STANDARDDEVIATION} <= $estimate*$thresholdpercent && $estimateinfo->{PATIENTLIABILITYESTIMATE} > -1)){
				my $estimatedetails;
				my $checkbox = Input({
					id => 'liabilitycofcheckbox',
					type => 'CHECKBOX',
				});
				my $limitbox = Input({
					id => 'LIABILITYCARDONFILELIMIT',
					name => 'LIABILITYCARDONFILELIMIT',
					value => $upperbound,
					size => 6,
					class => 'currencyonchange',
				});
				my $monthlylimitbox = Input({
					id => 'LIABILITYCARDONFILEMONTHLYLIMIT',
					name => 'LIABILITYCARDONFILEMONTHLYLIMIT',
					value => $defaultliabilitymonthlylimit,
					size => 6,
					class => 'currencyonchange',
				});
				if($data{CARDONFILE} && $data{COFREMAINING} >= $upperbound) {
					$showinput = 0;
					$cofexists = 1;
					if(!(exists $data{PASTVISITS}{BALANCE} && $data{PASTVISITS}{BALANCE}{OUTSTANDING} > 0 && $data{PASTVISITS}{BALANCE}{DISPLAYOUTSTANDING} ne 'Collected')) {
						$paymentduewarning = 0;
					}
				}
				if(!$cofexists){
					$estimatedetails = GetEstimateTypeDetails($dbh, Athena::Util::Hash::HashSlice($estimateinfo, [qw(DEDUCTIBLEREMAINING DEDUCTIBLEESTIMATE COINSURANCEESTIMATE PATIENTLIABILITYESTIMATE COPAYESTIMATE OTHERCHARGESESTIMATE)]));
				}
				$data{PATIENTLIABILITYESTIMATE} = {
					RANGE => $range,
					SHOWINPUT => $showinput,
					CHECKBOX => $checkbox,
					LIMITINPUT => $limitbox,
					SHOWBANNER => 1,
					COFEXISTS => $cofexists,
					CARDONFILEINFO => $cardonfileinfo,
					MONTHLYLIMITINPUT => ($monthlycoflimit ? $monthlylimitbox : ''),
					DEFAULTLIABILITYMONTHLYLIMIT => $defaultliabilitymonthlylimit,
					ESTIMATETYPE => $estimatedetails->{ESTIMATETYPE},
					ESTIMATEMESSAGE => $estimatedetails->{ESTIMATEMESSAGE},
					OVERRIDEELIGCOPAY => ($copay < 1) ? 1 : '',
				};
				$data{SHOWPAYMENTDUEWARNING} = $paymentduewarning;
		} else{
			$data{PATIENTLIABILITYESTIMATE} = {
				RANGE => 'Not available',
				OVERRIDEELIGCOPAY => '',	
			};

		}
	}


	if(GetTablespaceValueWithDefault($dbh, {KEY => 'FCS - automatic prepayment plans at check-in'}) eq 'ON') {
		$data{ADDITIONALPAYMENTLABEL} = "Patient deposit for today's services";
		$data{ADDITIONALPAYMENTLABEL} = "Patient deposit for current visit" if $isvisit;
	}
	else{
		$data{ADDITIONALPAYMENTLABEL} = "Additional payment for today's services";
		$data{ADDITIONALPAYMENTLABEL} = "Additional payment for current visit" if $isvisit;
		$data{ADDITIONALPAYMENTLABEL} = "Optional additional payment" if ((GetTablespaceValueWithDefault($dbh, {KEY => 'Patient-Pay: TOS liability estimation', DEPARTMENTID => $Global::session{DEPARTMENTID},}) eq 'ON') && $appointmentid);
	}

	#display the claims in hold
	my $holdclaimstext;
	if (GetTablespaceValue('Collector',$dbh) eq 'ON') {
		if (!%userprovidergroup) {
			$holdclaimstext = BusCall::PatientDemographics::QuickviewHoldClaims($patientid, $dbh, {});
		}
		else {
			#we need the enterpriseid of patient if we are going to display for all provider groups
			my $patiententity = BusCall::PatientDemographics::GetPatient($dbh, {
				PATIENTID => $patientid,
			});
			my @claims = BusCall::PatientDemographics::QuickviewHoldClaims($patiententity->EnterpriseID, $dbh, { PROVIDERGROUPID => '_ALL_' });

			my @sortedclaims = grep {$_->{PROVIDERGROUPID} != $Global::session{PROVIDERGROUPID}} @claims;
			unshift(@sortedclaims, grep {$_->{PROVIDERGROUPID} == $Global::session{PROVIDERGROUPID}} @claims);
			my $displaybr = 0;
			my $providergroupname;
			foreach my $providergroupclaims (@sortedclaims) {
				if (
					exists $providergroupclaims->{PROVIDERGROUPID}
					&& $providergroupclaims->{CLAIMSTEXT}
				) {
					if ($displaybr) {
						$holdclaimstext .= "<br />";
					}
					else {
						$displaybr = 1;
					}

					if (scalar(keys %userprovidergroup) > 1) {
						$providergroupname = HTML::Escape(
							$userprovidergroup{$providergroupclaims->{PROVIDERGROUPID}}{NAME}
						);
					}
					$holdclaimstext .= sprintf("<strong>%s</strong><br />%s",
						$providergroupname,
						$providergroupclaims->{CLAIMSTEXT},
					);
				}
			}
		}
		$holdclaimstext = "<tr><th>Claims in HOLD</th><td>$holdclaimstext</td>" if $holdclaimstext;
		$holdclaimstext = '' if (!AthenaSecurity::ResourceSecure($Global::session{USERNAME}, 'QUICKVIEWPATIENTOUTSTANDING'));
		$data{ADDITIONALTABLE}{HOLDCLAIMSTEXT} = $holdclaimstext;
	}

	$data{ISBADDEBTPAYMENTENABLED} = $isbaddebtpaymentenabled;


	if($isbaddebtpaymentenabled && $data{PASTVISITS}){
		#possible payment sections keys in past vists. all the sections are mentioned in order(end to begining)
		my @possiblepastvisitskeysdata = qw(
			OTHERPROVIDERGROUPCOLLECTIONS  
			COLLECTIONS 
			OTHERPROVIDERGROUPPAYMENTPLANS
			PAYMENTPLANS
			OTHERPROVIDERGROUPBALANCE  
			BALANCE  
			OTHERPROVIDERGROUPBADDEBTS 
			BADDEBTS
		);
		#defined payment sections keys in past visits as per the data
		my @pastvisitskeysdata = grep { defined $data{PASTVISITS}{$_} } @possiblepastvisitskeysdata;
		if(scalar @pastvisitskeysdata){
			my $key = $pastvisitskeysdata[0] ;
			if ($data{PASTVISITS}{PAYMENTPLANS}){
				$data{PASTVISITS}{HASPAYMENTPLANROW} =1;
			}
			if ($data{PASTVISITS}{OTHERPROVIDERGROUPPAYMENTPLANS}){
				$data{PASTVISITS}{HASOTHERPROVIDERGROUPPAYMENTPLANROW} =1;
			}

			if($key eq 'PAYMENTPLANS'){
				$data{PASTVISITS}{ISPAYMENTPLANSLASTROW}=1;
			}
			elsif($key eq 'OTHERPROVIDERGROUPPAYMENTPLANS'){
				$data{PASTVISITS}{ISOTHERPROVIDERGROUPPAYMENTPLANSLASTROW}=1;
			}
			else{
				$data{PASTVISITS}{$key}{ISLASTROW}=1;
			}
		}
	}

	my $tos_banner_for_sf_toggle= Athena::RolloutToggle::GetEnabledVersion($dbh, {KEY => 'COLKON_TOS_BANNER_FOR_SF'}) eq 'ON' ? 1 : 0; 

	if($tos_banner_for_sf_toggle){
		my $bannerdetails = GetTosBannerDetailsForSlidingfee($dbh, {PATIENTID =>$patientid,APPOINTMENTID=>$appointmentid});
		$data{ENABLESLIDINGFEETOSBANNER} = $bannerdetails->{ENABLESFBANNER};
		$data{SFBANNERCONTENT} = $bannerdetails->{BANNERTEXT};
		$data{SFBANNERDISPLAY} =  $bannerdetails->{DISPLAY};
	}

	$data{LOADNIMBUSAPP} = 1;
	warn "percy: CheckIn.pm: LOADNIMBUSAPP: $LOADNIMBUSAPP \n";

	warn "percy: CheckIn.pm: GenerateCollectPaymentHTML: Whiskers Render\n";
	return $template->Render(\%data);
}
