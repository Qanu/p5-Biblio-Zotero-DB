package Biblio::Zotero::DB::Schema::Result::TrashItemAttachment;

# TODO: document

use strict;
use warnings;
use base qw/Biblio::Zotero::DB::Schema::Result::ItemAttachment/;

__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
__PACKAGE__->table('trashItemAttachments');
__PACKAGE__->result_source_instance->is_virtual(1);

# NOTE: SQL
__PACKAGE__->result_source_instance->view_definition(
	q[
	SELECT * FROM itemAttachments me
		WHERE (
        itemid IN ( SELECT me.itemid FROM deletedItems me )
        OR
        sourceitemid IN ( SELECT me.itemid FROM deletedItems me )
		)
	]
);
# the above view_definition is the same as:
# ----------------------------------------
# my $deleted = $schema->resultset('DeletedItem')
# 	->get_column('itemid')
# 	->as_query;
# $schema
# 	->resultset('ItemAttachment')
# 	->search(
# 		{ -or => [ { itemid => { -in => $deleted } },
# 				{ sourceitemid => { -in => $deleted } } ]
# 		}
# 	)->as_query
# ####

1;
