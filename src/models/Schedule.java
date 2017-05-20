package models;

import java.util.Date;

public class Schedule {

	private int sche_no;
	private Date sche_date;
	private Date sche_starttime;
	private Date sche_endtime;
	private int sche_speaker;
	private String sche_content;
	private String sche_address;
	private String sche_category;

	public int getSche_no() {
		return sche_no;
	}

	public void setSche_no(int sche_no) {
		this.sche_no = sche_no;
	}

	public Date getSche_date() {
		return sche_date;
	}

	public void setSche_date(Date sche_date) {
		this.sche_date = sche_date;
	}

	public Date getSche_starttime() {
		return sche_starttime;
	}

	public void setSche_starttime(Date sche_starttime) {
		this.sche_starttime = sche_starttime;
	}

	public Date getSche_endtime() {
		return sche_endtime;
	}

	public void setSche_endtime(Date sche_endtime) {
		this.sche_endtime = sche_endtime;
	}

	public int getSche_speaker() {
		return sche_speaker;
	}

	public void setSche_speaker(int sche_speaker) {
		this.sche_speaker = sche_speaker;
	}

	public String getSche_content() {
		return sche_content;
	}

	public void setSche_content(String sche_content) {
		this.sche_content = sche_content;
	}

	public String getSche_address() {
		return sche_address;
	}

	public void setSche_address(String sche_address) {
		this.sche_address = sche_address;
	}

	public String getSche_category() {
		return sche_category;
	}

	public void setSche_category(String sche_category) {
		this.sche_category = sche_category;
	}

}
