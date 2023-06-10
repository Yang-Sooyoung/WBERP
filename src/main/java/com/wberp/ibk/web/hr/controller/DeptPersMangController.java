package com.wberp.ibk.web.hr.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wberp.ibk.common.bean.PagingBean;
import com.wberp.ibk.common.service.IPagingService;
import com.wberp.ibk.web.hr.service.IDeptPersMangService;

@Controller
public class DeptPersMangController {
	@Autowired
	public IDeptPersMangService iDeptPersMangService;

	@Autowired
	public IPagingService iPagingService;

	@RequestMapping(value = "/deptPersMang")
	public ModelAndView deptPersMang(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}

		mav.addObject("page", page);

		mav.setViewName("hr/deptPersMang");

		return mav;
	}

	@RequestMapping(value = "/getCorpListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getCorpListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> list = iDeptPersMangService.getCorpList(params);

		list = toLower(list);

		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}

	public static List<HashMap<String, String>> toLower(List<HashMap<String, String>> oldList) {
		List<HashMap<String, String>> newList = new ArrayList<HashMap<String, String>>();

		for (HashMap<String, String> oldMap : oldList) {
			Set<String> keySet = oldMap.keySet();

			Iterator<String> keys = keySet.iterator();

			HashMap<String, String> newMap = new HashMap<String, String>();

			while (keys.hasNext()) {
				String key = keys.next();
				newMap.put(key.toLowerCase(), String.valueOf(oldMap.get(key)));
			}

			newList.add(newMap);
		}

		return newList;
	}

	@RequestMapping(value = "/deptPersMangAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String deptPersMangAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iDeptPersMangService.getDeptPersMangCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iDeptPersMangService.getDeptPersMangList(params);

		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/deptPersMangDetailContAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String deptPersMangDetailContAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		HashMap<String, String> deptPersMang = iDeptPersMangService.getDeptPersMangDetailCont(params);
		modelMap.put("deptPersMang", deptPersMang);

		return mapper.writeValueAsString(modelMap);

	}
}