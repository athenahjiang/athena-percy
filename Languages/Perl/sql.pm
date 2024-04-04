####
#### select
####
use SQL::Select;
my $sql = SQL::Select->new->Select(
	'eligibilitytrack.id as eligibilitytrackid',
)->From(
	'eligibilitytrack',
	'provider',
)->Where(
	'eligibilitytrack.providerid = provider.id (+)',
	["eligibilitytrack.informationtype = 'MEDICAL'"],
	["eligibilitytrack.messageresult != '7.3'"],
)->OrderBy(
	'eligibilitytrack.dateofservice desc nulls last',
);
my @results = $sql->TableHash($dbh);
return \@results;

####
#### update
####
use SQL::Update;
SQL->Update(
		"documentqueue",
	)->Set(
		["documentqueue.documentclass = ?", $newdocumentclass],
	)->Where(
		["documentqueue.documentid = ?", $documentid],
		["documentqueue.practiceid = ?", $practiceid],
	)->Do($dbh);