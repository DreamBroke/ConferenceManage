package dao;

import models.Author;
import jdbc.ControlDB;

public class AuthorDAO {

	public static void insertAuthor(Author aut){
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
				+ aut.getAut_dissertation() + ")";
		ControlDB.executeUpdate(sql);
	}
	
}
