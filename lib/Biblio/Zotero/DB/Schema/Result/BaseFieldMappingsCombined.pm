use utf8;
package Biblio::Zotero::DB::Schema::Result::BaseFieldMappingsCombined;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::BaseFieldMappingsCombined

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<baseFieldMappingsCombined>

=cut

__PACKAGE__->table("baseFieldMappingsCombined");

=head1 ACCESSORS

=head2 itemtypeid

  data_type: 'int'
  is_nullable: 0

=head2 basefieldid

  data_type: 'int'
  is_nullable: 0

=head2 fieldid

  data_type: 'int'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "itemtypeid",
  { data_type => "int", is_nullable => 0 },
  "basefieldid",
  { data_type => "int", is_nullable => 0 },
  "fieldid",
  { data_type => "int", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemtypeid>

=item * L</basefieldid>

=item * L</fieldid>

=back

=cut

__PACKAGE__->set_primary_key("itemtypeid", "basefieldid", "fieldid");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6B6yT2r2p8qUcBXB1GQ4gA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
