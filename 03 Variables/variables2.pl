#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $dec = 21;
    my $oct = 0131;
    my $hex = 0x131;
    my $binary = 0b011001;
    my $float = 1.31;
    my $exp = 13.e34;
    message($dec);
    message($oct);
    message($hex);
    message($binary);
    message($float);
    message($exp);
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

