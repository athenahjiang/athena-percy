# $ATHENA_HOME/perllib/Athena/Appointment/Views/CheckIn.pm (GenerateStartReactAppJS)

################################################################################
# GenerateStartReactAppJS
#
# Description:
#	Generates the JS to start react apps on the page. Currently this is done
#	using StartClassicApp to start multiple apps on the page, but may transition
#	to using an orchestrator in the future. If you have a react app to start
#	on Check-in, it should be added here.
#
# Parameters:
#		$dbh - the database handle
#		$args - a hashref with the following arguments:
#			USERNAME             - the name of the user accessing the page
#			CONTACTMANAGEMENTAPP - hashref of properties required by the patient-contactinfo-ui app
#			PATIENTPORTALINFOAPP - hashref of properties required by the patient-portalinfo-ui app
#			PATIENTFINANCIALAPP - hashref of properties required by the patient_financials app
#
# Returns:
#       A string of HTML to add to the ADDITIONALSCRIPT arg of HeaderHTML
################################################################################
sub GenerateStartReactAppJS {
	my ($dbh, $args) = @_;

	use Data::Dumper;
	warn "percy: GenerateStartReactAppJS: args: ",Dumper($args),"\n";

	# Unpack args
	my $username = $args->{USERNAME};

	# explicitly call out what apps we support
	my $percy_test_app = $args->{PERCYTESTAPP};
	my $contact_management_app = $args->{CONTACTMANAGEMENTAPP};
	my $patientportal_info_app = $args->{PATIENTPORTALINFOAPP};
	my $patient_financial_app = $args->{PATIENTFINANCIALAPP};
	my $newfinancials_checkin_conf = eval { Athena::Conf::AthenaNet::Rollout('colkon')->{new_financials_checkin_conf}; } // 0;

	my $javascript = BusCall::Nimbus::StartClassicApp($dbh, {
		INCLUDEMETATAGS => 1,
		USERNAME        => $username,
		APPLICATIONS    => _GetNimbusApps($dbh, {
			$percy_test_app ? (PERCYTESTAPP => $percy_test_app) : (),
			$contact_management_app ? (CONTACTMANAGEMENTAPP => $contact_management_app) : (),
			$patientportal_info_app ? (PATIENTPORTALINFOAPP => $patientportal_info_app) : (),
			($newfinancials_checkin_conf && $patient_financial_app) ? (PATIENTFINANCIALAPP => $patient_financial_app) : (),
		}),
	});

	return $javascript;
}

