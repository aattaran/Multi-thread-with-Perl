use strict; 
use warnings;

my $filename = "linesfile.txt";

open(FH, $filename);
my @lines = <FH>;
close(FH);


my $count = scalar @lines;

print "number of lines $count\n";

use IO::File;

my $filename = "linesfile.txt";

my $fh = IO::File->new($filename, "r");
if (! $fh){
    print "cant open $fh ($!) \n";
}

my $count = 0;
while ($fh ->getline){
    $count++;
}
$fh->close;
print "number of lines are $count";