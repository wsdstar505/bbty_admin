package com.bbty.pojo;

import java.io.Serializable;

import javax.persistence.Table;

import org.springframework.stereotype.Repository;

@Repository
@Table(name="T_USER")
public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long empid;
	private String username;
	private String password;
	
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
