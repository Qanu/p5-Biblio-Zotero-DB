use utf8;
package Biblio::Zotero::DB::Schema::Result::CustomField;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::CustomField

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<customFields>

=cut

__PACKAGE__->table("customFields");

=head1 ACCESSORS

=head2 customfieldid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 fieldname

  data_type: 'text'
  is_nullable: 1

=head2 label

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "customfieldid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "fieldname",
  { data_type => "text", is_nullable => 1 },
  "label",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</customfieldid>

=back

=cut

__PACKAGE__->set_primary_key("customfieldid");

=head1 RELATIONS

=head2 custom_base_field_mappings

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::CustomBaseFieldMapping>

=cut

__PACKAGE__->has_many(
  "custom_base_field_mappings",
  "Biblio::Zotero::DB::Schema::Result::CustomBaseFieldMapping",
  { "foreign.customfieldid" => "self.customfieldid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 custom_item_type_fields

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::CustomItemTypeField>

=cut

__PACKAGE__->has_many(
  "custom_item_type_fields",
  "Biblio::Zotero::DB::Schema::Result::CustomItemTypeField",
  { "foreign.customfieldid" => "self.customfieldid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OowNMoDWmV2u4lqLPRPyKA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
