package com.bbty.dao.good;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.bbty.pojo.good.GoodType;

import tk.mybatis.mapper.common.Mapper;

@MapperScan
public interface GoodTypeDao extends Mapper<GoodType> {

	List<GoodType> selectGoodTypes();

}
