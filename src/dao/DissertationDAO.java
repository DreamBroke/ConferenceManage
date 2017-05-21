package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import jdbc.ControlDB;
import models.Dissertation;

public class DissertationDAO {

	public static void insertDissertation(Dissertation dis) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = dis.getDis_file();
		str = str.replaceAll("\\\\", "\\\\\\\\");
		String sql = "INSERT INTO dissertation(dis_title, dis_keyword, dis_abstract, dis_realm, dis_author, dis_file, dis_uptime) VALUES ('"
				+ dis.getDis_title()
				+ "', '"
				+ dis.getDis_keyword()
				+ "', '"
				+ dis.getDis_abstract()
				+ "', "
				+ dis.getDis_realm()
				+ ", "
				+ dis.getDis_author()
				+ ", '"
				+ str
				+ "', '"
				+ format.format(dis.getDis_uptime()) + "')";
		// System.out.println(sql);
		ControlDB.executeUpdate(sql);
	}

	public static void updateDissertation(Dissertation dis) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = dis.getDis_file();
		str = str.replaceAll("\\\\", "\\\\\\\\");
		String sql = "UPDATE dissertation SET `dis_title` = '"
				+ dis.getDis_title() + "', `dis_keyword` = '"
				+ dis.getDis_keyword() + "', `dis_abstract` = '"
				+ dis.getDis_abstract() + "', `dis_file` = '"
						+ str + "', `dis_uptime` = '"
				+ format.format(dis.getDis_uptime()) + "' WHERE `dis_no` = " + dis.getDis_no();
		// System.out.println(sql);
		ControlDB.executeUpdate(sql);
	}

	public static void deleteDissertationByNo(String no) {
		String sql = "DELETE FROM `conferencemanage`.`dissertation` WHERE dis_no = '"
				+ no + "';";
		String sql2 = "DELETE FROM `conferencemanage`.`author` WHERE aut_dissertation = " + no;
		ControlDB.executeUpdate(sql);
		ControlDB.executeUpdate(sql2);
	}

	public static ArrayList<Dissertation> getDissertationByAuthor(String author) {
		ArrayList<Dissertation> al = new ArrayList<Dissertation>();
		ResultSet rs = null;
		String sql = "select * from dissertation where dis_author = " + author;
		Dissertation dis = null;
		rs = ControlDB.executeQuery(sql);
		try {
			while (rs.next()) {
				dis = new Dissertation();
				dis.setDis_no(rs.getInt("dis_no"));
				dis.setDis_title(rs.getString("dis_title"));
				dis.setDis_keyword(rs.getString("dis_keyword"));
				dis.setDis_abstract(rs.getString("dis_abstract"));
				dis.setDis_realm(rs.getInt("dis_realm"));
				dis.setDis_author(rs.getInt("dis_author"));
				dis.setDis_file(rs.getString("dis_file"));
				dis.setDis_condition(rs.getInt("dis_condition"));
				dis.setDis_uptime(rs.getDate("dis_uptime"));
				dis.setDis_apptime(rs.getDate("dis_apptime"));
				al.add(dis);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}

	public static Dissertation getDissertationByNo(String no) {
		Dissertation dis = new Dissertation();
		ResultSet rs = null;
		String sql = "select * from dissertation where dis_no = " + no;
		rs = ControlDB.executeQuery(sql);
		try {
			while (rs.next()) {
				dis.setDis_no(rs.getInt("dis_no"));
				dis.setDis_title(rs.getString("dis_title"));
				dis.setDis_keyword(rs.getString("dis_keyword"));
				dis.setDis_abstract(rs.getString("dis_abstract"));
				dis.setDis_realm(rs.getInt("dis_realm"));
				dis.setDis_author(rs.getInt("dis_author"));
				dis.setDis_file(rs.getString("dis_file"));
				dis.setDis_condition(rs.getInt("dis_condition"));
				dis.setDis_uptime(rs.getDate("dis_uptime"));
				dis.setDis_apptime(rs.getDate("dis_apptime"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dis;
	}

}
