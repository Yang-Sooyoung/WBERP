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
import com.wberp.ibk.web.sales.service.IInsdCustService;

@Controller
public class IInsdCustController {
	@Autowired
	public IInsdCustService iInsdCustService;
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/custCompInfoMang") 
	public ModelAndView custCompInfoMang(@RequestParam HashMap<String,String> params,
			ModelAndView mav) {
		int page = 1;
		if(params.get("page")!=null) {
			page=Integer.parseInt(params.get("page"));
		}
		mav.addObject("page",page);
		mav.setViewName("sales/InsdCust/CustComList");
		return mav;
	}
	
	//고객사 목록
	@RequestMapping(value="/custCompInfoMangAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8") //method 부터 한글나오게 하는 코드
	@ResponseBody
	public String custCompInfoMangAjax(@RequestParam HashMap<String,String>params)
			throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap=new HashMap<String,Object>();
		int cnt=iInsdCustService.getInsdCustCnt(params);
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 8, 5);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iInsdCustService.getInsdCustList(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);
		return mapper.writeValueAsString(modelMap);
	}
	//고객사 등록 하기
	@RequestMapping(value="/CustComAdd")
	public ModelAndView CustComAdd(ModelAndView mav) {
		mav.setViewName("sales/InsdCust/CustComAdd");
		return mav;
	}
	@RequestMapping(value="/CustComAddAjax", 
			method=RequestMethod.POST, produces="text/json;charset=UTF-8") //method 부터 한글나오게 하는 코드
	@ResponseBody
	public String CustComAddAjax(@RequestParam HashMap<String,String>params)throws Throwable{
		ObjectMapper mapper=new ObjectMapper();
		Map<String,Object>modelMap=new HashMap<String,Object>();
		try {
			iInsdCustService.CustComAdd(params);
			
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res","FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	/*
	@RequestMapping(value = "/CustComDetail")
	public ModelAndView CustComDetail(HttpSession session, @RequestParam HashMap<String, String> params, 
								 ModelAndView mav) throws Throwable {
		mav.setViewName("sales/InsdCust/CustComDetail");
		return mav;
	}
	
	@RequestMapping(value = "/CustComDetailAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String CustComDetailAjax(@RequestParam HashMap<String, String> params)
							throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		HashMap<String, String> data = iInsdCustService.getCustCom(params);
		modelMap.put("data", data);
		return mapper.writeValueAsString(modelMap);
	}
	*/
	//고객사 상세보기 페이지
	@RequestMapping(value="/CustComDetail")
	public ModelAndView CustComDetail(@RequestParam HashMap<String, String>params,
			ModelAndView mav)throws Throwable{
		HashMap<String,String>data= iInsdCustService.getCustCom(params);
		mav.addObject("data",data);
		int poppage = 1;
		if(params.get("poppage") != null) {
			poppage = Integer.parseInt(params.get("poppage"));
		}
		mav.addObject("poppage", poppage);
		mav.setViewName("sales/InsdCust/CustComDetail");
		return mav;
	}

	// 상품 리스트 팝업
	@RequestMapping(value="/CustGodsListAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8") //method 부터 한글나오게 하는 코드
	@ResponseBody
	public String CustGodsListAjax(@RequestParam HashMap<String,String>params)
			throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap=new HashMap<String,Object>();
		int popcnt=iInsdCustService.getCustGodsCnt(params);
		PagingBean pb2 = iPagingService.getPagingBean(Integer.parseInt(params.get("poppage")), popcnt, 3, 3);
		
		params.put("startCntP", Integer.toString(pb2.getStartCount()));
		params.put("endCntP", Integer.toString(pb2.getEndCount()));
		
		List<HashMap<String, String>> poplist = iInsdCustService.getCustGodsList(params);
		
		modelMap.put("pb2", pb2);
		modelMap.put("poplist", poplist);
		modelMap.put("popcnt", popcnt);
		return mapper.writeValueAsString(modelMap);
	}
	/*
	@RequestMapping(value="/CustComDelete")
	public ModelAndView CustComDelete(@RequestParam HashMap<String, String>params,
			ModelAndView mav)throws Throwable{
		try {
			int cnt = iInsdCustService.CustComDelete(params);
			if(cnt>0) {
				mav.addObject("res","success");
			}else {
				mav.addObject("res","failed");
			}
		}catch(Exception e) {
			e.printStackTrace();
			mav.addObject("res","failed");
		}
		mav.setViewName("sales/InsdCust/CustComDelete");
		return mav;
	}*/
	//고객사 삭제
	@RequestMapping(value = "/CustComDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String CustComDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iInsdCustService.CustComDelete(params);
			if (cnt > 0) {
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
	//고객사 업데이트
	@RequestMapping(value="/CustComEdit")
	public ModelAndView CustComEdit(@RequestParam HashMap<String, String>params,
			ModelAndView mav)throws Throwable{
		HashMap<String,String>data= iInsdCustService.getCustCom(params);
		mav.addObject("data",data);
		mav.setViewName("sales/InsdCust/CustComEdit");
		return mav;
	}
	@RequestMapping(value = "/CustComUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String CustComUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iInsdCustService.updateCustCom(params);
			if (cnt > 0) {
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
	
	//고객리스트
	@RequestMapping(value="/custInfoMang") 
	public ModelAndView custInfoMang(@RequestParam HashMap<String,String> params,
			ModelAndView mav) {
		int page = 1;
		if(params.get("page")!=null) {
			page=Integer.parseInt(params.get("page"));
		}
		mav.addObject("page",page);
		mav.setViewName("sales/InsdCust/CustList");
		return mav;
	}
	//고객리스트 아작스
	@RequestMapping(value="/custInfoMangAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8") //method 부터 한글나오게 하는 코드
	@ResponseBody
	public String custInfoMangAjax(@RequestParam HashMap<String,String>params)
			throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap=new HashMap<String,Object>();
		int cnt=iInsdCustService.getInsdCustCnt2(params);
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 8, 5);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iInsdCustService.getInsdCustList2(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);
		return mapper.writeValueAsString(modelMap);
	}
	//고객 상세보기페이지
	@RequestMapping(value="/CustDetail")
	public ModelAndView CustDetail(@RequestParam HashMap<String, String>params,
			ModelAndView mav)throws Throwable{
		HashMap<String,String>data= iInsdCustService.getCustDetail(params);
		mav.addObject("data",data);
		int cmntpage = 1;
		if(params.get("cmntpage") != null) {
			cmntpage = Integer.parseInt(params.get("cmntpage"));
		}
		mav.addObject("cmntpage", cmntpage);
		
		
		mav.setViewName("sales/InsdCust/CustDetail");
		return mav;
	}
	//고객 정보 삭제
	@RequestMapping(value = "/CustDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String CustDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iInsdCustService.CustDelete(params);
			if (cnt > 0) {
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
	//고객 등록
	@RequestMapping(value="/CustAdd")
	public ModelAndView CustAdd(ModelAndView mav) {
		
		mav.setViewName("sales/InsdCust/CustAdd");
		return mav;
	}
	@RequestMapping(value="/CustAddAjax", 
			method=RequestMethod.POST, produces="text/json;charset=UTF-8") //method 부터 한글나오게 하는 코드
	@ResponseBody
	public String CustAddAjax(@RequestParam HashMap<String,String>params,@RequestParam(value="insd_cust_no") List<String>
	  susinList)throws Throwable{
		ObjectMapper mapper=new ObjectMapper();
		Map<String,Object>modelMap=new HashMap<String,Object>();

		
		try {
			//번호취득
			String insd_cust_no = iInsdCustService.nextVar(params);
			//params에 번호 추가
			params.put("insd_cust_no", insd_cust_no);
			//
			//반복문으로 수신동의 처리
			HashMap<String, Object> susin = new HashMap<String, Object>();
			for(int i = 0; i < susinList.size(); i++) {
				susin.put("insd_cust_no", insd_cust_no);
				susin.put("resrOrderList", susinList.get(i));
						
				iInsdCustService.CustAdd(susin);
			}
			
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res","FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	//고객 등록 고객사 리스트 팝업
		@RequestMapping(value="/CustComListAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8") //method 부터 한글나오게 하는 코드
		@ResponseBody
		public String CustComListAjax(@RequestParam HashMap<String,String>params)
				throws Throwable{
			ObjectMapper mapper= new ObjectMapper();
			Map<String,Object> modelMap=new HashMap<String,Object>();
			int popcomcnt=iInsdCustService.getCustComCnt(params);
			PagingBean pb3 = iPagingService.getPagingBean(Integer.parseInt(params.get("poppage")), popcomcnt, 3, 3);
			
			params.put("startCntP", Integer.toString(pb3.getStartCount()));
			params.put("endCntP", Integer.toString(pb3.getEndCount()));
			
			List<HashMap<String, String>> popcomlist = iInsdCustService.getCustComList(params);
			
			modelMap.put("pb3", pb3);
			modelMap.put("popcomlist", popcomlist);
			modelMap.put("popcomcnt", popcomcnt);
			return mapper.writeValueAsString(modelMap);
		}
	//고객 업데이트
	@RequestMapping(value="/CustEdit")
	public ModelAndView CustEdit(@RequestParam HashMap<String, String>params,
			ModelAndView mav)throws Throwable{
		HashMap<String,String>data= iInsdCustService.getCustDetail(params);
		mav.addObject("data",data);
		mav.setViewName("sales/InsdCust/CustEdit");
		return mav;
	}
	@RequestMapping(value = "/CustUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String CustUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iInsdCustService.updateCust(params);
			if (cnt > 0) {
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
	
	
	//고객 의견 목록 조회
	@RequestMapping(value="/opnnListAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8") //method 부터 한글나오게 하는 코드
	@ResponseBody
	public String opnnListAjax(@RequestParam HashMap<String,String>params)
			throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap=new HashMap<String,Object>();
		int cmntCnt=iInsdCustService.getopnnCnt(params);
		PagingBean cmntPb = iPagingService.getPagingBean(Integer.parseInt(params.get("cmntpage")), cmntCnt, 10, 10);
		
		params.put("startCnt", Integer.toString(cmntPb.getStartCount()));
		params.put("endCnt", Integer.toString(cmntPb.getEndCount()));
		
		List<HashMap<String, String>> cmntList = iInsdCustService.getopnnList(params);
		
		modelMap.put("cmntPb", cmntPb);
		modelMap.put("cmntList", cmntList);
		modelMap.put("cmntCnt", cmntCnt);
		return mapper.writeValueAsString(modelMap);
	}
	
	//고객 의견 등록
	@RequestMapping(value="/opnAddAjax", 
			method=RequestMethod.POST, produces="text/json;charset=UTF-8") //method 부터 한글나오게 하는 코드
	@ResponseBody
	public String opnAddAjax(@RequestParam HashMap<String,String>params)throws Throwable{
		ObjectMapper mapper=new ObjectMapper();
		Map<String,Object>modelMap=new HashMap<String,Object>();
		try {
			iInsdCustService.OpnAdd(params);
			
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res","FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//고객 의견 업데이트
	@RequestMapping(value = "/OpnnUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String OpnnUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iInsdCustService.updateOpnn(params);
			if (cnt > 0) {
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
	//고객사 리스트 팝업
		@RequestMapping(value="/CustListPopAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8") //method 부터 한글나오게 하는 코드
		@ResponseBody
		public String CustListPopAjax(@RequestParam HashMap<String,String>params)
				throws Throwable{
			ObjectMapper mapper= new ObjectMapper();
			Map<String,Object> modelMap=new HashMap<String,Object>();
			int popcnt=iInsdCustService.getCustListPopCnt(params);
			
			PagingBean pb2 = iPagingService.getPagingBean(Integer.parseInt(params.get("poppage")), popcnt, 10, 5);
			
			params.put("startCntP", Integer.toString(pb2.getStartCount()));
			params.put("endCntP", Integer.toString(pb2.getEndCount()));
			System.out.println(params.toString());
			List<HashMap<String, String>> poplist = iInsdCustService.getCustListPop(params);
			
			modelMap.put("pb2", pb2);
			modelMap.put("poplist", poplist);
			modelMap.put("popcnt", popcnt);
			return mapper.writeValueAsString(modelMap);
		}
		/*
		 * @RequestMapping(value="/ChanAddAjax", method=RequestMethod.POST,
		 * produces="text/json;charset=UTF-8") //method 부터 한글나오게 하는 코드
		 * 
		 * @ResponseBody public String ChanAddAjax(@RequestParam
		 * HashMap<String,String>params, @RequestParam(value="resr_no") List<String>
		 * resrNoList)throws Throwable{ ObjectMapper mapper=new ObjectMapper();
		 * Map<String,Object>modelMap=new HashMap<String,Object>(); String insd_cust_no
		 * = iInsdCustService.nextVar(params); try { iInsdCustService.OpnAdd(params);
		 * 
		 * 
		 * modelMap.put("res","SUCCESS"); } catch (Exception e) { e.printStackTrace();
		 * modelMap.put("res","FAILED"); }
		 * 
		 * return mapper.writeValueAsString(modelMap); }
		 */
		
}
