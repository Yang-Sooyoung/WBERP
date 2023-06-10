package com.wberp.ibk.web.eis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wberp.ibk.web.common.service.ICommonService;
import com.wberp.ibk.web.eis.service.IChartService;
import com.wberp.ibk.web.eis.service.IDashboardService;
import com.wberp.ibk.web.eis.service.IattchListService;
import com.wberp.ibk.common.bean.PagingBean;
import com.wberp.ibk.common.service.IPagingService;

@Controller
public class DashboardController {
	@Autowired
	public IDashboardService iDashboardService;
	
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@Autowired
	public IattchListService iattchListService;
	
	@RequestMapping(value = "/dasb")
	public ModelAndView dasb(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		

		mav.setViewName("eis/dasb");

		return mav;
	}
	
	
	
	@RequestMapping(value ="/dasbListAjax" , method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String dasbListAjax(@RequestParam HashMap<String, String> params) 
						throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();	
		
		
	    
	    
	    List<HashMap<String, String>> list = iDashboardService.getDashboard(params);
	    
		
		modelMap.put("list", list);
		
		

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value ="/dasbChartAjax" , method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String dasbChartAjax(@RequestParam HashMap<String, String> params) 
						throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		
		
	    List<HashMap<String, String>> clist = iDashboardService.getChartDrawList(params);
	    

		modelMap.put("clist", clist);
		
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/chartAjax",  method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String chartAjax(@RequestParam HashMap<String, String> params,ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		int cnt = iDashboardService.getChartDrawCnt(params);
		
		if ( cnt == 1 ) {
			List<HashMap<String, Object>> query1 = iattchListService.getQuery1(params);
			modelMap.put("query1", query1);
			
		} else if ( cnt == 2 ) {
			List<HashMap<String, Object>> query1 = iattchListService.getQuery1(params);
			List<HashMap<String, Object>> query2 = iattchListService.getQuery2(params);
			modelMap.put("query1", query1);
			modelMap.put("query2", query2);
			
		} else if ( cnt == 3 ) {
			List<HashMap<String, Object>> query1 = iattchListService.getQuery1(params);
			List<HashMap<String, Object>> query2 = iattchListService.getQuery2(params);
			List<HashMap<String, Object>> query3 = iattchListService.getQuery3(params);
			modelMap.put("query1", query1);
			modelMap.put("query2", query2);
			modelMap.put("query3", query3);
			
		} else if ( cnt == 4 ) {
			List<HashMap<String, Object>> query1 = iattchListService.getQuery1(params);
			List<HashMap<String, Object>> query2 = iattchListService.getQuery2(params);
			List<HashMap<String, Object>> query3 = iattchListService.getQuery3(params);
			List<HashMap<String, Object>> query4 = iattchListService.getQuery4(params);
			modelMap.put("query1", query1);
			modelMap.put("query2", query2);
			modelMap.put("query3", query3);
			modelMap.put("query4", query4);
			
			
		} else if ( cnt == 5 ) {
			List<HashMap<String, Object>> query1 = iattchListService.getQuery1(params);
			List<HashMap<String, Object>> query2 = iattchListService.getQuery2(params);
			List<HashMap<String, Object>> query3 = iattchListService.getQuery3(params);
			List<HashMap<String, Object>> query4 = iattchListService.getQuery4(params);
			List<HashMap<String, Object>> query5 = iattchListService.getQuery5(params);
		
			modelMap.put("query1", query1);
			modelMap.put("query2", query2);
			modelMap.put("query3", query3);
			modelMap.put("query4", query4);
			modelMap.put("query5", query5);
		
		} else if ( cnt == 6 ) {
			List<HashMap<String, Object>> query1 = iattchListService.getQuery1(params);
			List<HashMap<String, Object>> query2 = iattchListService.getQuery2(params);
			List<HashMap<String, Object>> query3 = iattchListService.getQuery3(params);
			List<HashMap<String, Object>> query4 = iattchListService.getQuery4(params);
			List<HashMap<String, Object>> query5 = iattchListService.getQuery5(params);
			List<HashMap<String, Object>> query6 = iattchListService.getQuery6(params);
			modelMap.put("query1", query1);
			modelMap.put("query2", query2);
			modelMap.put("query3", query3);
			modelMap.put("query4", query4);
			modelMap.put("query5", query5);
			modelMap.put("query6", query6);
			
			
		} else if ( cnt == 7 ) {
			List<HashMap<String, Object>> query1 = iattchListService.getQuery1(params);
			List<HashMap<String, Object>> query2 = iattchListService.getQuery2(params);
			List<HashMap<String, Object>> query3 = iattchListService.getQuery3(params);
			List<HashMap<String, Object>> query4 = iattchListService.getQuery4(params);
			List<HashMap<String, Object>> query5 = iattchListService.getQuery5(params);
			List<HashMap<String, Object>> query6 = iattchListService.getQuery6(params);
			List<HashMap<String, Object>> query7 = iattchListService.getQuery7(params);
			modelMap.put("query1", query1);
			modelMap.put("query2", query2);
			modelMap.put("query3", query3);
			modelMap.put("query4", query4);
			modelMap.put("query5", query5);
			modelMap.put("query6", query6);
			modelMap.put("query7", query7);
		
			
		} else if ( cnt == 8 ) {
			List<HashMap<String, Object>> query1 = iattchListService.getQuery1(params);
			List<HashMap<String, Object>> query2 = iattchListService.getQuery2(params);
			List<HashMap<String, Object>> query3 = iattchListService.getQuery3(params);
			List<HashMap<String, Object>> query4 = iattchListService.getQuery4(params);
			List<HashMap<String, Object>> query5 = iattchListService.getQuery5(params);
			List<HashMap<String, Object>> query6 = iattchListService.getQuery6(params);
			List<HashMap<String, Object>> query7 = iattchListService.getQuery7(params);
			List<HashMap<String, Object>> query8 = iattchListService.getQuery8(params);
			
			modelMap.put("query1", query1);
			modelMap.put("query2", query2);
			modelMap.put("query3", query3);
			modelMap.put("query4", query4);
			modelMap.put("query5", query5);
			modelMap.put("query6", query6);
			modelMap.put("query7", query7);
			modelMap.put("query8", query8);
		}
		
		
		
		modelMap.put("cnt", cnt);
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/oneChartAjax",  method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String oneChartAjax(@RequestParam HashMap<String, String> params,ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
	
		
		List<HashMap<String, Object>> Query = iattchListService.getTestQuery(params);
		modelMap.put("Query", Query);
		
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	@RequestMapping(value = "/popChartAjax",  method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String popChartAjax(@RequestParam HashMap<String, String> params,ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, Object>> query = iattchListService.getTestQuery(params);
		
		modelMap.put("query", query);

		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/widgDetailAjax", method = RequestMethod.POST, produces ="text/json;charset=UTF-8")
	@ResponseBody
	public String widgDetailAjax(@RequestParam HashMap<String, String> params)
							throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();

		HashMap<String, String> dlist  = iDashboardService.getWidgDetail(params);
	
		modelMap.put("dlist", dlist);

		return mapper.writeValueAsString(modelMap);
	}
	

	@RequestMapping(value ="/dasbMang")
	public ModelAndView dasbMang(@RequestParam HashMap<String, String> params,
								   ModelAndView mav) {
		int page = 1;
		
		if(params.get("page") != null ) {
			page = Integer.parseInt(params.get("page"));
		} 
		
		mav.addObject("page", page);
		
		mav.setViewName("eis/dasbMang");
		
		return mav;
	}
	
	
	
	@RequestMapping(value ="/dasbMangListAjax" , method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String dasbMangListAjax(@RequestParam HashMap<String, String> params) 
						throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();	
		
		int cnt = iDashboardService.getDashboardCnt(params);
		
		PagingBean pb 
		= iPagingService.getPagingBean(Integer.parseInt(params.get("page")),cnt,10,5);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
	    params.put("endCnt", Integer.toString(pb.getEndCount()));
	    
	    
		List<HashMap<String, String>> list = iDashboardService.getDashboardList(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/dasbAdd")
	public ModelAndView dasbAdd(ModelAndView mav) {
		
		mav.setViewName("eis/dasbAdd");
		
		return mav;
	}
	
	
	

	@RequestMapping(value = "/dasbAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String dasbAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		


		try {
			iDashboardService.addDashboard(params);

			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/dasbDetail")
	public ModelAndView dasbDetail(@RequestParam HashMap<String, String> params,
									 ModelAndView mav) throws Throwable{
		
		int page = 1;
		
		if(params.get("page") != null ) {
			page = Integer.parseInt(params.get("page"));
		} 
		
		
		HashMap<String, String> list = iDashboardService.getDashboardDetail(params);
		
		
		mav.addObject("list", list);
		mav.addObject("page", page);
		mav.setViewName("eis/dasbDetail");
		
		return mav;
	}
	
	
	
	
	
	@RequestMapping(value = "/dasbUpdate")
	public ModelAndView dasbUpdate(@RequestParam HashMap<String, String> params,
									ModelAndView mav) throws Throwable {
	
				
		
		HashMap<String, String> list = iDashboardService.getDashboardDetail(params);
		
		mav.addObject("list", list);
		
		mav.setViewName("eis/dasbUpdate");
				
		return mav;
	}
	
	@RequestMapping(value = "/dasbUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String dasbUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iDashboardService.dasbUpdate(params);
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
	
	@RequestMapping(value = "/dasbDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String dasbDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iDashboardService.deleteDasb(params);
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
	
	@RequestMapping(value ="/widgListAjax" , method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String widgListAjax(@RequestParam HashMap<String, String> params) 
						throws Throwable {
		
		
		ObjectMapper mapper = new ObjectMapper();
		
		
		Map<String, Object> modelMap = new HashMap<String, Object>();	
		
		int cnt = iDashboardService.getWidgCnt(params);
		
		PagingBean pb 
		= iPagingService.getPagingBean(Integer.parseInt(params.get("page")),cnt,10,5);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
	    params.put("endCnt", Integer.toString(pb.getEndCount()));
	    
	    
		List<HashMap<String, String>> widg = iDashboardService.getWidg(params);
		
		modelMap.put("pb", pb);
		modelMap.put("widg", widg);
		modelMap.put("cnt", cnt);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/widgAdd")
	public ModelAndView widgAdd(ModelAndView mav) {
		
		mav.setViewName("eis/widgAdd");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/attSelecAjax", method = RequestMethod.POST, produces ="text/json;charset=UTF-8")
	@ResponseBody
	public String attSelecAjax(@RequestParam HashMap<String, String> params)
							throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
	
		
		
		
		List<HashMap<String, String>> list = iattchListService.getAttSelecList(params);
		
		
		
		
		modelMap.put("list", list);
	
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/checkOrderAjax", method = RequestMethod.POST, produces ="text/json;charset=UTF-8")
	@ResponseBody
	public String checkOrderAjax(@RequestParam HashMap<String, String> params)
							throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
	
		
		
		
		List<HashMap<String, String>> chclist = iDashboardService.checkOrder(params);
		
		
		
		
		modelMap.put("chclist", chclist);
	
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/attSelecDetailAjax", method = RequestMethod.POST, produces ="text/json;charset=UTF-8")
	@ResponseBody
	public String attSelecDetailAjax(@RequestParam HashMap<String, String> params)
							throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();

		HashMap<String, String> alist  = iattchListService.getAttSelecDetailList(params);
	
		modelMap.put("alist", alist);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/widgAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String widgAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		


		try {
			iDashboardService.addWidg(params);
			


			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/updateOrderAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String updateOrderAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> check = iDashboardService.checkOrder(params);
		modelMap.put("check", check);
		
		try {
			
			int cnt = iDashboardService.updateOrder(params);
			
			
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
	
	
	@RequestMapping(value = "/widgDetail")
	public ModelAndView widgDetail(@RequestParam HashMap<String, String> params,
									 ModelAndView mav) throws Throwable{
		
		int page = 1;
		
		if(params.get("page") != null ) {
			page = Integer.parseInt(params.get("page"));
		} 
		
		
		HashMap<String, String> list = iDashboardService.getWidgDetail(params);
		
		
		mav.addObject("list", list);
		mav.addObject("page", page);
		mav.setViewName("eis/widgDetail");
		
		return mav;
	}
	
	@RequestMapping(value = "/widgUpdate")
	public ModelAndView widgUpdate(@RequestParam HashMap<String, String> params,
									ModelAndView mav) throws Throwable {
	
				
		
		HashMap<String, String> list = iDashboardService.getWidgDetail(params);
		
		mav.addObject("list", list);
		
		mav.setViewName("eis/widgUpdate");
				
		return mav;
	}
	
	@RequestMapping(value = "/widgUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String widgUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iDashboardService.widgUpdate(params);
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
	
	@RequestMapping(value = "/widgDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String widgDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iDashboardService.deleteWidg(params);
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
		
	
	
	@RequestMapping(value = "/widgDelete")
	public ModelAndView widgDelete(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		try {
			int cnt = iDashboardService.deleteWidg(params);

			if (cnt > 0) {
				mav.addObject("res", "success");
			} else {
				mav.addObject("res", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("res", "failed");
		}

		mav.setViewName("eis/widgDelete");

		return mav;
	}
	
	@RequestMapping(value = "/dasbDelete")
	public ModelAndView dasbDelete(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		try {
			int cnt = iDashboardService.deleteDasb(params);

			if (cnt > 0) {
				mav.addObject("res", "success");
			} else {
				mav.addObject("res", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("res", "failed");
		}

		mav.setViewName("eis/dasbDelete");

		return mav;
	}
	
	
	
	
	
	
	
}
