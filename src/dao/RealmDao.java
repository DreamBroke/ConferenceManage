package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.ControlDB;
import models.Realm;

public class RealmDao {

	public static ArrayList<Realm> getAllFatherRealm(){
		ArrayList<Realm> al = new ArrayList<Realm>();
		ResultSet rs = null;
		String sql = "select * from realm where rea_father = 0";
		rs = ControlDB.executeQuery(sql);
		Realm r = null;
		try {
			while(rs.next()){
				r = new Realm();
				r.setRea_no(rs.getInt("rea_no"));
				r.setRea_name(rs.getString("rea_name"));
				r.setRea_father(rs.getInt("rea_father"));
				r.setRea_createtime(rs.getDate("rea_createtime"));
				r.setRea_modifytime(rs.getDate("rea_modifytime"));
				al.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
	
	public static ArrayList<Realm> getSonRealmByNo(String s){
		ArrayList<Realm> al = new ArrayList<Realm>();
		ResultSet rs = null;
		String sql = "select * from realm where rea_father = " + s;
		rs = ControlDB.executeQuery(sql);
		Realm r = null;
		try {
			while(rs.next()){
				r = new Realm();
				r.setRea_no(rs.getInt("rea_no"));
				r.setRea_name(rs.getString("rea_name"));
				r.setRea_father(rs.getInt("rea_father"));
				r.setRea_createtime(rs.getDate("rea_createtime"));
				r.setRea_modifytime(rs.getDate("rea_modifytime"));
				r.setRea_createman(rs.getInt("rea_createman"));
				r.setRea_modifyman(rs.getInt("rea_modifyman"));
				al.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
	
	public static String getNameByNo(String no){
		String sql = "select rea_name from realm where rea_no = " + no;
		ResultSet rs = null;
		rs = ControlDB.executeQuery(sql);
		String str = "";
		try {
			while(rs.next()){
				str = rs.getString("rea_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
	
}
