package com.wberp.ibk.web.common.controller;

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
import com.wberp.ibk.exception.NotAllowException;
import com.wberp.ibk.util.Utils;
import com.wberp.ibk.web.common.service.ICommonService;

@Controller
public class CommonController {
	public static void main(String[] args) {}
	@Autowired
	public ICommonService iCommonService;
	
	@RequestMapping(value = "/header")
	public ModelAndView header(ModelAndView mav) {
		mav.setViewName("common/header");
		
		return mav;
	}
	
	@RequestMapping(value = "/notAllow")
	public ModelAndView notAllow(ModelAndView mav) {
		mav.setViewName("exception/NOT_ALLOW_ACCESS");
		
		return mav;
	}
	
	@RequestMapping(value = "/bottom")
	public ModelAndView bottom(ModelAndView mav) {
		mav.setViewName("common/bottom");
		
		return mav;
	}
	
	@RequestMapping(value = "/topLeft")
	public ModelAndView topLeft(@RequestParam HashMap<String, String> params, 
								HttpSession session, ModelAndView mav) throws Throwable {
		String athrTypeNo = iCommonService.menuAthrCheck(String.valueOf(session.getAttribute("sAthrNo")), 
														 String.valueOf(params.get("menuNo")));
		try {
			List<HashMap<String, String>> topMenu = iCommonService.getTopMenu(String.valueOf(session.getAttribute("sAthrNo")));
			
			mav.addObject("athrTypeNo", athrTypeNo);
			mav.addObject("topMenu", topMenu);
		} catch (Exception e) {
			e.printStackTrace();
			
			throw new NotAllowException("topLeft Excedption");
		}
		
		mav.setViewName("common/topLeft");
		
		return mav;
	}
	
	@RequestMapping(value = "/leftMenuAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String leftMenuAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		params.put("athrNo", String.valueOf(session.getAttribute("sAthrNo")));
		
		List<HashMap<String, String>> leftMenu = iCommonService.getLeftMenu(params);
		
		modelMap.put("leftMenu", leftMenu);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping({"/", "/login"})
	public ModelAndView login(ModelAndView mav) {
		mav.setViewName("common/login");
		
		return mav;
	}
	
	@RequestMapping(value = "/loginAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String loginAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			//패스워드 암호화
			params.put("pw", Utils.encryptAES128(params.get("pw")));

			HashMap<String, String> data = iCommonService.loginCheck(params);

			if (data != null && !data.isEmpty()) {
				session.setAttribute("sEmpNo", data.get("EMP_NO"));
				session.setAttribute("sEmpNm", data.get("EMP_NM"));
				session.setAttribute("sPhotoAddr", data.get("PHOTO_ADDR"));
				session.setAttribute("sAthrNo", data.get("ATHR_NO"));
				session.setAttribute("sDeptNo", data.get("DEPT_NO"));
				session.setAttribute("sDeptNm", data.get("DEPT_NM"));
				session.setAttribute("sPosnNm", data.get("POSN_NM"));

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
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		session.invalidate();
		
		mav.setViewName("redirect:login");

		return mav;
	}
	
	/**
	 * 공통코드 목록 조회
	 * @param params - bigFrac : 대분류 취득
	 * @return
	 * @throws Throwable
	 */
	@RequestMapping(value = "/getComnCodeAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getComnCodeAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			List<HashMap<String, String>> comnCode = iCommonService.getComnCode(params.get("bigFrac"));
			
			modelMap.put("comnCode", comnCode);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "ERROR");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping({"/Sample"})
	public ModelAndView sample(ModelAndView mav) {
		mav.setViewName("common/sample");

		return mav;
	}
	
}
