package com.bbty.pojo.good;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.stereotype.Repository;

@Repository
@Table(name="T_GOOD_TYPE")
public class GoodType implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="TYPEID")
	@SequenceGenerator(name="Any",sequenceName="SEQ_T_GOOD_TYPE")
	private Long typeId;
	
	@Column(name="TYPECODE")
	private String typeCode;
	
	@Column(name="TYPENAME")
	private String typeName;
	
	@Column(name="PARTYPEID")
	private Long parTypeId;
	
	@Column(name="STATUS")
	private String status;
	
	@Column(name="REMARK")
	private String remark;
	
	@Column(name="ISLEAF")
	private String isLeaf;
	
	public GoodType() {
		super();
	}

	public GoodType(Long typeId, String typeCode, String typeName, Long parTypeId, String status, String remark,
			String isLeaf) {
		super();
		this.typeId = typeId;
		this.typeCode = typeCode;
		this.typeName = typeName;
		this.parTypeId = parTypeId;
		this.status = status;
		this.remark = remark;
		this.isLeaf = isLeaf;
	}


	public String getTypeName() {
		return typeName;
	}


	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}


	public String getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(String isLeaf) {
		this.isLeaf = isLeaf;
	}

	public Long getTypeId() {
		return typeId;
	}
	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}
	public String getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}
	
	public Long getParTypeId() {
		return parTypeId;
	}
	public void setParTypeId(Long parTypeId) {
		this.parTypeId = parTypeId;
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
	
}
