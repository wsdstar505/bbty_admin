package com.bbty.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbty.dao.UserDao;
import com.bbty.pojo.User;
import com.bbty.service.inf.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	public UserDao userDao;
	
	@Override
	public List<User> getUsers() {
		return userDao.selectAllWithUserOper();
	}

	@Override
	public User getUserByUserId(User user) {
		return userDao.selectOneWithUserOper(user);
	}

}
