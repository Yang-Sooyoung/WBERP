package com.wberp.ibk.web.crm.controller;

import java.util.ArrayList;
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
import com.wberp.ibk.web.crm.service.ICampService;
import com.wberp.ibk.web.gw.service.IApprovalService;

@Controller
public class CampController {
	@Autowired
	public ICampService iCampService;

	@Autowired
	public IPagingService iPagingService;

	@Autowired
	public IApprovalService iApprovalService;
	
	// 캠페인목록
	@RequestMapping(value = "/campList")
	public ModelAndView campList(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		mav.addObject("page", page);

		mav.setViewName("crm/campList");
		return mav;
	}

	@RequestMapping(value = "campListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String campListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iCampService.getCampCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iCampService.getCamp(params);

		modelMap.put("pb", pb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}

	// 캠페인 수정
	@RequestMapping(value = "/campModf")
	public ModelAndView campModf(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		HashMap<String, String> data = iCampService.getCampDetail(params);

		mav.addObject("data", data);
		
		HashMap<String, String> camp = iCampService.getCampDept(params);
		
		mav.addObject("camp", camp);

		mav.setViewName("crm/campModf");

		return mav;
	}

	@RequestMapping(value = "/chanDetailAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String chanDetailAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> data2 = iCampService.getChanDetail(params);
		
		modelMap.put("data2", data2);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/campUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String campUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iCampService.campUpdate(params);
			if (cnt > 0) {
				modelMap.put("res", "SUCCESS");
			} else {
				modelMap.put("res", "FAILED");
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "ERROR");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/GroupUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String GroupUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		System.out.println(params.toString());
		try {
			int cnt = iCampService.custGroupUpdate(params);
			int cnt2 = iCampService.custGroupAreaUpdate(params);
			iCampService.custGroupChanDelete(params);
			if (cnt > 0 && cnt2 >0) {
				modelMap.put("res", "SUCCESS");
			} else {
				modelMap.put("res", "FAILED");
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "ERROR");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/campCustDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String campCustDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iCampService.campCustDelete(params);
			if (cnt > 0) {
				modelMap.put("res", "SUCCESS");
			} else {
				modelMap.put("res", "FAILED");
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "ERROR");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	
	// 캠페인 결과
	@RequestMapping(value = "/campResl")
	public ModelAndView campResl(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		mav.addObject("page", page);

		mav.setViewName("crm/campResl");
		return mav;
	}

	// 캠페인 결과 목록 아작스
	@RequestMapping(value = "campReslAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String campReslAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iCampService.getSendTableCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iCampService.getSendTable(params);

		modelMap.put("pb", pb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/campAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String campAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iCampService.addCamp(params);
			HashMap<String, String> campNo = iCampService.getCampNo(params);
			modelMap.put("res", "SUCCESS");
			modelMap.put("campNo", campNo);
			System.out.println(campNo);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/cgListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cgListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> data = iCampService.getCgList(params);

		modelMap.put("data", data);

		List<HashMap<String, String>> list = iCampService.getChanList(params);

		modelMap.put("list", list);
		
		

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/cgFilterAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cgFilterAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		HashMap<String, String> data = iCampService.getCgData(params);

		modelMap.put("data", data);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/campEnroll")
	public ModelAndView campEnroll(ModelAndView mav) {
		mav.setViewName("crm/campEnroll");

		return mav;
	}

	@RequestMapping(value = "/CampCgAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String CampCgAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {

			String CampCgNum = iCampService.getCampCgNum();
			params.put("CampCgNum", CampCgNum);
			iCampService.addCampCg(params);
			iCampService.cgAreaAdd(params);
			
			HashMap<String, String> cgNo = iCampService.getCampCgNo(params);

			modelMap.put("cgNo", cgNo);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/campCgChanAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String campCgChanAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			
			iCampService.cgChanAdd(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		modelMap.put("params", params);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/campTempListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String campTempListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> data = iCampService.getTempList(params);

		modelMap.put("data", data);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/campChanListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String campChanListAjax(@RequestParam HashMap<String, String> params,
			@RequestParam(value = "chanCheck", required = false) List<Integer> chanData) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		if (chanData != null) {
			String chanCheck = "";

			for (int a : chanData) {
				chanCheck += ","+ a;
			}

			chanCheck = chanCheck.substring(1);

			params.put("chanCheck", chanCheck);
		}

		List<HashMap<String, String>> list = iCampService.getChanList(params);

		modelMap.put("list", list);

		List<HashMap<String, String>> list2 = iCampService.getChanList2(params);
		
		modelMap.put("list2", list2);
		
		List<HashMap<String, String>> data2 = iCampService.getChanDetail(params);
		
		modelMap.put("data2", data2);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/tempConAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String tempConAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		HashMap<String, String> data = iCampService.getTempConData(params);

		modelMap.put("data", data);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "areaListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String areaListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> area = iCampService.getCampArea();

		modelMap.put("area", area);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/CampTempAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String CampTempAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iCampService.addCgChanTemp(params);
			modelMap.put("res", "SUCCESS");

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "getSimulDataAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getSimulDataAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> data = iCampService.getSimulData(params);
		HashMap<String, String> custcnt = iCampService.getCustCountData(params);

		modelMap.put("data", data);
		modelMap.put("custcnt", custcnt);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/campCustListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String campCustListAjax(@RequestParam HashMap<String, String> params,
			@RequestParam(value = "chanCheck", required = false) List<Integer> chanData) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		if (chanData != null) {
			String chanCheck = "";

			for (int a : chanData) {
				chanCheck += ","+ a;
			}

			chanCheck = chanCheck.substring(1);

			params.put("chanCheck", chanCheck);
		}
		List<HashMap<String, String>> data = iCampService.getCampCustList(params);

		modelMap.put("data", data);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/custListSaveAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String custListSaveAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iCampService.addCampCust(params);
			modelMap.put("res", "SUCCESS");

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/campFinishAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String campFinishAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			System.out.println(params);
			
			iApprovalService.PublicAppAdd(params.get("campno"),params.get("sEmpNo"),"8",params.get("campNm"),params.get("cont"),"캠페인 등록");
			params.put("statcode", "0");
			iCampService.updateStat(params);
			modelMap.put("res", "SUCCESS");
			
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/updateCampCustAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String updateCampCustAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			
			iCampService.updateCampCust(params);
			modelMap.put("res", "SUCCESS");

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/drawSimulationAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String drawSimulationAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list1 = iCampService.getCampChanTypeList(params);
		
		ArrayList<HashMap<String, Object>> list2 = new ArrayList<HashMap<String, Object>>();
		
		for(int i = 0 ; i < list1.size() ; i++) {
			
			if(String.valueOf(list1.get(i).get("CHAN_TYPE_NO")).equals("2")) {
				HashMap<String, Object> data = iCampService.getKakaoRectWhet(params);
				
				if(data==null) {
					data=new HashMap<String,Object>();
					data.put("RECT_WHET",0);
					data.put("REAL_RECT_WHET",0);
				}
			
				list2.add(data);
				
			}else if(String.valueOf(list1.get(i).get("CHAN_TYPE_NO")).equals("1")) {
				HashMap<String, Object> data = iCampService.getSmsRectWhet(params);
				
				if(data==null) {
					data=new HashMap<String,Object>();
					data.put("RECT_WHET",0);
					data.put("REAL_RECT_WHET",0);
				}
			
				list2.add(data);
			}else if(String.valueOf(list1.get(i).get("CHAN_TYPE_NO")).equals("4")) {
				HashMap<String, Object> data = iCampService.getEmailRectWhet(params);
				
				if(data==null) {
					data=new HashMap<String,Object>();
					data.put("RECT_WHET",0);
					data.put("REAL_RECT_WHET",0);
				}
			
				list2.add(data);
			}else {
				modelMap.put("res","FAILED");				
			}
			modelMap.put("res","SUCCESS");
		}
		
		modelMap.put("list1", list1);
		modelMap.put("list2", list2);
		
        return mapper.writeValueAsString(modelMap);
	}
}
