#!/usr/bin/perl
# template.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $time  = "05:24:37";
    my ($hour, $min, $sec) = $time =~ /(..):(..):(..)/;
    
    #my $hour = $1;
   # my $min = $2;
    #my $sec = $3;
    
    message("hour: $hour, min: $min, sec: $sec");
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

