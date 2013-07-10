package Biblio::Zotero::DB::Schema::ResultSet::ItemData;

use strict;
use warnings;
use base 'DBIx::Class::ResultSet';

sub fields_for_itemid {
	my ($self, $itemid) = @_;


	return { map { $_->fieldid->fieldname => $_->valueid->value }
		$self->search(
			{ 'itemid' => $itemid },
			{ prefetch => [qw/fieldid valueid/] }
		)->all
	};
}

1;
