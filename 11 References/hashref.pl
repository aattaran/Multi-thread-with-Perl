#!/usr/bin/perl
# refs.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $hashref = 
        {name => "jimi",
        instrument => "gitar",
        album => "are you",
        
       };
    my $copy = $hashref;
    $copy -> {song} = "why";
    foreach my $k (sort keys %$copy){
        my $v = $copy -> {$k};
        message ("$k: $v");
        
      }
    
    message($hashref);
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
