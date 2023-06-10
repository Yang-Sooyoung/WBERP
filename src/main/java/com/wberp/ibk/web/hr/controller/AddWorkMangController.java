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
import com.wberp.ibk.web.hr.service.IAddWorkMangService;

@Controller
public class AddWorkMangController {
	@Autowired
	public IAddWorkMangService iAddWorkService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/addWorkMang")
	public ModelAndView addWorkMang(@RequestParam HashMap<String, String> params, 
								 ModelAndView mav) throws Throwable {
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);

		mav.setViewName("hr/addWorkMang");

		return mav;
	}
	
	@RequestMapping(value = "/addWorkMangAjax", 
			method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String addWorkMangAjax(@RequestParam HashMap<String, String> params)
															throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iAddWorkService.getAddWorkCnt(params);
		
		PagingBean pb 
		= iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iAddWorkService.getAddWorkList(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/addWorkDetailContAjax", 
			method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
    @ResponseBody
    public String addWorkDetailContAjax(@RequestParam HashMap<String, String> params)
		   														  throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap <String, Object>();
      
		HashMap<String, String> addwork = iAddWorkService.getAddWorkDetailCont(params);
		modelMap.put("addwork", addwork);
      
		return mapper.writeValueAsString(modelMap);
      
	}
	 
	@RequestMapping(value = "/addWorkAddAjax", 
			method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String addWorkAddAjax(@RequestParam HashMap<String, String> params) 
														   throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
			
		try {
			iAddWorkService.addWorkAdd(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "EXCEPTION");
		}
		return mapper.writeValueAsString(modelMap);
	}
		
	@RequestMapping(value = "/addWorkUpdateAjax", 
			method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String addWorkUpdateAjax(@RequestParam HashMap<String, String> params) 
															  throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iAddWorkService.addWorkUpdate(params);
				
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
		
	@RequestMapping(value = "/addWorkDeleteAjax", 
			method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String addWorkDeleteAjax(@RequestParam HashMap<String, String> params) 
																	   throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
			
		try {
			int cnt = iAddWorkService.addWorkDelete(params);
				
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