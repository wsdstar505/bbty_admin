package com.bbty.service.inf.good;

import java.util.List;

import com.bbty.pojo.good.GoodRep;

public interface GoodRepService {

	List<GoodRep> getGoodReps(GoodRep goodRep);

	void saveGoodRep(GoodRep goodRep);

	GoodRep getGoodRep(GoodRep goodRep);
}
