use utf8;
package Biblio::Zotero::DB::Schema::Result::Charset;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::Charset

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<charsets>

=cut

__PACKAGE__->table("charsets");

=head1 ACCESSORS

=head2 charsetid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 charset

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "charsetid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "charset",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</charsetid>

=back

=cut

__PACKAGE__->set_primary_key("charsetid");

=head1 UNIQUE CONSTRAINTS

=head2 C<charset_unique>

=over 4

=item * L</charset>

=back

=cut

__PACKAGE__->add_unique_constraint("charset_unique", ["charset"]);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:g0JeuGcf5tbfRszBwN3D+w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
