package com.bbty.service.inf;

import java.util.List;

import com.bbty.pojo.Role;

public interface RoleService {

	public List<Role> getRoles();
	
	public void saveRole(Role role);

	public Role getRoleByRoleId(Role role);
	
}
