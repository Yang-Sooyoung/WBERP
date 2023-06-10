package com.wberp.ibk.web.sales.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import com.wberp.ibk.web.sales.service.ISaleScheService;
@Controller
public class SaleScheController {
	@Autowired
	 public ISaleScheService iSaleScheService;
	
	 @Autowired
	 public IPagingService iPagingService;
	 
		@RequestMapping(value = "/saleScheMang")
		public ModelAndView saleScheMang(@RequestParam HashMap<String, String> params,
									ModelAndView mav) {
			int page = 1;
			
			if(params.get("page") != null) {
				page = Integer.parseInt(params.get("page"));
			}
			
			mav.addObject("page", page);
			
			mav.setViewName("sales/salesche/saleScheMang");
			
			return mav;
		}
		
		@RequestMapping(value = "/saleScheMangAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" )//포스트 방식으로만 받겠다, 뷰의 정보가 text/json이고, 한글로 받겠다. 
		@ResponseBody
		public String saleScheMangAjax(@RequestParam HashMap<String, String> params)
				throws Throwable{
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap <String, Object>();
			
			int cnt = iSaleScheService.getSaleScheMangCnt(params);
			
			PagingBean pb 
			= iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
			
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String, String>> list = iSaleScheService.getSaleScheMang(params);
			
			modelMap.put("pb", pb);
			modelMap.put("list", list);
			modelMap.put("cnt", cnt);
			System.out.println(params);
			return mapper.writeValueAsString(modelMap);
			
		}
		
