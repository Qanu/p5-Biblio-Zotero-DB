use utf8;
package Biblio::Zotero::DB::Schema::Result::CreatorData;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::CreatorData

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<creatorData>

=cut

__PACKAGE__->table("creatorData");

=head1 ACCESSORS

=head2 creatordataid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 firstname

  data_type: 'text'
  is_nullable: 1

=head2 lastname

  data_type: 'text'
  is_nullable: 1

=head2 shortname

  data_type: 'text'
  is_nullable: 1

=head2 fieldmode

  data_type: 'int'
  is_nullable: 1

=head2 birthyear

  data_type: 'int'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "creatordataid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "firstname",
  { data_type => "text", is_nullable => 1 },
  "lastname",
  { data_type => "text", is_nullable => 1 },
  "shortname",
  { data_type => "text", is_nullable => 1 },
  "fieldmode",
  { data_type => "int", is_nullable => 1 },
  "birthyear",
  { data_type => "int", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</creatordataid>

=back

=cut

__PACKAGE__->set_primary_key("creatordataid");

=head1 RELATIONS

=head2 creators

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::Creator>

=cut

__PACKAGE__->has_many(
  "creators",
  "Biblio::Zotero::DB::Schema::Result::Creator",
  { "foreign.creatordataid" => "self.creatordataid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:77GVwSEM4nxAXvVUWPJvDA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
