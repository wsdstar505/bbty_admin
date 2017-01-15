package com.bbty.controller.good;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bbty.pojo.good.GoodInfo;
import com.bbty.service.inf.good.GoodInfoService;

@Controller
@RequestMapping(value = "/goodInfo")
public class GoodInfoController {

	@Autowired
	public GoodInfoService goodInfoService;

	@RequestMapping(value = "/getInfosByGoodType")
	@ResponseBody
	public Map<String, Object> getInfosByGoodType(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String parTypeIdStr = request.getParameter("parTypeIdStr");
		List<GoodInfo> list = goodInfoService.getInfosByTypeId(parTypeIdStr);
		map.put("data", list);
		return map;
	}

	@RequestMapping(value = "/saveGoodInfo")
	@ResponseBody
	public Map<String, Object> saveGoodInfo(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		Long parTypeId = Long.valueOf(request.getParameter("parTypeIdAdd"));
		String infoCode = request.getParameter("infoCode");
		String infoName = request.getParameter("infoName");
		String status = request.getParameter("status");
		String marker = request.getParameter("marker");
		String markAddress = request.getParameter("markAddress");
		String website = request.getParameter("website");
		String contact = request.getParameter("contact");
		String fax = request.getParameter("fax");
		String zipCode = request.getParameter("zipCode");
		String remark = request.getParameter("remark");

		GoodInfo goodInfo = new GoodInfo();
		goodInfo.setTypeId(parTypeId);
		goodInfo.setInfoCode(infoCode);
		goodInfo.setInfoName(infoName);
		goodInfo.setStatus(status);
		goodInfo.setMarker(marker);
		goodInfo.setMarkAddress(markAddress);
		goodInfo.setWebsite(website);
		goodInfo.setContact(contact);
		goodInfo.setFax(fax);
		goodInfo.setZipCode(zipCode);
		goodInfo.setRemark(remark);

		try {
			goodInfoService.saveInfo(goodInfo);
			map.put("rtn", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("rtn", "fail");
		}

		return map;
	}

	@RequestMapping(value = "/delGoodInfo")
	@ResponseBody
	public Map<String, Object> delGoodInfo(@RequestBody String[] infoIds) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			goodInfoService.delInfo(infoIds);
			map.put("rtn", "success");
		} catch (Exception e) {
			map.put("rtn", "fail");
		}
		return map;
	}

	@RequestMapping(value = "/getGoodInfoByInfoId")
	@ResponseBody
	public Map<String, Object> getGoodInfoByInfoId(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String infoId = request.getParameter("infoId");

		GoodInfo goodInfo = new GoodInfo();
		goodInfo.setInfoId(Long.valueOf(infoId));

		try {
			goodInfo = goodInfoService.getGoodInfo(goodInfo);
			if (goodInfo != null) {
				map.put("rtn", "success");
				map.put("goodInfo", goodInfo);
			}

		} catch (Exception e) {
			map.put("rtn", "fail");
		}

		return map;
	}

	@RequestMapping(value = "/uptGoodInfo")
	@ResponseBody
	public Map<String, Object> uptGoodInfo(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		Long typeId = Long.valueOf(request.getParameter("typeId"));
		Long infoId = Long.valueOf(request.getParameter("infoId"));
		String infoCode = request.getParameter("infoCode");
		String infoName = request.getParameter("infoName");
		String status = request.getParameter("status");
		String marker = request.getParameter("marker");
		String markAddress = request.getParameter("markAddress");
		String website = request.getParameter("website");
		String contact = request.getParameter("contact");
		String fax = request.getParameter("fax");
		String zipCode = request.getParameter("zipCode");
		String remark = request.getParameter("remark");

		GoodInfo goodInfo = new GoodInfo();
		goodInfo.setInfoId(infoId);
		goodInfo.setTypeId(typeId);
		goodInfo.setInfoCode(infoCode);
		goodInfo.setInfoName(infoName);
		goodInfo.setStatus(status);
		goodInfo.setMarker(marker);
		goodInfo.setMarkAddress(markAddress);
		goodInfo.setWebsite(website);
		goodInfo.setContact(contact);
		goodInfo.setFax(fax);
		goodInfo.setZipCode(zipCode);
		goodInfo.setRemark(remark);

		try {
			goodInfoService.updateGoodInfo(goodInfo);
			map.put("rtn", "success");

		} catch (Exception e) {
			map.put("rtn", "fail");
		}
		return map;
	}

	@RequestMapping(value = "/checkAddInfoCode")
	@ResponseBody
	public Map<String, Object> checkAddInfoCode(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String infoCode = request.getParameter("infoCode");

		if (infoCode != null) {

			GoodInfo goodInfo = new GoodInfo();
			goodInfo.setInfoCode(infoCode);

			try {
				goodInfo = this.goodInfoService.getGoodInfo(goodInfo);
				if (goodInfo != null) {
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

	@RequestMapping(value = "/checkInfoCode")
	@ResponseBody
	public Map<String, Object> checkInfoCode(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String infoCode = request.getParameter("infoCode");
		String infoSrcCode = request.getParameter("infoSrcCode");

		if (infoCode != null && infoSrcCode != null) {
			if (infoCode.equals(infoSrcCode)) {
				// 表示合法，验证通过
				map.put("valid", "true");
			} else {
				GoodInfo goodInfo = new GoodInfo();
				goodInfo.setInfoCode(infoCode);

				try {
					goodInfo = this.goodInfoService.getGoodInfo(goodInfo);
					if (goodInfo != null) {
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
		}

		return map;
	}
}
