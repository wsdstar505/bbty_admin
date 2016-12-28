package com.bbty.service.inf;

import java.util.List;

import com.bbty.pojo.Role;
import com.bbty.pojo.User;

public interface RoleService {

	public List<Role> getRoles();
	
	public void saveRole(Role role);

	public Role getRoleByRoleId(Role role);

	public void uptRole(Role role);
	
	public void delRole(String[] roleids);
	
	public void uptRoleBySelective(Role role);
	
	public List<Role> getRolesByUser(User user);
	
}
