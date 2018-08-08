package com.spring.web.DTO;

import java.sql.Timestamp;

public class MemberDTO {
	private String name;
	private String id;
	private String pw;
	private int birthYear;
	private int birthMonth;
	private int birthDay;
	private String email;
	private Timestamp reg_date;
	private Timestamp log_date;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getBirthYear() {
		return birthYear;
	}
	public void setBirthYear(int birthYear) {
		this.birthYear = birthYear;
	}
	public int getBirthMonth() {
		return birthMonth;
	}
	public void setBirthMonth(int birthMonth) {
		this.birthMonth = birthMonth;
	}
	public int getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(int birthDay) {
		this.birthDay = birthDay;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public Timestamp getLog_date() {
		return log_date;
	}
	public void setLog_date(Timestamp log_date) {
		this.log_date = log_date;
	}
	@Override
	public String toString() {
		return "MemberDTO [name=" + name + ", id=" + id + ", pw=" + pw + ", birthYear=" + birthYear + ", birthMonth="
				+ birthMonth + ", birthDay=" + birthDay + ", email=" + email + ", reg_date=" + reg_date + ", log_date="
				+ log_date + "]";
	}
}
