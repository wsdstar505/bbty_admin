package com.bbty.service.impl.good;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbty.dao.good.GoodTypeDao;
import com.bbty.pojo.good.GoodType;
import com.bbty.service.inf.good.GoodTypeService;

@Service
public class GoodTypeServiceImpl implements GoodTypeService{

	@Autowired
	public GoodTypeDao goodTypeDao;
	
	@Override
	public List<GoodType> getGoodTypeList(long parTypeId) {
		GoodType goodType = new GoodType();
		goodType.setParTypeId(parTypeId);
		List<GoodType> list = goodTypeDao.select(goodType);
		return list;
	}

	@Override
	public List<GoodType> getChildGoodTypesByTypeCode(String typeCode) {
		GoodType goodType = new GoodType();
		goodType.setTypeCode(typeCode);
		List<GoodType> res = goodTypeDao.selectChildsByTypeCode(goodType);
		//List<GoodType> res = goodTypeDao.select(goodType);
		return res;
	}


}
