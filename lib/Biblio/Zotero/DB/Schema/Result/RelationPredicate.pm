use utf8;
package Biblio::Zotero::DB::Schema::Result::RelationPredicate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::RelationPredicate

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<relationPredicates>

=cut

__PACKAGE__->table("relationPredicates");

=head1 ACCESSORS

=head2 predicateid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 predicate

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "predicateid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "predicate",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</predicateid>

=back

=cut

__PACKAGE__->set_primary_key("predicateid");

=head1 UNIQUE CONSTRAINTS

=head2 C<predicate_unique>

=over 4

=item * L</predicate>

=back

=cut

__PACKAGE__->add_unique_constraint("predicate_unique", ["predicate"]);

=head1 RELATIONS

=head2 collection_relations

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::CollectionRelation>

=cut

__PACKAGE__->has_many(
  "collection_relations",
  "Biblio::Zotero::DB::Schema::Result::CollectionRelation",
  { "foreign.predicateid" => "self.predicateid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_relations

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemRelation>

=cut

__PACKAGE__->has_many(
  "item_relations",
  "Biblio::Zotero::DB::Schema::Result::ItemRelation",
  { "foreign.predicateid" => "self.predicateid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:41:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ug0GIJmHTOa4oTI5+GvEZA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
