package com.bbty.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface UserRoleDao {

	public List<String> getUserRoleByUserName(String username);
	
}
