package Biblio::Zotero::DB::Schema::Result::StoredItem;

use strict;
use warnings;
use base qw/Biblio::Zotero::DB::Schema::Result::Item/;
#use base qw/DBIx::Class::Core/;

__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
__PACKAGE__->table('storeditems');
__PACKAGE__->result_source_instance->is_virtual(1);

# NOTE: SQL
__PACKAGE__->result_source_instance->view_definition(
	q[
	SELECT * FROM items me
		WHERE ( itemid NOT IN ( SELECT me.itemid FROM deletedItems me ) )
	]
);
# the above view_definition is the same as
# $schema
# 	->resultset('Item')
# 	->search(
# 		{
# 			itemid =>
# 				{ 'not in' =>
# 					$db->schema
# 						->resultset('DeletedItem')
# 						->get_column('itemid')
# 						->as_query
# 				}
# 		}
# 	)->as_query

1;
