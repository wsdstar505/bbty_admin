package com.bbty.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbty.dao.RoleDao;
import com.bbty.pojo.Role;
import com.bbty.service.inf.RoleService;

@Service
public class RoleServiceImpl implements RoleService{

	@Autowired
	public RoleDao roleDao;
	
	@Override
	public List<Role> getRoles() {
		return roleDao.selectAll();
	}

	@Override
	public void saveRole(Role role) {
		roleDao.insertSelective(role);
	}

	@Override
	public Role getRoleByRoleId(Role role) {
		return roleDao.selectOne(role);
	}

	@Override
	public void uptRole(Role role) {
		roleDao.updateByPrimaryKey(role);
	}

	@Override
	public void delRole(String[] roleids) {
		for (String roleid : roleids) {
			roleDao.deleteByPrimaryKey(roleid);
		}
		
	}

	@Override
	public void uptRoleByExampleSelective(Role role) {
		roleDao.updateByPrimaryKeySelective(role);
	}

}
