use utf8;
package Biblio::Zotero::DB::Schema::Result::ZoteroDummyTable;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::ZoteroDummyTable

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<zoteroDummyTable>

=cut

__PACKAGE__->table("zoteroDummyTable");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1JlgpBCxnB/x6u5a9HZEqw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
