use utf8;
package Biblio::Zotero::DB::Schema::Result::Field;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::Field

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<fields>

=cut

__PACKAGE__->table("fields");

=head1 ACCESSORS

=head2 fieldid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 fieldname

  data_type: 'text'
  is_nullable: 1

=head2 fieldformatid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "fieldid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "fieldname",
  { data_type => "text", is_nullable => 1 },
  "fieldformatid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</fieldid>

=back

=cut

__PACKAGE__->set_primary_key("fieldid");

=head1 RELATIONS

=head2 base_field_mappings_basefieldids

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::BaseFieldMapping>

=cut

__PACKAGE__->has_many(
  "base_field_mappings_basefieldids",
  "Biblio::Zotero::DB::Schema::Result::BaseFieldMapping",
  { "foreign.basefieldid" => "self.fieldid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 base_field_mappings_fieldids

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::BaseFieldMapping>

=cut

__PACKAGE__->has_many(
  "base_field_mappings_fieldids",
  "Biblio::Zotero::DB::Schema::Result::BaseFieldMapping",
  { "foreign.fieldid" => "self.fieldid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 custom_base_field_mappings

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::CustomBaseFieldMapping>

=cut

__PACKAGE__->has_many(
  "custom_base_field_mappings",
  "Biblio::Zotero::DB::Schema::Result::CustomBaseFieldMapping",
  { "foreign.basefieldid" => "self.fieldid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 custom_item_type_fields

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::CustomItemTypeField>

=cut

__PACKAGE__->has_many(
  "custom_item_type_fields",
  "Biblio::Zotero::DB::Schema::Result::CustomItemTypeField",
  { "foreign.fieldid" => "self.fieldid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fieldformatid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::FieldFormat>

=cut

__PACKAGE__->belongs_to(
  "fieldformatid",
  "Biblio::Zotero::DB::Schema::Result::FieldFormat",
  { fieldformatid => "fieldformatid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 item_type_fields

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemTypeField>

=cut

__PACKAGE__->has_many(
  "item_type_fields",
  "Biblio::Zotero::DB::Schema::Result::ItemTypeField",
  { "foreign.fieldid" => "self.fieldid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:44:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:p+WuGNUDcfQw2qoyNMOeSw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
