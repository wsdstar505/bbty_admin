package com.bbty.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbty.pojo.Role;
import com.bbty.service.inf.RoleService;
import com.bbty.session.RoleJson;

@Controller
@RequestMapping(value = "/role")
public class RoleController {

	@Autowired
	public RoleService roleService;

	@RequestMapping(value = "/getRoleList")
	@ResponseBody
	public Map<String, Object> getRoleList() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Role> roles = roleService.getRoles();
		map.put("data", roles);
		return map;
	}
	
	@RequestMapping(value = "/getRoleJson")
	@ResponseBody
	public Map<String, Object> getRoleJson() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<RoleJson> roleJsons = new ArrayList<RoleJson>();
		List<Role> roles = roleService.getRoles();
		for (Role role : roles) {
			RoleJson json = new RoleJson();
			json.setId(role.getRoleid());
			json.setText(role.getRolename());
			roleJsons.add(json);
		}
		map.put("roleJsons", roleJsons);
		return map;
	}

	// 新增角色
	@RequestMapping(value = "/saveRole")
	@ResponseBody
	public Map<String, Object> saveRole(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String roleid = request.getParameter("roleid");

		String rolename = request.getParameter("rolename");

		String status = request.getParameter("status");
		
		String remark = request.getParameter("remark");
		
		Role role = new Role(roleid, rolename,status,remark);

		try {
			roleService.saveRole(role);
			map.put("rtn", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("rtn", "fail");
		}

		return map;
	}

	// 修改角色
	@RequestMapping(value = "/uptRole")
	@ResponseBody
	public Map<String, Object> uptRole(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String roleid = request.getParameter("roleid");

		String rolename = request.getParameter("rolename");

		String status = request.getParameter("status");
		
		String remark = request.getParameter("remark");
		
		Role role = new Role(roleid, rolename,status,remark);

		try {
			roleService.uptRoleBySelective(role);
			map.put("rtn", "success");
		} catch (Exception e) {
			map.put("rtn", "fail");
		}

		return map;
	}

	// 删除角色
	@RequestMapping(value = "/delRole")
	@ResponseBody
	public Map<String, Object> delRole(@RequestBody String[] roleids) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			roleService.delRole(roleids);
			map.put("rtn", "success");
		} catch (Exception e) {
			map.put("rtn", "fail");
		}
		return map;
	}

	@RequestMapping(value = "/checkRoleId")
	@ResponseBody
	public Map<String, Object> checkRoleId(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String roleid = request.getParameter("roleid");

		Role role = new Role();

		role.setRoleid(roleid);

		try {
			role = roleService.getRoleByRoleId(role);
			if (role != null) {
				// 表示不合法，验证不通过
				map.put("valid", "false");
			} else {
				// 表示合法，验证通过
				map.put("valid", "true");
			}

		} catch (Exception e) {
			// 出现异常，验证不通过
			map.put("valid", "false");
		}

		return map;
	}

	@RequestMapping(value = "/getRoleByRoleId")
	@ResponseBody
	public Map<String, Object> getRoleByRoleId(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String roleid = request.getParameter("roleid");

		Role role = new Role();

		role.setRoleid(roleid);

		try {
			role = roleService.getRoleByRoleId(role);
			if (role != null) {
				map.put("rtn", "success");
				map.put("role", role);
			}

		} catch (Exception e) {
			map.put("rtn", "fail");
		}

		return map;
	}
	
	@RequestMapping(value = "/changeRoleStatus")
	@ResponseBody
	public Map<String,Object> changeRoleStatus(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();

		String roleid = request.getParameter("roleid");
		String status = request.getParameter("status");
		Role role = new Role();

		role.setRoleid(roleid);
		role.setStatus(status);
		
		try {
			roleService.uptRoleBySelective(role);
			if (role != null) {
				map.put("rtn", "success");
			}

		} catch (Exception e) {
			e.printStackTrace();
			map.put("rtn", "fail");
		}

		return map;
	}
}