		@RequestMapping(value = "/saleScheDetailAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
		@ResponseBody
		public String saleScheDetailAjax(@RequestParam HashMap<String, String> params)
				throws Throwable{
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap <String, Object>();
			
			
			HashMap<String, String> data = iSaleScheService.getSaleScheDetail(params);
			
			modelMap.put("data", data);
			
			return mapper.writeValueAsString(modelMap);
			
		}
		
		@RequestMapping(value = "/saleScheMapAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
		@ResponseBody
		public String saleScheMapAjax(@RequestParam HashMap<String, String> params)
				throws Throwable{
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap <String, Object>();
			
			
			HashMap<String, String> data = iSaleScheService.getSaleScheDetail(params);
			
			modelMap.put("data", data);
			
			return mapper.writeValueAsString(modelMap);
			
		}
		
		@RequestMapping(value="/saleScheMangAdd")
		public ModelAndView saleScheMangAdd(@RequestParam HashMap<String, String> params,
				ModelAndView mav) throws Throwable{
			
			
			HashMap<String, String> data = iSaleScheService.getSaleScheAdd(params);
			
			mav.addObject("data", data);
			
			int searchPage = 1;
			int search2Page = 1;
			int search3Page = 1;
			
			if(params.get("searchPage") != null) {
				searchPage = Integer.parseInt(params.get("searchPage"));
			}
			
			if(params.get("search2Page") != null) {
				search2Page = Integer.parseInt(params.get("search2Page"));
			}
			
			if(params.get("search3Page") != null) {
				search3Page = Integer.parseInt(params.get("search3Page"));
			}
			
			mav.addObject("searchPage", searchPage);
			mav.addObject("search2Page", search2Page);			
			mav.addObject("search3Page", search3Page);
			mav.setViewName("sales/salesche/saleScheMangAdd");
			return mav;
		}
		
		@RequestMapping(value = "/saleScheMangAddAjax",
				method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String saleScheMangAddAjax( @RequestParam HashMap<String, String> params)
			throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap <String, Object>();
		
		
		try {
			
			
			String scheno = iSaleScheService.getScheNo();
			params.put("scheno",scheno);
			String salescheno = iSaleScheService.getSaleSchecheNo();
			params.put("salescheno",salescheno);
			iSaleScheService.addScheMang(params);
			iSaleScheService.addSaleScheMang(params);
			if(!params.get("atchfilenm").equals("")) {
				String salescheatchfileno = iSaleScheService.getSaleScheAtchFile();
				params.put("salescheatchfileno",salescheatchfileno);
				iSaleScheService.addSaleScheAtchFileScheMang(params);				
			}
			System.out.println(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
		}
		
		
		@RequestMapping(value = "/saleScheAddSearchAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
		@ResponseBody
		public String saleScheAddSearchAjax(@RequestParam HashMap<String, String> params)
				throws Throwable{
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap <String, Object>();
			
			
			
			
			int cnt = iSaleScheService.getSaleScheAddSearchCustCompCnt(params);
			
			PagingBean pb 
			= iPagingService.getPagingBean(Integer.parseInt(params.get("searchPage")), cnt, 8, 3);
			
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String, String>> list1 = iSaleScheService.getSaleScheAddSearchCustComp(params);
			
			modelMap.put("pb", pb);
			modelMap.put("list1", list1);
			modelMap.put("cnt", cnt);
			
			System.out.println(params);
			
			return mapper.writeValueAsString(modelMap);
		}
		
		@RequestMapping(value = "/saleScheAddSearch2Ajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
		@ResponseBody
		public String saleScheAddSearch2Ajax(@RequestParam HashMap<String, String> params)
				throws Throwable{
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap <String, Object>();
			
			
			int cnt = iSaleScheService.getSaleScheAddSearchInsdCustCnt(params);
			
			PagingBean pb 
			= iPagingService.getPagingBean(Integer.parseInt(params.get("search2Page")), cnt, 8, 3);
			
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String, String>> list2 = iSaleScheService.getSaleScheAddSearchInsdCust(params);
			
			modelMap.put("pb", pb);
			modelMap.put("list2", list2);
			modelMap.put("cnt", cnt);
			
			System.out.println(params);
			
			return mapper.writeValueAsString(modelMap);
		}
		
		@RequestMapping(value = "/saleScheAddSearch3Ajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
		@ResponseBody
		public String saleScheAddSearch3Ajax(@RequestParam HashMap<String, String> params)
				throws Throwable{
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap <String, Object>();
			
			
			int cnt = iSaleScheService.getSaleScheAddSearchGodsCnt(params);
			
			PagingBean pb 
			= iPagingService.getPagingBean(Integer.parseInt(params.get("search3Page")), cnt, 8, 3);
			
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String, String>> list3 = iSaleScheService.getSaleScheAddSearchGods(params);
			
			modelMap.put("pb", pb);
			modelMap.put("list3", list3);
			modelMap.put("cnt", cnt);
			
			System.out.println(params);
			
			return mapper.writeValueAsString(modelMap);
		}
		
		@RequestMapping(value = "/fullcalendarAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
		@ResponseBody
		public String fullcalendarAjax(@RequestParam HashMap<String, String> params)
				throws Throwable{
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap <String, Object>();
			
			List<HashMap<String, String>> calendar = iSaleScheService.getFullcalendar(params);
			
			calendar = toLowerListMapKey(calendar);
			
			modelMap.put("calendar", calendar);
			
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
		
		@RequestMapping(value = "/saleScheDeleteAjax",
				method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String saleScheDeleteAjax(@RequestParam HashMap<String, String> params
				) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap <String, Object>();
			
			try {
				int cnt = iSaleScheService.deleteSaleSche(params);
				if(cnt > 0) {
					modelMap.put("res", "SUCCESS");
				} else {
					modelMap.put("res", "FAILED");
				}
			} catch (Exception e) {
				e.printStackTrace();
				modelMap.put("res", "EXCEPTION");
			}
			
			return  mapper.writeValueAsString(modelMap);
		}
		
		@RequestMapping(value = "/saleScheMangUpdate")
		public ModelAndView aBoardUpdate(@RequestParam HashMap<String, String> params,
				ModelAndView mav) throws Throwable {
			
			HashMap<String, String> data = iSaleScheService.getSaleScheDetail(params);
			
			mav.addObject("data", data);
			
			int search2Page = 1;
			int search3Page = 1;
			
			if(params.get("search2Page") != null) {
				search2Page = Integer.parseInt(params.get("search2Page"));
			}
			
			if(params.get("search3Page") != null) {
				search3Page = Integer.parseInt(params.get("search3Page"));
			}
			
			mav.addObject("search2Page", search2Page);			
			mav.addObject("search3Page", search3Page);
			mav.setViewName("sales/salesche/saleScheMangUpdate");
			
			return mav;
		}
		
		
		@RequestMapping(value = "/saleScheUpdateAjax",
				method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String saleScheUpdateAjax(@RequestParam HashMap<String, String> params
				) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap <String, Object>();
			
			try {
				
				
				iSaleScheService.updateSaleSche(params);
				iSaleScheService.updateScheMang(params);
				List<HashMap<String, String>> fileList = iSaleScheService.getSaleScheAtchFileSelect(params);
				modelMap.put("fileList", fileList);
				int flag = 0;
				for(int i = 0 ; i<fileList.size(); i++) {
					System.out.println("salescheno : " + params.get("salescheno"));
					System.out.println(fileList.get(i));
					String a = String.valueOf(fileList.get(i).get("SALE_SCHE_NO"));
					String b = params.get("salescheno").toString();
					if(a.equals(b)) {
						System.out.println(fileList.get(i));
						if(params.get("atchfilenm").equals("")) {
							iSaleScheService.deleteSaleScheAtchFileScheMang(params);
							System.out.println("11111");
							flag=0;
							break;
						}else {
							iSaleScheService.updateSaleScheAtchFileScheMang(params);	
							System.out.println("22222");
							flag=0;
							break;
						}
					}else {
						if(params.get("atchfilenm").equals("")) {
							flag=1;
						}else {
							flag=2;
						}
					}
				}
				if(flag==1) {
					System.out.println("333");
				}else if(flag==2){
					String salescheatchfileno = iSaleScheService.getSaleScheAtchFile();
					params.put("salescheatchfileno",salescheatchfileno);
					iSaleScheService.addSaleScheAtchFileScheMang(params);
					System.out.println("444");
				}
				
			
				System.out.println(params);
				modelMap.put("res", "SUCCESS");
			} catch (Exception e) {
				e.printStackTrace();
				modelMap.put("res", "EXCEPTION");
			}
			
			return mapper.writeValueAsString(modelMap);
		}
		
		@RequestMapping(value = "/saleScheUpdateSearch2Ajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
		@ResponseBody
		public String saleScheUpdateSearch2Ajax(@RequestParam HashMap<String, String> params)
				throws Throwable{
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap <String, Object>();
			
			
			int cnt = iSaleScheService.getSaleScheAddSearchInsdCustCnt(params);
			
			PagingBean pb 
			= iPagingService.getPagingBean(Integer.parseInt(params.get("search2Page")), cnt, 8, 3);
			
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String, String>> list2 = iSaleScheService.getSaleScheAddSearchInsdCust(params);
			
			modelMap.put("pb", pb);
			modelMap.put("list2", list2);
			modelMap.put("cnt", cnt);
			
			System.out.println(params);
			
			return mapper.writeValueAsString(modelMap);
		}
		
		@RequestMapping(value = "/saleScheUpdateSearch3Ajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
		@ResponseBody
		public String saleScheUpdateSearch3Ajax(@RequestParam HashMap<String, String> params)
				throws Throwable{
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap <String, Object>();
			
			
			int cnt = iSaleScheService.getSaleScheAddSearchGodsCnt(params);
			
			PagingBean pb 
			= iPagingService.getPagingBean(Integer.parseInt(params.get("search3Page")), cnt, 8, 3);
			
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String, String>> list3 = iSaleScheService.getSaleScheAddSearchGods(params);
			
			modelMap.put("pb", pb);
			modelMap.put("list3", list3);
			modelMap.put("cnt", cnt);
			
			System.out.println(params);
			
			return mapper.writeValueAsString(modelMap);
		}
}
