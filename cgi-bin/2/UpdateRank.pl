#!/usr/bin/perl
use CGI; 


$query   = new CGI;

$id = $query -> param ('id');
$rank = $query -> param ('rank');

print ("Content-type: text/html\n\n");

print <<ENDOFTAG;
 <h1>  
ENDOFTAG
        
    	$cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom UpdateRank '$id' '$rank' ";

	#print($cmd);
	system($cmd);

	my $url="#";
	my $t=1; # time until redirect activates
	print "<META HTTP-EQUIV=refresh CONTENT=\"$t;URL=$url\">\n";

print <<ENDOFTAG;
</h1>  
ENDOFTAG
