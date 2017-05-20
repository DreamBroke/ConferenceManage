package models;

import java.util.Date;

public class Review {

	private int rev_no;
	private int rev_dissertation;
	private int rev_teacher;
	private int rev_condition;
	private int rev_proposal;
	private Date rev_assigntime;
	private Date rev_reviewtime;
	public int getRev_no() {
		return rev_no;
	}
	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}
	public int getRev_dissertation() {
		return rev_dissertation;
	}
	public void setRev_dissertation(int rev_dissertation) {
		this.rev_dissertation = rev_dissertation;
	}
	public int getRev_teacher() {
		return rev_teacher;
	}
	public void setRev_teacher(int rev_teacher) {
		this.rev_teacher = rev_teacher;
	}
	public int getRev_condition() {
		return rev_condition;
	}
	public void setRev_condition(int rev_condition) {
		this.rev_condition = rev_condition;
	}
	public int getRev_proposal() {
		return rev_proposal;
	}
	public void setRev_proposal(int rev_proposal) {
		this.rev_proposal = rev_proposal;
	}
	public Date getRev_assigntime() {
		return rev_assigntime;
	}
	public void setRev_assigntime(Date rev_assigntime) {
		this.rev_assigntime = rev_assigntime;
	}
	public Date getRev_reviewtime() {
		return rev_reviewtime;
	}
	public void setRev_reviewtime(Date rev_reviewtime) {
		this.rev_reviewtime = rev_reviewtime;
	}
	
}
