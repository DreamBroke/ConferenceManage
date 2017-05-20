package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.ControlDB;
import models.Conference;

public class ConferenceDAO {
	
	public Conference getConference(){
		ResultSet rs = null;
		String sql = "select * from conference";
		rs = ControlDB.executeQuery(sql);
		Conference con = null;
		try {
			while(rs.next()){
				con = new Conference();
				con.setCon_no(rs.getInt("con_no"));
				con.setCon_name(rs.getString("con_name"));
				con.setCon_host(rs.getString("con_host"));
				con.setCon_organizer(rs.getString("con_organizer"));
				con.setCon_co_organizer(rs.getString("con_co-organizer"));
				con.setCon_startdate(rs.getDate("con_startdate"));
				con.setCon_enddate(rs.getDate("con_enddate"));
				con.setCon_upstartdate(rs.getDate("con_upstartdate"));
				con.setCon_upenddate(rs.getDate("con_upenddate"));
				con.setCon_address(rs.getString("con_address"));
				con.setCon_contents(rs.getString("con_contents"));
				con.setCon_affair_linkman(rs.getInt("con_affair-linkman"));
				con.setCon_finance_linkman(rs.getInt("con_finance-linkman"));
				con.setCon_capital(rs.getString("con_capital"));
				con.setCon_repast(rs.getString("con_repast"));
				con.setCon_scopen(rs.getString("con_scopen"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
}
