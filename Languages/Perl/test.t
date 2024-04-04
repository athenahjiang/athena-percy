#!/usr/local/bin/perl

use Data::Dumper;

use Athena::Policy;
use Athena::Lib qw( :athena );

use Method::Signatures::Simple; # $test_spec
use Athena::Test::Manager; # $manager
use Athena::Test::Spec; # add_test_specs
use AthenaX::AthenaNet::Test::Utils::NestedMock; # $mock
use Test::More; # done_testing
use Test::Deep; # cmp_deeply

# Import Test Packages
use Appointment;
use PatientInsurance;

# Import Util Packages
use HTML::Pattern::PageLevelMessage;
use HTML::TreeBuilder;

####
#### Test Setup
####

use constant TEST_CONTEXT_ID => 123;
# Test Input Data
# Mock Output Data
# CONSTANTS
# Test Output Data

# Mock Environments
my $mock = AthenaX::AthenaNet::Test::Utils::NestedMock->new([
	{
		package => 'BusCall::PatientInsurance',
		method => 'HasDemographicInterface',
		stub => sub { return 0; },
	},
]);
my $manager = Athena::Test::Manager->new(
	default_spec => Athena::Test::Spec->new()
		->mocks( 'TableSpaceInfoKey', GetTablespaceValue => sub { return 'ON'; }, )
		->mocks( 'Athena::Util::SQL', SQLValues => sub { return undef; }, )
		->mocks( 'Athena::Util::SQL', SQLColumnValues => sub { return undef; }, )
	,
);
my $test_case = $manager->new_test_case();
my $dbh = {};

####
#### Test Cases
####
$test_case->add_assert_fields_tests(
	# name
	'should properly assert fields',
	# test sub
	sub { BusCall::SubSystem::SubFunction($dbh, @_); },
	# Required args
	{ PATIENTID => -1, },
	# Require one only fields
	undef,
	# Optional fields
	undef,
	# Optional One only fields
	undef,
	# Required one plus fields
	undef,
);
$test_case->add_lives_ok_test(
	# test sub
	sub { BusCall::SubSystem::SubFunction($dbh, @_); },
	# args
	{ PATIENTID => -2, },
	# name
	'should not die'
);
$test_case->add_test_specs(
	Athena::Test::Spec->new()
		->name('When <Test Scenario> ')
		->rollout_toggles( COLTEC_INSURANCE_GUARDRAILS => 'OFF', )
		->mocks( 
			'Athena::RolloutToggle', 
			GetEnabledVersion => sub { 
				my ($dbh, $args) = @_;
				my $key = $args->{KEY};
				return 'ON';
			}, 
		)
		->mocks( 
			'BusCall::PatientInsurance', 
			SubFunction => sub { return $MOCK_OUTPUT; } 
		)
		->tests(func($dbh, $test_spec) {
			# call test for result

			# HTML
			my $tree = HTML::TreeBuilder->new_from_content($html);
			my @div_list = $tree->look_down( _tag => 'div' );
			my @class_list = $tree->look_down( 'class', 'class name' );

			# More
			is($result, 1, $test_spec->{NAME} . ': Test Result');

			# Deep
			cmp_deeply(
				[1,2,3], 
				[3,2,1], 
				'array: order does matter'
			);
			cmp_deeply(
				{1 => 'a', 2 => 'b'}, 
				{2 => 'b', 1 => 'a'}, 
				'hash: order does not matter'
			);
		}),
);

$manager->execute_tests($dbh, $test_case);

done_testing();

####
#### HELPER TEST FUNCTIONS
####

#########################################################################################
# test_a
#
# Description:
#	Helper function to test if an 'a' element from an HTML tree has correct fields
#
# Parameters:
#	$args:
#		Required:
#			TEST_NAME: (scalar) The name of the test spec
#			A: (blessed HTML::Element) The 'a' element
#			EXPECTED: (hashref) The expected set of fields
#
# Return Value:
#	HTML string of links
#########################################################################################
sub test_a {
	my ($args) = @_;
	Athena::Util::Assert::AssertFields($args, [qw(TEST_NAME A EXPECTED)], []);

	my $test_name = $args->{TEST_NAME};
	my $a = $args->{A};
	my $expected = $args->{EXPECTED};

	cmp_deeply(
		$a->attr('_content'),
		$expected->{CONTENT},
		$test_name . ": '$expected->{CONTENT}[0]' has correct content"
	);

	my $got_href = $a->attr('href');
	$got_href =~ s/\s+//g;
	my $expected_href = $a->attr('href');
	$expected_href =~ s/\s+//g;
	cmp_deeply(
		$got_href,
		$expected_href,
		$test_name . ": '$expected->{CONTENT}[0]' has correct href"
	);
}
