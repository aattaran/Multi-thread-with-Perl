#!/usr/bin/perl
# specials.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main("one", "two"); #@ARGV

sub main
{
    message(join(",",@ARGV)); # in cmd type perl examples.pl one two
    message(join(",",@_)); # in cmd type perl examples.pl one two
    print foreach (@_);
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

