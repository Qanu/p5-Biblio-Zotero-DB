package Biblio::Zotero::DB::Schema::ResultSet::Item;

use strict;
use warnings;
use Moo;

extends 'DBIx::Class::ResultSet';


has _item_attachment_resultset => ( is => 'rw', default => sub { 'ItemAttachment' } );

# pass the args as is to the parent --- new() takes no params for the current object
sub BUILDARGS { shift; { }; }
sub FOREIGNBUILDARGS { shift; @_; }

sub with_item_attachment_resultset {
	my ($self, $resultset) = @_;
	my $self_clone = $self->search({});
	$self_clone->_item_attachment_resultset($resultset);
	$self_clone;
}

sub search_by_field {
	my ($self, $field_queries) = @_;

	my $schema = $self->result_source->schema;
	my $subqueries;

	while (my ($key, $value) = each %$field_queries) {
		push @$subqueries,
			$schema->resultset('ItemData')->search(
			{
				'fieldid.fieldname' => $key,
				'valueid.value' => $value,
			},
			{
				prefetch => [ 'fieldid', 'valueid' ],
			}
			)->get_column('itemid')->as_query;
	}

	return $self->search_rs(
		{
			-and => [ map {
					{ 'me.itemid' => { '-in' => $_ } }
				} @$subqueries
			],
		},
		{
			prefetch => { 'item_datas' => [ 'fieldid', 'valueid' ] },
		},
	);
}

sub items_with_attachments_of_mimetypes {
	my ($self, @mimetypes) = @_;
	return unless @mimetypes;
	my $schema = $self->result_source->schema;
	my $subquery = $schema->resultset($self->_item_attachment_resultset)
		->search(
			{ mimetype => [ -or => @mimetypes ] },
			{ '+columns' =>
				{ outputitemid =>
					\do { "IFNULL(me.sourceitemid, me.itemid)" } },
			}
		 )->get_column('outputitemid')->as_query;

	return $self->search_rs(
		{ 'me.itemid' => { '-in' => $subquery } },
		{
			prefetch => { 'item_datas' => [ 'fieldid', 'valueid' ] },
		},
	);
}

sub items_with_pdf_attachments {
	my ($self) = @_;
	$self->items_with_attachments_of_mimetypes('application/pdf');
}

1;
