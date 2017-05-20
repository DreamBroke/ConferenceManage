package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.ControlDB;
import models.Representor;

public class RepresentorDAO {

	public static Representor doLogin(String username, String password) {
		Representor rep = null;
		String sql = "select * from representor where rep_username = ? and rep_password = ?";
		ResultSet rs = null;
		String[] args = { username, password };
		rs = ControlDB.executeQuery(sql, args);
		try {
			while (rs.next()) {
				rep = new Representor();
				rep.setRep_no(rs.getInt("rep_no"));
				rep.setRep_username(rs.getString("rep_username"));
				rep.setRep_password(rs.getString("rep_password"));
				rep.setRep_name(rs.getString("rep_name"));
				rep.setRep_sex(rs.getString("rep_sex"));
				rep.setRep_position(rs.getString("rep_position"));
				rep.setRep_professional(rs.getInt("rep_professional"));
				rep.setRep_taxpay(rs.getString("rep_taxpay"));
				rep.setRep_company(rs.getString("rep_company"));
				rep.setRep_email(rs.getString("rep_email"));
				rep.setRep_tel(rs.getString("rep_tel"));
				rep.setRep_country(rs.getString("rep_country"));
				rep.setRep_province(rs.getString("rep_province"));
				rep.setRep_city(rs.getString("rep_city"));
				rep.setRep_postcode(rs.getString("rep_postcode"));
				rep.setRep_qq(rs.getString("rep_qq"));
				rep.setRep_field(rs.getString("rep_field"));
				rep.setRep_payment(rs.getDouble("rep_payment"));
				rep.setRep_IDnumber(rs.getString("rep_IDnumber"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rep;
	}

	public static Representor getRepresentorByUsername(String username) {
		Representor rep = null;
		String sql = "select * from representor where rep_username = '"
				+ username + "'";
		ResultSet rs = null;
		rs = ControlDB.executeQuery(sql);

		try {
			while (rs.next()) {
				rep = new Representor();
				rep.setRep_no(rs.getInt("rep_no"));
				rep.setRep_username(rs.getString("rep_username"));
				rep.setRep_password(rs.getString("rep_password"));
				rep.setRep_name(rs.getString("rep_name"));
				rep.setRep_sex(rs.getString("rep_sex"));
				rep.setRep_position(rs.getString("rep_position"));
				rep.setRep_professional(rs.getInt("rep_professional"));
				rep.setRep_taxpay(rs.getString("rep_taxpay"));
				rep.setRep_company(rs.getString("rep_company"));
				rep.setRep_email(rs.getString("rep_email"));
				rep.setRep_tel(rs.getString("rep_tel"));
				rep.setRep_country(rs.getString("rep_country"));
				rep.setRep_province(rs.getString("rep_province"));
				rep.setRep_city(rs.getString("rep_city"));
				rep.setRep_postcode(rs.getString("rep_postcode"));
				rep.setRep_qq(rs.getString("rep_qq"));
				rep.setRep_field(rs.getString("rep_field"));
				rep.setRep_payment(rs.getDouble("rep_payment"));
				rep.setRep_IDnumber(rs.getString("rep_IDnumber"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rep;
	}
	
	public static Representor getRepresentorByNo(String no) {
		Representor rep = null;
		String sql = "select * from representor where rep_no = '"
				+ no + "'";
		ResultSet rs = null;
		rs = ControlDB.executeQuery(sql);
		try {
			while (rs.next()) {
				rep = new Representor();
				rep.setRep_no(rs.getInt("rep_no"));
				rep.setRep_username(rs.getString("rep_username"));
				rep.setRep_password(rs.getString("rep_password"));
				rep.setRep_name(rs.getString("rep_name"));
				rep.setRep_sex(rs.getString("rep_sex"));
				rep.setRep_position(rs.getString("rep_position"));
				rep.setRep_professional(rs.getInt("rep_professional"));
				rep.setRep_taxpay(rs.getString("rep_taxpay"));
				rep.setRep_company(rs.getString("rep_company"));
				rep.setRep_email(rs.getString("rep_email"));
				rep.setRep_tel(rs.getString("rep_tel"));
				rep.setRep_country(rs.getString("rep_country"));
				rep.setRep_province(rs.getString("rep_province"));
				rep.setRep_city(rs.getString("rep_city"));
				rep.setRep_postcode(rs.getString("rep_postcode"));
				rep.setRep_qq(rs.getString("rep_qq"));
				rep.setRep_field(rs.getString("rep_field"));
				rep.setRep_payment(rs.getDouble("rep_payment"));
				rep.setRep_IDnumber(rs.getString("rep_IDnumber"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rep;
	}

	public static int insertRepresentor(Representor rep) {
		String sql = "INSERT INTO representor(rep_username,rep_password,rep_name,rep_sex,rep_position,rep_professional,rep_taxpay,rep_company,rep_email,rep_tel,rep_postcode,rep_qq,rep_field,rep_IDnumber) values ('"
				+ rep.getRep_username()
				+ "','"
				+ rep.getRep_password()
				+ "','"
				+ rep.getRep_name()
				+ "','"
				+ rep.getRep_sex()
				+ "','"
				+ rep.getRep_position()
				+ "',"
				+ rep.getRep_professional()
				+ ",'"
				+ rep.getRep_taxpay()
				+ "','"
				+ rep.getRep_company()
				+ "','"
				+ rep.getRep_email()
				+ "','"
				+ rep.getRep_tel()
				+ "','"
				+ rep.getRep_postcode()
				+ "','"
				+ rep.getRep_qq()
				+ "','"
				+ rep.getRep_field()
				+ "','"
				+ rep.getRep_IDnumber()
				+ "')";
		int i = ControlDB.executeUpdate(sql);
		return i;
	}

	public static void modifyRepresentor(Representor rep) {
		String sql = "UPDATE `conferencemanage`.`representor` SET `rep_name` = '"
				+ rep.getRep_name()
				+ "',`rep_sex` = '"
				+ rep.getRep_sex()
				+ "',`rep_position` = '"
				+ rep.getRep_position()
				+ "',`rep_professional` = "
				+ rep.getRep_professional()
				+ ",`rep_taxpay` = '"
				+ rep.getRep_taxpay()
				+ "',`rep_company` = '"
				+ rep.getRep_company()
				+ "',`rep_email` = '"
				+ rep.getRep_email()
				+ "',`rep_tel` = '"
				+ rep.getRep_tel()
				+ "',`rep_country` = '"
				+ rep.getRep_country()
				+ "',`rep_province` = '"
				+ rep.getRep_province()
				+ "',`rep_city` = '"
				+ rep.getRep_city()
				+ "',`rep_postcode` = '"
				+ rep.getRep_postcode()
				+ "',`rep_qq` = '"
				+ rep.getRep_qq()
				+ "',`rep_field` = '"
				+ rep.getRep_field()
				+ "',`rep_IDnumber` = '"
				+ rep.getRep_IDnumber()
				+ "' WHERE `rep_no` = " + rep.getRep_no() + ";";
		ControlDB.executeUpdate(sql);
	}

	public static void modifyPassword(String no, String password) {
		// TODO Auto-generated method stub
		String sql = "UPDATE `conferencemanage`.`representor` SET `rep_password` = '"
				+ password
				+ "' WHERE `rep_no` = " + no + ";";
		ControlDB.executeUpdate(sql);
	}

}
