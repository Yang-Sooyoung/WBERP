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
import com.wberp.ibk.web.hr.service.IAtedCodeMangService;

@Controller
public class AtedCodeMangController {
	@Autowired
	public IAtedCodeMangService iAtedCodeService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/atedCodeMang")
	public ModelAndView atedCodeMang(@RequestParam HashMap<String, String> params, 
								 ModelAndView mav) throws Throwable {
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);

		mav.setViewName("hr/atedCodeMang");

		return mav;
	}
	
	@RequestMapping(value = "/atedCodeMangAjax", 
			method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String atedCodeMangAjax(@RequestParam HashMap<String, String> params)
															throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iAtedCodeService.getAtedCodeCnt(params);
		
		PagingBean pb 
		= iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iAtedCodeService.getAtedCodeList(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	 @RequestMapping(value = "/atedCodeDetailContAjax", 
			 method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
	   @ResponseBody
	   public String atedCodeDetailContAjax(@RequestParam HashMap<String, String> params)
			   															throws Throwable{
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap <String, Object>();
	      
	      HashMap<String, String> atedcode = iAtedCodeService.getAtedCodeDetailCont(params);
	      modelMap.put("atedcode", atedcode);
	      
	      return mapper.writeValueAsString(modelMap);
	      
	   }
	 
	 @RequestMapping(value = "/atedCodeAddAjax", 
			 method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String atedCodeAddAjax(@RequestParam HashMap<String, String> params) 
																	  throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			try {
				iAtedCodeService.atedCodeAdd(params);
				
				modelMap.put("res", "SUCCESS");
			} catch (Exception e) {
				e.printStackTrace();
				modelMap.put("res", "EXCEPTION");
			}
			
			return mapper.writeValueAsString(modelMap);
		}
		
		@RequestMapping(value = "/atedCodeUpdateAjax", 
				method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String atedCodeUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();

			try {
				int cnt = iAtedCodeService.atedCodeUpdate(params);
				
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
		
		@RequestMapping(value = "/atedCodeDeleteAjax", 
				method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String atedCodeDeleteAjax(@RequestParam HashMap<String, String> params) 
																	   throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			try {
				int cnt = iAtedCodeService.atedCodeDelete(params);
				
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