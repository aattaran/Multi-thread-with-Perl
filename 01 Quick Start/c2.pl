use strict;
use warnings;
use IO::File;

main(@ARGV);

sub main
{
    
    my $filename = shift || "linesfile1.txt";
    my $count = countlines($filename);
    message("there are $count in $filename");
    
}


sub countlines
{
    my $filename = shift;
    error("countlines: missing filename") unless $filename;
    
    my $fh = IO::File->new($filename,"r") or
        error("cant open $filename ($!) \n");
        
        my $count = 0;
        $count++ while($fh->getline);
        
        return $count;
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

# error ( string ) - display an error message and exit
sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}