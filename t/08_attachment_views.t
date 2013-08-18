use strict;
use warnings;
use Test::Most tests => 6;

use lib "t/lib";
use TestData;

my $db = get_db();


my $item_cognitive = $db
	->schema->resultset('Item')
	->search_by_field( {
		title => { like => "%Temptation%" }
	} )->first;

is( $item_cognitive->item_attachments_sourceitemids->count       , 1 );
is( $item_cognitive->stored_item_attachments_sourceitemids->count, 0 );
is( $item_cognitive->trash_item_attachments_sourceitemids->count , 1 );

my $item_kawaii = $db
	->schema->resultset('Item')
	->search_by_field( {
		title => { like => '%Kawaii%' }
	} )->first;

is( $item_kawaii->item_attachments_sourceitemids->count       , 1 );
is( $item_kawaii->stored_item_attachments_sourceitemids->count, 1 );
is( $item_kawaii->trash_item_attachments_sourceitemids->count , 0 );

done_testing;
