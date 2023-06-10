package com.wberp.ibk.web.eis.controller;

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
import com.wberp.ibk.web.eis.service.IreqsListService;

@Controller
public class reqsListController {
	@Autowired
	public IreqsListService ireqsListService;
	
	@Autowired
	public IPagingService iPagingService;
	 
	@RequestMapping(value = "/reqsList")
	public ModelAndView reqsList(@RequestParam HashMap<String, String> params,
								  ModelAndView mav) throws Throwable{
		
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		mav.addObject("page", page);
		
		mav.setViewName("eis/reqsList");
		
		return mav; 
	}
	
	@RequestMapping(value = "/reqsListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String reqsListAjax(@RequestParam HashMap<String, String> params)
							throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		  
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = ireqsListService.getreqsCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = ireqsListService.getreqsList(params);
		
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);
		modelMap.put("pb", pb); 
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/reqsDetail")
	public ModelAndView reqsDetail(@RequestParam HashMap<String, String> params,
									ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = ireqsListService.getreqsDetail(params);
		
		mav.addObject("data", data);
		
		mav.setViewName("eis/reqsDetail");
		
		return mav;
	}
	
	@RequestMapping(value = "/reqsAdd")
	public ModelAndView reqsAdd(ModelAndView mav) {
		
		mav.setViewName("eis/reqsAdd");
		
		return mav;
	}
	
	@RequestMapping(value = "/reqsAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String reqsAddAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			ireqsListService.reqsAdd(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/reqsUpdate")
	public ModelAndView reqsUpdate(@RequestParam HashMap<String, String> params,
									ModelAndView mav) throws Throwable {
				
		HashMap<String, String> data = ireqsListService.getreqsDetail(params);
		
		mav.addObject("data", data);
		
		mav.setViewName("eis/reqsUpdate");
		
		return mav;
	}
	
	@RequestMapping(value = "/reqsUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String reqsUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = ireqsListService.reqsUpdate(params);
			
			if(cnt > 0) {
				modelMap.put("res", "SUCCESS");
			}else {
				modelMap.put("res", "FAILED");
			}
		} catch(Exception e) {
			e.printStackTrace();
			modelMap.put("res", "EXCEPTION");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/catgListAjax",  method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String catgListAjax(@RequestParam HashMap<String, String> params)
							throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int catgCnt = ireqsListService.getcatgCnt(params);
		
		List<HashMap<String, String>> list = ireqsListService.getcatgList(params);
		
		modelMap.put("list", list);
		modelMap.put("catgCnt", catgCnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/reqsDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String reqsDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = ireqsListService.reqsDelete(params);
			
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
	
	@RequestMapping(value = "/proc4UpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String proc4UpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = ireqsListService.proc4Update(params);
			
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
	
	@RequestMapping(value = "/proc1UpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String proc1UpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = ireqsListService.proc1Update(params);
			
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
	
	@RequestMapping(value = "/proc2UpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String proc2UpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = ireqsListService.proc2Update(params);
			
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
	
	@RequestMapping(value = "/refsAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String refsAddAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = ireqsListService.refsAdd(params);
			
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
	
	@RequestMapping(value = "/reqsComtAjax",  method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String reqsComtAjax(@RequestParam HashMap<String, String> params)
							throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int comtCnt = ireqsListService.getreqsComtCnt(params);
		
		PagingBean cpb = iPagingService.getPagingBean(Integer.parseInt(params.get("cpage")), comtCnt, 5, 5);

		params.put("cStartCnt", Integer.toString(cpb.getStartCount()));
		params.put("cEndCnt", Integer.toString(cpb.getEndCount()));
		
		List<HashMap<String, String>> list = ireqsListService.getreqsComt(params);
		
		modelMap.put("cpb", cpb);
		modelMap.put("list", list);
		modelMap.put("comtCnt", comtCnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/comtAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String comtAddAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			ireqsListService.comtAdd(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/comtDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String comtDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = ireqsListService.comtDelete(params);
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
	
	@RequestMapping(value = "/comtUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String comtUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = ireqsListService.comtUpdate(params);
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
