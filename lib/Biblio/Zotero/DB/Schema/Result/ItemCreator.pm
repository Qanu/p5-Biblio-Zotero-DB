use utf8;
package Biblio::Zotero::DB::Schema::Result::ItemCreator;
$Biblio::Zotero::DB::Schema::Result::ItemCreator::VERSION = '0.003';
# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE


use strict;
use warnings;

use base 'DBIx::Class::Core';


__PACKAGE__->table("itemCreators");


__PACKAGE__->add_columns(
  "itemid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "creatorid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "creatortypeid",
  {
    data_type      => "int",
    default_value  => 1,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "orderindex",
  { data_type => "int", default_value => 0, is_nullable => 0 },
);


__PACKAGE__->set_primary_key("itemid", "creatorid", "creatortypeid", "orderindex");


__PACKAGE__->belongs_to(
  "creatorid",
  "Biblio::Zotero::DB::Schema::Result::Creator",
  { creatorid => "creatorid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


__PACKAGE__->belongs_to(
  "creatortypeid",
  "Biblio::Zotero::DB::Schema::Result::CreatorType",
  { creatortypeid => "creatortypeid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


__PACKAGE__->belongs_to(
  "itemid",
  "Biblio::Zotero::DB::Schema::Result::Item",
  { itemid => "itemid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oeh4tr0CDfowSGh8S3skNg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Biblio::Zotero::DB::Schema::Result::ItemCreator

=head1 VERSION

version 0.003

=head1 NAME

Biblio::Zotero::DB::Schema::Result::ItemCreator

=head1 TABLE: C<itemCreators>

=head1 ACCESSORS

=head2 itemid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 creatorid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 creatortypeid

  data_type: 'int'
  default_value: 1
  is_foreign_key: 1
  is_nullable: 0

=head2 orderindex

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</itemid>

=item * L</creatorid>

=item * L</creatortypeid>

=item * L</orderindex>

=back

=head1 RELATIONS

=head2 creatorid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::Creator>

=head2 creatortypeid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::CreatorType>

=head2 itemid

Type: belongs_to

Related object: L<Biblio::Zotero::DB::Schema::Result::Item>

=head1 AUTHOR

Zakariyya Mughal <zmughal@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Zakariyya Mughal.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
