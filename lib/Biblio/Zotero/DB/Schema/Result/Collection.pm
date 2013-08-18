use utf8;
package Biblio::Zotero::DB::Schema::Result::Collection;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::Collection

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<collections>

=cut

__PACKAGE__->table("collections");

=head1 ACCESSORS

=head2 collectionid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 collectionname

  data_type: 'text'
  is_nullable: 0

=head2 parentcollectionid

  data_type: 'int'
  default_value: null
  is_foreign_key: 1
  is_nullable: 1

=head2 dateadded

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0

=head2 datemodified

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0

=head2 clientdatemodified

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0

=head2 libraryid

  data_type: 'int'
  is_nullable: 1

=head2 key

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "collectionid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "collectionname",
  { data_type => "text", is_nullable => 0 },
  "parentcollectionid",
  {
    data_type      => "int",
    default_value  => \"null",
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "dateadded",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
  },
  "datemodified",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
  },
  "clientdatemodified",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
  },
  "libraryid",
  { data_type => "int", is_nullable => 1 },
  "key",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</collectionid>

=back

=cut

__PACKAGE__->set_primary_key("collectionid");

=head1 UNIQUE CONSTRAINTS

=head2 C<libraryid_key_unique>

=over 4

=item * L</libraryid>

=item * L</key>

=back

=cut

__PACKAGE__->add_unique_constraint("libraryid_key_unique", ["libraryid", "key"]);

=head1 RELATIONS

=head2 collection_items

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::CollectionItem>

=cut

__PACKAGE__->has_many(
  "collection_items",
  "Biblio::Zotero::DB::Schema::Result::CollectionItem",
  { "foreign.collectionid" => "self.collectionid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 collections

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::Collection>

=cut

__PACKAGE__->has_many(
  "collections",
  "Biblio::Zotero::DB::Schema::Result::Collection",
  { "foreign.parentcollectionid" => "self.collectionid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 parentcollectionid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::Collection>

=cut

__PACKAGE__->belongs_to(
  "parentcollectionid",
  "Biblio::Zotero::DB::Schema::Result::Collection",
  { collectionid => "parentcollectionid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yKzZ7kQPHQsrMv2FSL8wrQ

# NOTE: extended DBIC schema below


=attr name

TODO

=cut
sub name {
	my $self = shift;
	return $self->collectionname;
}

=method items

TODO

=cut
sub items {
	my $self = shift;
	my $schema = $self->result_source->schema;
	my $items = $self->collection_items
		->get_column('itemid')->as_query;
	$schema->resultset('StoredItem')->search( { itemid => { -in => $items } });
}

1;
