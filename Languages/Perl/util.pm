####
#### Comparison
####
if ($foo) # valid value
if (!defined($foo)) # undef
if ($foo == 1) # compare number
if ($foo eq 's1') # check string equal
if ($foo ne 's2') # check string not equal
if ($foo =~ /9eaf/) # matches regex or string
if ('item' ~~ @arr) # arr contains item

####
#### Dumper
####
use Data::Dumper;
warn "percy: a: ", Dumper($a), " \n";

####
#### async
####
use v5.14;
use Future::AsyncAwait;
async sub do_a_thing {
  my $first = await do_first_thing();
  my $second = await do_second_thing();
  return combine_things( $first, $second );
}
do_a_thing()->get;

####
#### grep
####
my @Array = ('Geeks', 'for', 'Geek');
my @A = grep(/^G/, @Array);
print @A; # GeeksGeek

####
#### eval
####
# Execute dynamic expressions
# Expects an expression or a block of code
my $a = 1;
my $b = 2;
my $expr = '$a + $b';
eval $expr; # return 3
eval "$expr"; # return 3
eval '$expr'; # return '$a + $b'
eval { $expr }; # return '$a + $b'

####
#### dir
####

# current dir
use Cwd qw( abs_path );
use Path::Class qw( file );
my $path = file(abs_path($0))->dir;

# read dir files
opendir my $dir, "/home/hjiang/hjiang-dev/prod/" or die "Cannot open directory: $!";
my @files = readdir $dir;
foreach (@files) {
  warn "file_name: $_ \n";
}
closedir $dir;
