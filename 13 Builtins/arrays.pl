#!/usr/bin/perl
# builtins.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my @list = qw( jan feb mar june);
    my $str = shift (@list);
    my @rlist = reverse @list;
    my @slist = sort @list;
    
    message(join (":", @list) );
    
    push (@list, "foo");
    message(join (":", @list) );
    
    pop (@list);
    message(join (":", @list) );
    
    shift (@list);
    message(join (":", @list) );
    
    
    unshift (@list, $str);
    message(join (":", @list) );
    
    message(join (":", @rlist) );
    
    message(join (":", @slist) );
    
    
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

