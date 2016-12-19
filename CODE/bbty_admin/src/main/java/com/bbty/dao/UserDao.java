package com.bbty.dao;

import org.mybatis.spring.annotation.MapperScan;

import com.bbty.pojo.User;

import tk.mybatis.mapper.common.Mapper;

@MapperScan
public interface UserDao extends Mapper<User>{

}
