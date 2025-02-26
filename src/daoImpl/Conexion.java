package daoImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
	private static String host = "jdbc:mysql://localhost:3306/tpintegradorlaboratorio4?useSSL=false";
	private static String user = "root";
	private static String pass = "root";

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.err.println("Error al cargar el driver JDBC: " + e.getMessage());
		}
	}

	
	
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(host, user, pass);
	}
	
}
