package com.bbty.service.inf.good;

import java.util.List;

import com.bbty.pojo.good.GoodInfo;

public interface GoodInfoService {

	List<GoodInfo> getInfosByTypeId(String parTypeIdStr);

	void saveInfo(GoodInfo goodInfo);

	void delInfo(String[] infoCodes);

	GoodInfo getGoodInfo(GoodInfo goodInfo);

	void updateGoodInfo(GoodInfo goodInfo);

}
