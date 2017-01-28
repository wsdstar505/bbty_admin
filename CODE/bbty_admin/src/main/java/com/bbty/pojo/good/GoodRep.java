package com.bbty.pojo.good;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.stereotype.Repository;

@Repository
@Table(name="T_GOOD_REP")
public class GoodRep  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="REPID")
	@SequenceGenerator(name="Any",sequenceName="SEQ_T_GOOD_REP")
	private Long repId;
	
	@Column(name="INFOID")
	private Long infoId;
	
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
	
	@Column(name="METERID")
	private Long meterId;
	
	@Column(name="REPNUM")
	private Long repNum;
	
	@Column(name="REPDATE")
	private String repDate;
	
	@Column(name="REPUPTDATE")
	private String repUptdate;
	
	@Column(name="REPEMPID")
	private Long repEmpid;

	public GoodRep() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GoodRep(Long repId, Long infoId, Long pici, Double cbp, Double pfp, Double sczdp, Double xsp, Long meterId,
			Long repNum, String repDate, String repUptdate, Long repEmpid) {
		super();
		this.repId = repId;
		this.infoId = infoId;
		this.pici = pici;
		this.cbp = cbp;
		this.pfp = pfp;
		this.sczdp = sczdp;
		this.xsp = xsp;
		this.meterId = meterId;
		this.repNum = repNum;
		this.repDate = repDate;
		this.repUptdate = repUptdate;
		this.repEmpid = repEmpid;
	}

	public Long getMeterId() {
		return meterId;
	}

	public void setMeterId(Long meterId) {
		this.meterId = meterId;
	}



	public Long getRepId() {
		return repId;
	}

	public void setRepId(Long repId) {
		this.repId = repId;
	}

	public Long getInfoId() {
		return infoId;
	}

	public void setInfoId(Long infoId) {
		this.infoId = infoId;
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

	public String getRepDate() {
		return repDate;
	}

	public void setRepDate(String repDate) {
		this.repDate = repDate;
	}

	public String getRepUptdate() {
		return repUptdate;
	}

	public void setRepUptdate(String repUptdate) {
		this.repUptdate = repUptdate;
	}

	public Long getRepEmpid() {
		return repEmpid;
	}

	public void setRepEmpid(Long repEmpid) {
		this.repEmpid = repEmpid;
	}
	
}
