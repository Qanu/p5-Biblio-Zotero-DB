use utf8;
package Biblio::Zotero::DB::Schema::Result::Annotation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::Annotation

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<annotations>

=cut

__PACKAGE__->table("annotations");

=head1 ACCESSORS

=head2 annotationid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 itemid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 parent

  data_type: 'text'
  is_nullable: 1

=head2 textnode

  data_type: 'int'
  is_nullable: 1

=head2 offset

  data_type: 'int'
  is_nullable: 1

=head2 x

  data_type: 'int'
  is_nullable: 1

=head2 y

  data_type: 'int'
  is_nullable: 1

=head2 cols

  data_type: 'int'
  is_nullable: 1

=head2 rows

  data_type: 'int'
  is_nullable: 1

=head2 text

  data_type: 'text'
  is_nullable: 1

=head2 collapsed

  data_type: 'bool'
  is_nullable: 1

=head2 datemodified

  data_type: 'date'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "annotationid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "itemid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "parent",
  { data_type => "text", is_nullable => 1 },
  "textnode",
  { data_type => "int", is_nullable => 1 },
  "offset",
  { data_type => "int", is_nullable => 1 },
  "x",
  { data_type => "int", is_nullable => 1 },
  "y",
  { data_type => "int", is_nullable => 1 },
  "cols",
  { data_type => "int", is_nullable => 1 },
  "rows",
  { data_type => "int", is_nullable => 1 },
  "text",
  { data_type => "text", is_nullable => 1 },
  "collapsed",
  { data_type => "bool", is_nullable => 1 },
  "datemodified",
  { data_type => "date", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</annotationid>

=back

=cut

__PACKAGE__->set_primary_key("annotationid");

=head1 RELATIONS

=head2 itemid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::ItemAttachment>

=cut

__PACKAGE__->belongs_to(
  "itemid",
  "Biblio::Zotero::DB::Schema::Result::ItemAttachment",
  { itemid => "itemid" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-11-25 12:44:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:78HAbANDYCvZ0CxhPjLY1w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
