import java.sql.*;
import java.io.*;
import oracle.jdbc.*;
import oracle.jdbc.pool.OracleDataSource;

class ListCustomers {
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
        	Statement stmtTitle = conn.createStatement();

		if(args.length == 2){

			String query = "SELECT * FROM customer where cust_id = '"+ args[1].trim() +"'";
			String getTitle = "SELECT d.purchased_book_id,b.title FROM booktwo b,customer c, TABLE(cust_purchase)(+) d where c.cust_id =  '"+ args[1].trim() +"' AND b.book_id = d.purchased_book_id";
		      
 			ResultSet rset = stmt.executeQuery(query);  
			
			System.out.println("<ul class='list-group'>");
    			while ( rset.next() ){	
				System.out.println(" ID : <li class='list-group-item'>" + rset.getString("cust_id") + "</li></br>");
				System.out.println(" Name : <li class='list-group-item'>" + rset.getString("cust_name") + "</li></br>");
				System.out.println(" Total Spent : <li class='list-group-item'>" + rset.getString("total_purchase") + "</li></br>");

			}

			ResultSet rs = stmtTitle.executeQuery(getTitle);
			System.out.println("Titles : ");

			while (rs.next()) {

				System.out.println(" <li class='list-group-item'>" + rs.getString("title") + "</li></br>");

			}
			System.out.println("</ul>");

			rset.close();
			rs.close();

		} 

		else if (args[0].trim().equals("admin")){

			String query = "SELECT * FROM customer";
		        
			Statement stm = conn.createStatement();

 			ResultSet rs = stm.executeQuery(query);  

			if( !rs.isBeforeFirst() ){
				System.out.println("<div class='alert alert-warning' role='alert'>No registered Customer!</div>");
			} 

    			while ( rs.next() ){	
				System.out.println("<li>" + "<a href='http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/ListCustomers.cgi?name="+args[0].trim()+"&id="+rs.getString("cust_id")+"'>" + rs.getString("cust_name") + "</a>" +"</li></br>");
			}

			rs.close();
			stm.close();


		}else {

			String query = "SELECT * FROM customer where cust_name='"+ args[0].trim() +"'";
		        
			Statement stm = conn.createStatement();

 			ResultSet rs = stm.executeQuery(query);  

			if( !rs.isBeforeFirst() ){
				System.out.println("<div class='alert alert-warning' role='alert'>No registered book!</div>");
			} 

    			while ( rs.next() ){	
				System.out.println("<li>" + "<a href='http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/ListCustomers.cgi?name="+args[0].trim()+"&id="+rs.getString("cust_id")+"'>" + rs.getString("cust_name") + "</a>" +"</li></br>");
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
