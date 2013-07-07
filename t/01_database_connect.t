use strict;
use warnings;
use Test::More tests => 2;

BEGIN { use_ok 'Biblio::Zotero::DB::Schema' }
use FindBin;
use lib "$FindBin::Bin/lib";

use TestData;

my $schema;
my $sqlite_db = get_test_db_path();
ok( $schema = Biblio::Zotero::DB::Schema->connect('dbi:SQLite:dbname='.$sqlite_db), 'created schema' );

done_testing;
