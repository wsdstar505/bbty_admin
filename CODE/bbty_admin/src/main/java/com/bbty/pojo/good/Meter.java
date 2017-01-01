package com.bbty.pojo.good;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.stereotype.Repository;

@Repository
@Table(name="T_GOOD_METER")
public class Meter implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="METER_ID")
	@SequenceGenerator(name="Any",sequenceName="SEQ_T_GOOD_METER")
	private Long meterId;
	
	@Column(name="METER_CODE")
	private String meterCode;
	
	@Column(name="METER_NAME")
	private String meterName;

	public Meter() {
		super();
	}

	public Meter(Long meterId, String meterCode, String meterName) {
		super();
		this.meterId = meterId;
		this.meterCode = meterCode;
		this.meterName = meterName;
	}

	public Long getMeterId() {
		return meterId;
	}

	public void setMeterId(Long meterId) {
		this.meterId = meterId;
	}

	public String getMeterCode() {
		return meterCode;
	}

	public void setMeterCode(String meterCode) {
		this.meterCode = meterCode;
	}

	public String getMeterName() {
		return meterName;
	}

	public void setMeterName(String meterName) {
		this.meterName = meterName;
	}
	
}
