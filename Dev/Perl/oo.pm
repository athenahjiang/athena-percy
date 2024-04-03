####
#### bless
####
# associates an object with a class
package MyClass;
my $object = { };
bless $object, "MyClass";
use Data::Structure::Util qw( unbless );
unbless $x;
ref($object); # MyClass

####
#### @ISA
####

# each package/class contains this
# a list of the parents of the package/class
# a list of scalar, string of package/class name
my @isa = eval "\@{${classname}::ISA}";
foreach (@isa) {
	warn "isa: $_ \n";
}
sub _PrintInheritanceStructure {
	my ($classname) = @_;

	my @isa = eval "\@{${classname}::ISA}";
	for my $parent_class (@isa){
		warn "percy: Eligibility/Request.pm: sub _PrintInheritanceStructure: $classname inherits $parent_class \n";
		_PrintInheritanceStructure($parent_class);
	}
}

####
#### can
####
my $object = {};
my $object_can_method = $object->can('method');
