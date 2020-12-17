import java.sql.*;
import java.io.*;
import oracle.jdbc.*;
import oracle.jdbc.pool.OracleDataSource;

class SearchBooks {


   static String getRank5(float rank, int check){
 
	if(rank > 0 && rank == 1 && check == 1){
	    return "checked";
	}
	if(rank == 2  && check == 2){
	    return "checked";
	}
	if(rank == 3 && check == 3){
	    return "checked";
	}
	if(rank == 4 && check == 4){
	    return "checked";
	}
	if(rank == 5 && check == 5){
	    return "checked";
	}

	return "";	
    } 

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
        	
		if(args.length == 3){

			String query = "";

			if (args[2].trim().equals("max")){

				query = "SELECT * FROM booktwo where avgrank >= "+ args[1].trim() + " - 0.5";

			}else{
				query = "SELECT * FROM booktwo where avgrank <= 0.5 + "+ args[1].trim();

			}
			//System.out.println(query);
 			ResultSet rset = stmt.executeQuery(query);  
			System.out.println("<Button onClick='sortRank(2); return false;' type='submit' class='btn btn-primary pull-right'>Sort Ranking</button></br>");


			System.out.println("<table id='bookTable' class='table table-striped'>");
			
			System.out.println("<thead>");
			System.out.println("<tr>");
			System.out.println("<th scope='col'>#</th>");
			System.out.println("<th scope='col'>Purchase</th>");
			System.out.println("<th scope='col'>Title</th>");
			System.out.println("<th scope='col'><a href='#' onClick='sortRank(2); return false;'> Rank </a> </th>");
			System.out.println("<tr>");
			System.out.println("<thead>");
			System.out.println("<tbody>");
			int i=1;
			if(!rset.isBeforeFirst()){
				System.out.println("<div class='alert alert-warning' role='alert'>No Books Based on your search!</div>");
			}
    			while ( rset.next() ){	
				System.out.println("<tr>");
				System.out.println("<th scope='row'>"+i+"</th>");
				System.out.println("<td>"+
							"<label class='checkbox-inline'>"+
      								"<input type='checkbox' onClick='purchaseBook("+rset.getInt("book_id")+",\""+args[0].trim()+"\"); return true;' name='"+rset.getInt("book_id")+"'>"+
    							"</label>"+ 
						   "</td>");
				System.out.println("<td>"+ rset.getString("title") +"</td>");
				System.out.println("<td hidden>"+ rset.getFloat("avgrank") +"</td>");
				System.out.println("<td>"+
							"<label class='radio-inline'>"+
      								"<input type='radio' onClick='updateRank("+rset.getInt("book_id")+",1); return false;' name='"+rset.getInt("book_id")+"' "+ getRank5(Math.round(rset.getFloat("avgrank")),1) +">"+
    							"</label>"+ 
							"<label class='radio-inline'>"+
      								"<input type='radio' onClick='updateRank("+rset.getInt("book_id")+",2); return false;' name='"+rset.getInt("book_id")+"' "+ getRank5(Math.round(rset.getFloat("avgrank")),2) +">"+
    							"</label>"+ 
							"<label class='radio-inline'>"+
      								"<input type='radio' onClick='updateRank("+rset.getInt("book_id")+",3); return false;' name='"+rset.getInt("book_id")+"' "+ getRank5(Math.round(rset.getFloat("avgrank")),3) +">"+
    							"</label>"+ 
							"<label class='radio-inline'>"+
      								"<input type='radio' onClick='updateRank("+rset.getInt("book_id")+",4); return false;' name='"+rset.getInt("book_id")+"' "+ getRank5(Math.round(rset.getFloat("avgrank")),4) +">"+
    							"</label>"+
							"<label class='radio-inline'>"+
      								"<input type='radio' onClick='updateRank("+rset.getInt("book_id")+",5); return false;' name='"+rset.getInt("book_id")+"' "+ getRank5(Math.round(rset.getFloat("avgrank")),5) +">"+
    							"</label>"+
						   "</td>");

				System.out.println("</tr>");
				i++;
			}

			System.out.println("</tbody>");
			System.out.println("</table>");
			System.out.println("<Button type='submit' onClick='purchaseBook(-1,\""+args[0].trim()+"\"); return false;' class='btn btn-primary'>Complete Purchase</button></br>");

			//System.out.println("<META " + "HTTP-EQUIV=refresh "+ "CONTENT=\"1;URL='http://undcemcs02.und.edu/~fraol.ahmed/513/2/index.html'\">");

			rset.close();
		}            	
            	stmt.close();
        } catch (SQLException ex){
            System.out.println(ex);
        }

        conn.close();
    }
}
