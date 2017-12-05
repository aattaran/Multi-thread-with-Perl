#!/usr/bin/perl
# template.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $line;
    open(FH, 'short.txt');
    
    while($line = <FH>) {
       $line =~ s/regular/BOB/;
        print $line;
    }
    
    while($_ = <FH>) {
       # print if /regular/;
        #print if ($_ =~ m|/|);
    }
    while($line = <FH>) {
       
        #print if ($line =~ m|/|);
    }

    
    close FH;
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

