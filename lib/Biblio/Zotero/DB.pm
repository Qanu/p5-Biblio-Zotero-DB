package Biblio::Zotero::DB;
{
  $Biblio::Zotero::DB::VERSION = '0.001';
}
# ABSTRACT: helper module to access the Zotero SQLite database

use strict;
use warnings;

use Moo;


has schema => ( is => 'rw' );

has zotero_db_file => ( is => 'rw' );

has storage_directory => ( is => 'rw' );

has profile_directory => ( is => 'rw' );

has profile_name => ( is => 'rw' );



sub find_profile_directories {

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
