package com.bbty.dao;

import org.mybatis.spring.annotation.MapperScan;
import com.bbty.pojo.UserOper;
import tk.mybatis.mapper.common.Mapper;

@MapperScan
public interface UserOperDao extends Mapper<UserOper>{

	public UserOper selectUserOperByUserOper(UserOper userOper);
}
