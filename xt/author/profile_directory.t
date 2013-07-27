use Test::Most tests => 2;
use strict;

BEGIN { use_ok 'Biblio::Zotero::DB' }

my $db = Biblio::Zotero::DB->new;

use DDP; p $db->find_profile_directories;
ok( @{$db->find_profile_directories} >= 1, 'has a profile directory');

done_testing;
