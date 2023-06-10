package com.wberp.ibk.web.crm.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

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
import com.wberp.ibk.web.crm.service.IChannelService;

@Controller
public class ChannelController {
	@Autowired
	public IChannelService iChannelService;

	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/chanList")
	public ModelAndView channelList(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		mav.addObject("page", page);

		mav.setViewName("crm/channelList");
		return mav;
	}
	
	@RequestMapping(value = "channelListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String channelListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iChannelService.getChanCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt,3,3);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iChannelService.getChan(params);

		modelMap.put("pb", pb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	
	
	@RequestMapping(value = "channelTypeSelectAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String channelTypeSelectAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();


		List<HashMap<String, String>> chanlist = iChannelService.getchannelTypelist(params);
		List<HashMap<String, String>> subclist = iChannelService.getsupplySubcSelect(params);
		List<HashMap<String, String>> supllist = iChannelService.getsupplyType(params);		
		modelMap.put("chanlist", chanlist);
		modelMap.put("subclist", subclist);
		modelMap.put("supllist", supllist);

		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "ChanAddPopAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ChanAddPopAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		
		List<HashMap<String, String>> chanlist = iChannelService.getchannelTypelist(params);
		List<HashMap<String, String>> subclist = iChannelService.getsupplySubcSelect(params);
		List<HashMap<String, String>> supllist = iChannelService.getsupplyType(params);		
		modelMap.put("chanlist", chanlist);
		modelMap.put("subclist", subclist);
		modelMap.put("supllist", supllist);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="chanAddAjax" ,method=RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String chanAddAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable{

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		System.out.println(params.toString());
		
		params.put("sMno", String.valueOf(session.getAttribute("sEmpNo")));
		
		try {
			iChannelService.chanAddAjax(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res","FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "ChanDetailAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ChanDetailAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		HashMap<String, String> list = iChannelService.getChanDetail(params);

		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "ChanUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ChanUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			iChannelService.ChanUpdate(params);
			
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res","FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "ChanDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ChanDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			iChannelService.ChanDelete(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res","FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "etcAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String etcAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> list1 = iChannelService.getEtcList(params);
		List<HashMap<String, String>> list2 = iChannelService.getEtcListCotr(params);
		List<HashMap<String, String>> list3 = iChannelService.getEtcListSupl(params);

		modelMap.put("list1", list1);
		modelMap.put("list2", list2);
		modelMap.put("list3", list3);

		return mapper.writeValueAsString(modelMap);
	}

	
	@RequestMapping(value = "deleteEtcAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String deleteEtcAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();
		int temp = Integer.parseInt(params.get("etcFlaghidden"));
		String temp2 = params.get("etcAddNm");
	
		if(temp == 1) {
			try {
				int tempInt = 0;
				List<HashMap<String, String>> list = iChannelService.getEtcList(params);	//채널유형명 가져오기
				for(int i = 0 ; i<list.size();i++) {	//입력한 채널유형명  , DB채널유형명 비교 반복문
						if(list.get(i).get("CHAN_TYPE").equals(temp2)) {
							tempInt = 1;
						}
				}
				if(tempInt == 1) {

					iChannelService.deleteEtcChanType(params);
					modelMap.put("res","SUCCESS");
				}
				else {
					modelMap.put("res","LOSS");
				}
			} catch (Exception e) {
				e.printStackTrace();
				modelMap.put("res","FAILED");
			}
		} else if(temp == 2) {
			
			try {
				int tempInt = 0;
				List<HashMap<String, String>> list = iChannelService.getEtcListCotr(params);	//채널유형명 가져오기
				for(int i = 0 ; i<list.size();i++) {	//입력한 채널유형명  , DB채널유형명 비교 반복문
						if(list.get(i).get("COTR_TYPE_NM").equals(temp2)) {
							tempInt = 1;
						}
				}
				if(tempInt == 1) {
					iChannelService.deleteEtcCotr(params);
					modelMap.put("res","SUCCESS");
				}
				else {
					modelMap.put("res","LOSS");
				}
			} catch (Exception e) {
				e.printStackTrace();
				modelMap.put("res","FAILED");
			}
		} else {
			try {
				int tempInt = 0;
				List<HashMap<String, String>> list = iChannelService.getEtcListSupl(params);	//채널유형명 가져오기
				for(int i = 0 ; i<list.size();i++) {	//입력한 채널유형명  , DB채널유형명 비교 반복문
						if(list.get(i).get("SUBC_NM").equals(temp2)) {
							tempInt = 1;
						}
				}
				if(tempInt == 1) {
					iChannelService.deleteEtcSupl(params);
					modelMap.put("res","SUCCESS");
				}
				else {
					modelMap.put("res","LOSS");
				}
			} catch (Exception e) {
				e.printStackTrace();
				modelMap.put("res","FAILED");
			}
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "addEtcAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String addEtcAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();
		int temp = Integer.parseInt(params.get("etcFlaghidden"));
		String temp2 = params.get("etcAddNm");
		if(temp == 1) {
			try {
				int tempInt = 0;
				List<HashMap<String, String>> list = iChannelService.getEtcList(params);	//채널유형명 가져오기
				for(int i = 0 ; i<list.size();i++) {	//입력한 채널유형명  , DB채널유형명 비교 반복문
						if(list.get(i).get("CHAN_TYPE").equals(temp2)) {
							tempInt = 1;
						}
				}
				if(tempInt == 1) {
					modelMap.put("res","OVERLAP");
				}
				else {
				iChannelService.addEtcChanType(params);
				modelMap.put("res","SUCCESS");
				}
			} catch (Exception e) {
				e.printStackTrace();
				modelMap.put("res","FAILED");
			}
		} else if(temp == 2) {
			
			try {
				int tempInt = 0;
				List<HashMap<String, String>> list = iChannelService.getEtcListCotr(params);	//채널유형명 가져오기
				for(int i = 0 ; i<list.size();i++) {	//입력한 채널유형명  , DB채널유형명 비교 반복문
						if(list.get(i).get("COTR_TYPE_NM").equals(temp2)) {
							tempInt = 1;
						}
				}
				if(tempInt == 1) {
					modelMap.put("res","OVERLAP");
				}
				else {
					iChannelService.addEtcCotr(params);
				modelMap.put("res","SUCCESS");
				}
			} catch (Exception e) {
				e.printStackTrace();
				modelMap.put("res","FAILED");
			}
		} else {
			try {
				int tempInt = 0;
				List<HashMap<String, String>> list = iChannelService.getEtcListSupl(params);	//채널유형명 가져오기
				for(int i = 0 ; i<list.size();i++) {	//입력한 채널유형명  , DB채널유형명 비교 반복문
						if(list.get(i).get("SUBC_NM").equals(temp2)) {
							tempInt = 1;
						}
				}
				if(tempInt == 1) {
					modelMap.put("res","OVERLAP");
				}
				else {
					iChannelService.addEtcSupl(params);
				modelMap.put("res","SUCCESS");
				}
			} catch (Exception e) {
				e.printStackTrace();
				modelMap.put("res","FAILED");
			}
		}
		return mapper.writeValueAsString(modelMap);
	}
}
