# $ATHENA_HOME/perllib/Athena/Athena/Eligibility/App/Events.pm

BusCall::Eligibility::CheckEligibility($dbh, { PATIENTID => 1561457, USERNAME => "autoelig", INQUIRYREASON => "NIGHTLY", PATIENTINSURANCEID => 21423, SEQUENCENUMBER => 1, });

$artifacts->{message_payload} = {
	eligibilityTrackId => $eligibility_track_id,
	eligibilityClass => $eligibility_class,
	eligibilityReceiver => $eligibility_receiver,
	contextId => $contextid,
	patientId => $all_eligibility_info->{patientId},
	patientInsuranceId => $all_eligibility_info->{patientInsuranceId},
	subscriberId => $idnumber,
	providerId => $all_eligibility_info->{eligibilityTracks}->[0]->{providerId},
	providerName => $all_eligibility_info->{eligibilityTracks}->[0]->{providerName},
	result => $all_eligibility_info->{eligibilityTracks}->[0]->{result},
	inquiryReason => $all_eligibility_info->{eligibilityTracks}->[0]->{inquiryReason},
	dateOfService => $all_eligibility_info->{eligibilityTracks}->[0]->{dateOfService},
	dateOfInquiry => $all_eligibility_info->{eligibilityTracks}->[0]->{dateOfInquiry},
	checkedBy => $all_eligibility_info->{eligibilityTracks}->[0]->{checkedBy},  
	benefitsVersion => "1",
};
