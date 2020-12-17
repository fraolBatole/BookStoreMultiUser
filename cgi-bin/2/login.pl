#!/usr/bin/perl
use CGI;

$query = new CGI;



$username = $query -> param('username');
$password = $query -> param('password');

print ("Content-type: text/html\n\n");
print <<ENDOFTAG;
ENDOFTAG
	
        $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom login '$username' '$password' ";

	system($cmd);	
	

#my $url = 'http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/ViewBooks.cgi';
#my $t = 2;
#print "<META HTTP-EQUIV=refresh CONTENT=\"$t;URL=$url\">\n";

