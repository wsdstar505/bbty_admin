package com.bbty.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.bbty.pojo.User;

import tk.mybatis.mapper.common.Mapper;

@MapperScan
public interface UserDao extends Mapper<User>{

	public List<User> selectAllWithUserOper();

	public User selectOneWithUserOper(User user);

	public User selectOneWithUserOperByUserId(User user);
}
