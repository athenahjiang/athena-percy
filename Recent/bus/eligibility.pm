# check
BusCall::Eligibility::CheckEligibility($dbh, { PATIENTID => $args->{PATIENTID}, USERNAME => $args->{USERNAME}, INQUIRYREASON => $args->{INQUIRYREASON}, ALTPATIENTINSURANCEID => $alt_patientinsurance_id, SEQUENCENUMBER => $patientinsurance_hashref->{SEQUENCENUMBER}, DATEOFSERVICE => $args->{DATEOFSERVICE}, PROVIDERID => $args->{PROVIDERID}, SERVICETYPECODES => $args->{SERVICETYPECODES}, });
BusCall::Eligibility::CheckEligibility($dbh, { PATIENTID => 22661, USERNAME => "autoelig", INQUIRYREASON => "NIGHTLY", PATIENTINSURANCEID => 342200, SEQUENCENUMBER => 1, });
BusCall::Eligibility::CheckEligibility($dbh, { PATIENTID => 1561457, USERNAME => "autoelig", INQUIRYREASON => "NIGHTLY", PATIENTINSURANCEID => 21423, SEQUENCENUMBER => 1, });

# parse
use Eligibility::Template
Eligibility::Template::_GetResultsFromEligibilityTrack($dbh, { ELIGIBILITYTRACKID => 1885747, PATIENTINSURANCE => {}, RETURNELIGIBILITYTRACK => 1, });
