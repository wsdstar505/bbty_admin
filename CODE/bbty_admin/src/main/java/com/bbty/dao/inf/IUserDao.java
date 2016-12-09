package com.bbty.dao.inf;

import org.mybatis.spring.annotation.MapperScan;

import com.bbty.pojo.User;

import tk.mybatis.mapper.common.Mapper;

@MapperScan
public interface IUserDao extends Mapper<User>{

}
