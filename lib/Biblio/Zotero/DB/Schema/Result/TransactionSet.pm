use utf8;
package Biblio::Zotero::DB::Schema::Result::TransactionSet;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::TransactionSet

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<transactionSets>

=cut

__PACKAGE__->table("transactionSets");

=head1 ACCESSORS

=head2 transactionsetid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 event

  data_type: 'text'
  is_nullable: 1

=head2 id

  data_type: 'int'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "transactionsetid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "event",
  { data_type => "text", is_nullable => 1 },
  "id",
  { data_type => "int", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</transactionsetid>

=back

=cut

__PACKAGE__->set_primary_key("transactionsetid");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:A6H1EzHILAx2ANHh52xmJA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
