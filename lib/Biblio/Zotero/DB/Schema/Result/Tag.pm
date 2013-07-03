use utf8;
package Biblio::Zotero::DB::Schema::Result::Tag;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::Tag

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<tags>

=cut

__PACKAGE__->table("tags");

=head1 ACCESSORS

=head2 tagid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 type

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
  is_nullable: 1

=head2 key

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "tagid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 0 },
  "type",
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
  { data_type => "int", is_nullable => 1 },
  "key",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</tagid>

=back

=cut

__PACKAGE__->set_primary_key("tagid");

=head1 UNIQUE CONSTRAINTS

=head2 C<libraryid_key_unique>

=over 4

=item * L</libraryid>

=item * L</key>

=back

=cut

__PACKAGE__->add_unique_constraint("libraryid_key_unique", ["libraryid", "key"]);

=head2 C<libraryid_name_type_unique>

=over 4

=item * L</libraryid>

=item * L</name>

=item * L</type>

=back

=cut

__PACKAGE__->add_unique_constraint("libraryid_name_type_unique", ["libraryid", "name", "type"]);

=head1 RELATIONS

=head2 item_tags

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemTag>

=cut

__PACKAGE__->has_many(
  "item_tags",
  "Biblio::Zotero::DB::Schema::Result::ItemTag",
  { "foreign.tagid" => "self.tagid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 itemids

Type: many_to_many

Composing rels: L</item_tags> -> itemid

=cut

__PACKAGE__->many_to_many("itemids", "item_tags", "itemid");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KZ6mzhv66OnDC6I6Qr/EwQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
