package com.bbty.controller.good;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		//判断是否有根节点
		if (list.size() != 0) {
			for (GoodType goodType : list) {
				GoodTypeTree tree = new GoodTypeTree();
				tree.setText(goodType.getTyepName());
				tree.setTags(goodType.getTypeCode());
				List<GoodType> temp = goodTypeService.getGoodTypeList(goodType.getTypeId());
				if(temp.size() !=0){
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
				t.setText(gt.getTyepName());
				t.setTags(gt.getTypeCode());
				if(gt.getIsLeaf().equals("0")){
					t.setNodes(getChildTree(list, gt));
				}else if(gt.getIsLeaf().equals("1")){
				}
				tt.add(t);
			}
		}
		return tt;
	}
}
