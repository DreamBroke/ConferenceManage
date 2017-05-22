package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.ControlDB;
import models.Method;

public class MethodDAO {

	public static ArrayList<Method> getAllMethod() {
		ArrayList<Method> al = new ArrayList<>();
		ResultSet rs = null;
		String sql = "select * from method";
		Method m = null;
		rs = ControlDB.executeQuery(sql);
		try {
			while (rs.next()) {
				m = new Method();
				m.setMet_no(rs.getInt("met_no"));
				m.setMet_name(rs.getString("met_name"));
				m.setMet_brief(rs.getString("met_brief"));
				m.setMet_createtime(rs.getDate("met_createtime"));
				m.setMet_modifytime(rs.getDate("met_modifytime"));
				m.setMet_createman(rs.getInt("met_createman"));
				m.setMet_modifyman(rs.getInt("met_modifyman"));
				al.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}

	public static String getBriefByNo(String no) {
		String brief = "";
		String sql = "select met_brief from method where met_no = " + no;
		ResultSet rs = null;
		rs = ControlDB.executeQuery(sql);
		try {
			while (rs.next()) {
				brief = rs.getString("met_brief");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return brief;
	}
	
	public static String getNameByNo(String no) {
		String brief = "";
		String sql = "select met_name from method where met_no = " + no;
		ResultSet rs = null;
		rs = ControlDB.executeQuery(sql);
		try {
			while (rs.next()) {
				brief = rs.getString("met_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return brief;
	}

}
