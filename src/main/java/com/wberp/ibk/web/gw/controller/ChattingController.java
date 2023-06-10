package com.wberp.ibk.web.gw.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wberp.ibk.common.CommonProperties;
import com.wberp.ibk.common.service.IPagingService;
import com.wberp.ibk.web.gw.service.IChattingService;

@Controller
public class ChattingController {
	@Autowired
	public IChattingService iChattingService;

	@Autowired
	public IPagingService iPagingService;

	@RequestMapping(value = "/ChattingAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ChattingAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iChattingService.getChattingCnt(params);

			int maxNo = iChattingService.getMaxNo(params);

			List<HashMap<String, String>> list = iChattingService.getChatting(params);

			modelMap.put("list", list);
			modelMap.put("cnt", cnt);
			modelMap.put("maxNo", maxNo);
			modelMap.put("message", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			modelMap.put("message", CommonProperties.RESULT_ERROR);
			modelMap.put("errorMessage", e.getMessage());
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/ChattingDetailAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ChattingDetailAjax(@RequestParam HashMap<String, String> params, HttpServletRequest request,
			HttpSession session, ModelAndView modelAndView) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iChattingService.getChatDetailCnt(params);

			List<HashMap<String, String>> chat = iChattingService.getChatDetail(params);
			List<HashMap<String, String>> alia = iChattingService.getName(params);

			modelMap.put("cnt", cnt);
			modelMap.put("chat", chat);
			modelMap.put("alia", alia);
			modelMap.put("message", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			modelMap.put("message", CommonProperties.RESULT_ERROR);
			modelMap.put("errorMessage", e.getMessage());
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/ChattingSendAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ChattingSendAjax(@RequestParam HashMap<String, String> params, HttpServletRequest request,
			ModelAndView modelAndView) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iChattingService.getChatSend(params);

			modelMap.put("res", "SUCCESS");
			modelMap.put("message", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
			modelMap.put("message", CommonProperties.RESULT_ERROR);
			modelMap.put("errorMessage", e.getMessage());
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/readAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String readAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int read = iChattingService.updateChat(params);
			if (read > 0) {
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

	@RequestMapping(value = "/chatReadCntAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String chatReadCntAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		params.put("sEmpNo", String.valueOf(session.getAttribute("sEmpNo")));
		int Cnt = iChattingService.chatReadCnt(params);

		modelMap.put("Cnt", Cnt);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/ChatDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ChatDeleteAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int del = iChattingService.deleteChat(params);
			if (del > 0) {
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

	@RequestMapping(value = "/GroupChattingAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String GroupChattingAjax(@RequestParam HashMap<String, String> params, HttpSession session, @RequestParam String addEmp,
			@RequestParam String addEmpNm, HttpServletRequest request, ModelAndView modelAndView) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			String getChatRoomNO = iChattingService.getChatRoomNO();

			params.put("chatroom", getChatRoomNO);
			
			modelMap.put("chatroom", getChatRoomNO);

			String ctitle = "";

			ctitle = addEmpNm;
			
			ctitle +="," + String.valueOf(session.getAttribute("sEmpNm"));
			
			ctitle = ctitle.substring(1);

			params.put("chatroompersnm", ctitle);

			iChattingService.getChatRoom(params);

			String ctitle2[];

			ctitle2 = addEmp.substring(1).split(",");

			for (int i = 0; i < ctitle2.length; i++) {
				params.put("empno", ctitle2[i]);
				iChattingService.getChatRoomPers(params);

			}
			params.put("empno", String.valueOf(session.getAttribute("sEmpNo")));
			iChattingService.getChatRoomPers(params);
			System.out.println("sEmpNo");

			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
			modelMap.put("errorMessage", e.getMessage());
		}

		return mapper.writeValueAsString(modelMap);
	}

}
