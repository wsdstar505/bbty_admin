package com.bbty.session;

import java.util.List;

public class UserSession {

	private Long empid;
	private String userid;
	private String username;
	private String password;
	private String status;
	private String gender;
	private String birthdate;
	private String mobileno;
	private String htel;
	private List<String> roleids;
	
	public UserSession() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public UserSession(Long empid, String userid, String password, String status, String username, String gender,
			String birthdate, String mobileno, String htel, List<String> roleids) {
		super();
		this.empid = empid;
		this.userid = userid;
		this.password = password;
		this.status = status;
		this.username = username;
		this.gender = gender;
		this.birthdate = birthdate;
		this.mobileno = mobileno;
		this.htel = htel;
		this.roleids = roleids;
	}

	public List<String> getRoleids() {
		return roleids;
	}

	public void setRoleids(List<String> roleids) {
		this.roleids = roleids;
	}

	public Long getEmpid() {
		return empid;
	}
	public void setEmpid(Long empid) {
		this.empid = empid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getMobileno() {
		return mobileno;
	}
	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}
	public String getHtel() {
		return htel;
	}
	public void setHtel(String htel) {
		this.htel = htel;
	}
	
}
