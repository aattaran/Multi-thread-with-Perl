#!/usr/bin/perl
# builtins.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $string = "this is a string\n";
    chomp $string;
    chop $string;
    message("[$string]");
    
    my $s2 = uc $string; #lc lowercase
    message ("$s2");
    
    my $s3  = substr($string, 5, 4);
    message ("$s3");
    
    
    my $s4  = index($string, "s");
    message ("$s4");
    
    my $s5  = rindex($string, "s");
    message ("$s5");
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

