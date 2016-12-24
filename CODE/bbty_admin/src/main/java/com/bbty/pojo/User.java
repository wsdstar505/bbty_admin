package com.bbty.pojo;

import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Repository;

@Repository
@Table(name="T_USER")
public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	private Long empid;
	private String userid;
	private String username;
	private String gender;
	private String birthdate;
	private String mobileno;
	private String htel;
	private String haddress;
	private String createtime;
	private String lastupttime;
	private String remark;
	
	public User() {
		super();
	}

	public User(Long empid, String userid, String username, String gender, String birthdate, String mobileno,
			String htel, String haddress, String createtime, String lastupttime, String remark) {
		super();
		this.empid = empid;
		this.userid = userid;
		this.username = username;
		this.gender = gender;
		this.birthdate = birthdate;
		this.mobileno = mobileno;
		this.htel = htel;
		this.haddress = haddress;
		this.createtime = createtime;
		this.lastupttime = lastupttime;
		this.remark = remark;
	}

	public Long getEmpid() {
		return empid;
	}
	public void setEmpid(Long empid) {
		this.empid = empid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	public String getHaddress() {
		return haddress;
	}

	public void setHaddress(String haddress) {
		this.haddress = haddress;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getLastupttime() {
		return lastupttime;
	}

	public void setLastupttime(String lastupttime) {
		this.lastupttime = lastupttime;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
