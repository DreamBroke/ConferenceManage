package models;

import java.util.Date;

public class Conference {

	private int con_no;
	private String con_name;
	private String con_host;
	private String con_organizer;
	private String con_co_organizer;
	private Date con_startdate;
	private Date con_enddate;
	private Date con_upstartdate;
	private Date con_upenddate;
	private String con_address;
	private String con_contents;
	private int con_affair_linkman;
	private int con_finance_linkman;
	private String con_capital;
	private String con_repast;
	private String con_scopen;

	public String getCon_capital() {
		return con_capital;
	}

	public void setCon_capital(String con_capital) {
		this.con_capital = con_capital;
	}

	public String getCon_repast() {
		return con_repast;
	}

	public void setCon_repast(String con_repast) {
		this.con_repast = con_repast;
	}

	public String getCon_scopen() {
		return con_scopen;
	}

	public void setCon_scopen(String con_scopen) {
		this.con_scopen = con_scopen;
	}

	public void setCon_startdate(Date con_startdate) {
		this.con_startdate = con_startdate;
	}

	public void setCon_enddate(Date con_enddate) {
		this.con_enddate = con_enddate;
	}

	public void setCon_upstartdate(Date con_upstartdate) {
		this.con_upstartdate = con_upstartdate;
	}

	public void setCon_upenddate(Date con_upenddate) {
		this.con_upenddate = con_upenddate;
	}

	public String getCon_name() {
		return con_name;
	}

	public void setCon_name(String con_name) {
		this.con_name = con_name;
	}

	public String getCon_host() {
		return con_host;
	}

	public void setCon_host(String con_host) {
		this.con_host = con_host;
	}

	public String getCon_organizer() {
		return con_organizer;
	}

	public void setCon_organizer(String con_organizer) {
		this.con_organizer = con_organizer;
	}

	public String getCon_co_organizer() {
		return con_co_organizer;
	}

	public void setCon_co_organizer(String con_co_organizer) {
		this.con_co_organizer = con_co_organizer;
	}

	public int getCon_no() {
		return con_no;
	}

	public void setCon_no(int con_no) {
		this.con_no = con_no;
	}

	public String getCon_address() {
		return con_address;
	}

	public void setCon_address(String con_address) {
		this.con_address = con_address;
	}

	public Date getCon_startdate() {
		return con_startdate;
	}

	public Date getCon_enddate() {
		return con_enddate;
	}

	public Date getCon_upstartdate() {
		return con_upstartdate;
	}

	public Date getCon_upenddate() {
		return con_upenddate;
	}

	public String getCon_contents() {
		return con_contents;
	}

	public void setCon_contents(String con_contents) {
		this.con_contents = con_contents;
	}

	public int getCon_affair_linkman() {
		return con_affair_linkman;
	}

	public void setCon_affair_linkman(int con_affair_linkman) {
		this.con_affair_linkman = con_affair_linkman;
	}

	public int getCon_finance_linkman() {
		return con_finance_linkman;
	}

	public void setCon_finance_linkman(int con_finance_linkman) {
		this.con_finance_linkman = con_finance_linkman;
	}

}
