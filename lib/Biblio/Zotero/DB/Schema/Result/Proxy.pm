use utf8;
package Biblio::Zotero::DB::Schema::Result::Proxy;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Biblio::Zotero::DB::Schema::Result::Proxy

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<proxies>

=cut

__PACKAGE__->table("proxies");

=head1 ACCESSORS

=head2 proxyid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 multihost

  data_type: 'int'
  is_nullable: 1

=head2 autoassociate

  data_type: 'int'
  is_nullable: 1

=head2 scheme

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "proxyid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "multihost",
  { data_type => "int", is_nullable => 1 },
  "autoassociate",
  { data_type => "int", is_nullable => 1 },
  "scheme",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</proxyid>

=back

=cut

__PACKAGE__->set_primary_key("proxyid");

=head1 RELATIONS

=head2 proxy_hosts

Type: has_many

Related object: L<Biblio::Zotero::DB::Schema::Result::ProxyHost>

=cut

__PACKAGE__->has_many(
  "proxy_hosts",
  "Biblio::Zotero::DB::Schema::Result::ProxyHost",
  { "foreign.proxyid" => "self.proxyid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-02 23:02:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GMlKwJS8GVtU4snBIaXjmw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
