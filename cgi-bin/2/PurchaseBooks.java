import java.sql.*;
import java.io.*;
import oracle.jdbc.*;
import oracle.jdbc.pool.OracleDataSource;

class PurchaseBooks {

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
	
	   if(args.length > 1) {

	    PreparedStatement insertPurchase = conn.prepareStatement("INSERT INTO TABLE(SELECT c.cust_purchase FROM customer c where c.cust_name = '"+args[0].trim()+"') VALUES (?)");
		
	    PreparedStatement checkPurchase = conn.prepareStatement("SELECT d.purchased_book_id as purchase FROM customer c, TABLE(cust_purchase)(+) d where c.cust_name = '"+args[0].trim()+"' AND d.purchased_book_id = ?");
	    
	    PreparedStatement getPrice = conn.prepareStatement("SELECT price FROM booktwo where book_id = ?");

	    PreparedStatement updatePrice = conn.prepareStatement("UPDATE customer set total_purchase = total_purchase + ? where cust_name = '"+args[0].trim()+"'");

		
	    	
		for (int i=1;i<args.length;i++){
			
			checkPurchase.setString(1,args[i].trim());
			ResultSet rs = checkPurchase.executeQuery();
			if(!rs.isBeforeFirst()){
			    	insertPurchase.setString(1,args[i].trim());
				insertPurchase.executeUpdate();

				getPrice.setString(1,args[i].trim());
				ResultSet rset = getPrice.executeQuery();
				while(rset.next()){
					updatePrice.setString(1,rset.getString("price"));
					updatePrice.executeUpdate();
				}
				rset.close();
			}	
			rs.close();

	   	}

	    insertPurchase.close();
	    getPrice.close();
	    updatePrice.close();
	
	   }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        conn.close();

    }
}