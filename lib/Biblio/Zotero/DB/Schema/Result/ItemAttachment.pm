use utf8;
package Biblio::Zotero::DB::Schema::Result::ItemAttachment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::ItemAttachment

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<itemAttachments>

=cut

__PACKAGE__->table("itemAttachments");

=head1 ACCESSORS

=head2 itemid

  data_type: 'integer'
  is_auto_increment: 1
  is_foreign_key: 1
  is_nullable: 0

=head2 sourceitemid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 1

=head2 linkmode

  data_type: 'int'
  is_nullable: 1

=head2 mimetype

  data_type: 'text'
  is_nullable: 1

=head2 charsetid

  data_type: 'int'
  is_nullable: 1

=head2 path

  data_type: 'text'
  is_nullable: 1

=head2 originalpath

  data_type: 'text'
  is_nullable: 1

=head2 syncstate

  data_type: 'int'
  default_value: 0
  is_nullable: 1

=head2 storagemodtime

  data_type: 'int'
  is_nullable: 1

=head2 storagehash

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "itemid",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_foreign_key    => 1,
    is_nullable       => 0,
  },
  "sourceitemid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 1 },
  "linkmode",
  { data_type => "int", is_nullable => 1 },
  "mimetype",
  { data_type => "text", is_nullable => 1 },
  "charsetid",
  { data_type => "int", is_nullable => 1 },
  "path",
  { data_type => "text", is_nullable => 1 },
  "originalpath",
  { data_type => "text", is_nullable => 1 },
  "syncstate",
  { data_type => "int", default_value => 0, is_nullable => 1 },
  "storagemodtime",
  { data_type => "int", is_nullable => 1 },
  "storagehash",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemid>

=back

=cut

__PACKAGE__->set_primary_key("itemid");

=head1 RELATIONS

=head2 annotations

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::Annotation>

=cut

__PACKAGE__->has_many(
  "annotations",
  "Biblio::Zotero::DB::Schema::Result::Annotation",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 highlights

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::Highlight>

=cut

__PACKAGE__->has_many(
  "highlights",
  "Biblio::Zotero::DB::Schema::Result::Highlight",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 itemid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::Item>

=cut

__PACKAGE__->belongs_to(
  "itemid",
  "Biblio::Zotero::DB::Schema::Result::Item",
  { itemid => "itemid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 sourceitemid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::Item>

=cut

__PACKAGE__->belongs_to(
  "sourceitemid",
  "Biblio::Zotero::DB::Schema::Result::Item",
  { itemid => "sourceitemid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:u4JJM71EtePId8XMpq4WOQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
