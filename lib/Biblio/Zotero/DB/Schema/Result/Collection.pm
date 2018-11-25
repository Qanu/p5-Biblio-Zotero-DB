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

=head2 clientdatemodified

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0

=head2 libraryid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 key

  data_type: 'text'
  is_nullable: 0

=head2 version

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=head2 synced

  data_type: 'int'
  default_value: 0
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
  "clientdatemodified",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
  },
  "libraryid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "key",
  { data_type => "text", is_nullable => 0 },
  "version",
  { data_type => "int", default_value => 0, is_nullable => 0 },
  "synced",
  { data_type => "int", default_value => 0, is_nullable => 0 },
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

=head2 collection_relations

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::CollectionRelation>

=cut

__PACKAGE__->has_many(
  "collection_relations",
  "Biblio::Zotero::DB::Schema::Result::CollectionRelation",
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

=head2 libraryid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::Library>

=cut

__PACKAGE__->belongs_to(
  "libraryid",
  "Biblio::Zotero::DB::Schema::Result::Library",
  { libraryid => "libraryid" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
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
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:44:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YkcXxGn8XAI3ajHCewUAig

# NOTE: extended DBIC schema below

=head1 SUMMARY

This represents the collection and subcollections (folder) structure of Zotero.

This class uses a L<Tree::AdjacencyList|DBIx::Class::Tree::AdjacencyList>
component to represent the parent-child relationship between collections.

=cut


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


__PACKAGE__->load_components("Tree::AdjacencyList");
__PACKAGE__->parent_column('parentcollectionid');

1;
