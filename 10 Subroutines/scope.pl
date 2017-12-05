#!/usr/bin/perl
# subs.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

my $g = " anther string";
main(@ARGV);

sub main
{
    my $m = " what is ";
    message("This is the template.pl exercise file from Perl 5 Essential Training.");
}

sub message
{
    my $m = shift or return;
    print(" $g:  $m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}

