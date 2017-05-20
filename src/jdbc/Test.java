package jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Test {

	public static void main(String[] args) {
		ResultSet rs = null;
		rs = ControlDB.executeQuery("select * from conference");
		try {
			if(rs.next()){
				System.out.println("会议名为：" + rs.getString("con_startdate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
