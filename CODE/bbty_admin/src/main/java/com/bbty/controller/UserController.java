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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbty.pojo.Role;
import com.bbty.pojo.User;
import com.bbty.pojo.UserOper;
import com.bbty.pojo.UserRole;
import com.bbty.service.inf.UserOperService;
import com.bbty.service.inf.UserRoleService;
import com.bbty.service.inf.UserService;
import com.bbty.session.UserSession;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	public UserService userService;
	@Autowired
	public UserOperService userOperService;
	@Autowired
	public UserRoleService userRoleService;

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
			user = userService.selectOneWithUserOper(user);
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

	@RequestMapping(value = "/changeUserStatus")
	@ResponseBody
	public Map<String, Object> changeUserStatus(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		Session session = SecurityUtils.getSubject().getSession();
		UserSession userSession = (UserSession) session.getAttribute("userSession");

		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateStr = dateFormat.format(date);

		String userid = request.getParameter("userid");
		String status = request.getParameter("status");
		Role role = new Role();
		UserOper userOper = new UserOper();
		userOper.setUserid(userid);
		userOper.setStatus(status);
		userOper.setLastupttime(dateStr);
		userOper.setUptempid(userSession.getEmpid());

		try {
			userOperService.uptUserOperBySelective(userOper);
			if (role != null) {
				map.put("rtn", "success");
			}

		} catch (Exception e) {
			e.printStackTrace();
			map.put("rtn", "fail");
		}

		return map;
	}

	// 新增员工
	@RequestMapping(value = "/saveUserAndOper")
	@ResponseBody
	public Map<String, Object> saveUserAndOper(HttpServletRequest request) {
		Session session = SecurityUtils.getSubject().getSession();
		UserSession userSession = (UserSession) session.getAttribute("userSession");

		Map<String, Object> map = new HashMap<String, Object>();

		String[] roleidArray = request.getParameterValues("roleids");
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
		// htel
		// haddress

		UserOper oper = new UserOper();
		oper.setUserid(userid);
		oper.setPassword(password);
		oper.setStatus(status);
		oper.setLastupttime(dateStr);
		oper.setUptempid(userSession.getEmpid());

		try {
			userService.saveUser(user);
			userOperService.saveUserOper(oper);

			User userAdd = userService.selectOneWithUserOper(user);

			if (roleidArray.length != 0) {
				for (String roleid : roleidArray) {
					UserRole userRole = new UserRole();
					userRole.setEmpid(userAdd.getEmpid());
					userRole.setRoleid(roleid);
					userRoleService.saveUserRole(userRole);
				}
			}

			map.put("rtn", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("rtn", "fail");
		}

		return map;
	}

	// 删除用户
	// 删除操作员
	// 删除用户与角色关系
	@RequestMapping(value = "/delUserAndOperAndRole")
	@ResponseBody
	public Map<String, Object> delUserAndOperAndRole(@RequestBody String[] userids) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			for (String userid : userids) {
				User user = new User();
				user.setUserid(userid);
				user = userService.selectOneWithUserOper(user);

				UserRole userRole = new UserRole();
				userRole.setEmpid(user.getEmpid());
				userRoleService.deleteUserRole(userRole);

				UserOper userOper = new UserOper();
				userOper.setUserid(user.getUserid());
				userOperService.deleteUserOper(userOper);

				userService.deleteUser(user);

			}
			map.put("rtn", "success");
		} catch (Exception e) {
			map.put("rtn", "fail");
		}
		return map;
	}
	
	@RequestMapping(value = "/getUserByUserId")
	@ResponseBody
	public Map<String, Object> getUserByUserId(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String userid = request.getParameter("userid");

		User user = new User();
		user.setUserid(userid);

		try {
			user = userService.selectOneWithUserOper(user);
			if (user != null) {
				map.put("rtn", "success");
				map.put("user", user);
			}

		} catch (Exception e) {
			map.put("rtn", "fail");
		}

		return map;
	}
}
