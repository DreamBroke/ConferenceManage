package models;

import java.util.Date;

public class Dissertation {

	private int dis_no;
	private String dis_title;
	private String dis_keyword;
	private String dis_abstract;
	private int dis_realm;
	private int dis_author;
	private String dis_file;
	private int dis_condition;
	private int dis_approver;
	private Date dis_uptime;
	private Date dis_apptime;
	
	public int getDis_no() {
		return dis_no;
	}
	public void setDis_no(int dis_no) {
		this.dis_no = dis_no;
	}
	public String getDis_title() {
		return dis_title;
	}
	public void setDis_title(String dis_title) {
		this.dis_title = dis_title;
	}
	public String getDis_keyword() {
		return dis_keyword;
	}
	public void setDis_keyword(String dis_keyword) {
		this.dis_keyword = dis_keyword;
	}
	public String getDis_abstract() {
		return dis_abstract;
	}
	public void setDis_abstract(String dis_abstract) {
		this.dis_abstract = dis_abstract;
	}
	public int getDis_realm() {
		return dis_realm;
	}
	public void setDis_realm(int dis_realm) {
		this.dis_realm = dis_realm;
	}
	public int getDis_author() {
		return dis_author;
	}
	public void setDis_author(int dis_author) {
		this.dis_author = dis_author;
	}
	public String getDis_file() {
		return dis_file;
	}
	public void setDis_file(String dis_file) {
		this.dis_file = dis_file;
	}
	public int getDis_condition() {
		return dis_condition;
	}
	public void setDis_condition(int dis_condition) {
		this.dis_condition = dis_condition;
	}
	public int getDis_approver() {
		return dis_approver;
	}
	public void setDis_approver(int dis_approver) {
		this.dis_approver = dis_approver;
	}
	public Date getDis_uptime() {
		return dis_uptime;
	}
	public void setDis_uptime(Date dis_uptime) {
		this.dis_uptime = dis_uptime;
	}
	public Date getDis_apptime() {
		return dis_apptime;
	}
	public void setDis_apptime(Date dis_apptime) {
		this.dis_apptime = dis_apptime;
	}
	
}
