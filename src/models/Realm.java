package models;

import java.util.Date;

public class Realm {

	private int rea_no;
	private String rea_name;
	private int rea_father;
	private Date rea_createtime;
	private Date rea_modifytime;
	private int rea_createman;
	private int rea_modifyman;

	public int getRea_no() {
		return rea_no;
	}

	public void setRea_no(int rea_no) {
		this.rea_no = rea_no;
	}

	public String getRea_name() {
		return rea_name;
	}

	public void setRea_name(String rea_name) {
		this.rea_name = rea_name;
	}

	public Date getRea_createtime() {
		return rea_createtime;
	}

	public void setRea_createtime(Date rea_createtime) {
		this.rea_createtime = rea_createtime;
	}

	public Date getRea_modifytime() {
		return rea_modifytime;
	}

	public void setRea_modifytime(Date rea_modifytime) {
		this.rea_modifytime = rea_modifytime;
	}

	public int getRea_createman() {
		return rea_createman;
	}

	public void setRea_createman(int rea_createman) {
		this.rea_createman = rea_createman;
	}

	public int getRea_modifyman() {
		return rea_modifyman;
	}

	public void setRea_modifyman(int rea_modifyman) {
		this.rea_modifyman = rea_modifyman;
	}

	public int getRea_father() {
		return rea_father;
	}

	public void setRea_father(int rea_father) {
		this.rea_father = rea_father;
	}

}
