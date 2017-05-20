package models;

import java.util.Date;

public class Scope {

	private int sco_no;
	private String sco_name;
	private String sco_brief;
	private Date sco_createtime;
	private Date sco_modifytime;
	private int sco_createman;
	private int sco_modifyman;

	public int getSco_no() {
		return sco_no;
	}

	public void setSco_no(int sco_no) {
		this.sco_no = sco_no;
	}

	public String getSco_name() {
		return sco_name;
	}

	public void setSco_name(String sco_name) {
		this.sco_name = sco_name;
	}

	public String getSco_brief() {
		return sco_brief;
	}

	public void setSco_brief(String sco_brief) {
		this.sco_brief = sco_brief;
	}

	public Date getSco_createtime() {
		return sco_createtime;
	}

	public void setSco_createtime(Date sco_createtime) {
		this.sco_createtime = sco_createtime;
	}

	public Date getSco_modifytime() {
		return sco_modifytime;
	}

	public void setSco_modifytime(Date sco_modifytime) {
		this.sco_modifytime = sco_modifytime;
	}

	public int getSco_createman() {
		return sco_createman;
	}

	public void setSco_createman(int sco_createman) {
		this.sco_createman = sco_createman;
	}

	public int getSco_modifyman() {
		return sco_modifyman;
	}

	public void setSco_modifyman(int sco_modifyman) {
		this.sco_modifyman = sco_modifyman;
	}

}
