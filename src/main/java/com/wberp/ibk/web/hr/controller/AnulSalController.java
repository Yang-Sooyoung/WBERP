package com.wberp.ibk.web.hr.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wberp.ibk.common.bean.PagingBean;
import com.wberp.ibk.common.service.IPagingService;
import com.wberp.ibk.web.hr.service.IAnulSalService;

@Controller
public class AnulSalController {
	@Autowired
	public IAnulSalService iAnulSalService;

	@Autowired
	public IPagingService iPagingService;

	@RequestMapping(value = "/anulSalMangList")
	public ModelAndView anulSalList(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		mav.addObject("page", page);

		mav.setViewName("hr/anulSalMangList");
		return mav;
	}

	@RequestMapping(value = "/anulSalMangListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String anulSalMangListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iAnulSalService.getAnulSalCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iAnulSalService.getAnulSalList(params);

		modelMap.put("pb", pb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}

	@ResponseBody
	@RequestMapping(value = "/excelUploadAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String excelUploadAjax(MultipartFile testFile, MultipartHttpServletRequest request) throws Exception {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		System.out.println("업로드 진행");

		MultipartFile excelFile = request.getFile("excelFile");

		if (excelFile == null || excelFile.isEmpty()) {
			throw new RuntimeException("엑셀파일을 선택해주세요.");
		}

		File destFile = new File("C:\\upload\\" + excelFile.getOriginalFilename());

		try {
			// 내가 설정한 위치에 내가 올린 파일을 만들고
			excelFile.transferTo(destFile);
			
			// 업로드를 진행하고 다시 지우기 
			iAnulSalService.excelUpload(destFile);
			// destFile.delete();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		

		return mapper.writeValueAsString(modelMap);
	}

}
