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
	public List<GoodType> getChildGoodTypesByParTypeId(String parTypeIdStr) {
		GoodType goodType = new GoodType();
		goodType.setParTypeId(Long.valueOf(parTypeIdStr));
		List<GoodType> res = goodTypeDao.getChildGoodTypesByParTypeId(goodType);
		return res;
	}

	@Override
	public void saveType(GoodType goodType) {
		goodTypeDao.insertSelective(goodType);
	}

	@Override
	public void delType(String[] typeIds) {
		for (String typeId : typeIds) {
			GoodType goodType = new GoodType();
			goodType.setTypeId(Long.valueOf(typeId));
			goodType = goodTypeDao.selectOne(goodType);
			
			if("1".equals(goodType.getIsLeaf())){
				this.deleteType(goodType);
				goodTypeDao.deleteByPrimaryKey(goodType.getTypeId());
			}else{
				goodTypeDao.deleteByPrimaryKey(goodType.getTypeId());
			}
		}
	}
	
	private void deleteType(GoodType goodType){
		List<GoodType> gts = this.getChildGoodTypesByParTypeId(String.valueOf(goodType.getTypeId()));
		if(gts != null && gts.size() !=0){
			for (GoodType gt : gts) {
				if("1".equals(gt.getIsLeaf())){
					this.deleteType(gt);
					goodTypeDao.deleteByPrimaryKey(gt.getTypeId());
				}else{
					goodTypeDao.deleteByPrimaryKey(gt.getTypeId());
				}
			}
		}
		
	}

	@Override
	public GoodType getGoodType(GoodType goodType) {
		return goodTypeDao.selectOne(goodType);
	}

	@Override
	public void updateGoodType(GoodType goodType) {
		goodTypeDao.updateByPrimaryKeySelective(goodType);
	}


}
