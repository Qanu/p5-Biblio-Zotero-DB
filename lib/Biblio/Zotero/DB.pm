package Biblio::Zotero::DB;
# ABSTRACT: helper module to access the Zotero SQLite database

use strict;
use warnings;

use v5.14;
use Moo;
use File::HomeDir;
use Path::Class;
use Path::Iterator::Rule;
use Class::Method::Modifiers;
use List::AllUtils qw(first);

use Biblio::Zotero::DB::Schema;

=attr schema

the L<DBIx::Class> schema that is connected to the C<zotero.sqlite> file

=cut
has schema => ( is => 'rw', builder => 1, lazy => 1 );

sub _build_schema {
	my ($self) = @_;
	Biblio::Zotero::DB::Schema->connect('dbi:SQLite:dbname='.$self->db_file,
		'', '',
		{
			(zotero_storage_directory => $self->storage_directory)x!! $self->storage_directory
		},
	);
}

=attr db_file

a string that contains the filename of the C<zotero.sqlite> file
The default is located in the directory of C<L</profile_directory>> attribute.

=cut
has db_file => ( is => 'rw', builder => 1, lazy => 1 );

sub _build_db_file {
	my ($self) = @_;
	dir($self->profile_directory)->file('zotero.sqlite');
}

=attr storage_directory

a string that contains the directory where the Zotero attachments are located.
The default is the C<storage> subdirectory of the C<L</profile_directory>> directory.

=cut
has storage_directory => ( is => 'rw', builder => 1, lazy => 1 );

sub _build_storage_directory {
	my ($self) = @_;
	dir($self->profile_directory)->subdir('storage');
}


=attr profile_directory

a string that contains the directory where the C<zotero.sqlite> database is located,
e.g.  C<~/.zotero/zotero/abc123.default/zotero/>.

=cut
has profile_directory => ( is => 'rw' );

=attr profile_name

a string containing the profile name to use, e.g. C<abc123.default>, which
corresponds to a profile directory such as
C<~/.zotero/zotero/abc123.default/zotero/>. Setting this will set the
C<L</profile_directory>> attribute.

=cut
has profile_name => ( is => 'rw', trigger => 1, builder => 1, lazy => 1 );

sub _trigger_profile_name {
	my ($self) = @_;
	$self->profile_directory(
		first { dir($_)->components(-2) eq $self->profile_name }
			@{$self->find_profile_directories});
}

sub _build_profile_name {
	my ($self) = @_;
	dir($self->profile_directory)->components(-2) if $self->profile_directory;
}

=method find_profile_directories()

returns an arrayref of the possible profile diretories that contain a
Zotero SQLite database

see: L<http://www.zotero.org/support/zotero_data> 

=cut

# From <http://www.zotero.org/support/zotero_data>
# Zotero for Firefox
#
# OS X                          /Users/<username>/Library/Application Support/Firefox/Profiles/<randomstring>/zotero
# Windows 7/Vista               C:\Users\<User Name>\AppData\Roaming\Mozilla\Firefox\Profiles\<randomstring>\zotero
# Windows XP/2000               C:\Documents and Settings\<username>\Application Data\Mozilla\Firefox\Profiles\<randomstring>\zotero
# Linux (most distributions)    ~/.mozilla/firefox/Profiles/<randomstring>/zotero

# Zotero Standalone
#
# OS X                          /Users/<username>/Library/Application Support/Zotero/Profiles/<randomstring>/zotero
# Windows 7/Vista               C:\Users\<User Name>\AppData\Roaming\Zotero\Profiles\<randomstring>\zotero
# Windows XP/2000               C:\Documents and Settings\<username>\Application Data\Zotero\Profiles\<randomstring>\zotero
# Linux (most distributions)    ~/.zotero/Profiles/<randomstring>/zotero


sub find_profile_directories {
	my ($self) = @_;
	for($^O) {
		return $self->_find_profile_directories_linux when('linux');
		return $self->_find_profile_directories_osx when('darwin');
		return $self->_find_profile_directories_win when('MSWin32');
		default { return [] };
	}
}

sub _find_profile_directories_osx {
	my ($self) = @_;
	my $my_data = dir(File::HomeDir->my_data)->absolute;
	# gives /Users/<username>/Library/Application Support
	my $find = [
		dir($my_data, 'Firefox'),
		dir($my_data, 'Zotero') ];
	return $self->_find_profile_directories_under($find);
}

sub _find_profile_directories_win {
	my ($self) = @_;
	my $my_data = dir(File::HomeDir->my_data)->absolute;
	# gives C:\Users\<User Name>\AppData\Local
	# or C:\Documents and Settings\<User Name>\Local Settings\Application Data
	# depending on OS version
	if( $my_data->components(-1) eq "Local" ) {
		# for Windows 7 / Vista
		# this returns the \Local directory
		# we want the \Roaming directory that is on the same level
		$my_data = $my_data->parent->subdir('Roaming');
	}
	my $find = [
		dir( $my_data, 'Mozilla','Firefox'),
		dir( $my_data, 'Zotero') ];
	return $self->_find_profile_directories_under($find);
}

sub _find_profile_directories_linux {
	my ($self) = @_;
	my $find =  [
		dir(File::HomeDir->my_home , '.mozilla/firefox'),
		dir(File::HomeDir->my_home , '.zotero/zotero') ];
	return $self->_find_profile_directories_under($find);
}

sub _find_profile_directories_under {
	my ($self, $dirs) = @_;
	# finds either
	# dir('Profiles',<randomstring>,'zotero')
	# (actually, currently it doesn't check for the Profiles directory)
	# or
	# dir(<randomstring>, 'zotero')
	return [ Path::Iterator::Rule->new
		->min_depth(1)->max_depth(3)
		->dir->name('zotero')->all( @$dirs ) ];
}

1;
