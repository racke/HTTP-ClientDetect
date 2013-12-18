#!/usr/bin/env perl

use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 10;
use File::Spec;
use Data::Dumper;

# fake a request

use Interchange6::Plugin::Interchange5::Request;
use Interchange6::Plugin::Autodetect::Language;


my $lang_detect = Interchange6::Plugin::Autodetect::Language->new(server_default => "hr_HR");

my %test_strings = (
                    'en,en-us;q=0.7,it;q=0.3' => 'en_US',
                    'en;q=0.1,en-us;q=0.5;q=0.7,it;q=0.8' => 'it_IT',
                    'en;q=0.1,en-us;q=0.5;q=0.7,it-it;q=0.8' => 'it_IT',
                    'en;q=0.1,en-us;q=0.5;hr-hr;q=0.7,it;q=0.8' => 'it_IT',
                    'just garbage' => 'hr_HR',
                    ',,,,,,,;;;,,,;;' => 'hr_HR',
                    'en-us;q=0.5;hr-hr;q=0.7,it;q=0.8,en' => 'en_US',
                    'en-us;q=0.5;hr-hr;q=0.7,it;q=0.8,en-gb' => 'en_GB',
                    'es' => 'es_ES',
                    'fr,fr-fr;q=0.7,it;q=0.3' => 'fr_FR',
                   );

foreach my $string (keys %test_strings) {
    my $expected = $test_strings{$string};
    my $env = {
               ACCEPT_LANGUAGE => $string,
              };
    my $request = Interchange6::Plugin::Interchange5::Request->new(env => $env);
    my $result = $lang_detect->language($request);
    is $result, $expected, "Expected $expected from $string, got $result";
}
