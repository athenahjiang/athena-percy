# perl gitland/fcc.pl

use FileRoot;
my $context_id = 432;
my $patient_id = 123;
my $patient_insurance_id = 456;
my $track_id = 789;
my $file_type = "eligibilityevents";
FileRoot::PutFile($dbh, { 
	FILENAME => "$context_id/$patient_id/$patient_insurance_id/$track_id/270.gz", 
	TYPE => $file_type, 
	CONTENTS => "270 test", 
});
FileRoot::PutFile($dbh, { 
	FILENAME => "$context_id/$patient_id/$patient_insurance_id/$track_id/271.gz", 
	TYPE => $file_type, 
	CONTENTS => "271 test", 
});
FileRoot::PutFile($dbh, { 
	FILENAME => "$context_id/$patient_id/$patient_insurance_id/$track_id/benefits.gz", 
	TYPE => $file_type, 
	CONTENTS => "{}", 
});
