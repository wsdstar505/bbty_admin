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
	
	/**
	 * 跳转到【计量单位配置管理】界面
	 * @return
	 */
	@RequestMapping(value = "/toMeterManager")
	public String toMeterManager(){
		return "/good/meterManager";
	}
}
