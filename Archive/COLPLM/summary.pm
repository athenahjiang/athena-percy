####
#### call stack
####

# legacy

# $ATHENA_HOME/htdocs/eligibility/eligibilitydisplay.esp
sub GetEligibilityResultText # $ATHENA_HOME/perllib/Athena/Eligibility.pm
sub HTMLSummary # $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm
sub BasicBlockHTML # $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm

# colplm

sub GetEligibilityDetails # $ATHENA_HOME/perllib/Athena/Athena/Eligibility/App/EligibilityDetails.pm
sub GetEligibilitySummary # $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm
sub _GetResultsFromEligibilityTrack # $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm
sub BasicBlockHash # $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm
sub _SubscriberAndDependentDemographicsHTML # $ATHENA_HOME/perllib/Athena/Eligibility/Template.pm
sub DemographicDiff # $ATHENA_HOME/perllib/Athena/Eligibility.pm

####
#### data
####

# elig notes (missing verificationnote, bug on colplm side)
# 1. ELIGIBILITYTRACK.VERIFICATIONNOTE
# 2. ELIGIBILITYTRACK.ELIGIBILITYWARNING
# 3. ""
eligibilityNotes => $results->{ELIGIBILITYTRACK}->{VERIFICATIONNOTE} || $results->{ELIGIBILITYTRACK}->{ELIGIBILITYWARNING} || "",

####
#### entity
####
# track
# pi
# canonical (benefits)

####
#### response
####

# basic info - track, pi, canonical
# notes - track.verificationnote, track.eligibilitywarning
# status - track
# provider - track
# dos - track
# elig last checked - track.outgoingtransactiondate
# elig last checked by - track.createdby
# cert number - pi
# policy number - pi
# pcp - canonical
sub _GetPCPName {
  my ($canonical) = @_;
  my @otherinfo = grep {$_->{ENTITY} eq 'Primary Care Provider'} @{$canonical->{OTHERINFO}{OTHERENTITIES}};
  return unless @otherinfo;
  my $pcp = $otherinfo[0]->{NAME};
  return $pcp;
}
# subscriber date - canonical
$canonical->{OTHERINFO}{SUBSCRIBERDATE}

# insurance info - pi
# insurancePackageId - pi.INSURANCEPACKAGEID
# insuranceName - pi.INSURANCEPACKAGENAME
# insuranceAddress - pi.ADDRESS
# insuranceCity - pi.CITY
# insuranceState - pi.STATE
# insuranceZip - pi.ZIP
# insurancePhone - pi.PHONE
# insuranceSequenceNumber.code - pi.SEQUENCENUMBER
# insuranceSequenceNumber.type - GetRelationshipToInsuredName(pi.RELATIONSHIPTOINSUREDID)

# patient details - canonical, pi

# subscriber details - canonical, pi

# demographic diff - canonical, pi

####
#### UI
####

# header
# insurance info - pi
# basic info - track, pi, canonical (without canonical)

# summary tab
# subscriber details - canonical, pi
# demographic diff - canonical, pi
# (these 2 could be combined)
# basic info - track, pi, canonical

# demographic diffs card
# demographic diff - canonical, pi
