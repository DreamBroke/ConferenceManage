package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import jdbc.ControlDB;
import models.Check;

public class CheckDAO {

	public static void insertCheck(Check che){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(che.getChe_time());
		String sql = "INSERT INTO `conferencemanage`.`check`(`che_method`,`che_account`,`che_time`,`che_representor`,`che_room`) VALUES ('"
				+ che.getChe_method() + "', '"
				+ che.getChe_account() + "', '"
				+ dateString + "', '"
				+ che.getChe_representor() + "', '"
				+ che.getChe_room() + "')";
		ControlDB.executeUpdate(sql);
	}
	
	public static ArrayList<Check> selectCheckByRep_no(String no){
		ArrayList<Check> al = new ArrayList<Check>();
		String sql = "select * from `check` where che_representor = " + no;
		ResultSet rs = null;
		Check che = null;
		rs = ControlDB.executeQuery(sql);
		try {
			while (rs.next()) {
				che = new Check();
				che.setChe_no(rs.getInt("che_no"));
				che.setChe_account(rs.getString("che_account"));
				che.setChe_method(rs.getInt("che_method"));
				che.setChe_money(rs.getDouble("che_money"));
				che.setChe_time(rs.getDate("che_time"));
				che.setChe_representor(rs.getInt("che_representor"));
				che.setChe_teacher(rs.getInt("che_teacher"));
				che.setChe_room(rs.getInt("che_room"));
				al.add(che);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
	
}
