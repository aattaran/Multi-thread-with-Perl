#!/usr/bin/perl
# template.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    open(FH, 'perlre.txt');
    while(<FH>) {
        #my @list = /([0-9])/g;
        #my @list = /([a-z])/g;
        #my @list = /([A-Z])/g;
        #my @list = /([127]+)/g;
        #my @list = /([\d]+)/g; #digits
        my @list = /([[:punct:]]+)/g;
        #message(@list) if @list;
        message(join(':', @list)) if @list;
    }
    close FH;
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

