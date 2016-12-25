package com.bbty.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbty.pojo.User;
import com.bbty.pojo.UserOper;
import com.bbty.service.inf.UserOperService;
import com.bbty.service.inf.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	public UserService userService;
	@Autowired
	public UserOperService userOperService;

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

	// 新增员工
	@RequestMapping(value = "/saveUserAndOper")
	@ResponseBody
	public Map<String, Object> saveUserAndOper(HttpServletRequest request) {
		Subject sub = SecurityUtils.getSubject();
		Session session = sub.getSession();
		UserOper userOper = (UserOper) session.getAttribute("currentUser");
		Map<String, Object> map = new HashMap<String, Object>();

		String userid = request.getParameter("userid");

		String username = request.getParameter("username");

		String gender = request.getParameter("gender");
		
		String birthdate = request.getParameter("birthdate");
		
		String mobileno = request.getParameter("mobileno");
		
		String status = request.getParameter("status");

		String remark = request.getParameter("remark");

		String password = request.getParameter("password");
		
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateStr = dateFormat.format(date);
		
		User user = new User();
		user.setUserid(userid);
		user.setUsername(username);
		user.setGender(gender);
		user.setBirthdate(birthdate);
		user.setMobileno(mobileno);
		user.setRemark(remark);
		user.setCreatetime(dateStr);
		user.setLastupttime(dateStr);
		
		UserOper oper = new UserOper();
		oper.setLastupttime(dateStr);
		oper.setStatus(status);
		oper.setUserid(userid);
		oper.setPassword(password);
		
		try {
			userService.saveUser(user);
			userOperService.saveUserOper(oper);
			map.put("rtn", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("rtn", "fail");
		}

		return map;
	}
}
