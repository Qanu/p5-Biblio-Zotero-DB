package Biblio::Zotero::DB::Schema::Result::StoredItemAttachment;

# TODO: document

use strict;
use warnings;
use base qw/Biblio::Zotero::DB::Schema::Result::ItemAttachment/;

__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
__PACKAGE__->table('storedItemAttachments');
__PACKAGE__->result_source_instance->is_virtual(1);

# NOTE: SQL
__PACKAGE__->result_source_instance->view_definition(
	q[
	SELECT * FROM itemAttachments me
		WHERE ( itemid NOT IN ( SELECT me.itemid FROM deletedItems me ) )
	]
);
# the above view_definition is the same as
# $schema
# 	->resultset('ItemAttachment')
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
