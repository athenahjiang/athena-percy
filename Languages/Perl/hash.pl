####
#### initialize
####
%hash = ( 'name' => "Percy", );
%hash = ( 'name', "Percy", );
$hash_ref = { NAME => "Percy" };

####
#### cast
####
$hash_ref = \%hash; # hash to hash_ref
%hash = %{$hash_ref}; # hash_ref to hash

####
#### access
####

# access
$hash{KEY} # hash
$hash_ref->{KEY} # hash_ref

# get keys
my @keys = keys %hash; # hash
my @keys = keys %{$hash_ref}; # hash_ref

# delete
if (exists $hash{1}) { delete $hash{1}; }
if (exists $hash_ref->{1}) { delete $hash_ref->{1}; }

# slice (returns the sliced hash)
Athena::Util::Hash::HashAntiSlice($args, [ "RETURNASHASH" ])

# exists
if (exists($hash{$key})) {}
