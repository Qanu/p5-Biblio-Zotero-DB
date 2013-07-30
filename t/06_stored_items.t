use strict;
use warnings;
use Test::Most tests => 3;

use lib "t/lib";
use TestData;

my $db = get_db();

my $attachment_itemtypeid = 14; # ItemType: typename => 'attachment'

my $perl_item_count = $db->schema->resultset('StoredItem')
	->search({ itemtypeid => { '!=' => $attachment_itemtypeid } })
	->search_by_field( { title => { like => '%Perl%' } })->count;
is( $perl_item_count, 2, 'found both Perl items');

my $thresher_shark_count_both = [ map {
		$_->search({ itemtypeid => { '!=' => $attachment_itemtypeid } })
			->search_by_field( { title => { like => '%Thresher%' } })->count
	} ( $db->schema->resultset('Item'), $db->schema->resultset('StoredItem') ) ];
cmp_deeply( $thresher_shark_count_both, [1, 0], 'Thresher shark article is deleted (and thus not stored)');

my $cognitive_count_both = [ map {
		$_->search({ itemtypeid => { '!=' => $attachment_itemtypeid } })
			->search_by_field( { title => { like => '%cognitive%' } })->count
	} ( $db->schema->resultset('Item'), $db->schema->resultset('StoredItem') ) ];
cmp_deeply( $cognitive_count_both, [2, 1], 'Articles with cognitive in the title');

done_testing;
