		package com.wberp.ibk.web.gw.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.wberp.ibk.web.gw.service.IDocService;

@Controller
public class DocController {
	@Autowired
	public IDocService iDocService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/gwDoc")
	public ModelAndView docList(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		int page = 1;
		
		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);

		mav.setViewName("gw/doc/gwDoc");
		
		return mav;
	}
	
	@RequestMapping(value = "docListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String docListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iDocService.getDocCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iDocService.getDoc(params);

		modelMap.put("pb", pb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/gwDocDetail")
	public ModelAndView docDetail(@RequestParam HashMap<String, String> params,
					ModelAndView mav) throws Throwable {
		iDocService.updateDocHit(params);
		
		HashMap<String, String> doc = iDocService.docDetail(params);
		
		mav.addObject("doc", doc);
		
		mav.setViewName("gw/doc/gwDocDetail");
		
		return mav;
	}
	
	@RequestMapping(value = "/gwDocAdd")
	public ModelAndView docAdd(@RequestParam HashMap<String, String> params,
					ModelAndView mav) {
		
		mav.setViewName("gw/doc/gwDocAdd");
		
		return mav;
	}
	
	@RequestMapping(value = "/docAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String docAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iDocService.docAdd(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/gwDocUpdate")
	public ModelAndView docUpdate(@RequestParam HashMap<String, String> params,
				ModelAndView mav) throws Throwable {
		iDocService.updateDocHit(params);
		
		HashMap<String, String> doc = iDocService.docDetail(params);
		
		mav.addObject("doc", doc);
		
		mav.setViewName("gw/doc/gwDocUpdate");
		
		return mav;
	}
	
	@RequestMapping(value = "/docUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String docUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iDocService.docUpdate(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/docDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String docDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iDocService.docDelete(params);
			if(cnt > 0) {
				modelMap.put("res", "SUCCESS");
			} else {
				modelMap.put("res", "FAILED");
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "EXCEPTION");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "docFavAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String docFavAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iDocService.getFavCnt(params);
		
		PagingBean favPb = iPagingService.getPagingBean(Integer.parseInt(params.get("favPage")), cnt, 10, 5);
		
		params.put("startCnt", Integer.toString(favPb.getStartCount()));
		params.put("endCnt", Integer.toString(favPb.getEndCount()));
		
		List<HashMap<String, String>> list = iDocService.getFavDoc(params);
		
		modelMap.put("favPb", favPb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "favImgAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String favImgAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iDocService.favUpdate(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/favDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String favDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iDocService.favDelete(params);
			if(cnt > 0) {
				modelMap.put("res", "SUCCESS");
			} else {
				modelMap.put("res", "FAILED");
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "EXCEPTION");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
