use utf8;
package Biblio::Zotero::DB::Schema::Result::Group;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::Group

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<groups>

=cut

__PACKAGE__->table("groups");

=head1 ACCESSORS

=head2 groupid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 libraryid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 0

=head2 version

  data_type: 'int'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "groupid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "libraryid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 0 },
  "version",
  { data_type => "int", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</groupid>

=back

=cut

__PACKAGE__->set_primary_key("groupid");

=head1 UNIQUE CONSTRAINTS

=head2 C<libraryid_unique>

=over 4

=item * L</libraryid>

=back

=cut

__PACKAGE__->add_unique_constraint("libraryid_unique", ["libraryid"]);

=head1 RELATIONS

=head2 libraryid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::Library>

=cut

__PACKAGE__->belongs_to(
  "libraryid",
  "Biblio::Zotero::DB::Schema::Result::Library",
  { libraryid => "libraryid" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:44:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PUgyKorJN/UoPklc4IQNrg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
