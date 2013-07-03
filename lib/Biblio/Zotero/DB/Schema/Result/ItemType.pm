use utf8;
package Biblio::Zotero::DB::Schema::Result::ItemType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::ItemType

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<itemTypes>

=cut

__PACKAGE__->table("itemTypes");

=head1 ACCESSORS

=head2 itemtypeid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 typename

  data_type: 'text'
  is_nullable: 1

=head2 templateitemtypeid

  data_type: 'int'
  is_nullable: 1

=head2 display

  data_type: 'int'
  default_value: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "itemtypeid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "typename",
  { data_type => "text", is_nullable => 1 },
  "templateitemtypeid",
  { data_type => "int", is_nullable => 1 },
  "display",
  { data_type => "int", default_value => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemtypeid>

=back

=cut

__PACKAGE__->set_primary_key("itemtypeid");

=head1 RELATIONS

=head2 base_field_mappings

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::BaseFieldMapping>

=cut

__PACKAGE__->has_many(
  "base_field_mappings",
  "Biblio::Zotero::DB::Schema::Result::BaseFieldMapping",
  { "foreign.itemtypeid" => "self.itemtypeid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_type_creator_types

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemTypeCreatorType>

=cut

__PACKAGE__->has_many(
  "item_type_creator_types",
  "Biblio::Zotero::DB::Schema::Result::ItemTypeCreatorType",
  { "foreign.itemtypeid" => "self.itemtypeid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_type_fields

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemTypeField>

=cut

__PACKAGE__->has_many(
  "item_type_fields",
  "Biblio::Zotero::DB::Schema::Result::ItemTypeField",
  { "foreign.itemtypeid" => "self.itemtypeid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9neWrGI+M7r0VExseuNPPw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
