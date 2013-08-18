package Biblio::Zotero::DB::Library::Unfiled;

use strict;
use warnings;
use Moo;

has _db => ( is => 'ro', weak_ref => 1 );

=attr name

TODO

=cut
has name => ( is => 'ro', default => sub { 'Unfiled Items' } );

=method items

TODO

=cut
sub items {
	my $self = shift;
	my $schema = $self->_db->schema;
	my $items = $schema->resultset('CollectionItem')
		->get_column('itemid')->as_query;
	$schema->resultset('StoredItem')
		->with_item_attachment_resultset('StoredItemAttachment')
		->toplevel_items
		->search( { 'me.itemid' => { 'not in' => $items } });
}

1;
