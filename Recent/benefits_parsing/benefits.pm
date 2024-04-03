####
#### legacy format
####

# $ATHENA_HOME/htdocs/eligibility/eligibilitydisplay.esp
sub GetEligibilityResultText # $ATHENA_HOME/perllib/Athena/Eligibility.pm
sub HTMLSummary # $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm
sub BenefitsBlockHTML # $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm
sub _BenefitTypeHTML # $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm
sub _ServiceTypeHTML # $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm
sub _PlanNetworkHTML # $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm
sub _BenefitItem # $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm

####
#### legacy format loops
####

# $ATHENA_HOME/htdocs/eligibility/eligibilitydisplay.esp
sub GetEligibilityResultText # $ATHENA_HOME/perllib/Athena/Eligibility.pm
sub HTMLSummary # $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm
sub BenefitsBlockHTML # $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm
sub MakeBenefitsHash # $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm
sub GetCanonicalBenefitLoop # $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm

####
#### colplm format loops
####

# samples
BusCall::Eligibility::GetBenefitDetails($dbh, { PATIENTID => 1035931, ELIGIBILITYTRACKID => 79779, });
use Eligibility::Template;
my $results = Eligibility::Template::_GetResultsFromEligibilityTrack($dbh, { ELIGIBILITYTRACKID => 79779, PATIENTINSURANCE => { PATIENTID => 1035931, }, });
$results->{CANONICAL}->{EBLOOPS};
BusCall::Eligibility::PercyParseEbLoops($dbh, { PATIENTID => 1035931, ELIGIBILITYTRACKID => 79779, ELIGIBILITYCLASS => 'UHC', });

# consumers
sub FetchAllEligibilityInfo # $ATHENA_HOME/perllib/Athena/Athena/Eligibility/App/PatientEligibility.pm
sub GetBenefitDetails # $ATHENA_HOME/perllib/Athena/Athena/Eligibility/App/EligibilityDetails.pm

# $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm
# COLPLM-4288 (no other use cases)
sub GetEligibilityBenefitHash

# $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm
# COLPLM-4033 (no other use cases)
sub FormatBenefitsHash

# $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm
# COLPLM-4033 COLPLM-4649 (no other use cases)
sub GetBenefitLoopHash

####
#### legacy parse raw
####

