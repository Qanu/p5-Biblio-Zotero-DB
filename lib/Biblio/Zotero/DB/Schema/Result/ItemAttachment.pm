use utf8;
package Biblio::Zotero::DB::Schema::Result::ItemAttachment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::ItemAttachment

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<itemAttachments>

=cut

__PACKAGE__->table("itemAttachments");

=head1 ACCESSORS

=head2 itemid

  data_type: 'integer'
  is_auto_increment: 1
  is_foreign_key: 1
  is_nullable: 0

=head2 parentitemid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 1

=head2 linkmode

  data_type: 'int'
  is_nullable: 1

=head2 contenttype

  data_type: 'text'
  is_nullable: 1

=head2 charsetid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 1

=head2 path

  data_type: 'text'
  is_nullable: 1

=head2 syncstate

  data_type: 'int'
  default_value: 0
  is_nullable: 1

=head2 storagemodtime

  data_type: 'int'
  is_nullable: 1

=head2 storagehash

  data_type: 'text'
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
  "parentitemid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 1 },
  "linkmode",
  { data_type => "int", is_nullable => 1 },
  "contenttype",
  { data_type => "text", is_nullable => 1 },
  "charsetid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 1 },
  "path",
  { data_type => "text", is_nullable => 1 },
  "syncstate",
  { data_type => "int", default_value => 0, is_nullable => 1 },
  "storagemodtime",
  { data_type => "int", is_nullable => 1 },
  "storagehash",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemid>

=back

=cut

__PACKAGE__->set_primary_key("itemid");

=head1 RELATIONS

=head2 annotations

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::Annotation>

=cut

__PACKAGE__->has_many(
  "annotations",
  "Biblio::Zotero::DB::Schema::Result::Annotation",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 charsetid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::Charset>

=cut

__PACKAGE__->belongs_to(
  "charsetid",
  "Biblio::Zotero::DB::Schema::Result::Charset",
  { charsetid => "charsetid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "NO ACTION",
  },
);

=head2 highlights

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::Highlight>

=cut

__PACKAGE__->has_many(
  "highlights",
  "Biblio::Zotero::DB::Schema::Result::Highlight",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

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

=head2 parentitemid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::Item>

=cut

__PACKAGE__->belongs_to(
  "parentitemid",
  "Biblio::Zotero::DB::Schema::Result::Item",
  { itemid => "parentitemid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:44:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hN9AWW/wa/ktSUoRoc7K1Q

# NOTE: extended DBIC schema below

use URI;
use URI::Escape;
use Path::Class;
use Path::Class::URI;
use Encode qw(encode_utf8);

# TODO: document
sub uri {
	my ($self) = @_;
	# TODO handle case where the item in not an attachment
	if(not defined $self->path) {
		# get URI from ItemDataValue table
		URI->new( $self->itemid->item_datas_rs->find(
			{ 'fieldid.fieldname' => 'url', },
			{ prefetch => [ 'fieldid', 'valueid' ] }
		)->valueid->value );
	}
	elsif($self->path =~ /^storage:/) {
		# link to file in storage
		my $key = $self->itemid->key;
		my $subdir = $self->result_source->schema->zotero_storage_directory()->subdir($key);

		my $subdir_uri = $subdir->uri->as_string;

		URI->new_abs( uri_escape( encode_utf8($self->path =~ s/^storage://r) ),
				# escaping URI because it may not be actually escaped properly in the DB
			$subdir_uri
		);
	} else {
		# link to file
		file($self->path)->uri; # NOTE this needs to be check for Zotero on non-Unix systems
	}
}

1;
