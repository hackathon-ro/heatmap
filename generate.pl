#!/usr/bin/env perl
use strict;
use warnings;
use CGI;
use JSON;
use Data::Dumper;
use Storable;
use DateTime;
use DBI;
use Data::Validate::URI qw(is_uri);
use Image::Heatmap;

my $cgi = CGI->new;
print "Content-type: application/json\n\n";

my $db = {
  name     => "heatmap",
  machine  => "127.0.0.1",
  port     => "3306",
  username => "root",
  password => "smeker",
};

my $dsn = sprintf("dbi:mysql:%s:%s:%s",$db->{name},$db->{machine},$db->{port});
my $dbh = DBI->connect($dsn,$db->{username},$db->{password});
my $sth = $dbh->prepare('select y,x  from heatmap;');

my $bucket_size = 300;
my @buckets;

my ($w,$h) = (1280,1024);

$sth->execute();
my $raw_data = $sth->fetchall_arrayref;

$buckets[$_->[0]/$bucket_size][$_->[1]/$bucket_size]++ for @$raw_data;



my $result = {
  bucket_size => $bucket_size,
  data => [],
};
# generate data
for(my $y=0;$y<=$h/$bucket_size;$y++) {
  for(my $x=0;$x<=$w/$bucket_size;$x++) {
    push @{$result->{data}},{
      count => $buckets[$y][$x] || 0,
      x => $x,
      y => $y,
    };
  };
};

print encode_json($result);
