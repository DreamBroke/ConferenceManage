package models;

import java.util.Date;

public class Professional {

	private int pro_no;
	private String pro_name;
	private Date pro_createtime;
	private Date pro_modifytime;
	private int pro_createman;
	private int pro_modifyman;

	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public Date getPro_createtime() {
		return pro_createtime;
	}

	public void setPro_createtime(Date pro_createtime) {
		this.pro_createtime = pro_createtime;
	}

	public int getPro_createman() {
		return pro_createman;
	}

	public void setPro_createman(int pro_createman) {
		this.pro_createman = pro_createman;
	}

	public int getPro_modifyman() {
		return pro_modifyman;
	}

	public void setPro_modifyman(int pro_modifyman) {
		this.pro_modifyman = pro_modifyman;
	}

	public Date getPro_modifytime() {
		return pro_modifytime;
	}

	public void setPro_modifytime(Date pro_modifytime) {
		this.pro_modifytime = pro_modifytime;
	}

}
