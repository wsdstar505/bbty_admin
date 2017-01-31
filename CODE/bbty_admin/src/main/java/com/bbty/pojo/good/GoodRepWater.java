package com.bbty.pojo.good;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.stereotype.Repository;

@Repository
@Table(name="T_GOOD_REP_WATER")
public class GoodRepWater implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="WATERID")
	@SequenceGenerator(name="Any",sequenceName="SEQ_T_GOOD_REP_WATER")
	private Long waterId;

	@Column(name="INFOID")
	private Long infoId;
	
	@Column(name="REPID")
	private Long repId;
	
	@Column(name="METERID")
	private Long meterId;
	
	@Column(name="PICI")
	private Long pici;
	
	@Column(name="CBP")
	private Double cbp;
	
	@Column(name="PFP")
	private Double pfp;
	
	@Column(name="SCZDP")
	private Double sczdp;
	
	@Column(name="XSP")
	private Double xsp;
	
	@Column(name="REPNUM")
	private Long repNum;
	
	@Column(name="WATERTYPE")
	private String waterType;
	
	@Column(name="REPUPTDATE")
	private String repUptDate;
	
	@Column(name="REPUPTEMPID")
	private Long repUptEmpid;

	public GoodRepWater() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GoodRepWater(Long waterId, Long infoId, Long repId, Long meterId, Long pici, Double cbp, Double pfp,
			Double sczdp, Double xsp, Long repNum, String waterType, String repUptDate, Long repUptEmpid) {
		super();
		this.waterId = waterId;
		this.infoId = infoId;
		this.repId = repId;
		this.meterId = meterId;
		this.pici = pici;
		this.cbp = cbp;
		this.pfp = pfp;
		this.sczdp = sczdp;
		this.xsp = xsp;
		this.repNum = repNum;
		this.waterType = waterType;
		this.repUptDate = repUptDate;
		this.repUptEmpid = repUptEmpid;
	}

	public Long getInfoId() {
		return infoId;
	}

	public void setInfoId(Long infoId) {
		this.infoId = infoId;
	}


	public Long getMeterId() {
		return meterId;
	}


	public void setMeterId(Long meterId) {
		this.meterId = meterId;
	}


	public Long getWaterId() {
		return waterId;
	}

	public void setWaterId(Long waterId) {
		this.waterId = waterId;
	}

	public Long getRepId() {
		return repId;
	}

	public void setRepId(Long repId) {
		this.repId = repId;
	}

	public Long getPici() {
		return pici;
	}

	public void setPici(Long pici) {
		this.pici = pici;
	}

	public Double getCbp() {
		return cbp;
	}

	public void setCbp(Double cbp) {
		this.cbp = cbp;
	}

	public Double getPfp() {
		return pfp;
	}

	public void setPfp(Double pfp) {
		this.pfp = pfp;
	}

	public Double getSczdp() {
		return sczdp;
	}

	public void setSczdp(Double sczdp) {
		this.sczdp = sczdp;
	}

	public Double getXsp() {
		return xsp;
	}

	public void setXsp(Double xsp) {
		this.xsp = xsp;
	}

	public Long getRepNum() {
		return repNum;
	}

	public void setRepNum(Long repNum) {
		this.repNum = repNum;
	}

	public String getWaterType() {
		return waterType;
	}

	public void setWaterType(String waterType) {
		this.waterType = waterType;
	}

	public String getRepUptDate() {
		return repUptDate;
	}

	public void setRepUptDate(String repUptDate) {
		this.repUptDate = repUptDate;
	}

	public Long getRepUptEmpid() {
		return repUptEmpid;
	}

	public void setRepUptEmpid(Long repUptEmpid) {
		this.repUptEmpid = repUptEmpid;
	}
	
}
