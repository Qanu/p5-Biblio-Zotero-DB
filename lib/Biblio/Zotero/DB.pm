package Biblio::Zotero::DB;
{
  $Biblio::Zotero::DB::VERSION = '0.001';
}
# ABSTRACT: helper module to access the Zotero SQLite database

use strict;
use warnings;

use v5.14;
use Moo;
use File::HomeDir;
use Path::Class;
use Path::Iterator::Rule;


has schema => ( is => 'rw' );

has zotero_db_file => ( is => 'rw' );

has storage_directory => ( is => 'rw' );

has profile_directory => ( is => 'rw' );

has profile_name => ( is => 'rw' );



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
	my ($self);
	my $my_data = dir(File::HomeDir->my_data)->absolute;
	# gives /Users/<username>/Library/Application Support
	my $find = [
		dir($my_data, 'Firefox'),
		dir($my_data, 'Zotero') ];
	return $self->_find_profile_directories_under(@$find);
}

sub _find_profile_directories_win {
	my ($self);
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
	return $self->_find_profile_directories_under(@$find);
}

sub _find_profile_directories_linux {
	my ($self);
	my $find =  [
		dir(File::HomeDir->my_home , '.mozilla/firefox'),
		dir(File::HomeDir->my_home , '.zotero/zotero') ];
	return $self->_find_profile_directories_under(@$find);

}

sub _find_profile_directories_under {
	my ($self, $dirs) = @_;
	# finds either
	# dir('Profiles',<randomstring>,'zotero')
	# or
	# dir(<randomstring>, 'zotero')
	return [ Path::Iterator::Rule->new
		->min_depth(1)->max_depth(3)
		->dir->name('zotero')->all( @$dirs ) ];
}

1;

__END__

=pod

=head1 NAME

Biblio::Zotero::DB - helper module to access the Zotero SQLite database

=head1 VERSION

version 0.001

=head1 ATTRIBUTES

=head2 schema [rw]

the DBIx::Class schema

=head2 zotero_db_file

TODO

=head2 storage_directory

TODO

=head2 profile_directory

TODO

=head2 profile_name

TODO

=head1 METHODS

=head2 find_profile_directories()

returns an arrayref of the possible profile diretories that contain a
Zotero SQLite database

see: L<http://www.zotero.org/support/zotero_data> 

=head1 AUTHOR

Zakariyya Mughal <zmughal@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Zakariyya Mughal.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
