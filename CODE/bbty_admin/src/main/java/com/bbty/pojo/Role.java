package com.bbty.pojo;

import java.io.Serializable;

import javax.persistence.Table;

import org.springframework.stereotype.Repository;

@Repository
@Table(name="T_ROLE")
public class Role implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String roleid;
	private String rolename;
	
	public Role() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Role(String roleid, String rolename) {
		super();
		this.roleid = roleid;
		this.rolename = rolename;
	}
	
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

}
