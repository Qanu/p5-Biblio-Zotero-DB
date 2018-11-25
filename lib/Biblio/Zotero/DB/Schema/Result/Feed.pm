use utf8;
package Biblio::Zotero::DB::Schema::Result::Feed;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::Feed

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<feeds>

=cut

__PACKAGE__->table("feeds");

=head1 ACCESSORS

=head2 libraryid

  data_type: 'integer'
  is_auto_increment: 1
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 url

  data_type: 'text'
  is_nullable: 0

=head2 lastupdate

  data_type: 'timestamp'
  is_nullable: 1

=head2 lastcheck

  data_type: 'timestamp'
  is_nullable: 1

=head2 lastcheckerror

  data_type: 'text'
  is_nullable: 1

=head2 cleanupreadafter

  data_type: 'int'
  is_nullable: 1

=head2 cleanupunreadafter

  data_type: 'int'
  is_nullable: 1

=head2 refreshinterval

  data_type: 'int'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "libraryid",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_foreign_key    => 1,
    is_nullable       => 0,
  },
  "name",
  { data_type => "text", is_nullable => 0 },
  "url",
  { data_type => "text", is_nullable => 0 },
  "lastupdate",
  { data_type => "timestamp", is_nullable => 1 },
  "lastcheck",
  { data_type => "timestamp", is_nullable => 1 },
  "lastcheckerror",
  { data_type => "text", is_nullable => 1 },
  "cleanupreadafter",
  { data_type => "int", is_nullable => 1 },
  "cleanupunreadafter",
  { data_type => "int", is_nullable => 1 },
  "refreshinterval",
  { data_type => "int", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</libraryid>

=back

=cut

__PACKAGE__->set_primary_key("libraryid");

=head1 UNIQUE CONSTRAINTS

=head2 C<url_unique>

=over 4

=item * L</url>

=back

=cut

__PACKAGE__->add_unique_constraint("url_unique", ["url"]);

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


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:41:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AAToORK7e/Z/s4dM+sCvaA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
