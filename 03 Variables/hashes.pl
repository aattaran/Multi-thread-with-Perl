#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my %hash = ("this" => "foo" , "that" => "bar");
    foreach my $k (sort keys %hash)
    {
        my $v = $hash{$k};
        message("$k is $v");
    }
    message ($hash{"that"});
    message (join(",",keys(%hash)));
    message (join(",",sort(keys(%hash))));
    message (join(",",values(%hash)));
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

