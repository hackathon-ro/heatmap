#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use JSON;
use Data::Dumper;
use Storable;
use DateTime;
use DBI;
my $cgi = CGI->new;
print "Content-type: text/html\n\n";
my $postdata = $cgi->param("POSTDATA");
warn "<pre>$postdata</pre>";

warn Dumper($cgi->{param});
my $x   = $cgi->param("x"   );
my $y   = $cgi->param("y"   );
my $url = $cgi->param("url" );





