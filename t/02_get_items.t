use strict;
use warnings;
use Test::Most tests => 6;

BEGIN { use_ok 'Biblio::Zotero::DB::Schema' }
use FindBin;
use lib "$FindBin::Bin/lib";

use TestData;

my $schema;
my $sqlite_db = get_test_db_path();
$schema = Biblio::Zotero::DB::Schema->connect('dbi:SQLite:dbname='.$sqlite_db);

my $titles;
my $title_rs;

my $attachment_itemtypeid;


is( $attachment_itemtypeid = $schema
	->resultset('ItemType')
	->search({ 'typename' => 'attachment' })
	->single->itemtypeid, 14, 'got attachment type ID');

ok( $title_rs = $schema->resultset('Item')->search(
		{
			'fieldid.fieldname' => 'title',
			'itemtypeid' => { '!=', $attachment_itemtypeid }
		},
		{
			prefetch => [
					{ 'item_datas' => [ 'fieldid', 'valueid' ] },
				],
		},
	), 'got titles result-set');

ok( $titles = [
	$title_rs
		->related_resultset('item_datas')
		->related_resultset('valueid')
		->get_column('value')->all
], 'got all titles');

is( scalar @$titles, 5, 'correct number of titles');

cmp_deeply( $titles,
	bag(
		"Zotero Quick Start Guide",
		"Higher-order Perl: Transforming programs with programs",
		"Modern Perl",
		"Electrical Advantages of Dendritic Spines",
		"Big Science vs. Little Science: How Scientific Impact Scales with Funding",
	),
	'all expected titles are found'
);

done_testing;

