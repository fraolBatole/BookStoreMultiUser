import java.sql.*;
import java.io.*;
import oracle.jdbc.*;
import oracle.jdbc.pool.OracleDataSource;

class ListBooks {
    public static void main(String [] args) throws SQLException{
        String user = "C##fraol.ahmed";
        String password = "fraol7124";
	String database = "65.52.222.73:1521/cdb1";

	// Open an OracleDataSource and get a connection.
	OracleDataSource ods = new OracleDataSource( );
	ods.setURL     ( "jdbc:oracle:thin:@" + database );
	ods.setUser    ( user );
	ods.setPassword( password );
	Connection conn = ods.getConnection( );

        try {

            	Statement stmt = conn.createStatement();
        	
		if(args.length == 2){

			String query = "SELECT * FROM booktwo where isbn = '"+ args[1].trim() +"'";
 			ResultSet rset = stmt.executeQuery(query);  
			
			System.out.println("<ul class='list-group'>");
    			while ( rset.next() ){	
				System.out.println(" ISBN : <li class='list-group-item'>" + rset.getString("isbn") + "</li></br>");
				System.out.println(" Title : <li class='list-group-item'>" + rset.getString("title") + "</li></br>");
				System.out.println(" Price : <li class='list-group-item'>" + rset.getString("price") + "</li></br>");
				System.out.println(" Rank : <li class='list-group-item'>" + Math.round(rset.getFloat("avgrank")) + "</li></br>");

			}
			System.out.println("</ul>");

			rset.close();
		}else {
			String query = "SELECT * FROM booktwo";
		        
			Statement stm = conn.createStatement();

 			ResultSet rs = stm.executeQuery(query);  

			if( !rs.isBeforeFirst() ){
				System.out.println("<div class='alert alert-warning' role='alert'>No registered book!</div>");
			} 

    			while ( rs.next() ){	
				System.out.println("<li>" + "<a href='http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/ListBooks.cgi?name="+args[0].trim()+"&isbn="+rs.getString("isbn")+"'>" + rs.getString("title") + "</a>" +"</li></br>");
			}
			rs.close();
			stm.close();
		}
            	
            	stmt.close();
        } catch (SQLException ex){
            System.out.println(ex);
        }

        conn.close();
    }
}
