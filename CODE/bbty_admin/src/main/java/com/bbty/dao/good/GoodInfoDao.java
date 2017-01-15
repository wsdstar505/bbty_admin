package com.bbty.dao.good;

import org.mybatis.spring.annotation.MapperScan;

import com.bbty.pojo.good.GoodInfo;

import tk.mybatis.mapper.common.Mapper;

@MapperScan
public interface GoodInfoDao extends Mapper<GoodInfo> {

	
}
