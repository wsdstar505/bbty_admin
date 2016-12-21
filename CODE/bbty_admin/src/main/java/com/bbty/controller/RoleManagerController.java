package com.bbty.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbty.pojo.Role;
import com.bbty.service.inf.RoleService;

@Controller
@RequestMapping(value = "/role")
public class RoleManagerController {

	@Autowired
	public RoleService roleService;
	
	@RequestMapping(value = "/getRoleList")
	@ResponseBody
	public Map<String, Object> getRoleList(){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Role> roles = roleService.getRoles();
		map.put("data", roles);
		return map;
	}
	
	//新增角色
	@RequestMapping(value = "/saveRole")
	@ResponseBody
	public Map<String, Object> saveRole(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		
		String roleid = request.getParameter("roleid");

		String rolename = request.getParameter("rolename");
		
		Role role = new Role(roleid, rolename);
		
		try {
			roleService.saveRole(role);
			map.put("rtn", "success");
		} catch (Exception e) {
			map.put("rtn", "fail");
		}

		return map;
	}
	
	@RequestMapping(value = "/getRoleByRoleId")
	@ResponseBody
	public Map<String, Object> getRoleByRoleId(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		
		String roleid = request.getParameter("roleid");
		
		Role role = new Role();
		
		role.setRoleid(roleid);
		
		try {
			role = roleService.getRoleByRoleId(role);
			if(role != null){
				//表示不合法，验证不通过
				map.put("valid", "false");
			}else{
				//表示合法，验证通过
				map.put("valid", "true");
			}
			
		} catch (Exception e) {
			//出现异常，验证不通过
			map.put("valid", "false");
		}

		return map;
	}
}
