use utf8;
package Biblio::Zotero::DB::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UlX+tV+7vyST2GUwO/11dw

use Moo;
use Path::Class;
use Path::Class::URI;

extends 'DBIx::Class::Schema';

=head1 SYNOPSIS

  $schema = Biblio::Zotero::DB::Schema->connect(
    'dbi:SQLite:dbname='.'/path/to/profile/zotero.sqlite',
    '', '',
    { zotero_storage_directory => '/path/to/profile/storage' },
  );

=cut

=attr zotero_storage_directory

a string the storage directory for attachments associated with the database.
This is optional and can be set by using the connection attribute
C<zotero_storage_directory>.

=cut
has zotero_storage_directory => ( is => 'rw' );

around connection => sub {
	my ( $inner, $self, $dsn, $username, $pass, $attr ) = ( shift, @_ );

	$self->zotero_storage_directory(dir(
		delete $attr->{zotero_storage_directory}
	)->absolute) if(exists $attr->{zotero_storage_directory});

	$attr->{ReadOnly} = 1; # force to be readonly

	$inner->(@_);
};

1;
