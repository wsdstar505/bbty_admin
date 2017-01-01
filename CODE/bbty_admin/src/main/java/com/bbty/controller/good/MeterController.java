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

import com.bbty.pojo.good.Meter;
import com.bbty.service.inf.good.MeterService;

/**
 * 计量单位配置控制器
 * 
 * @author 翁仕达
 *
 */
@Controller
@RequestMapping(value = "/meter")
public class MeterController {

	@Autowired
	public MeterService meterService;

	/**
	 * 查询计量单位配置列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getMeterList")
	@ResponseBody
	public Map<String, Object> getMeterList() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Meter> meters = meterService.getMeterList();
		map.put("data", meters);
		return map;
	}

	@RequestMapping(value = "/checkMeterCode")
	@ResponseBody
	public Map<String, Object> checkMeterCode(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String meterCode = request.getParameter("meterCode");

		Meter meter = new Meter();
		meter.setMeterCode(meterCode);
		try {
			meter = meterService.getMeterByMeterCode(meter);
			if (meter != null) {
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
	
	// 新增计量单位
	@RequestMapping(value = "/saveMeter")
	@ResponseBody
	public Map<String, Object> saveMeter(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String meterCode = request.getParameter("meterCode");

		String meterName = request.getParameter("meterName");

		Meter meter = new Meter();
		meter.setMeterCode(meterCode);
		meter.setMeterName(meterName);

		try {
			meterService.saveMeter(meter);
			map.put("rtn", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("rtn", "fail");
		}

		return map;
	}
	
	@RequestMapping(value = "/getMeterByMeterCode")
	@ResponseBody
	public Map<String, Object> getMeterByMeterCode(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String meterCode = request.getParameter("meterCode");

		Meter meter = new Meter();
		meter.setMeterCode(meterCode);

		try {
			meter = meterService.getMeterByMeterCode(meter);
			if (meter != null) {
				map.put("rtn", "success");
				map.put("meter", meter);
			}

		} catch (Exception e) {
			map.put("rtn", "fail");
		}

		return map;
	}
	
	// 修改计量单位
	@RequestMapping(value = "/uptMeter")
	@ResponseBody
	public Map<String, Object> uptMeter(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		String meterId = request.getParameter("meterId");
		String meterCode = request.getParameter("meterCode");

		String meterName = request.getParameter("meterName");

		
		Meter meter = new Meter();
		meter.setMeterId(Long.parseLong(meterId));
		meter.setMeterCode(meterCode);
		meter.setMeterName(meterName);

		try {
			meterService.uptMeterBySelective(meter);
			map.put("rtn", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("rtn", "fail");
		}

		return map;
	}
	
		@RequestMapping(value = "/delMeter")
		@ResponseBody
		public Map<String, Object> delMeter(@RequestBody String[] meterCodes) {
			Map<String, Object> map = new HashMap<String, Object>();
			try {
				meterService.delMeter(meterCodes);
				map.put("rtn", "success");
			} catch (Exception e) {
				map.put("rtn", "fail");
			}
			return map;
		}

}
