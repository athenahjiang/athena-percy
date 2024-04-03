use WorkUnit::AthenaDB;

WorkUnit::AthenaDB->new({  
	CONTEXTID => $contextid,
	PARAMETERS => {
		CLAIMIDS => [],
	},
	SUB => 'Athena::Eligibility::App::ThirdPartyInsuranceDetection::MedlytixPayerIQ::SyncClaimsForThirdPartyInsDetection',
})->RequestOnCommit($dbh);
