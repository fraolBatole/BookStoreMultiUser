import java.sql. *;
import java.io. *;
import oracle.jdbc. *;
import oracle.jdbc.pool.OracleDataSource;

public class RegisterBooks {

    public static void main(String [] args) throws SQLException {

        String user = "C##fraol.ahmed";
        String password = "fraol7124";
        String database = "65.52.222.73:1521/cdb1";

        // Open an OracleDataSource and get a connection.
        OracleDataSource ods = new OracleDataSource();
        ods.setURL("jdbc:oracle:thin:@" + database);
        ods.setUser(user);
        ods.setPassword(password);
        Connection conn = ods.getConnection();

        try {

	    Statement stmt = conn.createStatement();
            
	    String query = "INSERT INTO BOOKTWO (title,isbn,price,avgrank,votenum,totalrank) VALUES ('"+ args[0].trim() +"','"+ args[1].trim() +"','"+ args[2].trim() +"','"+ args[3].trim() +"',1,3)";

	    ResultSet rset = stmt.executeQuery(query);

	    System.out.println(query);

	    rset.close();
	    stmt.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        conn.close();


    }


}
