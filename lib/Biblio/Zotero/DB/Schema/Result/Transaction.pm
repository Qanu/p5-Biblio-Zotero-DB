use utf8;
package Biblio::Zotero::DB::Schema::Result::Transaction;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::Transaction

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<transactions>

=cut

__PACKAGE__->table("transactions");

=head1 ACCESSORS

=head2 transactionid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 transactionsetid

  data_type: 'int'
  is_nullable: 1

=head2 context

  data_type: 'text'
  is_nullable: 1

=head2 action

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "transactionid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "transactionsetid",
  { data_type => "int", is_nullable => 1 },
  "context",
  { data_type => "text", is_nullable => 1 },
  "action",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</transactionid>

=back

=cut

__PACKAGE__->set_primary_key("transactionid");

=head1 RELATIONS

=head2 transaction_logs

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::TransactionLog>

=cut

__PACKAGE__->has_many(
  "transaction_logs",
  "Biblio::Zotero::DB::Schema::Result::TransactionLog",
  { "foreign.transactionid" => "self.transactionid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6iOwQYg25n+0AL0zAmGH9A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
