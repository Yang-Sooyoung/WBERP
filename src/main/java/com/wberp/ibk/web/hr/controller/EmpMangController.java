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
import com.wberp.ibk.web.hr.service.IEmpMangService;

@Controller
public class EmpMangController {
		@Autowired
		public IEmpMangService iEmpMangService;
		
		@Autowired
		public IPagingService iPagingService;
		
		@RequestMapping(value = "/empMang")
		public ModelAndView empMang(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
			int page = 1;
			
			if (params.get("page") != null) {
				page = Integer.parseInt(params.get("page"));
			}
			mav.addObject("page", page);
			
			mav.setViewName("hr/empMang");
			return mav;
		}
		
		@RequestMapping(value = "/empMangListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String empMangListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

			ObjectMapper mapper = new ObjectMapper();

			Map<String, Object> modelMap = new HashMap<String, Object>();

			int cnt = iEmpMangService.getEmpMangCnt(params);

			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);

			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> list = iEmpMangService.getEmpMang(params);

			modelMap.put("pb", pb);
			modelMap.put("cnt", cnt);
			modelMap.put("list", list);

			return mapper.writeValueAsString(modelMap);
		}
		
		@RequestMapping(value = "/empMangDetail")
		public ModelAndView empMangDetail(@RequestParam HashMap<String, String> params,
				ModelAndView mav) throws Throwable {
			
			HashMap<String, String> empMang = iEmpMangService.getempMangDetail(params);
			
			mav.addObject("empMang",empMang);
			
			mav.setViewName("hr/empMangDetail");
			
			return mav;
		
}
		
		@RequestMapping(value = "/empMangAdd")
		public ModelAndView empMangAdd(@RequestParam HashMap<String, String> params,
						ModelAndView mav) {
			
			mav.setViewName("hr/empMangAdd");
			
			return mav;
		}
		
		@RequestMapping(value = "/EmpMangDeleteAjax" , method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		   @ResponseBody
		   public String EmpMangDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
				try {
					int cnt = iEmpMangService.getEmpMangDelete(params);
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
		
		@RequestMapping(value = "/EmpMangUpdateAjax",
				method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		   @ResponseBody
		   public String EmpMangUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
			
			try {
				int cnt = iEmpMangService.getEmpMangUpdate(params);
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
