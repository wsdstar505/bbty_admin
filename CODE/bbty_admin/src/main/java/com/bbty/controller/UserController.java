package com.bbty.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbty.pojo.User;
import com.bbty.service.inf.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	public UserService userService;
	
	@RequestMapping(value = "/getUserList")
	@ResponseBody
	public Map<String, Object> getUserList() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<User> users = userService.getUsers();
		map.put("data", users);
		return map;
	}
	
	@RequestMapping(value = "/checkUserId")
	@ResponseBody
	public Map<String, Object> checkUserId(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String userid = request.getParameter("userid");

		User user = new User();
		user.setUserid(userid);

		try {
			user = userService.getUserByUserId(user);
			if (user != null) {
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
}
