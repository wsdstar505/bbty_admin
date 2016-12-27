package com.bbty.service.inf;

import java.util.List;

import com.bbty.pojo.User;

public interface UserService {

	public List<User> getUsers();

	public User selectOneWithUserOper(User user);

	public void saveUser(User user);

	public void deleteUser(User user);

}
