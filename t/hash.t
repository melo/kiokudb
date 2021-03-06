#!/usr/bin/perl

use Test::More 'no_plan';

use ok 'KiokuDB';
use ok 'KiokuDB::Backend::Hash';

use KiokuDB::Test;

foreach my $format ( qw(memory storable json), eval { require YAML::XS; "yaml" } ) {
    foreach my $queue ( 1, 0 ) {
        run_all_fixtures( KiokuDB->connect( "hash", serializer => $format, linker_queue => $queue ) );
    }
}

