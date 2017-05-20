package models;

import java.util.Date;

public class Condition {

	private int cond_no;
	private String cond_name;
	private Date cond_createtime;
	private Date cond_modifytime;
	private int cond_createman;
	private int cond_modifyman;

	public int getCond_no() {
		return cond_no;
	}

	public void setCond_no(int cond_no) {
		this.cond_no = cond_no;
	}

	public String getCond_name() {
		return cond_name;
	}

	public void setCond_name(String cond_name) {
		this.cond_name = cond_name;
	}

	public Date getCond_createtime() {
		return cond_createtime;
	}

	public void setCond_createtime(Date cond_createtime) {
		this.cond_createtime = cond_createtime;
	}

	public Date getCond_modifytime() {
		return cond_modifytime;
	}

	public void setCond_modifytime(Date cond_modifytime) {
		this.cond_modifytime = cond_modifytime;
	}

	public int getCond_createman() {
		return cond_createman;
	}

	public void setCond_createman(int cond_createman) {
		this.cond_createman = cond_createman;
	}

	public int getCond_modifyman() {
		return cond_modifyman;
	}

	public void setCond_modifyman(int cond_modifyman) {
		this.cond_modifyman = cond_modifyman;
	}

}
