use utf8;
package Biblio::Zotero::DB::Schema::Result::Item;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::Item

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<items>

=cut

__PACKAGE__->table("items");

=head1 ACCESSORS

=head2 itemid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 itemtypeid

  data_type: 'int'
  is_nullable: 0

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
  is_foreign_key: 1
  is_nullable: 1

=head2 key

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "itemid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "itemtypeid",
  { data_type => "int", is_nullable => 0 },
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
  { data_type => "int", is_foreign_key => 1, is_nullable => 1 },
  "key",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemid>

=back

=cut

__PACKAGE__->set_primary_key("itemid");

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
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fulltext_item

Type: might_have

Related object: L<Biblio::Zotero::DB::Schema::Result::FulltextItem>

=cut

__PACKAGE__->might_have(
  "fulltext_item",
  "Biblio::Zotero::DB::Schema::Result::FulltextItem",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fulltext_item_words

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::FulltextItemWord>

=cut

__PACKAGE__->has_many(
  "fulltext_item_words",
  "Biblio::Zotero::DB::Schema::Result::FulltextItemWord",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_attachments_itemid

Type: might_have

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemAttachment>

=cut

__PACKAGE__->might_have(
  "item_attachments_itemid",
  "Biblio::Zotero::DB::Schema::Result::ItemAttachment",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_attachments_sourceitemids

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemAttachment>

=cut

__PACKAGE__->has_many(
  "item_attachments_sourceitemids",
  "Biblio::Zotero::DB::Schema::Result::ItemAttachment",
  { "foreign.sourceitemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_creators

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemCreator>

=cut

__PACKAGE__->has_many(
  "item_creators",
  "Biblio::Zotero::DB::Schema::Result::ItemCreator",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_datas

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemData>

=cut

__PACKAGE__->has_many(
  "item_datas",
  "Biblio::Zotero::DB::Schema::Result::ItemData",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_notes_itemid

Type: might_have

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemNote>

=cut

__PACKAGE__->might_have(
  "item_notes_itemid",
  "Biblio::Zotero::DB::Schema::Result::ItemNote",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_notes_sourceitemids

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemNote>

=cut

__PACKAGE__->has_many(
  "item_notes_sourceitemids",
  "Biblio::Zotero::DB::Schema::Result::ItemNote",
  { "foreign.sourceitemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_see_also_itemids

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemSeeAlso>

=cut

__PACKAGE__->has_many(
  "item_see_also_itemids",
  "Biblio::Zotero::DB::Schema::Result::ItemSeeAlso",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_see_also_linkeditemids

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemSeeAlso>

=cut

__PACKAGE__->has_many(
  "item_see_also_linkeditemids",
  "Biblio::Zotero::DB::Schema::Result::ItemSeeAlso",
  { "foreign.linkeditemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_tags

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemTag>

=cut

__PACKAGE__->has_many(
  "item_tags",
  "Biblio::Zotero::DB::Schema::Result::ItemTag",
  { "foreign.itemid" => "self.itemid" },
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
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 itemids

Type: many_to_many

Composing rels: L</item_see_also_linkeditemids> -> itemid

=cut

__PACKAGE__->many_to_many("itemids", "item_see_also_linkeditemids", "itemid");

=head2 linkeditemids

Type: many_to_many

Composing rels: L</item_see_also_linkeditemids> -> linkeditemid

=cut

__PACKAGE__->many_to_many("linkeditemids", "item_see_also_linkeditemids", "linkeditemid");

=head2 tagids

Type: many_to_many

Composing rels: L</item_tags> -> tagid

=cut

__PACKAGE__->many_to_many("tagids", "item_tags", "tagid");

=head2 wordids

Type: many_to_many

Composing rels: L</fulltext_item_words> -> wordid

=cut

__PACKAGE__->many_to_many("wordids", "fulltext_item_words", "wordid");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OcWFl3GnRhMxSUTwxOnJCw

# NOTE: extended DBIC schema below

# TODO: document
sub tag_names {
	my ($self) = @_;
	[map { $_->name } $self->tagids];
}

# TODO: document
sub fields {
	my ($self) = @_;
	$self->item_datas_rs->fields_for_itemid($self->itemid);
}

=head2 stored_item_attachments_sourceitemids

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::StoredItemAttachment>

=cut

__PACKAGE__->has_many(
  "stored_item_attachments_sourceitemids",
  "Biblio::Zotero::DB::Schema::Result::StoredItemAttachment",
  { "foreign.sourceitemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;
