####
#### details
####
BusCall::Eligibility::GetEligibilityDetails($dbh, { PATIENTID => 1561458, PATIENTINSURANCEID => 21424, });
BusCall::Eligibility::GetEligibilityHistory($dbh, { PATIENTID => 1561458, PATIENTINSURANCEID => 21424, });
BusCall::Eligibility::GetEligibilityHistory($dbh, { PATIENTID => 1561424, ELIGIBILITYTRACKIDS => [qw(69579)], });
BusCall::Eligibility::GetServiceTypeCodes($dbh, { PATIENTID => 857448, PATIENTINSURANCEID => 1226266, USERNAME => 'pjiang4', });
BusCall::Eligibility::GetDateOfServices($dbh, { PATIENTID => 859386, PATIENTINSURANCEID => 22326, SERVICETYPECODE => '30', });
BusCall::Eligibility::GetBenefitDetails($dbh, { PATIENTID => 64728, PATIENTINSURANCEID => 292146, ELIGIBILITYTRACKID => 1885747, });
BusCall::Eligibility::GetBenefitDetails($dbh, { PATIENTID => 1561457, ELIGIBILITYTRACKID => 62749, });

####
#### pi
####
my $pi = BusCall::PatientInsurance::GetPatientInsurance($dbh, { PATIENTINSURANCEID => 21423, RETURNASHASH => 1, });

####
#### template
####
use Eligibility::Template;
my $summary = Eligibility::Template::GetEligibilitySummary($dbh, { PATIENTINSURANCE => $pi, ELIGIBILITYTRACKID => 170459144, });
my $benefit = Eligibility::Template::GetEligibilityBenefitHash($dbh,{ ELIGIBILITYTRACKID => 62749, });
my $results = Eligibility::Template::_GetResultsFromEligibilityTrack($dbh, { ELIGIBILITYTRACKID => 170459144, PATIENTINSURANCE => $pi, RETURNELIGIBILITYTRACK => 1, });
my $basic_info = Eligibility::Template::BasicBlockHash($dbh, { PATIENTINSURANCE => $pi, RESULTS => $results, });
my $pcp = Eligibility::Template::_GetPCPName($results->{CANONICAL});

####
#### canonical
####
my $canonicalformat = BusCall::Eligibility::GetCanonical($dbh, { ELIGIBILITYCLASS => "UHC", PATIENTID => 1561457, DATEOFSERVICE => "06/24/2021", ELIGIBILITYCHECKED => "06/24/2021", INSURANCE => {}, });
my $request = Eligibility::Request->new({ CANONICAL=> $canonicalformat, ELIGIBILITYCLASS => "UHC", DBH => $dbh, USERNAME => 'ATHENA', });
$request->{INQUIRYREASON} = "NIGHTLY";
my $results = $request->ParseResponse($ansimessage, $dbh);

####
#### pcp
####
BusCall::Eligibility::EligibilityPCPNameFromVerificationNote($dbh, { PATIENTID => 56142220, USERNAME => 'pjiang4', });
BusCall::Eligibility::PCPNameFromEBSegment($dbh, { ELIGIBILITYTRACKID => 62750, PATIENTINSURANCE => { EligibilityLastCheckedDate => "2022-11-14", EligibleYN => "Y", ID => 21424, IDNumber => 977239334, InsurancePackage => { Address1 => "PO BOX 740800", City => "ATLANTA", ID => 982, InsuranceProductType => "OTHER", InsuranceReportingCategoryID => 123, InsuranceReportingCategoryName => "United Healthcare", InsuranceTypeID => "C1", InsuranceTypeName => "Commercial", PackageName => "UNITED HEALTHCARE", PhoneNumber => "(877) 842-3210", State => "GA", SuperPackageName => "United Healthcare", VersionToken => -1, Zip => "30374-0800" }, InsuredAddress1 => "21 Fake Lane", InsuredAddress2 => 123, InsuredCity => "New London", InsuredFirstName => "Roger", InsuredLastName => "Foster", InsuredState => "CT", InsuredZIP => "06320", PatientID => 1561458, PolicyNumber => "8G8440", RelationshipToInsuredID => 1, RelationshipToInsuredName => "Self", SequenceNumber => 1, VersionToken => -1 }, });

####
#### track
####
use Eligibility;
Eligibility::GetLastEligibilityCheck($dbh, { PATIENTINSURANCEID => 21423, INFORMATIONTYPE => 'MEDICAL', });
Eligibility::GetLastEligibilityCheck($dbh, { ALTPATIENTINSURANCEID => 16122, INFORMATIONTYPE => 'MEDICAL', });

####
#### recent user data
####
BusCall::Eligibility::SetUserPreference($dbh, {});
# set
BusCall::User::RecentUserDataSet($dbh, { USERNAME => 'pjiang4', KEY => 'ELIGIBILITY_FAVORITE_SERVICETYPECODE', VALUE => "[{\"code\":\"30\",\"isFavorite\":true,\"ordering\":1}]", });
BusCall::User::RecentUserDataSet($dbh, { USERNAME => 'pjiang4', KEY => 'COLLECTOR.ELIGIBILITY_ATTRIBUTES', VALUE => "{\"eligibilityDisplayPage\":\"newEligPage\"}", });
BusCall::User::RecentUserDataSet($dbh, { USERNAME => 'pjiang4', KEY => 'COLLECTOR.ELIGIBILITY_ATTRIBUTES', VALUE => "{\"eligibilityDisplayPage\":\"legacyEligPage\"}", });
# get
BusCall::User::RecentUserDataGet($dbh, { USERNAME => 'pjiang4', KEY => 'ELIGIBILITY_FAVORITE_SERVICETYPECODE', });
BusCall::User::RecentUserDataGet($dbh, { USERNAME => 'pjiang4', KEY => 'COLLECTOR.ELIGIBILITY_ATTRIBUTES', });
RECENTUSERDATA

####
#### other
####
BusCall::Eligibility::GetEligibilityBenefits($dbh, { ELIGIBILITYTRACKID => 62749, });
BusCall::Eligibility::GetNewEligibilityLink($dbh, { PATIENTID => 1561424, PATIENTINSURANCEID => 21320, ELIGIBILITYTRACKID => 666, USERNAME => 'pjiang4', });
BusCall::Eligibility::SetUserPreference($dbh, { USERNAME => 'pjiang4', KEY => 'COLLECTOR.ELIGIBILITY_ATTRIBUTES', VALUE => "{\"eligibilityDisplayPage\":\"newEligPage\"}", });
BusCall::Eligibility::UpdateDemographicDifference($dbh, { USERNAME => 'pjiang4', PATIENTINSURANCE => { ELIGIBILITYUPDATEREASON => "ELIGUPDATE", ELIGIBILITYUPDATETIMESTAMP => "SYSDATE", ID => "21423", INSUREDSTATE => "LA", PATIENTID => "1561457" }, COLUMNS => [ "ELIGIBILITYUPDATEREASON", "ELIGIBILITYUPDATETIMESTAMP", "INSUREDSTATE" ], });
