package models;

import java.util.Date;

public class Check {

	private int che_no;
	private int che_method;
	private String che_account;
	private double che_money;
	private Date che_time;
	private int che_representor;
	private int che_teacher;
	private int che_room;

	public int getChe_no() {
		return che_no;
	}

	public void setChe_no(int che_no) {
		this.che_no = che_no;
	}

	public int getChe_method() {
		return che_method;
	}

	public void setChe_method(int che_method) {
		this.che_method = che_method;
	}

	public String getChe_account() {
		return che_account;
	}

	public void setChe_account(String che_account) {
		this.che_account = che_account;
	}

	public double getChe_money() {
		return che_money;
	}

	public void setChe_money(double che_money) {
		this.che_money = che_money;
	}

	public Date getChe_time() {
		return che_time;
	}

	public void setChe_time(Date che_time) {
		this.che_time = che_time;
	}

	public int getChe_representor() {
		return che_representor;
	}

	public void setChe_representor(int che_representor) {
		this.che_representor = che_representor;
	}

	public int getChe_teacher() {
		return che_teacher;
	}

	public void setChe_teacher(int che_teacher) {
		this.che_teacher = che_teacher;
	}

	public int getChe_room() {
		return che_room;
	}

	public void setChe_room(int che_room) {
		this.che_room = che_room;
	}

}
