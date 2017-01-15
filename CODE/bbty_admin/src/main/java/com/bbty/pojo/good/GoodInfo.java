package com.bbty.pojo.good;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.stereotype.Repository;

@Repository
@Table(name="T_GOOD_INFO")
public class GoodInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="INFOID")
	@SequenceGenerator(name="Any",sequenceName="SEQ_T_GOOD_INFO")
	private Long infoId;
	
	@Column(name="TYPEID")
	private Long typeId;
	
	@Column(name="INFOCODE")
	private String infoCode;
	
	@Column(name="INFONAME")
	private String infoName;
	
	@Column(name="MARKER")
	private String marker;
	
	@Column(name="MARKADDRESS")
	private String markAddress;
	
	@Column(name="WEBSITE")
	private String website;
	
	@Column(name="CONTACT")
	private String contact;
	
	@Column(name="FAX")
	private String fax;
	
	@Column(name="ZIPCODE")
	private String zipCode;
	
	@Column(name="STATUS")
	private String status;

	@Column(name="REMARK")
	private String remark;
	
	public GoodInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GoodInfo(Long infoId, Long typeId, String infoCode, String infoName, String marker, String markAddress,
			String website, String contact, String fax, String zipCode, String status, String remark) {
		super();
		this.infoId = infoId;
		this.typeId = typeId;
		this.infoCode = infoCode;
		this.infoName = infoName;
		this.marker = marker;
		this.markAddress = markAddress;
		this.website = website;
		this.contact = contact;
		this.fax = fax;
		this.zipCode = zipCode;
		this.status = status;
		this.remark = remark;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}


	public Long getInfoId() {
		return infoId;
	}

	public void setInfoId(Long infoId) {
		this.infoId = infoId;
	}

	public Long getTypeId() {
		return typeId;
	}

	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}

	public String getInfoCode() {
		return infoCode;
	}

	public void setInfoCode(String infoCode) {
		this.infoCode = infoCode;
	}

	public String getInfoName() {
		return infoName;
	}

	public void setInfoName(String infoName) {
		this.infoName = infoName;
	}

	public String getMarker() {
		return marker;
	}

	public void setMarker(String marker) {
		this.marker = marker;
	}

	public String getMarkAddress() {
		return markAddress;
	}

	public void setMarkAddress(String markAddress) {
		this.markAddress = markAddress;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
