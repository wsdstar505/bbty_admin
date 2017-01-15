package com.bbty.service.impl.good;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbty.dao.good.GoodInfoDao;
import com.bbty.pojo.good.GoodInfo;
import com.bbty.service.inf.good.GoodInfoService;

@Service
public class GoodInfoServiceImpl implements GoodInfoService {

	@Autowired
	public GoodInfoDao goodInfoDao;

	@Override
	public List<GoodInfo> getInfosByTypeId(String parTypeIdStr) {
		GoodInfo goodInfo = new GoodInfo();
		goodInfo.setTypeId(Long.valueOf(parTypeIdStr));
		return goodInfoDao.select(goodInfo);

	}

	@Override
	public void saveInfo(GoodInfo goodInfo) {
		goodInfoDao.insertSelective(goodInfo);
	}

	@Override
	public void delInfo(String[] infoIds) {
		for (String infoId : infoIds) {
			// 如果有库存还得删除库存
			// 记录库存变动流水信息
			goodInfoDao.deleteByPrimaryKey(Long.valueOf(infoId));
		}
	}

	@Override
	public GoodInfo getGoodInfo(GoodInfo goodInfo) {
		return goodInfoDao.selectOne(goodInfo);
	}

	@Override
	public void updateGoodInfo(GoodInfo goodInfo) {
		goodInfoDao.updateByPrimaryKeySelective(goodInfo);
	}

}
