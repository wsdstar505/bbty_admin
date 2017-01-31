package com.bbty.service.inf.good;

import java.util.List;

import com.bbty.pojo.good.GoodRep;

public interface GoodRepService {

	List<GoodRep> getGoodReps(GoodRep goodRep);

	void saveGoodRep(GoodRep goodRep);

	GoodRep getGoodRep(GoodRep goodRep);

	void delRep(String[] repIds);

	List<GoodRep> getGoodRepsWithMeter(GoodRep goodRep);

	GoodRep getGoodRepWithMeter(GoodRep goodRep);

	void updateGoodRep(GoodRep goodRep);

	void delRep(GoodRep goodRep);
}
