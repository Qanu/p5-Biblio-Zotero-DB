use utf8;
package Biblio::Zotero::DB::Schema::Result::ItemTypeField;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::ItemTypeField

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<itemTypeFields>

=cut

__PACKAGE__->table("itemTypeFields");

=head1 ACCESSORS

=head2 itemtypeid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 fieldid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 1

=head2 hide

  data_type: 'int'
  is_nullable: 1

=head2 orderindex

  data_type: 'int'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "itemtypeid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "fieldid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 1 },
  "hide",
  { data_type => "int", is_nullable => 1 },
  "orderindex",
  { data_type => "int", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemtypeid>

=item * L</orderindex>

=back

=cut

__PACKAGE__->set_primary_key("itemtypeid", "orderindex");

=head1 UNIQUE CONSTRAINTS

=head2 C<itemtypeid_fieldid_unique>

=over 4

=item * L</itemtypeid>

=item * L</fieldid>

=back

=cut

__PACKAGE__->add_unique_constraint("itemtypeid_fieldid_unique", ["itemtypeid", "fieldid"]);

=head1 RELATIONS

=head2 fieldid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::Field>

=cut

__PACKAGE__->belongs_to(
  "fieldid",
  "Biblio::Zotero::DB::Schema::Result::Field",
  { fieldid => "fieldid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 itemtypeid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemType>

=cut

__PACKAGE__->belongs_to(
  "itemtypeid",
  "Biblio::Zotero::DB::Schema::Result::ItemType",
  { itemtypeid => "itemtypeid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ll2i1+6bR2ZFBomvgzNn2g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
