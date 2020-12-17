import java.sql.*;
import java.io.*;
import java.util.*;
import oracle.jdbc.*;
import oracle.jdbc.pool.OracleDataSource;

class ResetSystem {
    public static void main (String [] args) throws SQLException {
	   String user = "C##fraol.ahmed";
           String password = "fraol7124";
	   String database = "65.52.222.73:1521/cdb1";
	

	   OracleDataSource ods = new OracleDataSource ();
		ods.setURL ("jdbc:oracle:thin:@" + database);
		ods.setUser (user);
		ods.setPassword (password);
	   Connection conn = ods.getConnection();

	   try{
		Statement stmt = conn.createStatement();

		String deleteBooks = "DELETE FROM booktwo";
		stmt.executeQuery(deleteBooks );

		String deleteAuthors = "DELETE FROM customer";
		stmt.executeQuery(deleteAuthors );
		
		System.out.println("Successful!!!");
		stmt.close();
	
						
	   } catch (SQLException ex) {
	   	System.out.println(ex);
	   }
	   conn.close();
	}
}
