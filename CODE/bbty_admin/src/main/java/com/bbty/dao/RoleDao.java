package com.bbty.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.bbty.pojo.Role;
import com.bbty.pojo.User;

import tk.mybatis.mapper.common.Mapper;


/**
 * 角色Dao
 * 
 * @author wsdstar
 *
 */
@MapperScan
public interface RoleDao extends Mapper<Role> {

	List<Role> selectRolesByUser(User user);

}
