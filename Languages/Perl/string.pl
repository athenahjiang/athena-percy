my $str = "some random string";

# substr
my $new_str = substr($str, $index, $length, $replacement);

# join
my $new_str = join("separator", "s1", "s2", "s3");

# index (-1 on fail)
my $index = index($str, 'substr to be searched');
