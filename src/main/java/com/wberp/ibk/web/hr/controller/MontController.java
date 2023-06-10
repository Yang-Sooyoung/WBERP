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
import com.wberp.ibk.web.hr.service.IMontService;

@Controller
public class MontController {
	@Autowired
	public IMontService iMontService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@Autowired
	public IApprovalService iApprovalService;
	
	@RequestMapping(value = "/MontSortSalList")
	public ModelAndView MontSortSalList(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		mav.addObject("page", page);

		mav.setViewName("hr/MontSortSalList");
		return mav;
	}
		
	@RequestMapping(value = "/MontSortSalListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String MontSortSalListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iMontService.getMontCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iMontService.getMontList(params);

		modelMap.put("pb", pb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/montDetail")
	public ModelAndView montDetail(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		HashMap<String, String> mont = iMontService.getMont(params);
		
		mav.addObject("mont", mont);
		
		mav.setViewName("hr/montDetail");
		
		return mav;
	}
	
	@RequestMapping(value = "/montDetailAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String montDetailAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iMontService.getMontDetailCnt(params);

		List<HashMap<String, String>> list = iMontService.getCodeList(params);

		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/montUpdate")
	public ModelAndView montUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		HashMap<String, String> mont = iMontService.getMont(params);
		
		mav.addObject("mont", mont);
		
		mav.setViewName("hr/montUpdate");
		
		return mav;
	}
	
	@RequestMapping(value = "/montUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String montUpdateAjax(@RequestParam HashMap<String, String> params, @RequestParam(value = "sal_code", required = false) List<String> salCodeList, 
								@RequestParam(value = "price", required = false) List<String> salPriceList) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		System.out.println(salCodeList);
		try {
			for(int i= 0 ; i < salCodeList.size(); i++) {
				if(!salCodeList.get(i).equals("")) {
					params.put("sal_code",salCodeList.get(i));
					params.put("price",salPriceList.get(i));
					iMontService.montUpdate(params);
				}
			}
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "EXCEPTION");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/apprBtnAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String apprBtnAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			
			String gbnNo = (String) iMontService.date(params);
			String sal = (String) iMontService.sal(params);
			
			String html = "";
			
			html += "<table style=\"border-collapse: collapse;\r\n" + 
					"text-align: center;\r\n" + "width: 450px !important;\r\n" +
					"border-color: #c2c2c2;\r\n" + "height: 43px !important;\r\n" +
					"font-size: 10pt;\">";
			html += "<tr style=\"height: 40px;\r\n" + 
					"	border-top: 1px solid #c2c2c2;\">";
			html += "<th style=\"font-size: 10pt;\r\n" + "font-weight: bold;\r\n" + 
					"	background-color: #e4eaf2;\r\n" + "width: 150px;\r\n" + 
					"	display: table-cell;\r\n" + "text-align: center;\r\n" + 
					"	vertical-align: middle;\">" + "월간급여결재(월별)" + "</th>";
			html += "<td style=\"font-size: 10pt;\r\n" + "width: 300px;\r\n" + 
					"	display: inline-block;\r\n" + 
					"	padding: 0px 5px;\">"
					+ gbnNo
					+ "</td>";
			html += "</tr>";
			html += "<tr style=\"height: 40px;\r\n" + 
					"	border-top: 1px solid #c2c2c2;\">";
			html += "<th style=\"font-size: 10pt;\r\n" + "font-weight: bold;\r\n" + 
					"	background-color: #e4eaf2;\r\n" + "width: 150px;\r\n" + 
					"	display: table-cell;\r\n" + "text-align: center;\r\n" + 
					"	vertical-align: middle;\">" + "결재금액" + "</th>";
			html += "<td style=\"font-size: 10pt;\r\n" + "width: 300px;\r\n" + 
					"	display: inline-block;\r\n" + 
					"	padding: 0px 5px;\">"
					+ sal
					+ "</td>";
			html += "</tr>";
			html += "<th style=\"font-size: 10pt;\r\n" + "font-weight: bold;\r\n" + 
					"	background-color: #e4eaf2;\r\n" + "width: 150px;\r\n" + 
					"	display: table-cell;\r\n" + "text-align: center;\r\n" + 
					"	vertical-align: middle;\">" + "자세히 보기" + "</th>";
			html += "<td style=\"font-size: 10pt;\r\n" + "width: 300px;\r\n" + 
					"	display: inline-block;\r\n" + 
					"	padding: 0px 5px;\">"+ 
					"<form action=\"MontSortSalList\" id=\"salForm\" method=\"post\">\r\n" + 
					"			<input type=\"hidden\" id=\"top\" name=\"top\" value=\"2\" />\r\n" + 
					"			<input type=\"hidden\" id=\"menuNo\" name=\"menuNo\" value=\"34\" />"+
					"			<input type=\"button\" id=\"mv\" name=\"mv\" value=\"이동하기\" />"+
					"</form>" +
					"<script type=\"text/javascript\">" +
					"$(document).ready(function() {" +
					"$(\"#mv\").on(\"click\", function() {" +
					"$(\"#salForm\").attr(\"action\", \"MontSortSalList\");\r\n" + 
					"			$(\"#salForm\").submit();" +
					"});" +
					"});" +
					"</script>"
					+ "</td>";
			html += "</tr>";
			html += "</table>";
			
			iApprovalService.PublicAppAdd(gbnNo, params.get("empno"),params.get("athrno"),params.get("title"),html,params.get("type"));
			iMontService.getMont(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "EXCEPTION");
		}
			
		return mapper.writeValueAsString(modelMap);
	}
}
