package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.Author;
import jdbc.ControlDB;

public class AuthorDAO {

	public static void insertAuthor(Author aut) {
		String sql = "INSERT INTO `conferencemanage`.`author`(`aut_category`,`aut_name`,`aut_tel`,`aut_email`,`aut_company`,`aut_dissertation`) VALUES ('"
				+ aut.getAut_category()
				+ "', '"
				+ aut.getAut_name()
				+ "', '"
				+ aut.getAut_tel()
				+ "', '"
				+ aut.getAut_email()
				+ "', '"
				+ aut.getAut_company()
				+ "', "
				+ aut.getAut_dissertation()
				+ ")";
		ControlDB.executeUpdate(sql);
	}

	public static ArrayList<Author> getAuthorByDissertation(String no) {
		ArrayList<Author> al = new ArrayList<Author>();
		ResultSet rs = null;
		String sql = "select * from author where aut_dissertation = " + no;
		Author aut = null;
		rs = ControlDB.executeQuery(sql);
		try {
			while (rs.next()) {
				aut = new Author();
				aut.setAut_no(rs.getInt("aut_no"));
				aut.setAut_category(rs.getString("aut_category"));
				aut.setAut_name(rs.getString("aut_name"));
				aut.setAut_tel(rs.getString("aut_tel"));
				aut.setAut_email(rs.getString("aut_email"));
				aut.setAut_company(rs.getString("aut_company"));
				aut.setAut_dissertation(rs.getInt("aut_dissertation"));
				al.add(aut);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}

	public static Author getAuthorByNo(String no) {
		Author aut = new Author();
		ResultSet rs = null;
		String sql = "select * from author where aut_no = " + no;
		rs = ControlDB.executeQuery(sql);
		try {
			while (rs.next()) {
				aut = new Author();
				aut.setAut_no(rs.getInt("aut_no"));
				aut.setAut_category(rs.getString("aut_category"));
				aut.setAut_name(rs.getString("aut_name"));
				aut.setAut_tel(rs.getString("aut_tel"));
				aut.setAut_email(rs.getString("aut_email"));
				aut.setAut_company(rs.getString("aut_company"));
				aut.setAut_dissertation(rs.getInt("aut_dissertation"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return aut;
	}

	public static void deleteAuthorByNo(String no) {
		String sql = "DELETE FROM `conferencemanage`.`author` WHERE aut_no = '"
				+ no + "'";
		ControlDB.executeUpdate(sql);
	}

	public static void updateAuthorByNo(Author aut, String no) {
		String sql = "UPDATE `author` SET `aut_category` = '"
				+ aut.getAut_category() + "', `aut_name` = '"
				+ aut.getAut_name() + "', `aut_tel` = '" + aut.getAut_tel()
				+ "', `aut_email` = '" + aut.getAut_email()
				+ "', `aut_company` = '" + aut.getAut_company() + "' WHERE `aut_no` = " + no + ";";
		ControlDB.executeUpdate(sql);
	}

}
