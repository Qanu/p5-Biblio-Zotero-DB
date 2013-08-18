package Biblio::Zotero::DB::Library::Trash;

use strict;
use warnings;
use Moo;

has _db => ( is => 'ro', weak_ref => 1 );

=attr name 

TODO

=cut 
has name => ( is => 'ro', default => sub { 'Trash' } );

=method items

TODO

=cut
sub items {
  my $self = shift;
	my $schema = $self->_db->schema;
  $schema->resultset('Item')
    ->trash_items;
}

1;
