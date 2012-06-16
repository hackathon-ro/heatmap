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

my $cgi = CGI->new;
print "Content-type: application/json\n\n";

my $db = {
  name     => "heatmap",
  machine  => "127.0.0.1",
  port     => "3306",
  username => "root",
  password => "smeker",
};
sub error {
  my ($msg) = @_;
  print "{ error: \"$msg\" }";
  exit(-1);
};

my $url  = $cgi->param("url"    );
my $type = $cgi->param("type"    );

error("unexpected type") unless $type =~ /^(bucket|detailed)$/;
error("url invalid")     unless is_uri($url);


my ($w,$h) = (1280,1024);
my $dsn = sprintf("dbi:mysql:%s:%s:%s",$db->{name},$db->{machine},$db->{port});
my $dbh = DBI->connect($dsn,$db->{username},$db->{password});
my $sth = $dbh->prepare("select y,x  from heatmap where url=?;");

$sth->execute($url);
my $raw_data = $sth->fetchall_arrayref;
my $max = 0;
my $result = {
  data => [],
  max  => 0,
};
my @buckets;
  
if(      $type eq 'bucket') {
  my $bucket_size = $cgi->param("bucket_size" ) || 80;
  $result->{bucket_size} = $bucket_size;
  $buckets[$_->[0]/$bucket_size][$_->[1]/$bucket_size]++ for @$raw_data;

  # generate data
  for(my $y=0;$y<=$h/$bucket_size;$y++) {
    for(my $x=0;$x<=$w/$bucket_size;$x++) {
      if($buckets[$y][$x]) {
        $max = $max < $buckets[$y][$x] ? $buckets[$y][$x] : $max;
        push @{$result->{data}},{
          count => $buckets[$y][$x],
          x => $x,
          y => $y,
        };
      };
    };
  };

  $result->{max} = $max;

} elsif ($type eq 'detailed') {
  $buckets[$_->[0]][$_->[1]]++ for @$raw_data;

  for(my $y=0;$y<=$h;$y++) {
    for(my $x=0;$x<=$w;$x++) {
      if($buckets[$y][$x]) {
        $max = $max < $buckets[$y][$x] ? $buckets[$y][$x] : $max;
        push @{$result->{data}},{
          count => $buckets[$y][$x],
          x => $x,
          y => $y,
        };
      };
    };
  };

  $result->{max} = $max;
} else {
};

print encode_json($result);
