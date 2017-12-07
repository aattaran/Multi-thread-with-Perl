#!/usr/bin/perl
# refs.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $artists = [
    
    {
        name => 'jimi',
        instrument => 'trum',
        genre => 'rock'
    },
    {
        name => 'miles',
        instrument => 'piano',
        genre => 'clasic'
    }
    ];
    push @$artists, {name => 'miles',instrument => 'piano', genre => 'clasic'};
    
    foreach my $artist (@$artists) #de reference with @ becasue its a list
    {
        
        message("$artist-> {name}: $artist-> {instrument}, $artist-> {genre}");
    }
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

