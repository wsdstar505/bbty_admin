package com.bbty.controller.good;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bbty.pojo.good.GoodRep;
import com.bbty.service.inf.good.GoodRepService;
import com.bbty.session.UserSession;

@Controller
@RequestMapping(value = "/goodRep")
public class GoodRepController {

	@Autowired
	public GoodRepService goodRepService;
	
	@RequestMapping(value = "/getRepsByGoodInfo")
	@ResponseBody
	public Map<String, Object> getRepsByGoodInfo(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String infoIdStr = request.getParameter("infoIdStr");
		GoodRep goodRep = new GoodRep();
		goodRep.setInfoId(Long.parseLong(infoIdStr));
		List<GoodRep> list = goodRepService.getGoodReps(goodRep);
		map.put("data", list);
		return map;
	}
	
	// 新增库存
	@RequestMapping(value = "/saveGoodRep")
	@ResponseBody
	public Map<String, Object> saveGoodRep(HttpServletRequest request) {
		
		Session session = SecurityUtils.getSubject().getSession();
		UserSession userSession = (UserSession) session.getAttribute("userSession");
		
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateStr = dateFormat.format(date);
		
		Map<String, Object> map = new HashMap<String, Object>();

		String infoIdAdd = request.getParameter("infoIdAdd");
		
		String pici = request.getParameter("pici");

		String cbp = request.getParameter("cbp");
		
		String pfp = request.getParameter("pfp");
		
		String sczdp = request.getParameter("sczdp");
		
		String xsp = request.getParameter("xsp");

		String meterId = request.getParameter("meterId");
		
		String repNum = request.getParameter("repNum");
		
		try {

			GoodRep goodRep = new GoodRep();
			
			goodRep.setInfoId(Long.parseLong(infoIdAdd));
			goodRep.setMeterId(Long.parseLong(meterId));
			goodRep.setPici(Long.parseLong(pici));
			goodRep.setCbp(Double.parseDouble(cbp));
			goodRep.setPfp(Double.parseDouble(pfp));
			goodRep.setSczdp(Double.parseDouble(sczdp));
			goodRep.setXsp(Double.parseDouble(xsp));
			goodRep.setRepNum(Long.parseLong(repNum));
			
			goodRep.setRepDate(dateStr);
			goodRep.setRepUptdate(dateStr);
			goodRep.setRepEmpid(userSession.getEmpid());
			
			goodRepService.saveGoodRep(goodRep);
			map.put("rtn", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("rtn", "fail");
		}

		return map;
	}
	
	@RequestMapping(value = "/checkAddPici")
	@ResponseBody
	public Map<String, Object> checkAddPici(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String infoIdStr = request.getParameter("infoIdStr");

		String pici = request.getParameter("pici");
		if (infoIdStr != null && pici != null) {
			try {
				
				GoodRep goodRep = new GoodRep();
				goodRep.setInfoId(Long.parseLong(infoIdStr));
				goodRep.setPici(Long.parseLong(pici));
				
				goodRep = this.goodRepService.getGoodRep(goodRep);
				if (goodRep != null) {
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
		}

		return map;
	}
	
	
}
