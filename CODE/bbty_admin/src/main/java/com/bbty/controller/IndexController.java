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
	@RequestMapping(value = "/toGoodMeterManager")
	public String toMeterManager(){
		return "/good/goodMeterManager";
	}
	
	/**
	 * 跳转到【商品分类管理】界面
	 * @return
	 */
	@RequestMapping(value = "/toGoodTypeManager")
	public String toGoodTypeManager(){
		return "/good/goodTypeManager";
	}
	
	/**
	 * 跳转到【商品信息维护】界面
	 * @return
	 */
	@RequestMapping(value = "/toGoodInfoManager")
	public String toGoodInfoManager(){
		return "/good/goodInfoManager";
	}
	
	/**
	 * 跳转到【采购入库】界面
	 * @return
	 */
	@RequestMapping(value = "/toGoodRepManager")
	public String toGoodRepManager(){
		return "/good/goodRepManager";
	}
	
	/**
	 * 跳转到【采购退货】界面
	 * @return
	 */
	@RequestMapping(value = "/toGoodRepBackManager")
	public String toGoodRepBackManager(){
		return "/good/goodRepBackManager";
	}
	
	
}
