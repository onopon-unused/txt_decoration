#!/usr/bin/perl
use strict;
use warnings;
use Test::More tests => 1;
use lib::ParamUtils;

subtest 'get_param' => sub {
	lib::ParamUtils->get_param;
	ok( "OK" );
}
