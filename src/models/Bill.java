package models;

import java.util.Date;

public class Bill {

	private int bill_no;
	private double bill_money;
	private String bill_detail;
	private Date bill_date;
	private int bill_personnel;
	
	public int getBill_no() {
		return bill_no;
	}
	public void setBill_no(int bill_no) {
		this.bill_no = bill_no;
	}
	public double getBill_money() {
		return bill_money;
	}
	public void setBill_money(double bill_money) {
		this.bill_money = bill_money;
	}
	public String getBill_detail() {
		return bill_detail;
	}
	public void setBill_detail(String bill_detail) {
		this.bill_detail = bill_detail;
	}
	public Date getBill_date() {
		return bill_date;
	}
	public void setBill_date(Date bill_date) {
		this.bill_date = bill_date;
	}
	public int getBill_personnel() {
		return bill_personnel;
	}
	public void setBill_personnel(int bill_personnel) {
		this.bill_personnel = bill_personnel;
	}
	
	
}
