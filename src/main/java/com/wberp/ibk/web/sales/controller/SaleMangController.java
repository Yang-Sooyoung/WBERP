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
import com.wberp.ibk.web.sales.service.ISaleMangService;

@Controller
public class SaleMangController {
	@Autowired
	public ISaleMangService iSaleMangService;
	
	@Autowired
	public IPagingService iPagingService;
	
	//영업 정보 리스트
	@RequestMapping(value = "/saleMang")
	public ModelAndView saleMang(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		mav.setViewName("sales/saleMang/saleMang");
		
		return mav;
	}
	
	@RequestMapping(value = "saleMangAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String saleMangAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iSaleMangService.getSaleMangListCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 15, 5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iSaleMangService.getSaleMangList(params);

		modelMap.put("pb", pb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	
	//영업 정보 상세보기
	@RequestMapping(value = "/saleMangDetail")
	public ModelAndView saleMangDetail(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		HashMap<String, String> sale = iSaleMangService.getSaleMangDetail(params);
		HashMap<String, String> sugs = iSaleMangService.getSugsTabList(params);
		HashMap<String, String> negt = iSaleMangService.getNegtTabList(params);
		HashMap<String, String> cotr = iSaleMangService.getCotrTabList(params);
		
		mav.addObject("sale", sale);
		mav.addObject("sugs", sugs);
		mav.addObject("negt", negt);
		mav.addObject("cotr", cotr);
		
		mav.setViewName("sales/saleMang/saleMangDetail");
		
		System.out.println(params);
		
		return mav;
	}
		
	//영업정보 등록
	@RequestMapping(value="/saleMangAdd")
	public ModelAndView saleMangMangAdd(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{
		
		int searchPage = 1;
		int search2Page = 1;
		
		if(params.get("searchPage") != null) {
			searchPage = Integer.parseInt(params.get("searchPage"));
		}
		
		if(params.get("search2Page") != null) {
			search2Page = Integer.parseInt(params.get("search2Page"));
		}
		
		mav.addObject("searchPage", searchPage);
		mav.addObject("search2Page", search2Page);			
		mav.setViewName("sales/saleMang/saleMangAdd");
		return mav;
	}
	
	@RequestMapping(value ="/saleMangAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String saleMangAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iSaleMangService.saleMangAdd(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		 
		return mapper.writeValueAsString(modelMap);
	}
	
	//영업 등록 - 고객사 검색
	@RequestMapping(value = "/saleMangAddSearchAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
	@ResponseBody
	public String saleMangAddSearchAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap <String, Object>();

		int cnt = iSaleMangService.getSaleMangAddSearchCustCompCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("searchPage")), cnt, 8, 3);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list1 = iSaleMangService.getSaleMangAddSearchCustComp(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list1", list1);
		modelMap.put("cnt", cnt);
		
		System.out.println(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//영업 등록 - 내부고객 검색
	@RequestMapping(value = "/saleMangAddSearch2Ajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
	@ResponseBody
	public String saleMangAddSearch2Ajax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap <String, Object>();
		
		int cnt = iSaleMangService.getSaleMangAddSearchInsdCustCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("search2Page")), cnt, 8, 3);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list2 = iSaleMangService.getSaleMangAddSearchInsdCust(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list2", list2);
		modelMap.put("cnt", cnt);
		
		System.out.println(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//영업정보 수정
	@RequestMapping(value = "/saleMangUpdate")
	public ModelAndView saleMangUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		HashMap<String, String> sale = iSaleMangService.getSaleMangDetail(params);
		
		mav.addObject("sale", sale);
		
		int searchPage = 1;
		int search2Page = 1;
		
		if(params.get("search1Page") != null) {
			searchPage = Integer.parseInt(params.get("searchPage"));
		}
		
		if(params.get("search2Page") != null) {
			search2Page = Integer.parseInt(params.get("search2Page"));
		}
		
		mav.addObject("searchPage", searchPage);
		mav.addObject("search2Page", search2Page);
		mav.setViewName("sales/saleMang/saleMangUpdate");
		
		return mav;
	}
		
	@RequestMapping(value = "/saleMangUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String saleMangUpdateAjax(@RequestParam HashMap<String, String> params ) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iSaleMangService.saleMangUpdate(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res","FAILED");
		}
		
		return  mapper.writeValueAsString(modelMap);
	}
	
	//영업정보 수정 - 고객사 검색
	@RequestMapping(value = "/saleMangUpdateSearchAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
	@ResponseBody
	public String saleMangUpdateSearchAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap <String, Object>();

		int cnt = iSaleMangService.getSaleMangAddSearchCustCompCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("searchPage")), cnt, 8, 3);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list1 = iSaleMangService.getSaleMangAddSearchCustComp(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list1", list1);
		modelMap.put("cnt", cnt);
		
		System.out.println(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//영업정보 수정 - 내부고객 검색
	@RequestMapping(value = "/saleMangUpdateSearch2Ajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
	@ResponseBody
	public String saleMangUpdateSearch2Ajax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap <String, Object>();
		
		
		int cnt = iSaleMangService.getSaleMangAddSearchInsdCustCnt(params);
		
		PagingBean pb 
		= iPagingService.getPagingBean(Integer.parseInt(params.get("search2Page")), cnt, 8, 3);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list2 = iSaleMangService.getSaleMangAddSearchInsdCust(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list2", list2);
		modelMap.put("cnt", cnt);
		
		System.out.println(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//영업 단계별 정보
	
	//영업 단계별 정보 리스트
	@RequestMapping(value = "tabListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String tabListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int sugsCnt = iSaleMangService.getSugsTabCnt(params);
		int negtCnt = iSaleMangService.getNegtTabCnt(params);
		int cotrCnt = iSaleMangService.getCotrTabCnt(params);
		
		modelMap.put("sugsCnt", sugsCnt);
		modelMap.put("negtCnt", negtCnt);
		modelMap.put("cotrCnt", cotrCnt);
		
		HashMap<String, String> sugs = iSaleMangService.getSugsTabList(params);
		HashMap<String, String> negt = iSaleMangService.getNegtTabList(params);
		HashMap<String, String> cotr = iSaleMangService.getCotrTabList(params);
		
		modelMap.put("sugs", sugs);
		modelMap.put("negt", negt);
		modelMap.put("cotr", cotr);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//제안 등록
	@RequestMapping(value ="/sugsAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String sugsAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			String sugsNo = iSaleMangService.getSugsNo();
			params.put("sugsNo",sugsNo);
			
			iSaleMangService.sugsAdd1(params);
			iSaleMangService.sugsAdd2(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//협상 등록
	@RequestMapping(value ="/negtAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String negtAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			String negtNo = iSaleMangService.getNegtNo();
			params.put("negtNo",negtNo);
			
			iSaleMangService.negtAdd1(params);
			iSaleMangService.negtAdd2(params);
			iSaleMangService.negtAdd3(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//계약 등록
	@RequestMapping(value ="/cotrAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cotrAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			String cotrNo = iSaleMangService.getCotrNo();
			params.put("cotrNo",cotrNo);
			
			iSaleMangService.cotrAdd1(params);
			iSaleMangService.cotrAdd2(params);
			iSaleMangService.cotrAdd3(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//제안 정보 등록 - 상품명 검색
	@RequestMapping(value = "/saleMangAddSearch3Ajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
	@ResponseBody
	public String saleMangAddSearch3Ajax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap <String, Object>();
		
		int cnt = iSaleMangService.getSaleMangAddSearchGodsCnt1(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("search3Page")), cnt, 8, 3);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list3 = iSaleMangService.getSaleMangAddSearchGods1(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list3", list3);
		modelMap.put("cnt", cnt);
		
		System.out.println(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//협상 정보 등록 - 상품명 검색
	@RequestMapping(value = "/saleMangAddSearch4Ajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
	@ResponseBody
	public String saleMangAddSearch4Ajax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap <String, Object>();
		
		int cnt = iSaleMangService.getSaleMangAddSearchGodsCnt2(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("search4Page")), cnt, 8, 3);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list3 = iSaleMangService.getSaleMangAddSearchGods2(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list3", list3);
		modelMap.put("cnt", cnt);
		
		System.out.println(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//계약 정보 등록 - 상품명 검색
	@RequestMapping(value = "/saleMangAddSearch5Ajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
	@ResponseBody
	public String saleMangAddSearch5Ajax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap <String, Object>();
		
		int cnt = iSaleMangService.getSaleMangAddSearchGodsCnt3(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("search5Page")), cnt, 8, 3);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list3 = iSaleMangService.getSaleMangAddSearchGods3(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list3", list3);
		modelMap.put("cnt", cnt);
		
		System.out.println(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//영업 단계별 정보 수정
	
	//제안 수정
	@RequestMapping(value="sugsUpdateAjax",method=RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String sugsUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iSaleMangService.sugsUpdate1(params);
			iSaleMangService.sugsUpdate2(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res","FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//협상 수정
	@RequestMapping(value="negtUpdateAjax",method=RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String negtUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iSaleMangService.negtUpdate1(params);
			iSaleMangService.negtUpdate2(params);
			iSaleMangService.negtUpdate3(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res","FAILED");
		}
		
		return  mapper.writeValueAsString(modelMap);
	}
	
	//계약 수정
	@RequestMapping(value="cotrUpdateAjax",method=RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cotrUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iSaleMangService.cotrUpdate1(params);
			iSaleMangService.cotrUpdate2(params);
			iSaleMangService.cotrUpdate3(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res","FAILED");
		}
		
		return  mapper.writeValueAsString(modelMap);
	}
	
	//제안 수정 - 상품명 검색
	@RequestMapping(value = "/saleMangUpdateSearch6Ajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
	@ResponseBody
	public String saleMangUpdateSearch6Ajax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap <String, Object>();
		
		
		int cnt = iSaleMangService.getSaleMangAddSearchGodsCnt6(params);
		
		PagingBean pb 
		= iPagingService.getPagingBean(Integer.parseInt(params.get("search6Page")), cnt, 8, 3);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list3 = iSaleMangService.getSaleMangAddSearchGods6(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list3", list3);
		modelMap.put("cnt", cnt);
		
		System.out.println(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//협상 수정 - 상품명 검색
	@RequestMapping(value = "/saleMangUpdateSearch7Ajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
	@ResponseBody
	public String saleMangUpdateSearch7Ajax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap <String, Object>();
		
		
		int cnt = iSaleMangService.getSaleMangAddSearchGodsCnt7(params);
		
		PagingBean pb 
		= iPagingService.getPagingBean(Integer.parseInt(params.get("search7Page")), cnt, 8, 3);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list3 = iSaleMangService.getSaleMangAddSearchGods7(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list3", list3);
		modelMap.put("cnt", cnt);
		
		System.out.println(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//계약 수정 - 상품명 검색
	@RequestMapping(value = "/saleMangUpdateSearch8Ajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
	@ResponseBody
	public String saleMangUpdateSearch8Ajax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap <String, Object>();
		
		
		int cnt = iSaleMangService.getSaleMangAddSearchGodsCnt8(params);
		
		PagingBean pb 
		= iPagingService.getPagingBean(Integer.parseInt(params.get("search8Page")), cnt, 8, 3);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list3 = iSaleMangService.getSaleMangAddSearchGods8(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list3", list3);
		modelMap.put("cnt", cnt);
		
		System.out.println(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//코멘트
	
	//코멘트 리스트
	@RequestMapping(value = "/commentListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String commentListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int sugsCnt = iSaleMangService.getSugsCommentCnt(params);
		int negtCnt = iSaleMangService.getNegtCommentCnt(params);
		int cotrCnt = iSaleMangService.getCotrCommentCnt(params);
		
		PagingBean sugsPb = iPagingService.getPagingBean(Integer.parseInt(params.get("sugsPage")), sugsCnt, 5, 3);
		PagingBean negtPb = iPagingService.getPagingBean(Integer.parseInt(params.get("negtPage")), negtCnt, 5, 3);
		PagingBean cotrPb = iPagingService.getPagingBean(Integer.parseInt(params.get("cotrPage")), cotrCnt, 5, 3);
		
		params.put("sugsStartCnt", Integer.toString(sugsPb.getStartCount()));
		params.put("sugsEndCnt", Integer.toString(sugsPb.getEndCount()));
		params.put("negtStartCnt", Integer.toString(negtPb.getStartCount()));
		params.put("negtEndCnt", Integer.toString(negtPb.getEndCount()));
		params.put("cotrStartCnt", Integer.toString(cotrPb.getStartCount()));
		params.put("cotrEndCnt", Integer.toString(cotrPb.getEndCount()));
		
		List<HashMap<String, String>> sugs = iSaleMangService.getSugsCommentList(params);
		List<HashMap<String, String>> negt = iSaleMangService.getNegtCommentList(params);
		List<HashMap<String, String>> cotr = iSaleMangService.getCotrCommentList(params);
		
		modelMap.put("sugs", sugs);
		modelMap.put("negt", negt);
		modelMap.put("cotr", cotr);
		
		modelMap.put("sugsPb", sugsPb);
		modelMap.put("negtPb", negtPb);
		modelMap.put("cotrPb", cotrPb);
		modelMap.put("sugsCnt", sugsCnt);
		modelMap.put("negtCnt", negtCnt);
		modelMap.put("cotrCnt", cotrCnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//코멘트 추가
	@RequestMapping(value = "/commentAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String commentAddAjax(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		params.put("empNo", String.valueOf(session.getAttribute("sEmpNo")));
		
		int temp = Integer.parseInt(params.get("tabNo"));
		
		if(temp == 0) {
			params.put("commentProgCondNo", "0");
		} else if (temp == 1) {
			params.put("commentProgCondNo", "1");
		} else {
			params.put("commentProgCondNo", "2");			
		}
		
		try {
			if(temp == 0) {
				iSaleMangService.commentAdd1(params);
			} else if (temp == 1) {
				iSaleMangService.commentAdd2(params);
			} else {		
				iSaleMangService.commentAdd3(params);
			}
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "EXCEPTION");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//코멘트 수정
	@RequestMapping(value = "/commentUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String commentUpdateAjax(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		params.put("empNo", String.valueOf(session.getAttribute("sEmpNo")));
		
		int temp = Integer.parseInt(params.get("tabNo"));
		
		if(temp == 0) {
			System.out.println(temp);
			params.put("commentProgCondNo", "0");
		} else if (temp == 1) {
			System.out.println(temp);
			params.put("commentProgCondNo", "1");
		} else {
			System.out.println(temp);
			params.put("commentProgCondNo", "2");			
		}
		
		try {
			if(temp == 0) {
				iSaleMangService.commentUpdate1(params);
			} else if (temp == 1) {
				iSaleMangService.commentUpdate2(params);
			} else {		
				iSaleMangService.commentUpdate3(params);
			}
			
			modelMap.put("res", "SUCCESS");
		
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "EXCEPTION");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//코멘트 삭제
	@RequestMapping(value = "/commentDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String commentDeleteAjax(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		params.put("empNo", String.valueOf(session.getAttribute("sEmpNo")));
		
		try {
			int cnt = iSaleMangService.commentDelete(params);
			
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