import java.sql. *;
import java.io. *;
import oracle.jdbc. *;
import oracle.jdbc.pool.OracleDataSource;

public class RegisterCustomer {

    public static void main(String[] args) throws SQLException {

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

            String query = "INSERT INTO customer (cust_name,total_purchase,cust_purchase) VALUES ('" + args[0].trim().replaceAll("\\s","") + "',0,new cust())";

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
