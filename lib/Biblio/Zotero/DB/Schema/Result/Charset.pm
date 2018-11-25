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

=head1 RELATIONS

=head2 item_attachments

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemAttachment>

=cut

__PACKAGE__->has_many(
  "item_attachments",
  "Biblio::Zotero::DB::Schema::Result::ItemAttachment",
  { "foreign.charsetid" => "self.charsetid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:44:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oHJsgdvb+bmsH4upWITQMA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
