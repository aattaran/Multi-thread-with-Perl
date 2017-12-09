#!/usr/bin/perl
# modules.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;
use Example;
 
main(@ARGV);

sub main
{
    my $obj = Example->new;
    $obj->copyfile("olives.jpg",'newfile.jpg');
    
    
    message("Done.");
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

