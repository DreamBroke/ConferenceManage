package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.ControlDB;
import models.Hotel;

public class HotelDAO {
	
	public static ArrayList<Hotel> getAllHotel(){
		ResultSet rs = null;
		String sql = "select * from hotel";
		rs = ControlDB.executeQuery(sql);
		ArrayList<Hotel> al = new ArrayList<Hotel>();
		Hotel h = null;
		try {
			while(rs.next()){
				h = new Hotel();
				h.setHot_no(rs.getInt("hot_no"));
				h.setHot_name(rs.getString("hot_name"));
				h.setHot_tel(rs.getString("hot_tel"));
				h.setHot_address(rs.getString("hot_address"));
				h.setHot_capital(rs.getString("hot_capital"));
				h.setHot_remarks(rs.getString("hot_remarks"));
				h.setHot_room(rs.getString("hot_room"));
				h.setHot_linkman(rs.getString("hot_linkman"));
				h.setHot_arrangement(rs.getString("hot_arrangement"));
				h.setHot_lnglat(rs.getString("hot_lnglat"));
				al.add(h);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
	
}
