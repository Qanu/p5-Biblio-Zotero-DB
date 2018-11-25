use utf8;
package Biblio::Zotero::DB::Schema::Result::PublicationsItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::PublicationsItem

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<publicationsItems>

=cut

__PACKAGE__->table("publicationsItems");

=head1 ACCESSORS

=head2 itemid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "itemid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemid>

=back

=cut

__PACKAGE__->set_primary_key("itemid");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:41:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lkGkNlhjZBVzwIWpXctrag


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
