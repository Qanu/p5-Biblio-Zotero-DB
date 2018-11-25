use utf8;
package Biblio::Zotero::DB::Schema::Result::ItemCreator;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::ItemCreator

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<itemCreators>

=cut

__PACKAGE__->table("itemCreators");

=head1 ACCESSORS

=head2 itemid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 creatorid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 creatortypeid

  data_type: 'int'
  default_value: 1
  is_foreign_key: 1
  is_nullable: 0

=head2 orderindex

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "itemid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "creatorid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "creatortypeid",
  {
    data_type      => "int",
    default_value  => 1,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "orderindex",
  { data_type => "int", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemid>

=item * L</creatorid>

=item * L</creatortypeid>

=item * L</orderindex>

=back

=cut

__PACKAGE__->set_primary_key("itemid", "creatorid", "creatortypeid", "orderindex");

=head1 UNIQUE CONSTRAINTS

=head2 C<itemid_orderindex_unique>

=over 4

=item * L</itemid>

=item * L</orderindex>

=back

=cut

__PACKAGE__->add_unique_constraint("itemid_orderindex_unique", ["itemid", "orderindex"]);

=head1 RELATIONS

=head2 creatorid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::Creator>

=cut

__PACKAGE__->belongs_to(
  "creatorid",
  "Biblio::Zotero::DB::Schema::Result::Creator",
  { creatorid => "creatorid" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 creatortypeid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::CreatorType>

=cut

__PACKAGE__->belongs_to(
  "creatortypeid",
  "Biblio::Zotero::DB::Schema::Result::CreatorType",
  { creatortypeid => "creatortypeid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 itemid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::Item>

=cut

__PACKAGE__->belongs_to(
  "itemid",
  "Biblio::Zotero::DB::Schema::Result::Item",
  { itemid => "itemid" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:44:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/oCqexIcxHDzhJwyNz9JjQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
