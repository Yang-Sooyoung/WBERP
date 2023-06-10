package com.wberp.ibk.web.gw.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wberp.ibk.common.service.IPagingService;
import com.wberp.ibk.web.gw.service.IScheduleService;

@Controller
public class ScheduleController {

	@Autowired
	public IScheduleService iScheduleService;
	
	@Autowired
	public IPagingService iPagingService;
	
	//일정 조회
	@RequestMapping(value="/gwSchDetail")
	public ModelAndView gwSchDetail(@RequestParam HashMap<String,String>params,
		ModelAndView mav)throws Throwable{
		
		mav.setViewName("gw/Schedule/gwSchList");
		
		return mav;
	}
	@ResponseBody
	@RequestMapping(value="/gwScheDetailAjax",method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String gwScheDetailAjax(@RequestParam HashMap<String,String>params)throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		HashMap<String, String> list = iScheduleService.getgwScheDetail(params);

		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	//일정등록
	@RequestMapping(value="/gwSchAdd")
	public ModelAndView gwScheAdd(@RequestParam HashMap<String,String>params, HttpSession session,
			ModelAndView mav)throws Throwable {
		
		params.put("sEmpNo", String.valueOf(session.getAttribute("sEmpNo")));
	
		HashMap<String,String> data = iScheduleService.ScheAdd(params);
		
		mav.addObject("data", data);
	
		mav.setViewName("gw/Schedule/gwSchAdd");
		
		return mav;
	}
		@ResponseBody
		@RequestMapping(value="/gwSchAddAjax",method = RequestMethod.POST,produces ="text/json;charset=UTF-8")
	public String gwSchAddAjax(@RequestParam HashMap<String,String>params)throws Throwable{
			
			ObjectMapper mapper = new ObjectMapper();
			Map<String,Object> modelMap = new HashMap<String,Object>();
			
			try {
				iScheduleService.getgwSchAdd(params);
				if(!params.get("docmatchfilenm").equals("")) {
					iScheduleService.addgwScheAtchFile0(params);
				}
				System.out.println(params);
				modelMap.put("res", "SUCCESS");
			}catch (Exception e) {
				e.printStackTrace();
				modelMap.put("res", "FAILED");
			}
		
			return mapper.writeValueAsString(modelMap);
		}

	@RequestMapping(value="/gwSchUpdate")
	public ModelAndView gwSchUpdate(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		HashMap<String,String> data =iScheduleService.getgwScheDetail(params);
	
		mav.addObject("data",data);

		mav.setViewName("gw/Schedule/gwSchUpdate");
		
	return mav;
	}
	@ResponseBody
	@RequestMapping(value="/gwSchUpdateAjax",method = RequestMethod.POST,produces ="text/json;charset=UTF-8")
	public String gwSchUpdateAjax(@RequestParam HashMap<String,String>params)throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
	
		try {
			
			iScheduleService.gwSchUpdate(params);
		List<HashMap<String, String>> fileList = iScheduleService.getgwScheAtchFileSelect(params);
		 modelMap.put("fileList",fileList);
		int flag =0;
		for(int i =0 ; i<fileList.size(); i++) {
			System.out.println("gwshceno : "+ params.get("gwshceno"));
			System.out.println(fileList.get(i));
			String a = String.valueOf(fileList.get(i).get("SCHE_NO"));
			String b = params.get("gwshceno").toString();
		if(a.equals(b)) {
		System.out.println(fileList.get(i));
			if(params.get("docmatchfilenm").equals("")) {
				iScheduleService.gwSchDelFile(params);
				System.out.println("11111");
				flag=0;
				break;
			}else {
				iScheduleService.gwSchUpdateFile(params);
				System.out.println("22222");
				flag=0;
				break;
			}
		}else {
			 if(params.get("docmatchfilenm").equals("")) {
				 flag=1;
			 }else {
				 flag=2;
			 }
		   }
		}
		if(flag==1) {
			System.out.println("333");
		}else if(flag==2) {
			iScheduleService.addgwScheAtchFile(params);
			System.out.println("4444");
		}
		 System.out.println(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "EXCEPTION");
		}
		
		return mapper.writeValueAsString(modelMap);
		
	}

	//달력
	@RequestMapping(value = "/fullcalendarAjax1", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
	@ResponseBody
	public String fullcalendarAjax(@RequestParam HashMap<String, String> params,
			@RequestParam(value = "gwschesort", required = false) List<Integer> chanData) throws Throwable{
		
		if (chanData != null) {
			String gwschesort = "";

			for (int a : chanData) {
				gwschesort += ","+ a;
			}

			gwschesort = gwschesort.substring(1);

			params.put("gwschesort", gwschesort);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap <String, Object>();
		
		List<HashMap<String, String>> calendar = iScheduleService.getFullcalendar(params);
		
		calendar = toLowerListMapKey(calendar);
		
		modelMap.put("calendar", calendar);
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
// 부서별 일정 표시
	@ResponseBody
	@RequestMapping(value="/workSortAjax",method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String workSortAjax(@RequestParam HashMap<String, String> params)
			throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap <String, Object>();
		List<HashMap<String,String>> worksort = iScheduleService.getgwWorkSort(params);
		modelMap.put("worksort", worksort);
		
		
		return mapper.writeValueAsString(modelMap);	
	}
	public static List<HashMap<String, String>> toLowerListMapKey(List<HashMap<String, String>> oldList) {
		List<HashMap<String, String>> newList = new ArrayList<HashMap<String, String>>();
		
		for(HashMap<String, String> oldMap : oldList) {
			Set<String> keySet = oldMap.keySet();
			
			Iterator<String> keys = keySet.iterator();
			
			HashMap<String, String> newMap = new HashMap<String, String>();
			
			while(keys.hasNext()) {
				String key = keys.next();
				newMap.put(key.toLowerCase(), String.valueOf(oldMap.get(key)));
			}
			
			newList.add(newMap);
		}
		
		return newList;
	}
	@ResponseBody
	@RequestMapping(value="/gwSchDelAjax",method = RequestMethod.POST,produces ="text/json;charset=UTF-8")
		public String gwSchDelAjax(@RequestParam HashMap<String,String>params)throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		 Map<String,Object> modelMap = new HashMap<String,Object>();
		 try {
				int cnt = iScheduleService.getgwSchDelete(params);
				if( cnt > 0 ) {
					modelMap.put("res", "SUCCESS");
				}else {
					modelMap.put("res", "FAILED");
				}
			 } catch (Exception e) {
					e.printStackTrace();
					modelMap.put("res", "EXCEPTION");
				}
		 
		 
		 
		 return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	
}
