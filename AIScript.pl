#!/usr/bin/perl

die "You can choose only a file." if $#ARGV != 0; #only one file in input
$path_to_file = shift || die $!;

my $handle;
unless (open $handle, "<", $path_to_file) {
   print STDERR "Could not open file '$path_to_file': $!\n";
   # we return 'undefined', we could also 'die' or 'croak'
   return undef
}
chomp(my @lines = <$handle>);
unless (close $handle) {
   # what does it mean if close yields an error and you are just reading?
   print STDERR "Don't care error while closing '$path_to_file': $!\n";
} 

# Open a file named like path_to_file; die if there's an error
open my $fh, '>', $path_to_file or die "Cannot open output.txt: $!";

my $idx = 0;
# Loop over the array
foreach (@lines)
{
    print $fh "% $idx -> $_\n"; # Print each entry in our array to the file
    $idx += 1;
}
close $fh; 



