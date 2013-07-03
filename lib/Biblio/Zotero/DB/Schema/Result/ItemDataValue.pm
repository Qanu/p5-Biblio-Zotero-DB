use utf8;
package Biblio::Zotero::DB::Schema::Result::ItemDataValue;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::ItemDataValue

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<itemDataValues>

=cut

__PACKAGE__->table("itemDataValues");

=head1 ACCESSORS

=head2 valueid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 value

  data_type: (empty string)
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "valueid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "value",
  { data_type => "", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</valueid>

=back

=cut

__PACKAGE__->set_primary_key("valueid");

=head1 UNIQUE CONSTRAINTS

=head2 C<value_unique>

=over 4

=item * L</value>

=back

=cut

__PACKAGE__->add_unique_constraint("value_unique", ["value"]);

=head1 RELATIONS

=head2 item_datas

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemData>

=cut

__PACKAGE__->has_many(
  "item_datas",
  "Biblio::Zotero::DB::Schema::Result::ItemData",
  { "foreign.valueid" => "self.valueid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ta4mnXiDYmyA+kw5wpEelQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
