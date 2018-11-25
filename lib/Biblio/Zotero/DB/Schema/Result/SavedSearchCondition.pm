use utf8;
package Biblio::Zotero::DB::Schema::Result::SavedSearchCondition;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::SavedSearchCondition

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<savedSearchConditions>

=cut

__PACKAGE__->table("savedSearchConditions");

=head1 ACCESSORS

=head2 savedsearchid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 searchconditionid

  data_type: 'int'
  is_nullable: 0

=head2 condition

  data_type: 'text'
  is_nullable: 0

=head2 operator

  data_type: 'text'
  is_nullable: 1

=head2 value

  data_type: 'text'
  is_nullable: 1

=head2 required

  data_type: 'none'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "savedsearchid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "searchconditionid",
  { data_type => "int", is_nullable => 0 },
  "condition",
  { data_type => "text", is_nullable => 0 },
  "operator",
  { data_type => "text", is_nullable => 1 },
  "value",
  { data_type => "text", is_nullable => 1 },
  "required",
  { data_type => "none", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</savedsearchid>

=item * L</searchconditionid>

=back

=cut

__PACKAGE__->set_primary_key("savedsearchid", "searchconditionid");

=head1 RELATIONS

=head2 savedsearchid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::SavedSearch>

=cut

__PACKAGE__->belongs_to(
  "savedsearchid",
  "Biblio::Zotero::DB::Schema::Result::SavedSearch",
  { savedsearchid => "savedsearchid" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:44:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:p4Su/NB8KE+fOGRsGajmtQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
