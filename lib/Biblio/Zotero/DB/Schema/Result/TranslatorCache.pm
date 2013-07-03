use utf8;
package Biblio::Zotero::DB::Schema::Result::TranslatorCache;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::TranslatorCache

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<translatorCache>

=cut

__PACKAGE__->table("translatorCache");

=head1 ACCESSORS

=head2 leafname

  data_type: 'text'
  is_nullable: 0

=head2 translatorjson

  data_type: 'text'
  is_nullable: 1

=head2 code

  data_type: 'text'
  is_nullable: 1

=head2 lastmodifiedtime

  data_type: 'int'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "leafname",
  { data_type => "text", is_nullable => 0 },
  "translatorjson",
  { data_type => "text", is_nullable => 1 },
  "code",
  { data_type => "text", is_nullable => 1 },
  "lastmodifiedtime",
  { data_type => "int", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</leafname>

=back

=cut

__PACKAGE__->set_primary_key("leafname");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FBPDb1yatrWIk/IipJfb2A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
