package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.ControlDB;
import models.Professional;

public class ProfessionalDAO {

	public static ArrayList<Professional> getAllProfessional(){
		ArrayList<Professional> al = new ArrayList<Professional>();
		String sql = "select * from professional";
		ResultSet rs = null;
		Professional pro = null;
		rs = ControlDB.executeQuery(sql);
		try {
			while(rs.next()){
				pro = new Professional();
				pro.setPro_no(rs.getInt("pro_no"));
				pro.setPro_name(rs.getString("pro_name"));
				pro.setPro_createtime(rs.getDate("pro_createtime"));
				pro.setPro_modifytime(rs.getDate("pro_modifytime"));
				pro.setPro_createman(rs.getInt("pro_createman"));
				pro.setPro_modifyman(rs.getInt("pro_modifyman"));
				al.add(pro);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
	
}
