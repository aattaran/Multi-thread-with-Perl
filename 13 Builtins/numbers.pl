#!/usr/bin/perl
# builtins.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $num = 123.456;
    my $n = int($num);
    message("$n");
    
    my $n2 = int(rand(100));
    message("$n2");
    
    srand(125);
    srand($$. time);
    my $n3 = int(rand(100));
    message("$n3");
    
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

