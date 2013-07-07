package TestData;
use Exporter 'import';
@EXPORT    = qw(get_test_db_path);   # afunc is a function

use strict;
use warnings;
use Path::Class;

sub get_test_db_path {
	return file(__FILE__)->dir
		->parent
		->subdir('test-data')
		->file('zotero-test-data.sqlite')
		->absolute;
}

1;
