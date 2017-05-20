package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.ControlDB;
import models.Teacher;

public class TeacherDAO {

	public static Teacher getTeacherByNo(int no){
		ResultSet rs = null;
		String sql = "select * from teacher where tea_no = " + no;
		rs = ControlDB.executeQuery(sql);
		Teacher t = null;
		try {
			while(rs.next()){
				t = new Teacher();
				t.setTea_name(rs.getString("tea_name"));
				t.setTea_no(rs.getInt("tea_no"));
				t.setTea_username(rs.getString("tea_username"));
				t.setTea_password(rs.getString("tea_password"));
				t.setTea_sex(rs.getString("tea_sex"));
				t.setTea_position(rs.getString("tea_position"));
				t.setTea_professional(rs.getInt("tea_professional"));
				t.setTea_email(rs.getString("tea_email"));
				t.setTea_tel(rs.getString("tea_tel"));
				t.setTea_qq(rs.getString("tea_qq"));
				t.setTea_scope(rs.getInt("tea_scope"));
				t.setTea_realm(rs.getInt("tea_realm"));
				t.setTea_jurisdiction(rs.getInt("tea_jurisdiction"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return t;
	}
}
