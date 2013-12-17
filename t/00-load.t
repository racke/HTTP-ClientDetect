#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 4;

BEGIN {
    use_ok( 'Interchange6::Plugin::Autodetect' ) || print "Bail out!\n";
    use_ok( 'Interchange6::Plugin::Autodetect::Language' ) || print "Bail out!\n";
    use_ok( 'Interchange6::Plugin::Autodetect::Location' ) || print "Bail out!\n";
    use_ok( 'Interchange6::Plugin::Interchange5::Request' ) || print "Bail out!\n";
}

diag( "Testing Interchange6::Plugin::Autodetect $Interchange6::Plugin::Autodetect::VERSION, Perl $], $^X" );
