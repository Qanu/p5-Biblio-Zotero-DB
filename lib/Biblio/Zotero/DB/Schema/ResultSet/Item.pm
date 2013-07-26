package Biblio::Zotero::DB::Schema::ResultSet::Item;
{
  $Biblio::Zotero::DB::Schema::ResultSet::Item::VERSION = '0.001';
}

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

__END__

=pod

=head1 NAME

Biblio::Zotero::DB::Schema::ResultSet::Item

=head1 VERSION

version 0.001

=head1 AUTHOR

Zakariyya Mughal <zmughal@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Zakariyya Mughal.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
