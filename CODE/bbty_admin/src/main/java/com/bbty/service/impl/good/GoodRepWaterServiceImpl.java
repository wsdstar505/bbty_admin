package com.bbty.service.impl.good;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbty.dao.good.GoodRepWaterDao;
import com.bbty.pojo.good.GoodRepWater;
import com.bbty.service.inf.good.GoodRepWaterService;

@Service
public class GoodRepWaterServiceImpl implements GoodRepWaterService{

	@Autowired
	public GoodRepWaterDao goodRepWaterDao;
	
	@Override
	public void saveRepWater(GoodRepWater goodRepWater) {
		goodRepWaterDao.insertSelective(goodRepWater);
	}

}
