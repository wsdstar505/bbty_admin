package com.bbty.service.inf.good;

import java.util.List;

import com.bbty.pojo.good.Meter;

public interface MeterService {

	List<Meter> getMeterList();

	void saveMeter(Meter meter);

	Meter getMeter(Meter meter);

	void uptMeterBySelective(Meter meter);

	void delMeter(String[] meterIds);

}
