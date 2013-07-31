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
		WHERE (
			itemid NOT IN ( SELECT me.itemid FROM deletedItems me )
			AND
			(
				sourceitemid IS NULL
				OR
				sourceitemid NOT IN ( SELECT me.itemid FROM deletedItems me )
			)
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
# 		{ -and => [ { itemid => { -not_in => $deleted } },
# 			{ -or => [ { sourceitemid => undef },
# 				{ sourceitemid => { -not_in => $deleted } }] }
# 		] }
# 	)->as_query
# ####
# the clause checking the sourceitemid is for when only the source item is
# marked as deleted, but the attachment is not

1;
