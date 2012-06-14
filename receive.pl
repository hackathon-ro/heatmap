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
print "Content-type: text/html\n\n";

my $type   = $cgi->param("type"   );
my $x      = $cgi->param("x"      );
my $y      = $cgi->param("y"      );
my $url    = $cgi->param("url"    );
my $button = $cgi->param("button" );

sub error {
  my ($msg) = @_;
  print "{ error: \"$msg\" }";
  exit(-1);
};

error("coordinates not integers") unless ($x =~ /^\d+$/ && $y =~ /^\d+$/ );
error("type not move\/click")     unless ($type =~ /^(move|click)$/ );
error("url invalid")              unless is_uri($url);



warn Dumper([$x,$y,$url,$button]);
my $db = {
  name     => "heatmap",
  machine  => "127.0.0.1",
  port     => "3306",
  username => "root",
  password => "smeker",
};

if(       $type eq "click") {

  my $dsn = sprintf("dbi:mysql:%s:%s:%s",$db->{name},$db->{machine},$db->{port});
  my $dbh = DBI->connect($dsn,$db->{username},$db->{password});
  my $time = DateTime->now->ymd;
  $dbh->do("INSERT INTO heatmap(id,url,time,x,y,button) VALUES(DEFAULT,\"$url\",\"$time\",$x,$y,$button);");

} elsif ( $type eq "move") {

} else {
};





