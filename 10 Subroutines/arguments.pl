#!/usr/bin/perl
# subs.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $s = "This is the template.pl exercise file from Perl 5 Essential Training.";
    my $y = 42;
    my $z = "zee";
    message($s, $y, $z);
}

sub message
{
    my ($m, $y, $z) = @_;
    #my $m = shift or return;
    print("$m ($y) ($z) \n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}

