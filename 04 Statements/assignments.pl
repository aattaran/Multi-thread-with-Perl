#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $var = 34;
    $var = "haj";
    my @arr = (1,2,3,4, 6+7,"five");
    message("var is $var.");
    message(join(",",@arr));
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

