package com.bbty.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/index")
public class IndexController {

	/**
	 * 跳转到【角色管理】界面
	 * @return
	 */
	@RequestMapping(value = "/toRoleManager")
	public String toRoleManager(){
		return "/userRole/roleManager";
	}
	
	/**
	 * 跳转到【员工管理】界面
	 * @return
	 */
	@RequestMapping(value = "/toUserManager")
	public String toUserManager(){
		return "/userRole/userManager";
	}
}
