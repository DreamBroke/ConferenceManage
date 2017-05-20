package models;

import java.util.Date;

public class Jurisdiction {

	private int jur_no;
	private int jur_range;
	private String jur_instruction;
	private Date jur_createtime;
	private Date jur_modifytime;
	private int jur_createman;
	private int jur_modifyman;

	public int getJur_no() {
		return jur_no;
	}

	public void setJur_no(int jur_no) {
		this.jur_no = jur_no;
	}

	public int getJur_range() {
		return jur_range;
	}

	public void setJur_range(int jur_range) {
		this.jur_range = jur_range;
	}

	public Date getJur_createtime() {
		return jur_createtime;
	}

	public void setJur_createtime(Date jur_createtime) {
		this.jur_createtime = jur_createtime;
	}

	public Date getJur_modifytime() {
		return jur_modifytime;
	}

	public void setJur_modifytime(Date jur_modifytime) {
		this.jur_modifytime = jur_modifytime;
	}

	public int getJur_createman() {
		return jur_createman;
	}

	public void setJur_createman(int jur_createman) {
		this.jur_createman = jur_createman;
	}

	public int getJur_modifyman() {
		return jur_modifyman;
	}

	public void setJur_modifyman(int jur_modifyman) {
		this.jur_modifyman = jur_modifyman;
	}

	public String getJur_instruction() {
		return jur_instruction;
	}

	public void setJur_instruction(String jur_instruction) {
		this.jur_instruction = jur_instruction;
	}

}
