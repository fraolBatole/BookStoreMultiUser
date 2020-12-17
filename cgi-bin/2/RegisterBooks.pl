#!/usr/bin/perl
use CGI; 


$query   = new CGI;

$title = $query -> param ('title');
$isbn = $query -> param ('isbn');
$price = $query -> param ('price');
$rate = $query -> param ('rate');

print ("Content-type: text/html\n\n");

print <<ENDOFTAG;
 <h1>  
ENDOFTAG
        
    	$cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom RegisterBooks '$title' '$isbn' '$price' '$rate' ";

	print($cmd);
	system($cmd);

	my $url="http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/AdminPage.cgi";
	my $t=1; # time until redirect activates
	print "<META HTTP-EQUIV=refresh CONTENT=\"$t;URL=$url\">\n";

print <<ENDOFTAG;
</h1>  
ENDOFTAG
