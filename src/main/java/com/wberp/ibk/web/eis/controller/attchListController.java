package com.wberp.ibk.web.eis.controller;

import java.util.ArrayList;
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
import com.wberp.ibk.web.eis.service.IChartService;
import com.wberp.ibk.web.eis.service.IDashboardService;
import com.wberp.ibk.web.eis.service.IattchListService;

@Controller
public class attchListController {
	@Autowired
	public IattchListService iattchListService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@Autowired
	public IChartService iChartService;
	
	@Autowired
	public IDashboardService iDashboardService;

	@RequestMapping(value = "/attchList")
	public ModelAndView attchList(@RequestParam HashMap<String, String> params,
								  ModelAndView mav) throws Throwable{
		
		// 1 메뉴에서 접근 : params = {chatno=, top=5, menuNo=56}
		// 2 상세에서 접근 : params = {top=5, menuNo=56, page=}
		
		int newPage = 1; // 애는 컨트롤러에서 임시로 선언한 변수
		
		if( ( params.get("page") != null ) && ( !"".equals(params.get("page")) ) ) {
			newPage = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", newPage);
		mav.addObject("params", params);
		
		mav.setViewName("eis/attchList");
		
		return mav; 
	}
	
	@RequestMapping(value = "/attchListAjax", method = RequestMethod.POST, produces ="text/json;charset=UTF-8")
	@ResponseBody
	public String attchListAjax(@RequestParam HashMap<String, String> params)
							throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
	
		int cnt = iattchListService.getAttchCnt(params);
		
		PagingBean pb
		= iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 6, 3);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iattchListService.getattchList(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/attchDetail")
	public ModelAndView attchDetail(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		
		// params - 화면에서 던져준 값 : MENU_NO
		
		HashMap<String, String> detail = iattchListService.getattchDetail(params);
		
		mav.addObject("detail", detail);
		System.out.println("asdfasdf");
		mav.setViewName("eis/attchDetail");
		
		return mav; 
	}
	
	@RequestMapping(value = "/attchAdd")
	public ModelAndView attchAdd(ModelAndView mav) {
		
		mav.setViewName("eis/attchAdd");
		
		return mav;
	}
	
	@RequestMapping(value = "/attchAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String attchAddAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String empNo = "";
		
		if ( session == null || session.getAttribute("sEmpNo") == null ) {
			modelMap.put("res", "FAILED");
			return mapper.writeValueAsString(modelMap);
		} else {
			empNo = String.valueOf(session.getAttribute("sEmpNo"));
		}
		
		params.put("EMP_NO", empNo);
		
		try {
			iattchListService.attchAdd(params);
			// {top=5, menuNo=56, page=, attch_NO=, EIS_CATG_NO=3, TITLE=ㄹ3ㄹ23ㄹ2332ㄹ3ㄹ3, INFO=443ㅎ3, ATTCH_QUERY=ㅎ3ㅎ34ㅎ43ㅎ43ㅎ4, ATTCH_TYPE=1,2,3, EMP_NO=10}
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}

	
	@RequestMapping(value = "/attchDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String attchDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iattchListService.attchDelete(params);
			
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
	
	
	@RequestMapping(value = "/attchQueryAjax",  method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String attchQueryAjax(@RequestParam HashMap<String, String> params,
								ModelAndView mav) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, Object>> list = iattchListService.getattchQuery(params);
		
		mav.addObject("detail", params);
		
		int index = 0;
		List<HashMap<String, Object>> newList = new ArrayList<HashMap<String, Object>>();
		List<String> dataTitle = new ArrayList<String>();
		List<String> dataXaxis = new ArrayList<String>();
		List<Integer> dataList = new ArrayList<Integer>();
		for ( HashMap<String, Object> data : list ) {
			
			dataTitle.add(String.valueOf(data.get("NAME")));
			dataList.add(Integer.valueOf(String.valueOf(data.get("DATA"))));
			dataXaxis.add(String.valueOf(data.get("XAXIS")));
			index++;
		}
		
		
		modelMap.put("dataXaxis", dataXaxis); // TXT
		modelMap.put("dataTitle", dataTitle); // NAME
		modelMap.put("dataList", dataList);   // DATA
		modelMap.put("dataName", "카테고리별 장표개수");
		
		String resultMsg = "FALSE";
		if ( list.size() > 0 ) {
			resultMsg = "SUCCESS";
		}
		
		modelMap.put("resultMsg", resultMsg);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/attchUpdate")
	public ModelAndView attchUpdate(@RequestParam HashMap<String, String> params,
									ModelAndView mav) throws Throwable {
				
		HashMap<String, String> resultData = iattchListService.getattchDetail(params);
		
		mav.addObject("data", resultData);
		
		mav.setViewName("eis/attchUpdate");
		
		return mav;
	}
	
	@RequestMapping(value = "/attchUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String attchUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iattchListService.attchUpdate(params);
			
			if(cnt > 0) {
				modelMap.put("res", "SUCCESS");
			}else {
				modelMap.put("res", "FAILED");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			modelMap.put("res", "EXCEPTION");
		}
		
		/* modelMap.put("aaa", maa); */
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/categAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String categAddAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		


		try {
			iattchListService.addEisCate(params);

			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/catgList2Ajax",  method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String catgList2Ajax(@RequestParam HashMap<String, String> params)
							throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int catgCnt = iattchListService.getcatgCnt2(params);
		
		List<HashMap<String, String>> list = iattchListService.getcatgList2(params);
		
		modelMap.put("list", list);
		modelMap.put("catgCnt", catgCnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/catgDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String catgDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iattchListService.catgDelete(params);
			
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
	
	
	
	
	
	
	
	@RequestMapping(value = "/testList")
	public ModelAndView testList(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		

		mav.setViewName("eis/testList");

		return mav;
	}
	
	
	@RequestMapping(value = "/jaehun")
	public ModelAndView jaehun(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		mav.setViewName("eis/jaehun");
		
		return mav;
	}
	
	
}
