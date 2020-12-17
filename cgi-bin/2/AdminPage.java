import java.sql.*;
import java.io.*;
import oracle.jdbc.*;
import oracle.jdbc.pool.OracleDataSource;

class displayAuthor {
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
	     	Statement stmt1 = conn.createStatement();
		ResultSet rsAuthor = stmt1.executeQuery("SELECT author_name from authors a where a.author_id = '"+args[0].trim()+"' ");
		
		System.out.println("ID: <input class='form-control' type='text' name='authorID' value='"+args[0].trim()+"' id = 'authorID' readonly>");

		while (rsAuthor.next()){

			System.out.println("Author Name: <input class='form-control' type='text' name='authorName' id = 'authorName' value='"+rsAuthor.getString("author_name")+"' readonly>");
		}

		Statement stmt2 = conn.createStatement();
		ResultSet rsTitle = stmt1.executeQuery("SELECT DISTINCT title from books b, table(b.author_id) d where d.author_id = '"+args[0].trim()+"' ");
		String authorsBook = "Authors Books :";
		while (rsTitle.next()){

			authorsBook += "<input class='form-control' type='text' name='authorTitle' id = 'authorTitle' value='"+rsTitle.getString("title")+"' readonly>";
		}
		System.out.println(authorsBook);

		Statement stmt3 = conn.createStatement();
		ResultSet rsGenre = stmt3.executeQuery("SELECT DISTINCT gg.genre_name from books b, table(b.author_id) d,table(b.genre_id) g, genre gg where d.author_id = '"+args[0].trim()+"' AND gg.genre_id = g.genre_id");
		String authorsGenre = "Authors GENRE(Speciality) :";
		while (rsGenre.next()){

			authorsGenre += "<input class='form-control' type='text' name='authorGenre' id = 'authorGenre' value='"+rsGenre.getString("genre_name")+"' readonly>";
		}
		System.out.println(authorsGenre);


		rsAuthor.close();
		rsTitle.close();
		rsGenre.close();

		stmt1.close();
		stmt2.close();
		stmt3.close();


	   } catch (SQLException ex) {
	   	System.out.println(ex);
	   }
	   conn.close();

	
	}
}