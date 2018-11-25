use utf8;
package Biblio::Zotero::DB::Schema::Result::FeedItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::FeedItem

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<feedItems>

=cut

__PACKAGE__->table("feedItems");

=head1 ACCESSORS

=head2 itemid

  data_type: 'integer'
  is_auto_increment: 1
  is_foreign_key: 1
  is_nullable: 0

=head2 guid

  data_type: 'text'
  is_nullable: 0

=head2 readtime

  data_type: 'timestamp'
  is_nullable: 1

=head2 translatedtime

  data_type: 'timestamp'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "itemid",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_foreign_key    => 1,
    is_nullable       => 0,
  },
  "guid",
  { data_type => "text", is_nullable => 0 },
  "readtime",
  { data_type => "timestamp", is_nullable => 1 },
  "translatedtime",
  { data_type => "timestamp", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemid>

=back

=cut

__PACKAGE__->set_primary_key("itemid");

=head1 UNIQUE CONSTRAINTS

=head2 C<guid_unique>

=over 4

=item * L</guid>

=back

=cut

__PACKAGE__->add_unique_constraint("guid_unique", ["guid"]);

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


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:41:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fpXLGGXmdE2sHHUaH8HCrg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
