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

	return $self->search(
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

1;
