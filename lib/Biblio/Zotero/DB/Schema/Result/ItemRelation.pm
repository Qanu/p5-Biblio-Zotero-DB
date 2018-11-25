use utf8;
package Biblio::Zotero::DB::Schema::Result::ItemRelation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::ItemRelation

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<itemRelations>

=cut

__PACKAGE__->table("itemRelations");

=head1 ACCESSORS

=head2 itemid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 predicateid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 object

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "itemid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "predicateid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "object",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemid>

=item * L</predicateid>

=item * L</object>

=back

=cut

__PACKAGE__->set_primary_key("itemid", "predicateid", "object");

=head1 RELATIONS

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

=head2 predicateid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::RelationPredicate>

=cut

__PACKAGE__->belongs_to(
  "predicateid",
  "Biblio::Zotero::DB::Schema::Result::RelationPredicate",
  { predicateid => "predicateid" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:41:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NmEv29PSxXzLHrtDmm5cYw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
