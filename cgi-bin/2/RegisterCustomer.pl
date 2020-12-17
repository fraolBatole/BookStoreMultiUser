#!/usr/bin/perl
use CGI; 


$query   = new CGI;

$name = $query -> param ('name');

print ("Content-type: text/html\n\n");

print <<ENDOFTAG;
 <h1>  
ENDOFTAG
        
    	$cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom RegisterCustomer '$name' ";

	print($cmd);
	system($cmd);

	my $url="http://undcemcs02.und.edu/~fraol.ahmed/513/2/RegisterCust.html";
	my $t=1; # time until redirect activates
	print "<META HTTP-EQUIV=refresh CONTENT=\"$t;URL=$url\">\n";

print <<ENDOFTAG;
</h1>  
ENDOFTAG
