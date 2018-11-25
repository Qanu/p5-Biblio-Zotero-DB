use utf8;
package Biblio::Zotero::DB::Schema::Result::Highlight;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::Highlight

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<highlights>

=cut

__PACKAGE__->table("highlights");

=head1 ACCESSORS

=head2 highlightid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 itemid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 startparent

  data_type: 'text'
  is_nullable: 1

=head2 starttextnode

  data_type: 'int'
  is_nullable: 1

=head2 startoffset

  data_type: 'int'
  is_nullable: 1

=head2 endparent

  data_type: 'text'
  is_nullable: 1

=head2 endtextnode

  data_type: 'int'
  is_nullable: 1

=head2 endoffset

  data_type: 'int'
  is_nullable: 1

=head2 datemodified

  data_type: 'date'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "highlightid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "itemid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "startparent",
  { data_type => "text", is_nullable => 1 },
  "starttextnode",
  { data_type => "int", is_nullable => 1 },
  "startoffset",
  { data_type => "int", is_nullable => 1 },
  "endparent",
  { data_type => "text", is_nullable => 1 },
  "endtextnode",
  { data_type => "int", is_nullable => 1 },
  "endoffset",
  { data_type => "int", is_nullable => 1 },
  "datemodified",
  { data_type => "date", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</highlightid>

=back

=cut

__PACKAGE__->set_primary_key("highlightid");

=head1 RELATIONS

=head2 itemid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemAttachment>

=cut

__PACKAGE__->belongs_to(
  "itemid",
  "Biblio::Zotero::DB::Schema::Result::ItemAttachment",
  { itemid => "itemid" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:44:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rEfaVRBFomewekCKihoDxA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
