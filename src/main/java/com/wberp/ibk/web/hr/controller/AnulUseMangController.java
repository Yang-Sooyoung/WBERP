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
import com.wberp.ibk.web.gw.service.IApprovalService;
import com.wberp.ibk.web.hr.service.IAnulUseMangService;

@Controller
public class AnulUseMangController {
	@Autowired
	public IAnulUseMangService iAnulUseService;

	@Autowired
	public IApprovalService iApprovalService;
	
	@Autowired
	public IPagingService iPagingService;

	@RequestMapping(value = "/anulUseMang")
	public ModelAndView anulUseMang(@RequestParam HashMap<String, String> params, 
								 ModelAndView mav) throws Throwable {
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);

		mav.setViewName("hr/anulUseMang");

		return mav;
	}
	
	@RequestMapping(value = "/anulUseMangAjax", 
			method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String anulUseMangAjax(@RequestParam HashMap<String, String> params)
															throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iAnulUseService.getAnulUseCnt(params);
		
		PagingBean pb 
		= iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iAnulUseService.getAnulUseList(params);
		
		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	 @RequestMapping(value = "/anulUseDetailContAjax", 
			 method = RequestMethod.POST, produces = "text/json;charset=UTF-8" ) 
	   @ResponseBody
	   public String anulUseDetailContAjax(@RequestParam HashMap<String, String> params)
			   															throws Throwable{
	      ObjectMapper mapper = new ObjectMapper();
	      Map<String, Object> modelMap = new HashMap <String, Object>();
	      
	      HashMap<String, String> anuluse = iAnulUseService.getAnulUseDetailCont(params);
	      modelMap.put("anuluse", anuluse);
	      
	      return mapper.writeValueAsString(modelMap);
	      
	   }
	 
	 @RequestMapping(value = "/anulUseAddAjax", 
			 method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String anulUseAddAjax(@RequestParam HashMap<String, String> params) 
																	  throws Throwable {
		 	ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			String gbnNo = (String) iAnulUseService.nextVar(params);
			
			try {
				String html = "";
				
				html += "<table style=\"border-collapse: collapse;\r\n" + 
						"text-align: center;\r\n" + "width: 450px !important;\r\n" +
						"border-color: #c2c2c2;\r\n" + "height: 43px !important;\r\n" +
						"font-size: 10pt;\">";
				html += "<tr style=\"height: 40px;\r\n" + 
						"	border-top: 1px solid #c2c2c2;\" name=\"" + gbnNo + "\">";
				html += "<th style=\"font-size: 10pt;\r\n" + "font-weight: bold;\r\n" + 
						"	background-color: #e4eaf2;\r\n" + "width: 150px;\r\n" + 
						"	display: table-cell;\r\n" + "text-align: center;\r\n" + 
						"	vertical-align: middle;\">" + "사원번호" + "</th>";
				html += "<td style=\"font-size: 10pt;\r\n" + "width: 300px;\r\n" + 
						"	display: inline-block;\r\n" + 
						"	padding: 0px 5px;\">"
						+ params.get("sEmpNo")
						+ "</td>";
				html += "</tr>";
				html += "<tr style=\"height: 40px;\r\n" + 
						"	border-top: 1px solid #c2c2c2;\">";
				html += "<th style=\"font-size: 10pt;\r\n" + "font-weight: bold;\r\n" + 
						"	background-color: #e4eaf2;\r\n" + "width: 150px;\r\n" + 
						"	display: table-cell;\r\n" + "text-align: center;\r\n" + 
						"	vertical-align: middle;\">" + "성명" + "</th>";
				html += "<td style=\"font-size: 10pt;\r\n" + "width: 300px;\r\n" + 
						"	display: inline-block;\r\n" + 
						"	padding: 0px 5px;\">"
						+ params.get("sEmpNm")
						+ "</td>";
				html += "</tr>";
				html += "<tr style=\"height: 40px;\r\n" + 
						"	border-top: 1px solid #c2c2c2;\">";
				html += "<th style=\"font-size: 10pt;\r\n" + "font-weight: bold;\r\n" + 
						"	background-color: #e4eaf2;\r\n" + "width: 150px;\r\n" + 
						"	display: table-cell;\r\n" + "text-align: center;\r\n" + 
						"	vertical-align: middle;\">" + "부서" + "</th>";
				html += "<td style=\"font-size: 10pt;\r\n" + "width: 300px;\r\n" + 
						"	display: inline-block;\r\n" + 
						"	padding: 0px 5px;\">"
						+ params.get("sDeptNm")
						+ "</td>";
				html += "</tr>";
				html += "<tr style=\"height: 40px;\r\n" + 
						"	border-top: 1px solid #c2c2c2;\">";
				html += "<th style=\"font-size: 10pt;\r\n" + "font-weight: bold;\r\n" + 
						"	background-color: #e4eaf2;\r\n" + "width: 150px;\r\n" + 
						"	display: table-cell;\r\n" + "text-align: center;\r\n" + 
						"	vertical-align: middle;\">" + "직급" + "</th>";
				html += "<td style=\"font-size: 10pt;\r\n" + "width: 300px;\r\n" + 
						"	display: inline-block;\r\n" + 
						"	padding: 0px 5px;\">"
						+ params.get("sPosnNm")
						+ "</td>";
				html += "</tr>";
				html += "<tr style=\"height: 40px;\r\n" + 
						"	border-top: 1px solid #c2c2c2;\">";
				html += "<th style=\"font-size: 10pt;\r\n" + "font-weight: bold;\r\n" + 
						"	background-color: #e4eaf2;\r\n" + "width: 150px;\r\n" + 
						"	display: table-cell;\r\n" + "text-align: center;\r\n" + 
						"	vertical-align: middle;\">" + "휴가코드설명" + "</th>";
				html += "<td style=\"font-size: 10pt;\r\n" + "width: 300px;\r\n" + 
						"	display: inline-block;\r\n" + 
						"	padding: 0px 5px;\">"
						+ params.get("vact_code_expn1")
						+ "</td>";
				html += "</tr>";
				html += "<tr style=\"height: 40px;\r\n" + 
						"	border-top: 1px solid #c2c2c2;\">";
				html += "<th style=\"font-size: 10pt;\r\n" + "font-weight: bold;\r\n" + 
						"	background-color: #e4eaf2;\r\n" + "width: 150px;\r\n" + 
						"	display: table-cell;\r\n" + "text-align: center;\r\n" + 
						"	vertical-align: middle;\">" + "내용" + "</th>";
				html += "<td style=\"font-size: 10pt;\r\n" + "width: 300px;\r\n" + 
						"	display: inline-block;\r\n" + 
						"	padding: 0px 5px;\">"
						+ params.get("cont1")
						+ "</td>";
				html += "</tr>";
				html += "<tr style=\"height: 40px;\r\n" + 
						"	border-top: 1px solid #c2c2c2;\">";
				html += "<th style=\"font-size: 10pt;\r\n" + "font-weight: bold;\r\n" + 
						"	background-color: #e4eaf2;\r\n" + "width: 150px;\r\n" + 
						"	display: table-cell;\r\n" + "text-align: center;\r\n" + 
						"	vertical-align: middle;\">" + "등록일" + "</th>";
				html += "<td style=\"font-size: 10pt;\r\n" + "width: 300px;\r\n" + 
						"	display: inline-block;\r\n" + 
						"	padding: 0px 5px;\">"
						+ params.get("reg_day1")
						+ "</td>";
				html += "</tr>";
				html += "<tr style=\"height: 40px;\r\n" + 
						"	border-top: 1px solid #c2c2c2;\">";
				html += "<th style=\"font-size: 10pt;\r\n" + "font-weight: bold;\r\n" + 
						"	background-color: #e4eaf2;\r\n" + "width: 150px;\r\n" + 
						"	display: table-cell;\r\n" + "text-align: center;\r\n" + 
						"	vertical-align: middle;\">" + "시작일" + "</th>";
				html += "<td style=\"font-size: 10pt;\r\n" + "width: 300px;\r\n" + 
						"	display: inline-block;\r\n" + 
						"	padding: 0px 5px;\">"
						+ params.get("start_day1")
						+ "</td>";
				html += "</tr>";
				html += "<tr style=\"height: 40px;\r\n" + 
						"	border-top: 1px solid #c2c2c2;\">";
				html += "<th style=\"font-size: 10pt;\r\n" + "font-weight: bold;\r\n" + 
						"	background-color: #e4eaf2;\r\n" + "width: 150px;\r\n" + 
						"	display: table-cell;\r\n" + "text-align: center;\r\n" + 
						"	vertical-align: middle;\">" + "종료일" + "</th>";
				html += "<td style=\"font-size: 10pt;\r\n" + "width: 300px;\r\n" + 
						"	display: inline-block;\r\n" + 
						"	padding: 0px 5px;\">"
						+ params.get("end_day1")
						+ "</td>";
				html += "</tr>";
				html += "<tr style=\"height: 40px;\r\n" + 
						"	border-top: 1px solid #c2c2c2;\">";
				html += "<th style=\"font-size: 10pt;\r\n" + "font-weight: bold;\r\n" + 
						"	background-color: #e4eaf2;\r\n" + "width: 150px;\r\n" + 
						"	display: table-cell;\r\n" + "text-align: center;\r\n" + 
						"	vertical-align: middle;\">" + "일수" + "</th>";
				html += "<td style=\"font-size: 10pt;\r\n" + "width: 300px;\r\n" + 
						"	display: inline-block;\r\n" + 
						"	padding: 0px 5px;\">"
						+ params.get("day_cnt1")
						+ "</td>";
				html += "</tr>";
				html += "</table>";
				
				iApprovalService.PublicAppAdd(gbnNo, params.get("sEmpNo"),params.get("athrno"), params.get("type"), html, params.get("type"));
				
				params.put("anul_use_no", gbnNo);
				iAnulUseService.anulUseAdd(params);
				 
				modelMap.put("res", "SUCCESS");
			} catch (Exception e) {
				e.printStackTrace();
				modelMap.put("res", "EXCEPTION");
			}
			
			return mapper.writeValueAsString(modelMap);
		}
		
		@RequestMapping(value = "/anulUseUpdateAjax", 
				method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String anulUseUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();

			try {
				int cnt = iAnulUseService.anulUseUpdate(params);
				
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
		
		@RequestMapping(value = "/anulUseDeleteAjax", 
				method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String anulUseDeleteAjax(@RequestParam HashMap<String, String> params) 
																	   throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			try {
				int cnt = iAnulUseService.anulUseDelete(params);
				
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
