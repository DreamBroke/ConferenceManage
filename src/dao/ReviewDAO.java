package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.ControlDB;

public class ReviewDAO {

	public static String getReviewByrDissertation(String no){
		String sql = "SELECT rev_proposal FROM conferencemanage.review WHERE rev_dissertation = " + no;
		ResultSet rs = null;
		rs = ControlDB.executeQuery(sql);
		String str = "";
		try {
			while (rs.next()) {
				str = rs.getString("rev_proposal");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
	
}
