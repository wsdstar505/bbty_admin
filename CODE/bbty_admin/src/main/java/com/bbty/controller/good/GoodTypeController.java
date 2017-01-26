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

import com.bbty.pojo.good.GoodType;
import com.bbty.service.inf.good.GoodTypeService;
import com.bbty.session.GoodTypeTree;

@Controller
@RequestMapping(value = "/goodType")
public class GoodTypeController {

	@Autowired
	public GoodTypeService goodTypeService;

	@RequestMapping(value = "/getGoodTypeTree")
	@ResponseBody
	public Map<String, Object> getGoodTypeTree() {
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
				if (gt.getIsLeaf().equals("1")) {
					t.setNodes(getChildTree(list, gt));
				} else if (gt.getIsLeaf().equals("0")) {
				}
				tt.add(t);
			}
		}
		return tt;
	}

	@RequestMapping(value = "/getChildGoodTypesByTypeCode")
	@ResponseBody
	public Map<String, Object> getChildGoodTypesByTypeCode(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String parTypeIdStr = request.getParameter("parTypeIdStr");
		List<GoodType> list = goodTypeService.getChildGoodTypesByParTypeId(parTypeIdStr);
		map.put("data", list);
		return map;
	}

	@RequestMapping(value = "/saveGoodType")
	@ResponseBody
	public Map<String, Object> saveGoodType(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		Long parTypeId = Long.valueOf(request.getParameter("parTypeIdAdd"));
		String typeCode = request.getParameter("typeCode");
		String typeName = request.getParameter("typeName");
		String status = request.getParameter("status");
		String isLeaf = request.getParameter("isLeaf");
		String remark = request.getParameter("remark");

		GoodType goodType = new GoodType();
		goodType.setTypeName(typeName);
		goodType.setTypeCode(typeCode);
		goodType.setStatus(status);
		goodType.setRemark(remark);
		goodType.setParTypeId(parTypeId);
		goodType.setIsLeaf(isLeaf);

		try {
			goodTypeService.saveType(goodType);
			map.put("rtn", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("rtn", "fail");
		}

		return map;
	}

	@RequestMapping(value = "/delGoodType")
	@ResponseBody
	public Map<String, Object> delGoodType(@RequestBody String[] typeIds) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			goodTypeService.delType(typeIds);
			map.put("rtn", "success");
		} catch (Exception e) {
			map.put("rtn", "fail");
		}
		return map;
	}

	@RequestMapping(value = "/getGoodType")
	@ResponseBody
	public Map<String, Object> getGoodType(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String typeId = request.getParameter("typeId");

		GoodType goodType = new GoodType();
		goodType.setTypeId(Long.valueOf(typeId));;

		try {
			goodType = goodTypeService.getGoodType(goodType);
			if (goodType != null) {
				map.put("rtn", "success");
				map.put("goodType", goodType);
			}

		} catch (Exception e) {
			map.put("rtn", "fail");
		}

		return map;
	}

	@RequestMapping(value = "/uptGoodType")
	@ResponseBody
	public Map<String, Object> uptGoodType(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String typeId = request.getParameter("typeId");
		String typeCode = request.getParameter("typeCode");
		String typeName = request.getParameter("typeName");
		String status = request.getParameter("status");
		String isLeaf = request.getParameter("isLeaf");
		String parTypeIdUpt = request.getParameter("parTypeIdUpt");

		String isSrcLeaf = request.getParameter("isSrcLeaf");

		GoodType goodType = new GoodType();
		goodType.setTypeId(Long.valueOf(typeId));
		goodType.setTypeCode(typeCode);
		goodType.setTypeName(typeName);
		goodType.setParTypeId(Long.valueOf(parTypeIdUpt));
		goodType.setStatus(status);
		goodType.setIsLeaf(isLeaf);

		try {
			if (isSrcLeaf.equals(isLeaf)) {
				// 是否有子节点-没有变化
				goodTypeService.updateGoodType(goodType);
			} else {
				// 是否有子节点-有变化
				if ("1".equals(isLeaf)) {
					// 从无到有
					goodTypeService.updateGoodType(goodType);
				} else if ("0".equals(isLeaf)) {
					// 从有到无
					// 变更原先子节点到父节点下
					// 遍历子节点
					List<GoodType> gts = goodTypeService.getChildGoodTypesByParTypeId(typeId);

					if (gts != null && gts.size() != 0) {
						for (GoodType gt : gts) {
							gt.setParTypeId(Long.valueOf(parTypeIdUpt));
							goodTypeService.updateGoodType(gt);
						}
					}

					goodTypeService.updateGoodType(goodType);
				}
			}
			map.put("rtn", "success");

		} catch (Exception e) {
			map.put("rtn", "fail");
		}
		return map;
	}

	@RequestMapping(value = "/checkTypeCode")
	@ResponseBody
	public Map<String, Object> checkTypeCode(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String typeCode = request.getParameter("typeUptCode");
		String typeSrcCode = request.getParameter("typeSrcCode");

		if (typeCode != null && typeSrcCode != null) {
			if (typeCode.equals(typeSrcCode)) {
				// 表示合法，验证通过
				map.put("valid", "true");
			} else {
				GoodType goodType = new GoodType();
				goodType.setTypeCode(typeCode);

				try {
					goodType = this.goodTypeService.getGoodType(goodType);
					if (goodType != null) {
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
	
	@RequestMapping(value = "/checkAddTypeCode")
	@ResponseBody
	public Map<String, Object> checkAddTypeCode(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String typeCode = request.getParameter("typeCode");

		if (typeCode != null) {
			
				GoodType goodType = new GoodType();
				goodType.setTypeCode(typeCode);

				try {
					goodType = this.goodTypeService.getGoodType(goodType);
					if (goodType != null) {
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
