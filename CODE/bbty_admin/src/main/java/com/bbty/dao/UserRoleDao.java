package com.bbty.dao;

import java.util.List;
import org.mybatis.spring.annotation.MapperScan;

import com.bbty.pojo.User;
import com.bbty.pojo.UserRole;
import tk.mybatis.mapper.common.Mapper;

/**
 * 操作员角色关系Dao
 * @author wsdstar
 *
 */
@MapperScan
public interface UserRoleDao extends Mapper<UserRole>{

	/**
	 * 
	 * @param user
	 * @return
	 */
	public List<UserRole> selectAllByUser(User user);
	
}
