#!/usr/bin/perl
# files.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;
use IO::File;

main(@ARGV);

sub main
{
    my $originalfile = "olives.jpg";
    my $newfile = "copy.jpg";
    
    my $bufsize = 1024 * 1024;
    
    my $fh = IO::File ->new($originalfile,"r") or 
        error(" cannot read ($!)");
        
    my $nfh = IO::File ->new($newfile,"w") or 
        error(" cannot write ($!)"); 
        
    $fh->binmode(":raw");
    $nfh->binmode(":raw");
    
    my $buf = "";
    while( $fh->read($buf, $bufsize)){
        $nfh->print($buf);
    }
    message("Done.")
    
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print(STDERR "$0: $e\n");
    exit 0;
}

