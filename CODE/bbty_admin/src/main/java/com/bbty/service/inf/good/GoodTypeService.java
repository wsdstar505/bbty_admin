package com.bbty.service.inf.good;

import java.util.List;

import com.bbty.pojo.good.GoodType;

public interface GoodTypeService {

	List<GoodType> getGoodTypeList(long parTypeId);

	List<GoodType> getChildGoodTypesByParTypeId(String parTypeIdStr);

	void saveType(GoodType goodType);

	void delType(String[] typeCodes);

	GoodType getGoodTypeByTypeCode(GoodType goodType);

}
