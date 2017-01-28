package com.bbty.service.impl.good;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbty.dao.good.GoodRepDao;
import com.bbty.pojo.good.GoodRep;
import com.bbty.service.inf.good.GoodRepService;

@Service
public class GoodRepServiceImpl implements GoodRepService {

	@Autowired
	public GoodRepDao goodRepDao;
	
	@Override
	public List<GoodRep> getGoodReps(GoodRep goodRep) {
		return goodRepDao.select(goodRep);
	}

	@Override
	public void saveGoodRep(GoodRep goodRep) {
		goodRepDao.insert(goodRep);
	}

	@Override
	public GoodRep getGoodRep(GoodRep goodRep) {
		return goodRepDao.selectOne(goodRep);
	}

}
