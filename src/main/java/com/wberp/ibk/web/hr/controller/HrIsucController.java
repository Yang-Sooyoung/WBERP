package com.wberp.ibk.web.hr.controller;

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
import com.wberp.ibk.web.hr.service.IHrIsucService;

@Controller
public class HrIsucController {
	@Autowired
	public IHrIsucService iHrIsucService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/hrIsuc")
	public ModelAndView hrIsuc(@RequestParam HashMap<String, String> params, 
								 ModelAndView mav) throws Throwable {
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);

		mav.setViewName("hr/hrIsuc");

		return mav;
	}
	
	@RequestMapping(value = "/hrIsucAjax", 
			method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String hrIsucAjax(@RequestParam HashMap<String, String> params)
															throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iHrIsucService.gethrIsucCnt(params);
		
		PagingBean pb 
		= iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iHrIsucService.gethrIsucList(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	 @RequestMapping(value = "/hrIsucDetailContAjax", 
			 method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
	   @ResponseBody
	   public String hrIsucDetailContAjax(@RequestParam HashMap<String, String> params)
			   															throws Throwable{
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap <String, Object>();
	      
	      HashMap<String, String> hrIsuc = iHrIsucService.gethrIsucDetailCont(params);
	      modelMap.put("hrIsuc", hrIsuc);
	      
	      return mapper.writeValueAsString(modelMap);
	      
	   }

	}