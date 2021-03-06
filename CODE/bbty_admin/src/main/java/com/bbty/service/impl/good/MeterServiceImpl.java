package com.bbty.service.impl.good;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbty.dao.good.MeterDao;
import com.bbty.pojo.good.Meter;
import com.bbty.service.inf.good.MeterService;

@Service
public class MeterServiceImpl implements MeterService{

	@Autowired
	public MeterDao meterDao;
	
	@Override
	public List<Meter> getMeterList() {
		return meterDao.selectAll();
	}

	@Override
	public void saveMeter(Meter meter) {
		meterDao.insertSelective(meter);
	}

	@Override
	public Meter getMeter(Meter meter) {
		return meterDao.selectOne(meter);
	}

	@Override
	public void uptMeterBySelective(Meter meter) {
		meterDao.updateByPrimaryKeySelective(meter);
	}

	@Override
	public void delMeter(String[] meterIds) {
		for (String meterId : meterIds) {
			Meter meter = new Meter();
			meter.setMeterId(Long.valueOf(meterId));
			meterDao.deleteByPrimaryKey(meter.getMeterId());
		}
	}
	
}
