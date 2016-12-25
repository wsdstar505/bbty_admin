package com.bbty.pojo;

import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Repository;

@Repository
@Table(name="T_USER_OPER")
public class UserOper implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	private String userid;
	private String password;
	private String status;
	private String lastlogin;
	private String lastupttime;
	private Long uptempid;
	
	public UserOper() {
		super();
	}

	public UserOper(String userid, String password, String status, String lastlogin, String lastupttime, Long uptempid) {
		super();
		this.userid = userid;
		this.password = password;
		this.status = status;
		this.lastlogin = lastlogin;
		this.lastupttime = lastupttime;
		this.uptempid = uptempid;
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

	public String getLastlogin() {
		return lastlogin;
	}

	public void setLastlogin(String lastlogin) {
		this.lastlogin = lastlogin;
	}

	public String getLastupttime() {
		return lastupttime;
	}

	public void setLastupttime(String lastupttime) {
		this.lastupttime = lastupttime;
	}

	public Long getUptempid() {
		return uptempid;
	}

	public void setUptempid(Long uptempid) {
		this.uptempid = uptempid;
	}

}
