use Test::Most tests => 1;
use strict;

BEGIN { use_ok 'Biblio::Zotero::DB' }

my $db = Biblio::Zotero::DB->new;

use DDP; p $db->find_profile_directories;

done_testing;
