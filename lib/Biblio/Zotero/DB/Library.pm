package Biblio::Zotero::DB::Library;

use strict;
use warnings;
use Moo;
use Biblio::Zotero::DB::Library::Trash;
use Biblio::Zotero::DB::Library::Unfiled;

has _db => ( is => 'ro', weak_ref => 1 );

=method collections

TODO

Biblio::Zotero::DB::Schema::Result::Collection

=cut
sub collections {
  my $self = shift;
  $self->_db->schema->resultset('Collection');
}

=attr name 

TODO

=cut 
has name => ( is => 'ro', default => sub { 'My Library' } );

=method items

TODO

=cut
sub items {

}

=method trash

TODO

=cut
sub trash {
  my $self = shift;
  Biblio::Zotero::DB::Library::Trash->new( _db => $self->_db );
}

=method unfiled

TODO

=cut
sub unfiled {
  my $self = shift;
  Biblio::Zotero::DB::Library::Unfiled->new( _db => $self->_db );
}

1;
