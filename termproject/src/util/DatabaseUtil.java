package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	public static Connection getConnection() {
	try {
		String dbURL = "jdbc:mysql://localhost:3306/skubab?characterEncoding=UTF-8&serverTimezone=UTC";
		String dbID = "root";
		String dbpassword = "bang";
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(dbURL,dbID,dbpassword);
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return null;
	}
	
	
}
