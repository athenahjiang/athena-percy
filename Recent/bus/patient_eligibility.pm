####
#### alt check
####
BusCall::Eligibility::CheckAltPatientEligibility($dbh, { PATIENTID => 1035805, PATIENTINSURANCEID => 23931, USERNAME => 'pjiang4', INQUIRYREASON => 'USER-REQUESTED', FETCHBENEFITSYN => 'Y', });
BusCall::Eligibility::CheckAltPatientEligibility($dbh, { DATEOFSERVICE => '10/25/2022', FETCHBENEFITSYN => 'N', INQUIRYREASON => 'ELIGIBILITY-SERVICE', PATIENTID => 798, PATIENTINSURANCEID => 1205, SERVICETYPECODES => [ '30','UC','MH' ], USERNAME => 'pjiang4', });

####
#### fetch
####
BusCall::Eligibility::FetchAllEligibilityInfo($dbh, { PATIENTID => 1561457, PATIENTINSURANCEID => 21423, EXCLUDEELIGIBILITYTRACKIDS => [ qw() ], });
BusCall::Eligibility::FetchAllEligibilityInfo($dbh, { PATIENTID => 1561457, INCLUDEELIGIBILITYTRACKIDS => [ qw(62749) ], });

####
#### new fetch
####
BusCall::Eligibility::FetchAllEligibilityInfo($dbh, { PATIENTID => 64728, INCLUDEELIGIBILITYTRACKIDS => [ qw(1885747) ], });
BusCall::Eligibility::FetchAllEligibilityInfo($dbh, { PATIENTID => 1561458, PATIENTINSURANCEID => 21424, EXCLUDEELIGIBILITYTRACKIDS => [ qw() ], });
