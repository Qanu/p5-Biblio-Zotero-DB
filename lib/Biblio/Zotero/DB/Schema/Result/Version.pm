use utf8;
package Biblio::Zotero::DB::Schema::Result::Version;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::Version

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<version>

=cut

__PACKAGE__->table("version");

=head1 ACCESSORS

=head2 schema

  data_type: 'text'
  is_nullable: 0

=head2 version

  data_type: 'int'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "schema",
  { data_type => "text", is_nullable => 0 },
  "version",
  { data_type => "int", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</schema>

=back

=cut

__PACKAGE__->set_primary_key("schema");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0UXNcol+JqUcgdem5PkgDg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
