package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.ControlDB;
import models.Room;

public class RoomDAO {

	public static ArrayList<Room> getRoomByHotel(String no) {
		ArrayList<Room> al = new ArrayList<Room>();
		ResultSet rs = null;
		String sql = "select * from room where roo_hotel = " + no;
		Room r = null;
		rs = ControlDB.executeQuery(sql);
		try {
			while (rs.next()) {
				r = new Room();
				r.setRoo_no(rs.getInt("roo_no"));
				r.setRoo_name(rs.getString("roo_name"));
				r.setRoo_description(rs.getString("roo_description"));
				r.setRoo_available(rs.getInt("roo_available"));
				r.setRoo_hotel(rs.getInt("roo_hotel"));
				r.setRoo_price(rs.getDouble("roo_price"));
				al.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}

	public static void decreaseAvailable(String no) {
		String sql = "UPDATE `conferencemanage`.`room` SET `roo_available` = `roo_available`-1 WHERE `roo_no` = "
				+ no;
		ControlDB.executeUpdate(sql);
	}

	public static String getNameByNo(String no) {
		String str = "";
		String sql = "select roo_name from room where roo_no = " + no;
		ResultSet rs = null;
		rs = ControlDB.executeQuery(sql);
		try {
			while (rs.next()) {
				str = rs.getString("roo_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}

	public static String getHotelByNo(String no) {
		String str = "";
		String sql = "select roo_hotel from room where roo_no = " + no;
		ResultSet rs = null;
		rs = ControlDB.executeQuery(sql);
		try {
			while (rs.next()) {
				str = rs.getString("roo_hotel");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}

	public static String getPriceByNo(String no) {
		String str = "";
		String sql = "select roo_price from room where roo_no = " + no;
		ResultSet rs = null;
		rs = ControlDB.executeQuery(sql);
		try {
			while (rs.next()) {
				str = rs.getString("roo_price");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}

}
