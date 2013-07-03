use utf8;
package Biblio::Zotero::DB::Schema::Result::FieldsCombined;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::FieldsCombined

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<fieldsCombined>

=cut

__PACKAGE__->table("fieldsCombined");

=head1 ACCESSORS

=head2 fieldid

  data_type: 'int'
  is_nullable: 0

=head2 fieldname

  data_type: 'text'
  is_nullable: 0

=head2 label

  data_type: 'text'
  is_nullable: 1

=head2 fieldformatid

  data_type: 'int'
  is_nullable: 1

=head2 custom

  data_type: 'int'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "fieldid",
  { data_type => "int", is_nullable => 0 },
  "fieldname",
  { data_type => "text", is_nullable => 0 },
  "label",
  { data_type => "text", is_nullable => 1 },
  "fieldformatid",
  { data_type => "int", is_nullable => 1 },
  "custom",
  { data_type => "int", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</fieldid>

=back

=cut

__PACKAGE__->set_primary_key("fieldid");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZI65ORMoLc5DQXZVcha8hw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
