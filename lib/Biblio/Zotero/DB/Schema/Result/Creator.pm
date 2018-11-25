use utf8;
package Biblio::Zotero::DB::Schema::Result::Creator;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::Creator

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<creators>

=cut

__PACKAGE__->table("creators");

=head1 ACCESSORS

=head2 creatorid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 firstname

  data_type: 'text'
  is_nullable: 1

=head2 lastname

  data_type: 'text'
  is_nullable: 1

=head2 fieldmode

  data_type: 'int'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "creatorid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "firstname",
  { data_type => "text", is_nullable => 1 },
  "lastname",
  { data_type => "text", is_nullable => 1 },
  "fieldmode",
  { data_type => "int", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</creatorid>

=back

=cut

__PACKAGE__->set_primary_key("creatorid");

=head1 UNIQUE CONSTRAINTS

=head2 C<lastname_firstname_fieldmode_unique>

=over 4

=item * L</lastname>

=item * L</firstname>

=item * L</fieldmode>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "lastname_firstname_fieldmode_unique",
  ["lastname", "firstname", "fieldmode"],
);

=head1 RELATIONS

=head2 item_creators

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemCreator>

=cut

__PACKAGE__->has_many(
  "item_creators",
  "Biblio::Zotero::DB::Schema::Result::ItemCreator",
  { "foreign.creatorid" => "self.creatorid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:44:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:t38+MuHQ7DmnRVqK2SH1eA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
