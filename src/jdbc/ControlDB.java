package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ControlDB {

	//执行select语句
	public static ResultSet executeQuery(String sql){
		ResultSet rs = null;
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DBCon.GetConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	//用PreparedStatement执行select语句
	public static ResultSet executeQuery(String sql, String[] args){
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement ps = null;
		conn = DBCon.GetConnection();
		try {
			ps = conn.prepareStatement(sql);
			int i = 1;
			for(String s :args){
				ps.setString(i, s);
				i++;
			}
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	//执行insert、update、delete语句
	public static int executeUpdate(String sql){
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DBCon.GetConnection();
			stmt = conn.createStatement();
			int i = stmt.executeUpdate(sql);
			return i;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("执行SQL语句出错：" + e.getMessage());
			return 0;
		}finally{
			DBClose.close(stmt, conn);
		}
	}
	
}
