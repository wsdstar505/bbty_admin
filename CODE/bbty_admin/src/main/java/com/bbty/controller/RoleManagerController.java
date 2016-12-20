package com.bbty.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
}
