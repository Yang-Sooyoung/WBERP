package com.wberp.ibk.web.crm.controller;

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
import com.wberp.ibk.web.crm.service.ITempChanService;

@Controller
public class TempChanController {
	@Autowired
	public ITempChanService iTempChanService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/tempList")
	public ModelAndView tempList(@RequestParam HashMap<String, String> params,
									ModelAndView mav) {
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page); 
		
		mav.setViewName("crm/template/tempList");
		
		return mav;
	}

	@RequestMapping(value = "/tempListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String tempListAjax(@RequestParam HashMap<String,String> params ) 
								throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();

		
		int cnt = iTempChanService.getTempCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 4);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iTempChanService.getTempList(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/createTemp")
	public ModelAndView tempMailAdd(ModelAndView mav) {
		
		mav.setViewName("crm/template/createTemp");
		
		return mav;
	}

	
	
	@RequestMapping(value = "/tempMailAddAjax",  
			method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String templateMailAddAjax(@RequestParam HashMap<String, String> params, @RequestParam(value="resr_no")  List<String> resrNoList, @RequestParam(value="resr_order") List<String> resrOrderList) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		//순번 괄호 지우기
		for(int i = 0; i < resrOrderList.size(); i++) {
			String resrOrderOrigin = resrOrderList.get(i);
			resrOrderOrigin = resrOrderOrigin.replace("{", "");
			resrOrderOrigin = resrOrderOrigin.replace("}", "");
			resrOrderList.set(i, resrOrderOrigin);	
		}
		
		try {
			//시퀀스 번호 가져오기
			String seq = iTempChanService.seq();
			//파람즈에 번호 추가
			params.put("seq", seq);
			//템플릿에 인서트
			iTempChanService.tempMailAdd(params);
			
				//시퀀스 번호, 예약어 번호, 순번 리스트 넣은 맵 생성
				HashMap<String, Object> resrMap = new HashMap<String, Object>();
				for(int i = 0; i < resrOrderList.size(); i++) {
					resrMap.put("seq", seq);
					resrMap.put("resrOrderList", resrOrderList.get(i));
					resrMap.put("resrNoList", resrNoList.get(i));
					
					iTempChanService.tempResrAdd(resrMap);
				}
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/tempMmsAddAjax",  
			method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String templateMmsAddAjax(@RequestParam HashMap<String, String> params, @RequestParam(value="resr_no")  List<String> resrNoList, @RequestParam(value="resr_order") List<String> resrOrderList) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		//순번 괄호 지우기
		for(int i = 0; i < resrOrderList.size(); i++) {
			String resrOrderOrigin = resrOrderList.get(i);
			resrOrderOrigin = resrOrderOrigin.replace("{", "");
			resrOrderOrigin = resrOrderOrigin.replace("}", "");
			resrOrderList.set(i, resrOrderOrigin);	
		}
		
		try {
			//시퀀스 번호 가져오기
			String seq = iTempChanService.seq();
			//파람즈에 번호 추가
			params.put("seq", seq);
			//템플릿에 인서트
			iTempChanService.tempMmsAdd(params);
			
			//시퀀스 번호, 예약어 번호, 순번 리스트 넣은 맵 생성
			HashMap<String, Object> resrMap = new HashMap<String, Object>();
			for(int i = 0; i < resrOrderList.size(); i++) {
				resrMap.put("seq", seq);
				resrMap.put("resrOrderList", resrOrderList.get(i));
				resrMap.put("resrNoList", resrNoList.get(i));
				
				System.out.println(resrMap);			
				iTempChanService.tempResrAdd(resrMap);
			}
			
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/tempBoardDetail")
	public ModelAndView tempBoardDetail(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		HashMap<String, String> tempBoard = iTempChanService.getTempBoardDetail(params);
		List<HashMap<String, String>> tempResr = iTempChanService.getTempResrDetail(params);
		int UsedCnt = iTempChanService.getUsedTemp(params);
		
		mav.addObject("tempBoard", tempBoard);
		mav.addObject("tempResr", tempResr);
		mav.addObject("UsedCnt", UsedCnt);
		
		mav.setViewName("crm/template/tempBoardDetail");
		
		return mav;
	}
	
	@RequestMapping(value = "/tempDeleteAjax",  
			method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String tempDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iTempChanService.tempBoardDelete(params);
			int cnt2 = iTempChanService.tempResrDelete(params);			
				
				if(cnt > 0 && cnt2 > 0) {
					modelMap.put("res", "SUCCESS");
				} else {
					modelMap.put("res", "FAILED");
				}
				
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/tempBoardUpdate")
	public ModelAndView tempBoardUpdate(@RequestParam HashMap<String, String> params, 
			ModelAndView mav) throws Throwable {
		
		HashMap<String, String> tempBoard = iTempChanService.getTempBoardDetail(params);
		List<HashMap<String, String>> tempResr = iTempChanService.getTempResrDetail(params);
		
		mav.addObject("tempBoard", tempBoard);
		mav.addObject("tempResr", tempResr);
		
		mav.setViewName("crm/template/tempBoardUpdate");
		
		return mav;
	}
	
	@RequestMapping(value = "/tempMmsUpdateAjax",
					method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String tempMmsUpdateAjax(@RequestParam HashMap<String, String> params, @RequestParam(value="resr_no")  List<String> resrNoList, @RequestParam(value="resr_order") List<String> resrOrderList) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		//순번 괄호 지우기
				for(int i = 0; i < resrOrderList.size(); i++) {
					String resrOrderOrigin = resrOrderList.get(i);
					resrOrderOrigin = resrOrderOrigin.replace("{", "");
					resrOrderOrigin = resrOrderOrigin.replace("}", "");
					resrOrderList.set(i, resrOrderOrigin);	
				}
				
				try {
					iTempChanService.tempMmsUpdate(params);
					iTempChanService.tempResrDelete(params);
						
						//시퀀스 번호, 예약어 번호, 순번 리스트 넣은 맵 생성
						HashMap<String, Object> resrMap = new HashMap<String, Object>();
						String tempNo = params.get("tempNo");
						for(int i = 0; i < resrOrderList.size(); i++) {
							resrMap.put("tempNo", tempNo);
							resrMap.put("resrOrderList", resrOrderList.get(i));
							resrMap.put("resrNoList", resrNoList.get(i));
							iTempChanService.tempResrAddUpdate(resrMap);
						}

						
						modelMap.put("res", "SUCCESS");
					
				} catch (Exception e) {
					e.printStackTrace();
					modelMap.put("res", "FAILED");
				}
				return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/tempMailUpdateAjax",
			method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String tempMailUpdateAjax(@RequestParam HashMap<String, String> params, @RequestParam(value="resr_no")  List<String> resrNoList, @RequestParam(value="resr_order") List<String> resrOrderList) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		//순번 괄호 지우기
		for(int i = 0; i < resrOrderList.size(); i++) {
			String resrOrderOrigin = resrOrderList.get(i);
			resrOrderOrigin = resrOrderOrigin.replace("{", "");
			resrOrderOrigin = resrOrderOrigin.replace("}", "");
			resrOrderList.set(i, resrOrderOrigin);	
		}
		
		try {
			
			iTempChanService.tempMailUpdate(params);
			iTempChanService.tempResrDelete(params);	
				
				//시퀀스 번호, 예약어 번호, 순번 리스트 넣은 맵 생성
				HashMap<String, Object> resrMap = new HashMap<String, Object>();
				String tempNo = params.get("tempNo");
				for(int i = 0; i < resrOrderList.size(); i++) {
					resrMap.put("tempNo", tempNo);
					resrMap.put("resrOrderList", resrOrderList.get(i));
					resrMap.put("resrNoList", resrNoList.get(i));
					iTempChanService.tempResrAddUpdate(resrMap);
				}
				modelMap.put("res", "SUCCESS");
			
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/tempCateListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String tempCateListAjax(@RequestParam HashMap<String,String> params ) 
								throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iTempChanService.getTempCateCnt(params);
		
		List<HashMap<String, String>> cateList = iTempChanService.getTempCateList(params);
		
		modelMap.put("cateList", cateList);
		modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/tempCateOptionAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String tempCateOptionAjax(@RequestParam HashMap<String,String> params ) 
								throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();//결과값 담을 맵
		//여기까지 : 맵을 문자열로 바꿔서 오브젝트로 보낼거다
		
		int cnt = iTempChanService.getTempCateCnt(params);
		
		List<HashMap<String, String>> cateList = iTempChanService.getTempCateList(params);
		
		modelMap.put("cateList", cateList);
		modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/tempCateAddAjax",  
			method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String tempCateAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iTempChanService.tempCateAdd(params);			
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/checkCateDuplAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String checkCateDuplAjax(@RequestParam HashMap<String,String> params ) 
								throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iTempChanService.duplTempCateCnt(params);

		modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/tempChanOptionAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String tempChanOptionAjax(@RequestParam HashMap<String,String> params ) 
								throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> chanList = iTempChanService.getTempChanList(params);
		
		modelMap.put("chanList", chanList);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
}
