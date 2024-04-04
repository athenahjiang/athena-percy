####
#### initialize
####
my @array = (0,0,0,1,2,2,3,3,3,4); # array
my $array_ref = [ qw(60872) ] # array ref
my @array = qw(a b c d); # evaluated as if they were single-quoted
my @array = qq(a b c d); # evaluated as if they were double-quoted

####
#### cast
####
my $arr_ref = \@arr; # arr to arr_ref
my @arr = @{$arr_ref}; # arr_ref to arr
my %hash = map { $_ => 1 } @arr; # arr to hash

####
#### access
####
my $ele = @arr[0];
my $ele = @{$arr_ref}[0];

####
#### operation
####
scalar(@{$arr_ref}); # size arr_ref
push(@array, (35, 40, 55)); # push/append to the end
pop(@array); # return & remove last element
shift(@arr); # return & remove first element
unshift(@arr, ('PHP', 'Java')); # push/append to the front & return arr current size

####
#### traverse
####

# for index loop
for my $i (0 .. $#arr) {
	warn "element: $arr[i] \n";
}

# for loop
for my $element (@arr){
	warn "element: $element \n";
}

# foreach loop
foreach (@arr) {
	warn "element: $_ \n";
}

# while loop
while ($element=shift(@arr)) {
	warn "element: $element \n";
}

# while size loop
while (scalar(@arr) != 0) {
	my $element = shift(@arr);
	warn "element: $element \n";
}

####
#### map function
####
map { warn "element: $_ \n"; } @arr;
