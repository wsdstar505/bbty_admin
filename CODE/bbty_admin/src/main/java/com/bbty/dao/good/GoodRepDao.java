package com.bbty.dao.good;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.bbty.pojo.good.GoodRep;

import tk.mybatis.mapper.common.Mapper;

@MapperScan
public interface GoodRepDao extends Mapper<GoodRep>{

	List<GoodRep> getGoodRepsWithMeter(GoodRep goodRep);

	GoodRep getGoodRepWithMeter(GoodRep goodRep);

}
