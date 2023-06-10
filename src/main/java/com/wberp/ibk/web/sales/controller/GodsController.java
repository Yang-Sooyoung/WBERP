package com.wberp.ibk.web.sales.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.wberp.ibk.web.sales.service.IGodsService;
@Controller
public class GodsController {
	@Autowired
	 public IGodsService iGodsService;
	
	 @Autowired
	 public IPagingService iPagingService;
	 
		@RequestMapping(value = "/godsCheck")
		public ModelAndView godsCheck(@RequestParam HashMap<String, String> params,
									ModelAndView mav) {
			int page = 1;
			
			if(params.get("page") != null) {
				page = Integer.parseInt(params.get("page"));
			}
			
			mav.addObject("page", page);
			
			mav.setViewName("sales/gods/godsCheck");
			
			return mav;
		}
		
		@RequestMapping(value = "/godsCheckAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" )//포스트 방식으로만 받겠다, 뷰의 정보가 text/json이고, 한글로 받겠다. 
		@ResponseBody
		public String godsCheckAjax(@RequestParam HashMap<String, String> params)
				throws Throwable{
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap <String, Object>();
			
			int cnt = iGodsService.getGodsCnt(params);
			
			PagingBean pb 
			= iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 8, 5);
			
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String, String>> list = iGodsService.getGods(params);
			
			modelMap.put("pb", pb);
			modelMap.put("list", list);
			modelMap.put("cnt", cnt);
			
			return mapper.writeValueAsString(modelMap);
			
		}
		
		@RequestMapping(value = "/godsDetail")
		public ModelAndView godsDetail(HttpSession session, @RequestParam HashMap<String, String> params, 
									 ModelAndView mav) throws Throwable {
			
			mav.setViewName("sales/gods/godsDetail");
			
			return mav;
			
			
		}
		
		@RequestMapping(value = "/godsDetailAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String godsDetailAjax(@RequestParam HashMap<String, String> params)
								throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			HashMap<String, String> data = iGodsService.getGodsDetail(params);
			
			modelMap.put("data", data);
			
			return mapper.writeValueAsString(modelMap);
		}
		@RequestMapping(value="/godsAdd")
		public ModelAndView godsAdd(ModelAndView mav) {
			mav.setViewName("sales/gods/godsAdd");
			return mav;
		}
		@RequestMapping(value="/godsAddAjax", 
				method=RequestMethod.POST, produces="text/json;charset=UTF-8") //method 부터 한글나오게 하는 코드
		@ResponseBody
		public String godsAddAjax(@RequestParam HashMap<String,String>params)throws Throwable{
			
			ObjectMapper mapper=new ObjectMapper();
			
			Map<String,Object> modelMap = new HashMap<String,Object>();
			 
			try {
				iGodsService.godsAdd(params);
				
				modelMap.put("res","SUCCESS"); 
			} catch (Exception e) {
				e.printStackTrace();
				modelMap.put("res","FAILED");
			}
			
			return mapper.writeValueAsString(modelMap);
		}
		
		// 수정 다중테이블의 경우 쿼리 각각 작성하여 DATA1,DATA2, .. 만들어 params 넘기기
		@RequestMapping(value="/godsUpdate")
		public ModelAndView godsUpdate(@RequestParam HashMap<String, String> params, 
				ModelAndView mav) throws Throwable {
			HashMap<String, String> data = iGodsService.getGodsDetail(params);
			
			mav.addObject("data", data);
			mav.setViewName("sales/gods/godsUpdate");
			
			return mav;
		}
		
		@RequestMapping(value="/godsUpdateAjax", 
				method = RequestMethod.POST, produces="text/json;charset=UTF-8") //method 부터 한글나오게 하는 코드
		@ResponseBody
		public String godsUpdateAjax(@RequestParam HashMap<String,String>params)throws Throwable{
			
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			 
			try {
				iGodsService.godsUpdate(params);
				
				modelMap.put("res","SUCCESS"); 
			} catch (Exception e) {
				e.printStackTrace();
				modelMap.put("res","FAILED");
			}
			
			return mapper.writeValueAsString(modelMap);
		}
		
	
		@RequestMapping(value="/godsDeleteAjax", 
				method = RequestMethod.POST, produces="text/json;charset=UTF-8") //method 부터 한글나오게 하는 코드
		@ResponseBody
		public String godsDeleteAjax(@RequestParam HashMap<String,String>params)throws Throwable{
			
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			try {
				iGodsService.godsDelete(params);
				
				modelMap.put("res","SUCCESS"); 
			} catch (Exception e) {
				e.printStackTrace();
				modelMap.put("res","FAILED");
			}
			
			return mapper.writeValueAsString(modelMap);
		}

		@RequestMapping(value = "/godsCond")
		public ModelAndView godsCond(@RequestParam HashMap<String, String> params,
									ModelAndView mav) {
			int page = 1;
			
			if(params.get("page") != null) {
				page = Integer.parseInt(params.get("page"));
			}
			
			mav.addObject("page", page);
			
			mav.setViewName("sales/gods/godsCond");
			
			return mav;
		}
		
		@RequestMapping(value = "/godsCondAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" )//포스트 방식으로만 받겠다, 뷰의 정보가 text/json이고, 한글로 받겠다. 
		@ResponseBody
		public String godsCondAjax(@RequestParam HashMap<String, String> params)
				throws Throwable{
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap <String, Object>();
			
			int cnt = iGodsService.getCotrDayQGodsCnt(params);
			
			PagingBean pb 
			= iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 8, 5);
			
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String, String>> list = iGodsService.getCotrDayQGods(params);
			
			modelMap.put("pb", pb);
			modelMap.put("list", list);
			modelMap.put("cnt", cnt);
			
			return mapper.writeValueAsString(modelMap);
			
		}
		
		
}
