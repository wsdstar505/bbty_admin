package com.bbty.dao.good;

import org.mybatis.spring.annotation.MapperScan;

import com.bbty.pojo.good.Meter;

import tk.mybatis.mapper.common.Mapper;

@MapperScan
public interface MeterDao extends Mapper<Meter> {

}
