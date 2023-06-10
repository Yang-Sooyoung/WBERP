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
import com.wberp.ibk.web.hr.service.IDeptMangService;

@Controller
public class DeptMangController {
	@Autowired
	public IDeptMangService iDeptMangService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/deptMang")
	public ModelAndView deptMang(@RequestParam HashMap<String, String> params, 
								 ModelAndView mav) throws Throwable {
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);

		mav.setViewName("hr/deptMang");

		return mav;
	}
	
	@RequestMapping(value = "/DeptMangAjax", 
			method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String DeptMangAjax(@RequestParam HashMap<String, String> params)
															throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iDeptMangService.getDeptMangCnt(params);
		
		PagingBean pb 
		= iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iDeptMangService.getDeptMangList(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	 @RequestMapping(value = "/DeptMangDetailContAjax", 
			 method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
	   @ResponseBody
	   public String DeptMangDetailContAjax(@RequestParam HashMap<String, String> params)
			   															throws Throwable{
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap <String, Object>();
	      
	      HashMap<String, String> deptMang = iDeptMangService.getDeptMangDetailCont(params);
	      modelMap.put("deptMang", deptMang);
	      
	      return mapper.writeValueAsString(modelMap);
	      
	   }
	 
	 @RequestMapping(value = "/DeptMangAddAjax", 
			 method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String DeptMangAddAjax(@RequestParam HashMap<String, String> params) 
																	  throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			try {
				iDeptMangService.DeptMangAdd(params);
				
				modelMap.put("res", "SUCCESS");
			} catch (Exception e) {
				e.printStackTrace();
				modelMap.put("res", "EXCEPTION");
			}
			
			return mapper.writeValueAsString(modelMap);
		}
		
		@RequestMapping(value = "/DeptMangUpdateAjax", 
				method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String DeptMangUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();

			try {
				int cnt = iDeptMangService.DeptMangUpdate(params);
				
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
		
		@RequestMapping(value = "/DeptMangDeleteAjax", 
				method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String DeptMangDeleteAjax(@RequestParam HashMap<String, String> params) 
																	   throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			try {
				int cnt = iDeptMangService.DeptMangDelete(params);
				
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