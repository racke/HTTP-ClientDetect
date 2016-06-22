#!/usr/bin/env perl

use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use File::Spec;
use Data::Dumper;

# fake a request

use Interchange6::Plugin::Interchange5::Request;
use HTTP::ClientDetect::Location;

my $env = {
    USER_AGENT => 'Perl 6.0',
};

my $request = Interchange6::Plugin::Interchange5::Request->new(env => $env);

ok ($request->user_agent eq $env->{USER_AGENT}, "Testing user agent accessor.");

done_testing;

