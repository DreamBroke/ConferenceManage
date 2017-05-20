package models;

import java.util.Date;

public class Method {

	private int met_no;
	private String met_name;
	private String met_brief;
	private Date met_createtime;
	private Date met_modifytime;
	private int met_createman;
	private int met_modifyman;

	public int getMet_no() {
		return met_no;
	}

	public void setMet_no(int met_no) {
		this.met_no = met_no;
	}

	public String getMet_name() {
		return met_name;
	}

	public void setMet_name(String met_name) {
		this.met_name = met_name;
	}

	public String getMet_brief() {
		return met_brief;
	}

	public void setMet_brief(String met_brief) {
		this.met_brief = met_brief;
	}

	public Date getMet_createtime() {
		return met_createtime;
	}

	public void setMet_createtime(Date met_createtime) {
		this.met_createtime = met_createtime;
	}

	public Date getMet_modifytime() {
		return met_modifytime;
	}

	public void setMet_modifytime(Date met_modifytime) {
		this.met_modifytime = met_modifytime;
	}

	public int getMet_createman() {
		return met_createman;
	}

	public void setMet_createman(int met_createman) {
		this.met_createman = met_createman;
	}

	public int getMet_modifyman() {
		return met_modifyman;
	}

	public void setMet_modifyman(int met_modifyman) {
		this.met_modifyman = met_modifyman;
	}

}
