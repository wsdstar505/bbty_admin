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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bbty.pojo.good.GoodRep;
import com.bbty.pojo.good.GoodRepWater;
import com.bbty.pojo.good.Meter;
import com.bbty.service.inf.good.GoodRepService;
import com.bbty.service.inf.good.GoodRepWaterService;
import com.bbty.service.inf.good.MeterService;
import com.bbty.session.SelectJson;
import com.bbty.session.UserSession;

@Controller
@RequestMapping(value = "/goodRep")
public class GoodRepController {

	@Autowired
	public GoodRepService goodRepService;

	@Autowired
	public GoodRepWaterService goodRepWaterService;

	@Autowired
	public MeterService meterService;

	@RequestMapping(value = "/getRepsByGoodInfo")
	@ResponseBody
	public Map<String, Object> getRepsByGoodInfo(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String infoIdStr = request.getParameter("infoIdStr");
		GoodRep goodRep = new GoodRep();
		goodRep.setInfoId(Long.parseLong(infoIdStr));
		List<GoodRep> list = goodRepService.getGoodRepsWithMeter(goodRep);
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

			goodRep = goodRepService.getGoodRepWithMeter(goodRep);

			GoodRepWater goodRepWater = new GoodRepWater();

			goodRepWater.setRepId(goodRep.getRepId());
			goodRepWater.setInfoId(goodRep.getInfoId());
			goodRepWater.setMeterId(goodRep.getMeterId());
			goodRepWater.setPici(goodRep.getPici());
			goodRepWater.setCbp(goodRep.getCbp());
			goodRepWater.setPfp(goodRep.getPfp());
			goodRepWater.setSczdp(goodRep.getSczdp());
			goodRepWater.setXsp(goodRep.getXsp());
			goodRepWater.setRepNum(goodRep.getRepNum());

			goodRepWater.setRepUptDate(goodRep.getRepUptdate());
			goodRepWater.setRepUptEmpid(goodRep.getRepEmpid());

			goodRepWater.setWaterType("0");

			goodRepWaterService.saveRepWater(goodRepWater);

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
				goodRep = this.goodRepService.getGoodRepWithMeter(goodRep);

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

	@RequestMapping(value = "/delGoodRep")
	@ResponseBody
	public Map<String, Object> delGoodRep(@RequestBody String[] repIds) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			for (String repId : repIds) {
				GoodRep goodRep = new GoodRep();
				goodRep.setRepId(Long.valueOf(repId));
				goodRep = goodRepService.getGoodRepWithMeter(goodRep);

				if (goodRep != null) {
					GoodRepWater goodRepWater = new GoodRepWater();

					goodRepWater.setInfoId(goodRep.getInfoId());
					goodRepWater.setMeterId(goodRep.getMeterId());
					goodRepWater.setRepId(goodRep.getRepId());
					goodRepWater.setPici(goodRep.getPici());
					goodRepWater.setCbp(goodRep.getCbp());
					goodRepWater.setPfp(goodRep.getPfp());
					goodRepWater.setSczdp(goodRep.getSczdp());
					goodRepWater.setXsp(goodRep.getXsp());
					goodRepWater.setRepNum(goodRep.getRepNum());
					goodRepWater.setRepUptDate(goodRep.getRepUptdate());
					goodRepWater.setRepUptEmpid(goodRep.getRepEmpid());

					goodRepWater.setWaterType("2");

					goodRepWaterService.saveRepWater(goodRepWater);

				}
			}

			goodRepService.delRep(repIds);

			map.put("rtn", "success");
		} catch (Exception e) {
			map.put("rtn", "fail");
		}
		return map;
	}

	@RequestMapping(value = "/getGoodRep")
	@ResponseBody
	public Map<String, Object> getGoodRep(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String repId = request.getParameter("repId");

		GoodRep goodRep = new GoodRep();
		goodRep.setRepId(Long.parseLong(repId));

		try {
			goodRep = goodRepService.getGoodRepWithMeter(goodRep);

			if (goodRep != null) {
				Meter meter = new Meter();
				meter.setMeterId(goodRep.getMeterId());
				meter = meterService.getMeter(meter);

				if (meter != null) {
					SelectJson selectJson = new SelectJson();
					selectJson.setId(String.valueOf(meter.getMeterId()));
					selectJson.setText(meter.getMeterName());
					map.put("selectJson", selectJson);
				}

				map.put("rtn", "success");
				map.put("goodRep", goodRep);
			}

		} catch (Exception e) {
			map.put("rtn", "fail");
		}

		return map;
	}

	@RequestMapping(value = "/uptGoodRep")
	@ResponseBody
	public Map<String, Object> uptGoodRep(HttpServletRequest request) {

		Session session = SecurityUtils.getSubject().getSession();
		UserSession userSession = (UserSession) session.getAttribute("userSession");

		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateStr = dateFormat.format(date);

		Map<String, Object> map = new HashMap<String, Object>();
		Long infoId = Long.valueOf(request.getParameter("infoId"));
		Long repId = Long.valueOf(request.getParameter("repId"));
		Long pici = Long.valueOf(request.getParameter("pici"));
		Double cbp = Double.valueOf(request.getParameter("cbp"));
		Double pfp = Double.valueOf(request.getParameter("pfp"));
		Double sczdp = Double.valueOf(request.getParameter("sczdp"));
		Double xsp = Double.valueOf(request.getParameter("xsp"));
		Long meterId = Long.valueOf(request.getParameter("meterId"));
		Long repNum = Long.valueOf(request.getParameter("repNum"));

		GoodRep goodRep = new GoodRep();
		goodRep.setRepId(repId);
		goodRep.setInfoId(infoId);
		goodRep.setMeterId(meterId);
		goodRep.setPici(pici);
		goodRep.setCbp(cbp);
		goodRep.setPfp(pfp);
		goodRep.setSczdp(sczdp);
		goodRep.setXsp(xsp);
		goodRep.setRepNum(repNum);

		goodRep.setRepUptdate(dateStr);
		goodRep.setRepEmpid(userSession.getEmpid());

		GoodRepWater goodRepWater = new GoodRepWater();

		goodRepWater.setRepId(goodRep.getRepId());
		goodRepWater.setInfoId(goodRep.getInfoId());
		goodRepWater.setMeterId(goodRep.getMeterId());
		goodRepWater.setPici(goodRep.getPici());
		goodRepWater.setCbp(goodRep.getCbp());
		goodRepWater.setPfp(goodRep.getPfp());
		goodRepWater.setSczdp(goodRep.getSczdp());
		goodRepWater.setXsp(goodRep.getXsp());
		goodRepWater.setRepNum(goodRep.getRepNum());
		goodRepWater.setRepUptDate(goodRep.getRepUptdate());
		goodRepWater.setRepUptEmpid(goodRep.getRepEmpid());

		goodRepWater.setWaterType("1");

		try {
			goodRepService.updateGoodRep(goodRep);
			goodRepWaterService.saveRepWater(goodRepWater);
			map.put("rtn", "success");

		} catch (Exception e) {
			map.put("rtn", "fail");
		}
		return map;
	}
	
	
	
	@RequestMapping(value = "/backGoodRep")
	@ResponseBody
	public Map<String, Object> backGoodRep(HttpServletRequest request) {
		Session session = SecurityUtils.getSubject().getSession();
		UserSession userSession = (UserSession) session.getAttribute("userSession");

		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateStr = dateFormat.format(date);

		Map<String, Object> map = new HashMap<String, Object>();
		Long repId = Long.valueOf(request.getParameter("repId"));
		Long repNum = Long.valueOf(request.getParameter("repNum"));
		Long backNum = Long.valueOf(request.getParameter("backNum"));
		
		GoodRep goodRep = new GoodRep();
		goodRep.setRepId(repId);
		
		goodRep = goodRepService.getGoodRepWithMeter(goodRep);
		
		if(repNum.equals(backNum)){
			//全部退货
			try {
				if(goodRep != null){
					GoodRepWater goodRepWater = new GoodRepWater();

					goodRepWater.setInfoId(goodRep.getInfoId());
					goodRepWater.setMeterId(goodRep.getMeterId());
					goodRepWater.setRepId(goodRep.getRepId());
					goodRepWater.setPici(goodRep.getPici());
					goodRepWater.setCbp(goodRep.getCbp());
					goodRepWater.setPfp(goodRep.getPfp());
					goodRepWater.setSczdp(goodRep.getSczdp());
					goodRepWater.setXsp(goodRep.getXsp());
					goodRepWater.setRepNum(backNum);
					goodRepWater.setRepUptDate(dateStr);
					goodRepWater.setRepUptEmpid(userSession.getEmpid());

					goodRepWater.setWaterType("3");

					goodRepWaterService.saveRepWater(goodRepWater);
					
					goodRepService.delRep(goodRep);

					map.put("rtn", "success");
				}
			} catch (Exception e) {
				map.put("rtn", "fail");
			}
		}else{
			//部分退货
			try {
				GoodRepWater goodRepWater = new GoodRepWater();

				goodRepWater.setInfoId(goodRep.getInfoId());
				goodRepWater.setMeterId(goodRep.getMeterId());
				goodRepWater.setRepId(goodRep.getRepId());
				goodRepWater.setPici(goodRep.getPici());
				goodRepWater.setCbp(goodRep.getCbp());
				goodRepWater.setPfp(goodRep.getPfp());
				goodRepWater.setSczdp(goodRep.getSczdp());
				goodRepWater.setXsp(goodRep.getXsp());
				goodRepWater.setRepNum(backNum);
				goodRepWater.setRepUptDate(dateStr);
				goodRepWater.setRepUptEmpid(userSession.getEmpid());

				goodRepWater.setWaterType("4");

				goodRepWaterService.saveRepWater(goodRepWater);
				
				Long cjnum = repNum-backNum;
				
				goodRep.setRepNum(cjnum);
				goodRepWater.setRepUptDate(dateStr);
				goodRepWater.setRepUptEmpid(userSession.getEmpid());
				
				goodRepService.updateGoodRep(goodRep);
				
				map.put("rtn", "success");
			} catch (Exception e) {
				map.put("rtn", "fail");
			}
			
		}
		
		return map;
	}
}
