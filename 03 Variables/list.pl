#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my @array = (1,2,3,4,5,"six");
    my($one, $two, $three) = (1,2,3);
    message(join(",",@array));
    message($one);
    message($two);
    message($three);
    message($array[2]);
    message("there are ". scalar @array . " in array");
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

