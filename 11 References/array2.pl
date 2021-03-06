#!/usr/bin/perl
# refs.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $var = [
    "This is the Perl 5 references chapter.",
    42,
    "another one",
    "another"];
    my $copy = $var;
    message($var);
    message(join(": " , @$var));
    $copy ->[2] = 145;
    message(join(": " , @$copy));
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

