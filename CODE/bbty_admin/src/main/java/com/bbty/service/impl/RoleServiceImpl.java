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

}
