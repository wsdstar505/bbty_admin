package com.bbty.dao;

import org.mybatis.spring.annotation.MapperScan;

import com.bbty.pojo.Role;

import tk.mybatis.mapper.common.Mapper;


/**
 * 角色Dao
 * 
 * @author wsdstar
 *
 */
@MapperScan
public interface RoleDao extends Mapper<Role> {

}
