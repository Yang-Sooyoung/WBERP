package com.wberp.ibk.web.gw.controller;

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
import com.wberp.ibk.web.gw.service.IBoardService;

@Controller
public class BoardController {
	@Autowired
	public IBoardService iBoardService;

	@Autowired
	public IPagingService iPagingService;

	// 게시판 관리 페이지
	@RequestMapping(value = "/gwBoardManage")
	public ModelAndView boardMang(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		List<HashMap<String, String>> list = iBoardService.getBoardMang(params);

		mav.addObject("list", list);

		mav.setViewName("gw/board/gwBoardManage");

		return mav;
	}

	// 게시판 관리 페이지 ajax
	@RequestMapping(value = "/boardMangAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String boardMangAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> list = iBoardService.getBoardMang(params);

		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}

	// 게시판 목록
	@RequestMapping(value = "/gwBoard")
	public ModelAndView board(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}

		mav.addObject("page", page);

		mav.setViewName("gw/board/gwBoard");

		return mav;
	}

	// 게시판 목록 페이지
	@RequestMapping(value = "/boardAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String boardAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iBoardService.getBoardCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 3);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iBoardService.getBoard(params);

		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);

		return mapper.writeValueAsString(modelMap);
	}

	// 관리페이지 추가
	@RequestMapping(value = "/addAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String addAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iBoardService.addAjax(params);

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

	// 호출 아작스
	@RequestMapping(value = "/loadAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String loadAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> list = iBoardService.ajaxBoard(params);

		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}

	// 관리페이지 삭제
	@RequestMapping(value = "/delAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String delAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iBoardService.delAjax(params);

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

	// 전사게시판 상세페이지
	@RequestMapping(value = "/gwBoardDetail")
	public ModelAndView gwBoardDetail(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		iBoardService.gwBoardHit(params);

		HashMap<String, String> data = iBoardService.gwBoardDetail(params);

		HashMap<String, String> filedata = iBoardService.gwBoardFileDetail(params);

		mav.addObject("data", data);

		mav.addObject("filedata", filedata);

		mav.setViewName("gw/board/gwBoardDetail");

		return mav;
	}

	// 전사게시판 수정 파일 추가
	@RequestMapping(value = "/gwFileAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String gwFileAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			if (!params.get("docmatchfilenm").equals("")) {
				iBoardService.gwBoardFile2(params);
			}

			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);

	}

	// 전사게시판 삭제
	@RequestMapping(value = "/boardDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String boardDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iBoardService.gwBoardDelete(params);
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

	// 전사게시판 추가
	@RequestMapping(value = "/gwBoardAdd")
	public ModelAndView gwBoardAdd(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		mav.setViewName("gw/board/gwBoardAdd");

		return mav;
	}

	// 전사게시판 추가
	@RequestMapping(value = "/gwBoardAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String gwBoardAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		String BOARD_NO = iBoardService.getBoardNo();
		params.put("BOARD_NO", BOARD_NO);

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iBoardService.gwBoardAdd(params);
			if (!params.get("docmatchfilenm").equals("")) {
				iBoardService.gwBoardFile(params);
			}
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);

	}

	// 전사게시판 수정
	@RequestMapping(value = "/gwBoardUpdate")
	public ModelAndView gwBoardUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		HashMap<String, String> data = iBoardService.gwBoardDetail(params);

		HashMap<String, String> filedata = iBoardService.gwBoardFileDetail(params);

		mav.addObject("data", data);

		mav.addObject("filedata", filedata);

		mav.setViewName("gw/board/gwBoardUpdate");

		return mav;
	}

	// 전사게시판 수정
	@RequestMapping(value = "/gwBoardUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String gwBoardUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iBoardService.boardUpdate(params);

			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}

	// 전사게시판 파일 삭제
	@RequestMapping(value = "/fileDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String fileDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iBoardService.fileDelete(params);
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

	// 즐겨찾기
	@RequestMapping(value = "/gwBoardBokAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String gwBoardBokAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iBoardService.getBokcnt(params);

		PagingBean favPb = iPagingService.getPagingBean(Integer.parseInt(params.get("favPage")), cnt, 10, 5);

		params.put("startCnt", Integer.toString(favPb.getStartCount()));
		params.put("endCnt", Integer.toString(favPb.getEndCount()));

		List<HashMap<String, String>> list = iBoardService.getBokBoard(params);

		modelMap.put("favPb", favPb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}

	// 별 모양 버튼 클릭시 변환
	@RequestMapping(value = "/gwBokImgAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String gwBokImgAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iBoardService.getBokImg(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}

	// 즐겨찾기 해제
	@RequestMapping(value = "/bokCancleAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String bokCancleAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iBoardService.getBokCancel(params);
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

	// 한줄게시판
	@RequestMapping(value = "/gwOneBoard")
	public ModelAndView OB(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}

		mav.addObject("page", page);

		mav.setViewName("gw/board/gwOneBoard");

		return mav;
	}

	// 한줄게시판 목록
	@RequestMapping(value = "/gwOneBoardAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String gwOneBoardAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iBoardService.getObCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iBoardService.getOb(params);

		modelMap.put("pb", pb);
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);

		return mapper.writeValueAsString(modelMap);
	}

	// 한줄게시판 추가
	@RequestMapping(value = "/addObAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String addObAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iBoardService.addOneBoard(params);

			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);

	}

	// 한줄게시판 삭제
	@RequestMapping(value = "/deleteObAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String deleteObAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iBoardService.deleteOb(params);

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

	// 게시판 수정을 위한 상세페이지
	@RequestMapping(value = "/detailObAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String detailObAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		HashMap<String, String> data = iBoardService.oneDetail(params);

		modelMap.put("data", data);

		return mapper.writeValueAsString(modelMap);
	}

	// 한줄게시판 수정
	@RequestMapping(value = "/updateObAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String updateObAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iBoardService.oneUpdate(params);

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

}
