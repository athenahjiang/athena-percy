sub GetLastEligibilityCheck {
	my ($dbh, $args) = @_;

	# base sql
	my $sql = SQL::Select->new(
		)->Select(
		)->From(
			q{eligibilitytrack},
		)->Where(
			# base where args
			q{eligibilitytrack.messageresult is not null},
			q{eligibilitytrack.transactionyn = 'Y'},

			# ip
			$args->{INSURANCEPACKAGEID} ?
			[q{eligibilitytrack.insurancepackageid = ?},
			$args->{INSURANCEPACKAGEID}] 
			:
			(),
			
			# info type (default MEDICAL)
			[q{eligibilitytrack.informationtype = nvl(?, 'MEDICAL')}, 
			$args->{INFORMATIONTYPE}],
		);

	# COLPAT_STC_SUPPORT_FOR_TELADOC
	# either specify stc or query for null stc
	# withou toggle, ELIGIBILITYTRACK.SERVICETYPECODE is always null
	if(
		$args->{SERVICETYPECODES} && 
		scalar @{$args->{SERVICETYPECODES}} && 
		$stctoggle eq 'ON'
	) {
		my $stc = join(',' , @{$args->{SERVICETYPECODES}});
		$sql->Where( [q{eligibilitytrack.servicetypecode = ?}, $stc], );
	} else {
		$sql->Where( [q{eligibilitytrack.servicetypecode is null}], );
	}

	# dos check
	if ($args->{DOSCHECKYN} eq 'Y') {

		$sql->OrderBy(
			[q{eligibilitytrack.dateofservice desc}],
			[q{eligibilitytrack.created desc}],
		);

		# eligible or ip need review
		$sql->Where(q{eligibilitytrack.messageresult in ('1','2.2')},);

		# COLCS_AWV_ELIGIBILITY
		# as of dos check
		if ($is_coding_service_eligibility_on && $args->{ASOFDOSCHECKYN} eq 'Y') {
			# row.dos <= arg.dos
			$sql->Where(
				[q{(eligibilitytrack.dateofservice <= ?)}, 
				$args->{DATEOFSERVICE}],
			);
		} else {
			my $today = AthenaDate::PracticeToday($dbh);
			my $lastdayinmonth = AthenaDate::GetLastDateOfMonth({DATE => $today});
			my $dosexpirationdate = AthenaDate::GetLastDateOfMonth({DATE => $args->{DATEOFSERVICE}});

			# row.dos within 5 days of arg.dos
			# row.dos same month as arg.dos
			# row.created same month as athena today
			$sql->Where(
				[q{eligibilitytrack.dateofservice <= ? +- 5},
				$args->{DATEOFSERVICE}],
				[q{(last_day(eligibilitytrack.dateofservice) = ?},
				$dosexpirationdate],
				[q{last_day(eligibilitytrack.created) = ?},
				$lastdayinmonth],
			);
		}
	} else {
		# created within 90 days
		$sql->Where(q{eligibilitytrack.created + 0 > sysdate - 90},);

		# all message
		if ($args->{ALLMESSAGEYN} eq 'Y') {
			$sql->Where(
				q{
					(eligibilitytrack.inquiryreason = 'ITERATIVE' 
					and
					eligibilitytrack.messageresult in ('1','2','2.2')
					) 
					or
					(eligibilitytrack.inquiryreason <> 'ITERATIVE')
				},
			);
		} else {
			$sql->Where(
				q{
					eligibilitytrack.messageresult in ('1','2','2.1','2.2') 
					or 
					eligibilitytrack.messageresult like '6%'
				},
			);
		}

		# N | undef
		if ($args->{DOSCHECKYN} eq 'N') {
			$sql->OrderBy([q{eligibilitytrack.created desc}],);

			# on transaction date dos
			$sql->Where(q{
				eligibilitytrack.dateofservice is null
				or 
				eligibilitytrack.dateofservice = 
				eligibilitytrack.outgoingtransactiondate
			},);
		} elsif ($args->{DOSCHECKYN} eq undef) {
			if($args->{DOCUMENTINSURANCEID}) {
				$sql->OrderBy([q{eligibilitytrack.created desc}],);
			}
			else {
				$sql->OrderBy(
					[q{eligibilitytrack.dateofservice desc}],
					[q{eligibilitytrack.created desc}],
				);
			}
		}
	}

	# alt pi (return)
	if ($args->{ALTPATIENTINSURANCEID}) {
		$sql->Where(
			[q{eligibilitytrack.altpatientinsuranceid = ?}, 
			$args->{ALTPATIENTINSURANCEID}],
		);

		return $args->{RETURNSQL} ? $sql : $sql->HashRef($dbh) || {};
	}

	# document insurance id (return)
	if ($args->{DOCUMENTINSURANCEID}) {
		$sql->Where(
			[q{eligibilitytrack.documentinsuranceid = ?}, 
			$args->{DOCUMENTINSURANCEID}],
		);

		return $args->{RETURNSQL} ? $sql : $sql->HashRef($dbh) || {};
	}

	# cpi insurance sync (return)
	# get all pi with same patiententerpriseid from a given pi
	# get all tracks from all pi
	if (GetTablespaceValue("CPI Insurance Synchronization", $dbh)) {
		$sql->From(
			q{patientinsurance patientinsurance1}, 
			q{patientinsurance patientinsurance2}
		)->Where(
			q{patientinsurance1.deleted is null},
			q{patientinsurance2.deleted is null},
			$args->{PATIENTINSURANCEID} ? [q{patientinsurance1.id = ?}, $args->{PATIENTINSURANCEID}] : (),
			q{patientinsurance1.insurancepackageid = patientinsurance2.insurancepackageid},
			q{patientinsurance1.patiententerpriseid = patientinsurance2.patiententerpriseid},
			q{nvl(patientinsurance1.idnumber,'0') = nvl(patientinsurance2.idnumber,'0')},
			q{eligibilitytrack.patientinsuranceid = patientinsurance2.id},
		);

		# on transaction date dos or pi elig service date dos
		if ($args->{DOSCHECKYN} eq undef) {
			$sql->Where(
				q{
					(
						patientinsurance1.eligibilityservicedate is not null 
						and 
						eligibilitytrack.dateofservice = patientinsurance1.eligibilityservicedate
					) 
					or
					(
						eligibilitytrack.dateofservice = trunc(eligibilitytrack.outgoingtransactiondate)
						or 
						eligibilitytrack.dateofservice is null
					)
				},
			);
		}

		return $args->{RETURNSQL} ? $sql : $sql->HashRef($dbh) || {};
	}

	# pi
	$sql->Where(
		$args->{PATIENTINSURANCEID} ? [q{eligibilitytrack.patientinsuranceid = ?}, $args->{PATIENTINSURANCEID}] : (),
	);

	# on transaction date dos or pi elig service date dos
	if ($args->{DOSCHECKYN} eq undef) {
		$sql->From(
			q{patientinsurance},
		)->Where(
			q{patientinsurance.id = 
			eligibilitytrack.patientinsuranceid},

			q{
				(
					patientinsurance.eligibilityservicedate is not null 
					and 
					eligibilitytrack.dateofservice = patientinsurance.eligibilityservicedate
				) 
				or
				(
					eligibilitytrack.dateofservice = trunc(eligibilitytrack.outgoingtransactiondate)
					or 
					eligibilitytrack.dateofservice is null
				)
			},
		);
	}

	return $args->{RETURNSQL} ? $sql : $sql->HashRef($dbh) || {};
};
