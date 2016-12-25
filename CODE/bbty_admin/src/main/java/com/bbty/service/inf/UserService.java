package com.bbty.service.inf;

import java.util.List;

import com.bbty.pojo.User;

public interface UserService {

	public List<User> getUsers();

	public User getUserByUserId(User user);

}
