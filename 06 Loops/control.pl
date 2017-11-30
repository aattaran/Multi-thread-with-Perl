#!/usr/bin/perl
# loops.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $line;
    open(FH, "linesfile.txt");
    while ($line = <FH>){
        next if $line =~ /5/;
        last if $line =~ /4/;
        print $line;
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
    print("$0: $e\n");
    exit 0;
}

