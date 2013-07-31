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


sub get_titles {
	my $rs = shift;
	[ map { $_->fields->{title}  } $rs->all];
}

my $all_pdfs_anywhere_rs = $db->schema->resultset('Item')->items_with_pdf_attachments;

is( $all_pdfs_anywhere_rs->count, 9, 'all PDF anywhere (stored and deleted)' );

my $storeditems_with_storeditemattachments_pdf_rs = $db->schema
	->resultset('StoredItem')
	->with_item_attachment_resultset('StoredItemAttachment')
	->items_with_pdf_attachments;
cmp_deeply( get_titles($storeditems_with_storeditemattachments_pdf_rs), bag(
	"Higher-order Perl: Transforming programs with programs",
	"Modern Perl",
	"Electrical Advantages of Dendritic Spines",
	"Big Science vs. Little Science: How Scientific Impact Scales with Funding",
	"Patrick-Wyatt-Writing-reliable-online-game-services.pdf",
	"The Power of Kawaii: Viewing Cute Images Promotes a Careful Behavior and Narrows Attentional Focus"),
	'all stored items that have PDFs that are also stored');

done_testing;
