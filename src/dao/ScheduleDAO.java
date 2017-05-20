package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import jdbc.ControlDB;
import models.Schedule;

public class ScheduleDAO {

	public ArrayList<Schedule> getAllSchedule() {
		ArrayList<Schedule> al = new ArrayList<Schedule>();
		ResultSet rs = null;
		String sql = "select * from schedule";
		Schedule sc = null;
		rs = ControlDB.executeQuery(sql);
		try {
			while (rs.next()) {
				sc = new Schedule();
				sc.setSche_no(rs.getInt("sche_no"));
				sc.setSche_date(rs.getDate("sche_date"));
				sc.setSche_starttime(rs.getTime("sche_starttime"));
				sc.setSche_endtime(rs.getTime("sche_endtime"));
				sc.setSche_speaker(rs.getInt("sche_speaker"));
				if (rs.getString("sche_content") == null
						|| rs.getString("sche_content").equals("")) {
					sc.setSche_content("无");
				} else {
					sc.setSche_content(rs.getString("sche_content"));
				}
				if (rs.getString("sche_address") == null
						|| rs.getString("sche_address").equals("")) {
					sc.setSche_address("无");
				} else {
					sc.setSche_address(rs.getString("sche_address"));
				}
				if (rs.getString("sche_category") == null
						|| rs.getString("sche_category").equals("")) {
					sc.setSche_category("无");
				} else {
					sc.setSche_category(rs.getString("sche_category"));
				}
				al.add(sc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}

}
