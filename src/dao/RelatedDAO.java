package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.ControlDB;
import models.Related;

public class RelatedDAO {

	public static Related getRelatedById(int no){
		Related r = null;
		ResultSet rs = null;
		String sql = "select * from related where rel_no = " + no;
		rs = ControlDB.executeQuery(sql);
		try {
			while(rs.next()){
				r = new Related();
				r.setRel_no(rs.getInt("rel_no"));
				r.setRel_name(rs.getString("rel_name"));
				r.setRel_brief(rs.getString("rel_brief"));
				r.setRel_photo(rs.getString("rel_photo"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return r;
	}
	
	public static ArrayList<Related> getOtherRelated(){
		ArrayList<Related> al = new ArrayList<Related>();
		Related r = null;
		ResultSet rs = null;
		String sql = "select * from related where rel_no > 2";
		rs = ControlDB.executeQuery(sql);
		try {
			while(rs.next()){
				r = new Related();
				r.setRel_no(rs.getInt("rel_no"));
				r.setRel_name(rs.getString("rel_name"));
				r.setRel_brief(rs.getString("rel_brief"));
				r.setRel_photo(rs.getString("rel_photo"));
				al.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
}
