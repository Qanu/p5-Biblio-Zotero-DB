use utf8;
package Biblio::Zotero::DB::Schema::Result::Relation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::Relation

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<relations>

=cut

__PACKAGE__->table("relations");

=head1 ACCESSORS

=head2 libraryid

  data_type: 'int'
  is_nullable: 0

=head2 subject

  data_type: 'text'
  is_nullable: 0

=head2 predicate

  data_type: 'text'
  is_nullable: 0

=head2 object

  data_type: 'text'
  is_nullable: 0

=head2 clientdatemodified

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "libraryid",
  { data_type => "int", is_nullable => 0 },
  "subject",
  { data_type => "text", is_nullable => 0 },
  "predicate",
  { data_type => "text", is_nullable => 0 },
  "object",
  { data_type => "text", is_nullable => 0 },
  "clientdatemodified",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</subject>

=item * L</predicate>

=item * L</object>

=back

=cut

__PACKAGE__->set_primary_key("subject", "predicate", "object");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kJd1BrKNRtrMybVuwK65xg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
