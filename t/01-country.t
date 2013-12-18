#!/usr/bin/env perl

use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 2;
use File::Spec;
use Data::Dumper;

# fake a request

use Interchange6::Plugin::Interchange5::Request;
use Interchange6::Plugin::Autodetect::Location;


my $env = {
           remote_addr => '128.31.0.51',
          };
my $request = Interchange6::Plugin::Interchange5::Request->new(env => $env);

my $dbfile = File::Spec->catfile(t => 'GeoIP.dat');

my $geo = Interchange6::Plugin::Autodetect::Location->new(db => $dbfile);

# testing if geo_ip works calling it.

my $ip = $geo->geo->country_code_by_addr("128.31.0.51") || "";
ok($ip, "Found country code of 128.31.0.51: $ip");
my $host = $geo->geo->country_code_by_name("linuxia.de") || "";
ok($host, "Found country code of linuxia.de: $host");
