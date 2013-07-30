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
