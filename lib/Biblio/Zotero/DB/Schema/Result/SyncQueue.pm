use utf8;
package Biblio::Zotero::DB::Schema::Result::SyncQueue;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::SyncQueue

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<syncQueue>

=cut

__PACKAGE__->table("syncQueue");

=head1 ACCESSORS

=head2 libraryid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 key

  data_type: 'text'
  is_nullable: 0

=head2 syncobjecttypeid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 lastcheck

  data_type: 'timestamp'
  is_nullable: 1

=head2 tries

  data_type: 'int'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "libraryid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "key",
  { data_type => "text", is_nullable => 0 },
  "syncobjecttypeid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "lastcheck",
  { data_type => "timestamp", is_nullable => 1 },
  "tries",
  { data_type => "int", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</libraryid>

=item * L</key>

=item * L</syncobjecttypeid>

=back

=cut

__PACKAGE__->set_primary_key("libraryid", "key", "syncobjecttypeid");

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

=head2 syncobjecttypeid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::SyncObjectType>

=cut

__PACKAGE__->belongs_to(
  "syncobjecttypeid",
  "Biblio::Zotero::DB::Schema::Result::SyncObjectType",
  { syncobjecttypeid => "syncobjecttypeid" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:41:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+wFlsqT8vR4nUpmkXc97Mw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
