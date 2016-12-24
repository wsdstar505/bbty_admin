package com.bbty.dao;

import org.mybatis.spring.annotation.MapperScan;
import com.bbty.pojo.UserOper;
import tk.mybatis.mapper.common.Mapper;

/**
 * 操作员Dao
 * 
 * @author wsdstar
 *
 */
@MapperScan
public interface UserOperDao extends Mapper<UserOper> {

	/**
	 * 根据UserOper属性多条件关联查询UserOper
	 * 
	 * @param userOper
	 * @return
	 */
	public UserOper selectOneByUserOper(UserOper userOper);
}
