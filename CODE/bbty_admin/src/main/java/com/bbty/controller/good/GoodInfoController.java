package com.bbty.controller.good;

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
import com.bbty.pojo.good.GoodInfo;
import com.bbty.pojo.good.GoodType;
import com.bbty.service.inf.good.GoodInfoService;
import com.bbty.service.inf.good.GoodTypeService;
import com.bbty.session.GoodTypeTree;

@Controller
@RequestMapping(value = "/goodInfo")
public class GoodInfoController {

	@Autowired
	public GoodInfoService goodInfoService;
	
	@Autowired
	public GoodTypeService goodTypeService;

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
	
	@RequestMapping(value = "/getGoodInfoTree")
	@ResponseBody
	public Map<String, Object> getGoodInfoTree() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<GoodTypeTree> treeList = new ArrayList<GoodTypeTree>();
		List<GoodType> list = goodTypeService.getGoodTypeList(0);
		// 判断是否有根节点
		if (list.size() != 0) {
			for (GoodType goodType : list) {
				GoodTypeTree tree = new GoodTypeTree();
				tree.setText(goodType.getTypeName());
				tree.setTags(String.valueOf(goodType.getTypeId()));
				List<GoodType> temp = goodTypeService.getGoodTypeList(goodType.getTypeId());
				if (temp.size() != 0) {
					tree.setNodes(getChildTree(temp, goodType));
				}
				treeList.add(tree);
			}
		}
		map.put("treeList", treeList);
		return map;
	}
	
	private List<GoodTypeTree> getChildTree(List<GoodType> treeList, GoodType goodType) {
		// 子节点列表
		List<GoodType> list = goodTypeService.getGoodTypeList(goodType.getTypeId());
		List<GoodTypeTree> tt = new ArrayList<GoodTypeTree>();
		if (list.size() != 0) {
			for (GoodType gt : list) {
				GoodTypeTree t = new GoodTypeTree();
				t.setText(gt.getTypeName());
				t.setTags(String.valueOf(gt.getTypeId()));
				//goodType
				t.setType("1");
				if (gt.getIsLeaf().equals("1")) {
					//有子类别
					t.setNodes(getChildTree(list, gt));
				} else if (gt.getIsLeaf().equals("0")) {
					//无子类别
					//查询
					List<GoodTypeTree> temp = new ArrayList<GoodTypeTree>();
					List<GoodInfo> gis = goodInfoService.getInfosByTypeId(String.valueOf(gt.getTypeId()));
					if(gis != null && gis.size() !=0){
						t.setIsLeaf("1");
						for (GoodInfo goodInfo : gis) {
							GoodTypeTree gtt = new GoodTypeTree();
							gtt.setText(goodInfo.getInfoName());
							gtt.setTags(String.valueOf(goodInfo.getInfoId()));
							gtt.setType("0");
							gtt.setIsLeaf("0");
							temp.add(gtt);
						}
						t.setNodes(temp);
					}
					
				}
				tt.add(t);
			}
		}
		return tt;
	}
	
}
