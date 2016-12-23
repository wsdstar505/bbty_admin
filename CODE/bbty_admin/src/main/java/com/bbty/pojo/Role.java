package com.bbty.pojo;

import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Repository;

@Repository
@Table(name="T_ROLE")
public class Role implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	private String roleid;
	private String rolename;
	private String status;
	private String remark;
	
	public Role() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Role(String roleid, String rolename, String status, String remark) {
		super();
		this.roleid = roleid;
		this.rolename = rolename;
		this.status = status;
		this.remark = remark;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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
