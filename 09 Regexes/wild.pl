#!/usr/bin/perl
# template.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    open(FH, 'short.txt');
    while(<FH>) {
        #/(^....)/;
        #/(....)$/;
        /(a...)/;
        #my @list = /(a...)/g; #global
        #my @list = /(a.{5})/g; #global
        #my @list = /(a.*s)/g; #global
        my @list = /(a.*?s)/g; #global
        #message($1) if $1;
        message(join(':',@list)) if @list;
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

