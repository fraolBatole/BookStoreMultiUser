#!/usr/bin/perl
use CGI; 


$query   = new CGI;
$uname = $query -> param("uname");
print ("Content-type: text/html\n\n");

print <<ENDOFTAG;
 <h1>  
ENDOFTAG
        
    $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom PurchaseBooks $uname ";
    
	my @bookId = $query -> param('id');
	foreach my $id (@bookId) {    $cmd .= "'" . $id .  "' "; }

	print($cmd);
	system($cmd);

my $url="http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/home.cgi?name=$uname";
my $t=1; # time until redirect activates
print "<META HTTP-EQUIV=refresh CONTENT=\"$t;URL=$url\">\n";

print <<ENDOFTAG;
</h1>  
ENDOFTAG
