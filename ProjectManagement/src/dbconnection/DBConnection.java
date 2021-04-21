package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public Connection connect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");

			// Provide the correct details: DBServer/DBName, userName, password
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/gbcompany", "root", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

}
