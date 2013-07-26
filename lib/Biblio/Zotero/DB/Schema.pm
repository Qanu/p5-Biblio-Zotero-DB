use utf8;
package Biblio::Zotero::DB::Schema;
{
  $Biblio::Zotero::DB::Schema::VERSION = '0.001';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UlX+tV+7vyST2GUwO/11dw

use Moose;
use Path::Class;
use Path::Class::URI;

extends 'DBIx::Class::Schema';

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

__END__

=pod

=head1 NAME

Biblio::Zotero::DB::Schema

=head1 VERSION

version 0.001

=head1 AUTHOR

Zakariyya Mughal <zmughal@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Zakariyya Mughal.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
