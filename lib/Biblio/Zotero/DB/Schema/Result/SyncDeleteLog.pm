use utf8;
package Biblio::Zotero::DB::Schema::Result::SyncDeleteLog;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::SyncDeleteLog

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<syncDeleteLog>

=cut

__PACKAGE__->table("syncDeleteLog");

=head1 ACCESSORS

=head2 syncobjecttypeid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

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
  "syncobjecttypeid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "libraryid",
  { data_type => "int", is_nullable => 0 },
  "key",
  { data_type => "text", is_nullable => 0 },
  "timestamp",
  { data_type => "int", is_nullable => 0 },
);

=head1 UNIQUE CONSTRAINTS

=head2 C<syncobjecttypeid_libraryid_key_unique>

=over 4

=item * L</syncobjecttypeid>

=item * L</libraryid>

=item * L</key>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "syncobjecttypeid_libraryid_key_unique",
  ["syncobjecttypeid", "libraryid", "key"],
);

=head1 RELATIONS

=head2 syncobjecttypeid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::SyncObjectType>

=cut

__PACKAGE__->belongs_to(
  "syncobjecttypeid",
  "Biblio::Zotero::DB::Schema::Result::SyncObjectType",
  { syncobjecttypeid => "syncobjecttypeid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SbV7iU/RXaLVEvgMh4sQcw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
