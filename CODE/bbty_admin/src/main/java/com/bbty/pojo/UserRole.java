package com.bbty.pojo;

import java.io.Serializable;

import javax.persistence.Table;

import org.springframework.stereotype.Repository;

@Repository
@Table(name="T_USER_ROLE")
public class UserRole implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long empid;
	private String roleid;
	public Long getEmpid() {
		return empid;
	}
	public void setEmpid(Long empid) {
		this.empid = empid;
	}
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

}
