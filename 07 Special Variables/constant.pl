#!/usr/bin/perl
# specials.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    message("this file name is". __FILE__);
    message("this line is". __LINE__);
    message("this packge is ". __PACKAGE__);
}
#__END__
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

