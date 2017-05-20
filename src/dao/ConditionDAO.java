package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.ControlDB;

public class ConditionDAO {

	public static String getNameByNo(String no){
		String sql = "select cond_name from `condition` where cond_no = " + no;
		ResultSet rs = null;
		rs = ControlDB.executeQuery(sql);
		String str = "";
		try {
			while(rs.next()){
				str = rs.getString("cond_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
	
}
