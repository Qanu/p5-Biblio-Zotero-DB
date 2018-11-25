use utf8;
package Biblio::Zotero::DB::Schema::Result::FieldsCombined;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::FieldsCombined

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<fieldsCombined>

=cut

__PACKAGE__->table("fieldsCombined");

=head1 ACCESSORS

=head2 fieldid

  data_type: 'int'
  is_nullable: 0

=head2 fieldname

  data_type: 'text'
  is_nullable: 0

=head2 label

  data_type: 'text'
  is_nullable: 1

=head2 fieldformatid

  data_type: 'int'
  is_nullable: 1

=head2 custom

  data_type: 'int'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "fieldid",
  { data_type => "int", is_nullable => 0 },
  "fieldname",
  { data_type => "text", is_nullable => 0 },
  "label",
  { data_type => "text", is_nullable => 1 },
  "fieldformatid",
  { data_type => "int", is_nullable => 1 },
  "custom",
  { data_type => "int", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</fieldid>

=back

=cut

__PACKAGE__->set_primary_key("fieldid");

=head1 RELATIONS

=head2 item_datas

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemData>

=cut

__PACKAGE__->has_many(
  "item_datas",
  "Biblio::Zotero::DB::Schema::Result::ItemData",
  { "foreign.fieldid" => "self.fieldid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:44:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xBSc7+gzNqgC6RonnSFCmA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
