package com.bbty.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbty.dao.UserOperDao;
import com.bbty.pojo.UserOper;
import com.bbty.service.inf.UserOperService;

@Service
public class UserOperServiceImpl implements UserOperService{

	@Autowired
	public UserOperDao userOperDao;
	
	@Override
	public void saveUserOper(UserOper oper) {
		userOperDao.insertSelective(oper);
	}

	@Override
	public void uptUserOperBySelective(UserOper oper) {
		userOperDao.updateByPrimaryKeySelective(oper);
	}

	@Override
	public void deleteUserOper(UserOper userOper) {
		userOperDao.delete(userOper);
	}


}
