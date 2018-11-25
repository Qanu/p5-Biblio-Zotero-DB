use utf8;
package Biblio::Zotero::DB::Schema::Result::Library;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::Library

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<libraries>

=cut

__PACKAGE__->table("libraries");

=head1 ACCESSORS

=head2 libraryid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 type

  data_type: 'text'
  is_nullable: 0

=head2 editable

  data_type: 'int'
  is_nullable: 0

=head2 fileseditable

  data_type: 'int'
  is_nullable: 0

=head2 version

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=head2 storageversion

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=head2 lastsync

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=head2 archived

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "libraryid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "type",
  { data_type => "text", is_nullable => 0 },
  "editable",
  { data_type => "int", is_nullable => 0 },
  "fileseditable",
  { data_type => "int", is_nullable => 0 },
  "version",
  { data_type => "int", default_value => 0, is_nullable => 0 },
  "storageversion",
  { data_type => "int", default_value => 0, is_nullable => 0 },
  "lastsync",
  { data_type => "int", default_value => 0, is_nullable => 0 },
  "archived",
  { data_type => "int", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</libraryid>

=back

=cut

__PACKAGE__->set_primary_key("libraryid");

=head1 RELATIONS

=head2 collections

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::Collection>

=cut

__PACKAGE__->has_many(
  "collections",
  "Biblio::Zotero::DB::Schema::Result::Collection",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feed

Type: might_have

Related object: L<Biblio::Zotero::DB::Schema::Result::Feed>

=cut

__PACKAGE__->might_have(
  "feed",
  "Biblio::Zotero::DB::Schema::Result::Feed",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 group

Type: might_have

Related object: L<Biblio::Zotero::DB::Schema::Result::Group>

=cut

__PACKAGE__->might_have(
  "group",
  "Biblio::Zotero::DB::Schema::Result::Group",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 items

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::Item>

=cut

__PACKAGE__->has_many(
  "items",
  "Biblio::Zotero::DB::Schema::Result::Item",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 saved_searches

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::SavedSearch>

=cut

__PACKAGE__->has_many(
  "saved_searches",
  "Biblio::Zotero::DB::Schema::Result::SavedSearch",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 storage_delete_logs

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::StorageDeleteLog>

=cut

__PACKAGE__->has_many(
  "storage_delete_logs",
  "Biblio::Zotero::DB::Schema::Result::StorageDeleteLog",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sync_caches

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::SyncCache>

=cut

__PACKAGE__->has_many(
  "sync_caches",
  "Biblio::Zotero::DB::Schema::Result::SyncCache",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sync_delete_logs

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::SyncDeleteLog>

=cut

__PACKAGE__->has_many(
  "sync_delete_logs",
  "Biblio::Zotero::DB::Schema::Result::SyncDeleteLog",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sync_queues

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::SyncQueue>

=cut

__PACKAGE__->has_many(
  "sync_queues",
  "Biblio::Zotero::DB::Schema::Result::SyncQueue",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 synced_settings

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::SyncedSetting>

=cut

__PACKAGE__->has_many(
  "synced_settings",
  "Biblio::Zotero::DB::Schema::Result::SyncedSetting",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:44:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:L40qp9S0HpJs0tcwga1dgw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