################################################################################
# _GetNimbusApps
#
# Description:
#	Helper function to build and return the nimbus applications to be loaded using StartClassicApp
#
# Parameters:
#		$dbh - the database handle
#		$args - a hashref with the following arguments:
#			USERNAME             - the name of the user accessing the page
#			CONTACTMANAGEMENTAPP - hashref of properties required by the patient-contactinfo-ui app
#			PATIENTPORTALINFOAPP - hashref of properties required by the patient-portalinfo-ui app
#			PATIENTFINANCIALAPP - hashref of properties required by the patient_financials app
#
# Returns:
#       An arrayref of hashrefs defining the specs of the nimbus apps to be started
################################################################################
sub _GetNimbusApps {
	my ($dbh, $args) = @_;

	warn "percy: _GetNimbusApps: args: ",Dumper($args),"\n";

	my @allowed_apps = qw(
		CONTACTMANAGEMENTAPP
		PATIENTPORTALINFOAPP
		PATIENTFINANCIALAPP
		PERCYTESTAPP
	);

	my $app_exists_to_be_loaded = 0;

	foreach my $app (@allowed_apps) {
		if (exists $args->{$app} && $args->{$app}) {
			$app_exists_to_be_loaded = 1;
			last;
		}
	}

	return [] unless $app_exists_to_be_loaded;

	my @applications = ();

	use Athena::View::Collector::NimbusClassicApp;
	my $percy_test_app_spec = {
		NAME => 'patient-costs-ui',
		CONTEXT => {
			data => {
				contextId => $args->{PERCYTESTAPP}->{CONTEXTID},
				patientId => $args->{PERCYTESTAPP}->{PATIENTID},
				patientInsuranceId => $args->{PERCYTESTAPP}->{PATIENTINSURANCEID},
				apiBaseUrl => $args->{PERCYTESTAPP}->{BASEURL},
			},
			config => { containerId => "percy-test-app-container", }
		},
		SETUP => Athena::View::Collector::NimbusClassicApp::WaitForNimbusAppContainerToBeReady(),
		START => q{
			if (context.container) {
				app.start(context.container, context.data);
			}
		},
		ERROR => qq{ console.error(error); },
	};
	push(@applications, $percy_test_app_spec);

	# Patient Contact Management
	require Clinical::Standalone;
	my $is_standalone_clinicals = Clinical::Standalone::HasDemographicInterface($dbh);
	my $contact_management_version;
	$contact_management_version = BusCall::PatientDemographics::GetContactManagementAppVersion($dbh, {
		USERNAME => $args->{USERNAME},
	}) if exists $args->{CONTACTMANAGEMENTAPP} && $args->{CONTACTMANAGEMENTAPP};

	# Patient Portal Info
	my $portal_info_version;
	$portal_info_version = BusCall::PatientDemographics::GetPortalInfoAppVersion($dbh, {
		USERNAME => $args->{USERNAME},
	}) if exists $args->{PATIENTPORTALINFOAPP} && $args->{PATIENTPORTALINFOAPP};

	if (
		!$is_standalone_clinicals
		&& $contact_management_version
		&& exists $args->{CONTACTMANAGEMENTAPP}
		&& $args->{CONTACTMANAGEMENTAPP}
	) {
		my $contact_management_app_spec = ViewBusCall::Collector::GetContactManagementAppSpec($dbh, $args->{CONTACTMANAGEMENTAPP});

		push(@applications, $contact_management_app_spec);
	} elsif (
		$is_standalone_clinicals
		&& $portal_info_version
		&& exists $args->{PATIENTPORTALINFOAPP}
		&& $args->{PATIENTPORTALINFOAPP}
	) {
		my $portal_info_app_spec = ViewBusCall::Collector::GetPatientPortalInfoAppSpec($dbh, $args->{PATIENTPORTALINFOAPP});

		push(@applications, $portal_info_app_spec);
	}

	my $newfinancials_checkin_conf = eval { Athena::Conf::AthenaNet::Rollout('colkon')->{new_financials_checkin_conf}; } // 0;
	if ($newfinancials_checkin_conf) {
		my $patient_financials_version;
		$patient_financials_version = BusCall::Nimbus::GetApplicationVersion($dbh, {
			USERNAME => $args->{USERNAME},
			APPNAME => 'patient_financials',
		}) if exists $args->{PATIENTFINANCIALAPP} && $args->{PATIENTFINANCIALAPP};

		if ($patient_financials_version
			&& exists $args->{PATIENTFINANCIALAPP}
			&& $args->{PATIENTFINANCIALAPP}
		) {
			my $data = BusCall::PatientQuickView::GetFinancialDetails($dbh, {PATIENTID => $args->{PATIENTFINANCIALAPP}->{PATIENTID}});
			$data->{DATA}->{SOURCE} = "CHECKIN";
			$data->{DATA}->{PATIENTID} = $args->{PATIENTFINANCIALAPP}->{PATIENTID};
			$data->{DATA}->{APPOINTMENTID} = $args->{PATIENTFINANCIALAPP}->{APPOINTMENTID};

			my $patient_financials_app_spec = {
				NAME => 'patient_financials',
				CONTEXT => {
					data => $data->{DATA},
					settings => $data->{SETTINGS},
					config => { containerId => $args->{PATIENTFINANCIALAPP}->{CONTAINERID} },
				},
				SETUP => qq {
						context.container = document.getElementById('patient_financials');
					},
				START => qq{
						app.start(context.container, { data: context.data, settings: context.settings });
					},
				ERROR => qq{
						document.getElementById('patient_financials').textContent = "There was an error loading this page";
						console.error(error);
					},
			};

			push(@applications, $patient_financials_app_spec);
		}
	}

	return \@applications;
}