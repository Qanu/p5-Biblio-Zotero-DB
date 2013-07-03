use utf8;
package Biblio::Zotero::DB::Schema::Result::Library;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::Library

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<libraries>

=cut

__PACKAGE__->table("libraries");

=head1 ACCESSORS

=head2 libraryid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 librarytype

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "libraryid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "librarytype",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</libraryid>

=back

=cut

__PACKAGE__->set_primary_key("libraryid");

=head1 RELATIONS

=head2 group

Type: might_have

Related object: L<Biblio::Zotero::DB::Schema::Result::Group>

=cut

__PACKAGE__->might_have(
  "group",
  "Biblio::Zotero::DB::Schema::Result::Group",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 items

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::Item>

=cut

__PACKAGE__->has_many(
  "items",
  "Biblio::Zotero::DB::Schema::Result::Item",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:97town+aPZwbrbi2nYaQZQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
