use Test::Most tests => 7;
use strict;
use Path::Class;

BEGIN { use_ok 'Biblio::Zotero::DB' }

# TODO, these tests should build a directory and remove it later
use constant PROFILE_NAME => 'p1qrkl5z.test';
use constant PROFILE_DIRECTORY => '/home/zaki/.zotero/zotero/p1qrkl5z.test/zotero';

test_find_profile_directories();
test_attr_profile_name();
test_attr_profile_directory();
test_attr_storage_directory();
test_attr_db_file();
test_attr_schema();

sub test_find_profile_directories {
  my $db = Biblio::Zotero::DB->new;

  use DDP; p $db->find_profile_directories;
  ok( @{$db->find_profile_directories} >= 1, 'has a profile directory');
}

sub test_attr_profile_name {
  my $db = Biblio::Zotero::DB->new;
  $db->profile_name( PROFILE_NAME );
  is( $db->profile_directory, PROFILE_DIRECTORY,
    'profile_name trigger');
}

sub test_attr_profile_directory {
  my $db = Biblio::Zotero::DB->new;
  $db->profile_directory(PROFILE_DIRECTORY);
  is( $db->profile_name, PROFILE_NAME, 'profile_name builder');

}

sub test_attr_storage_directory {
  my $db = Biblio::Zotero::DB->new;
  $db->profile_name( PROFILE_NAME );
  is( $db->storage_directory, dir(PROFILE_DIRECTORY, 'storage'),
    'storage directory');
}

sub test_attr_db_file {
  my $db = Biblio::Zotero::DB->new;
  $db->profile_name( PROFILE_NAME );
  is( $db->db_file, dir(PROFILE_DIRECTORY)->file('zotero.sqlite'),
    'storage directory');
}

sub test_attr_schema {
  my $db = Biblio::Zotero::DB->new;
  $db->profile_name( PROFILE_NAME );
  isa_ok( $db->schema, 'Biblio::Zotero::DB::Schema' );
}

done_testing;
