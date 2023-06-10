package com.wberp.ibk.web.hr.controller;

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
import com.wberp.ibk.web.hr.service.EduService;

@Controller
public class EduController {

	@Autowired
	public EduService iEduService;

	@Autowired
	public IPagingService iPagingService;

	@RequestMapping(value = "/eduList")
	public ModelAndView eduList(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}

		mav.addObject("page", page);

		mav.setViewName("hr/eduList");

		return mav;
	}

	@RequestMapping(value = "/eduListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String eduListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iEduService.getEduCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iEduService.getEduList(params);

		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/eduDetail")
	public ModelAndView eduDetail(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		HashMap<String, String> edu = iEduService.getEduDetail(params);

		mav.addObject("edu", edu);

		mav.setViewName("hr/eduDetail");

		return mav;
	}

	@RequestMapping(value = "/eduDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String eduDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iEduService.eduDelete(params);
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

	@RequestMapping(value = "/eduAdd")
	public ModelAndView eduAdd(ModelAndView mav) {

		mav.setViewName("hr/eduAdd");

		return mav;
	}

	@RequestMapping(value = "/eduAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String eduAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iEduService.eduAdd(params);

			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/eduUpdate")
	public ModelAndView eduUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		HashMap<String, String> edu = iEduService.getEduDetail(params);

		mav.addObject("edu", edu);

		mav.setViewName("hr/eduUpdate");

		return mav;
	}

	@RequestMapping(value = "/eduUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String eduUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iEduService.eduUpdate(params);
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
	
	@RequestMapping(value = "/eduaply")
	public ModelAndView eduaply(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}

		mav.addObject("page", page);

		mav.setViewName("hr/eduaply");

		return mav;
	}

	@RequestMapping(value = "/eduaplyListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String eduaplyListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iEduService.getEduaplyCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iEduService.getEduaplyList(params);

		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);

		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	@RequestMapping(value = "/eduaplyDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String eduaplyDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iEduService.eduaplyDelete(params);
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
	
	@RequestMapping(value = "/eduaplyAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String eduaplyAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iEduService.getEduaplyCnt(params);
			HashMap<String, String> edu = iEduService.getEduDetail(params);
			if (Integer.parseInt(params.get("sign_pers")) > cnt) {
				iEduService.eduaplyAdd(params);
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
	
	// 교육장

	@RequestMapping(value = "/educenterList")
	public ModelAndView educenterList(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}

		mav.addObject("page", page);

		mav.setViewName("hr/educenterList");

		return mav;
	}

	@RequestMapping(value = "/educenterListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String educenterListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iEduService.getEducenterCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iEduService.getEducenterList(params);

		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/educenterDetail")
	public ModelAndView educenterDetail(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {

		HashMap<String, String> edu = iEduService.getEducenterDetail(params);

		mav.addObject("edu", edu);

		mav.setViewName("hr/educenterDetail");

		return mav;
	}

	@RequestMapping(value = "/educenterUpdate")
	public ModelAndView educenterUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {

		HashMap<String, String> edu = iEduService.getEducenterDetail(params);

		mav.addObject("edu", edu);

		mav.setViewName("hr/educenterUpdate");

		return mav;
	}

	@RequestMapping(value = "/educenterUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String educenterUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iEduService.educenterUpdate(params);
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

	@RequestMapping(value = "/educenterDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String educenterDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iEduService.educenterDelete(params);
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

	@RequestMapping(value = "/educenterAdd")
	public ModelAndView educenterAdd(ModelAndView mav) {

		mav.setViewName("hr/educenterAdd");

		return mav;
	}

	@RequestMapping(value = "/educenterAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String educenterAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iEduService.educenterAdd(params);

			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}

	// 교육자

	@RequestMapping(value = "/edupersList")
	public ModelAndView edupersList(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}

		mav.addObject("page", page);

		mav.setViewName("hr/edupersList");

		return mav;
	}

	@RequestMapping(value = "/edupersListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String edupersListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iEduService.getEdupersCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iEduService.getEdupersList(params);

		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/edupersDetail")
	public ModelAndView edupersDetail(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		HashMap<String, String> edu = iEduService.getEdupersDetail(params);

		mav.addObject("edu", edu);

		mav.setViewName("hr/edupersDetail");

		return mav;
	}

	@RequestMapping(value = "/edupersUpdate")
	public ModelAndView edupersUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		HashMap<String, String> edu = iEduService.getEdupersDetail(params);

		mav.addObject("edu", edu);

		mav.setViewName("hr/edupersUpdate");

		return mav;
	}

	@RequestMapping(value = "/edupersUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String edupersUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iEduService.edupersUpdate(params);
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

	@RequestMapping(value = "/edupersDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String edupersDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iEduService.edupersDelete(params);
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

	@RequestMapping(value = "/edupersAdd")
	public ModelAndView edupersAdd(ModelAndView mav) {

		mav.setViewName("hr/edupersAdd");

		return mav;
	}

	@RequestMapping(value = "/edupersAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String edupersAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iEduService.edupersAdd(params);

			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/eduperscarrUpdate")
	public ModelAndView eduperscarrUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {

		HashMap<String, String> edu = iEduService.getEdupersDetail(params);

		mav.addObject("edu", edu);

		mav.setViewName("hr/eduperscarrUpdate");

		return mav;
	}

	@RequestMapping(value = "/eduperscarrUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String eduperscarrUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iEduService.eduperscarrUpdate(params);
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

	@RequestMapping(value = "/eduperscarrAdd")
	public ModelAndView eduperscarrAdd(ModelAndView mav) {

		mav.setViewName("hr/eduperscarrAdd");

		return mav;
	}

	@RequestMapping(value = "/eduperscarrAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String eduperscarrAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iEduService.eduperscarrAdd(params);

			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/eduperscarrDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String eduperscarrDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iEduService.eduperscarrDelete(params);
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

	@RequestMapping(value = "/eduperscarrList")
	public ModelAndView eduperscarrList(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}

		mav.addObject("page", page);

		mav.setViewName("hr/eduperscarrList");

		return mav;
	}

	@RequestMapping(value = "/eduperscarrListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String eduperscarrListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iEduService.getEduperscarrCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iEduService.getEduperscarrList(params);

		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);

		return mapper.writeValueAsString(modelMap);
	}

}
