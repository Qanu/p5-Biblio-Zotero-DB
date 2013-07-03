use utf8;
package Biblio::Zotero::DB::Schema::Result::StorageDeleteLog;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::StorageDeleteLog

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<storageDeleteLog>

=cut

__PACKAGE__->table("storageDeleteLog");

=head1 ACCESSORS

=head2 libraryid

  data_type: 'int'
  is_nullable: 0

=head2 key

  data_type: 'text'
  is_nullable: 0

=head2 timestamp

  data_type: 'int'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "libraryid",
  { data_type => "int", is_nullable => 0 },
  "key",
  { data_type => "text", is_nullable => 0 },
  "timestamp",
  { data_type => "int", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</libraryid>

=item * L</key>

=back

=cut

__PACKAGE__->set_primary_key("libraryid", "key");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3C5gfd4sZ5Ul0QU4FZ8i0A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
