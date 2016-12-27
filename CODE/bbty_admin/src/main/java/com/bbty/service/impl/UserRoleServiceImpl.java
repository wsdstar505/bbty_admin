package com.bbty.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbty.dao.UserRoleDao;
import com.bbty.pojo.UserRole;
import com.bbty.service.inf.UserRoleService;

@Service
public class UserRoleServiceImpl implements UserRoleService{

	@Autowired
	public UserRoleDao userRoleDao;
	
	@Override
	public void saveUserRole(UserRole userRole) {
		userRoleDao.insertSelective(userRole);
	}

	@Override
	public void deleteUserRole(UserRole userRole) {
		userRoleDao.delete(userRole);
	}

}
