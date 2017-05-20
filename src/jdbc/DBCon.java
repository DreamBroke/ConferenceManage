package jdbc;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBCon {
	
	private static String DB_DRIVER;
	
	private static String DB_URL;
	
	private static String DB_USERNAME;
	
	private static String DB_PASSWORD;
	
	static{
		Properties p = new Properties();
		InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("dbconfig.properties");
		try {
			p.load(is);
			DB_DRIVER = p.getProperty("driver");
			DB_URL = p.getProperty("url");
			DB_USERNAME = p.getProperty("user");
			DB_PASSWORD = p.getProperty("password");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private DBCon(){}
	public static Connection GetConnection(){
		Connection conn = null;
		try {
			Class.forName(DB_DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void main(String[] args) {
		Connection conn = GetConnection();
		if(conn == null){
			System.out.println("a");
		}else{
			System.out.println("b");
		}
	}
	
}
