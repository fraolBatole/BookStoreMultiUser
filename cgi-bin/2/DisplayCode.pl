#!/usr/bin/perl
use CGI; 
$query     = new CGI;

$act = $query->param('act');

print( "Content-type: text/plain\n\n" );

    if ( $act == 1 ) {
      system( "cat AdminPage.cgi;echo '\n\n\n\n\n';cat AdminPage.pl;echo '\n\n\n\n\n';cat AdminPage.java" );
    }   
    elsif ( $act == 2 ) {
      system( "cat home.cgi;echo '\n\n\n\n\n';cat home.pl;echo '\n\n\n\n\n';cat SearchBooks.java" );
    }
    elsif ( $act == 3 ) {
      system( "cat ListBooks.cgi;echo '\n\n\n\n\n';cat ListBooks.pl;echo '\n\n\n\n\n';cat ListBooks.java" );
    }
    elsif ( $act == 4 ) {
      system( "cat ListCustomers.cgi;echo '\n\n\n\n\n';cat ListCustomers.pl;echo '\n\n\n\n\n';cat ListCustomers.java" );
    }
    else {
      print( "\n\n\n     No such interface: $interface" );
    }