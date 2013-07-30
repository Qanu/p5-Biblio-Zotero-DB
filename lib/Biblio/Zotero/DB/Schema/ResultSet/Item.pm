package Biblio::Zotero::DB::Schema::ResultSet::Item;

use strict;
use warnings;
use base 'DBIx::Class::ResultSet';

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
	my $subquery = $schema->resultset('ItemAttachment')
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
