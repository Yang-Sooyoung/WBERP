package com.wberp.ibk.web.gw.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

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
import com.wberp.ibk.batch.service.ICampBatchService;
import com.wberp.ibk.common.bean.PagingBean;
import com.wberp.ibk.common.service.IPagingService;
import com.wberp.ibk.web.gw.service.IApprovalService;


@Controller
public class ApprovalController {
	
	@Autowired IApprovalService iApprovalService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@Autowired
	public ICampBatchService iCampBatchService;
	@RequestMapping(value = "/gwApp") // 결재 메뉴화면
	public ModelAndView gwApp(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		mav.addObject("page", page);
		
		mav.setViewName("gw/approval/gwApp"); 
		
		return mav;
	}
	
	@RequestMapping(value = "/gwAppAdd") // 결재 추가화면
	public ModelAndView gwAppAdd(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		mav.addObject("page", page);
		
		HashMap<String, String> mode = iApprovalService.getAprvMode(params);
		
		mav.addObject("mode", mode);
		
		mav.setViewName("gw/approval/gwAppAdd");
		
		return mav;
	}
	
	@RequestMapping(value = "AppAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") // 결재추가Ajax
	@ResponseBody
	public String AppAddAjax(@RequestParam HashMap<String, String> params, @RequestParam List<String> appathr,
			@RequestParam List<String> appref) throws Throwable {
		
		String aprvno = iApprovalService.getAppNo();
		params.put("aprvno",aprvno);
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iApprovalService.addApp(params);
			for(int i = 0; i < appathr.size(); i++){
				if(appathr.get(i)!=null&&appathr.get(i)!="") {
					HashMap<String, String> paramAthr = new HashMap<String, String>();
					paramAthr.put("aprvno", aprvno);
					paramAthr.put("appathr", appathr.get(i));
					iApprovalService.addAppAthr(paramAthr);
				}
			}
			
			if(appref.get(0)!=null) {
				for(int i = 0; i < appref.size(); i++) {
					if(appref.get(i)!=null && appref.get(i)!="") {
						HashMap<String, String> paramRef = new HashMap<String, String>();
						paramRef.put("aprvno", aprvno);
						paramRef.put("appref", appref.get(i));
						iApprovalService.addAppRef(paramRef);
					}
				}
			}
			
			if(params.get("docmatchfilenm")!=null && !params.get("docmatchfilenm").equals("")) {
				
				String aprvfileno = iApprovalService.getAppFileNo();
				params.put("aprvfileno",aprvfileno);
				iApprovalService.addAppFile(params);
			}
			for(int i = 0; i < appathr.size(); i++){
				if(appathr.get(i)!=null&&appathr.get(i)!="") {
					params.put("appathr", appathr.get(i));
					iApprovalService.addNotice(params);
				}
			}
			
			modelMap.put("res", "SUCCESS");
			
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	@RequestMapping(value = "empListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")//수신함목록(요청)Ajax
	@ResponseBody
	public String empListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iApprovalService.getEmpCnt(params);
		
		PagingBean pb
		= iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt,5,5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iApprovalService.getEmpList(params);
		
		modelMap.put("pb", pb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/gwAppRecp") // 수신함 메인화면
	public ModelAndView gwAppRecp(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		
		mav.setViewName("gw/approval/gwAppRecp");
		
		return mav;
	}
	
	@RequestMapping(value = "AppRecpListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") //수신함목록Ajax
	@ResponseBody
	public String AppRecpListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iApprovalService.getAppErcpCnt(params);

		PagingBean pb
		= iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt,5,5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iApprovalService.getAppErcpList(params);

		modelMap.put("pb", pb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "AppRecpList_reqAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")//수신함목록(요청)Ajax
	@ResponseBody
	public String AppRecpList_reqAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iApprovalService.getAppErcpCnt_req(params);

		PagingBean pb
		= iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt,5,5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iApprovalService.getAppErcpList_req(params);

		modelMap.put("pb", pb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "AppRecpList_refAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")//수신함목록(반려)Ajax
	@ResponseBody
	public String AppRecpList_refAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iApprovalService.getAppErcpCnt_ref(params);

		PagingBean pb
		= iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt,5,5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iApprovalService.getAppErcpList_ref(params);

		modelMap.put("pb", pb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "AppRecpList_admAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")//수신함목록(승인)Ajax
	@ResponseBody
	public String AppRecpList_admAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iApprovalService.getAppErcpCnt_adm(params);

		PagingBean pb
		= iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iApprovalService.getAppErcpList_adm(params);

		modelMap.put("pb", pb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value ="/gwAppRecpDetail")//수신함 상세보기 화면
	public ModelAndView gwAppRecpDetail(@RequestParam HashMap<String, String> params,
									ModelAndView mav) throws Throwable {
		
		List<HashMap<String, String>> aprv = iApprovalService.getApp(params);
		HashMap<String, String> file = iApprovalService.getAppFile(params);
		HashMap<String, String> stat = iApprovalService.getAppStat(params);
		
		mav.addObject("aprv", aprv);	
		mav.addObject("file", file);
		mav.addObject("stat", stat);
		
		mav.setViewName("gw/approval/gwAppRecpDetail");
		
		return mav;
	}
	
	@RequestMapping(value = "AppSucAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")//수신함상세보기Ajax 
	@ResponseBody
	public String AppSucAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iApprovalService.aprvSuc(params);
			if(cnt > 0) {
				List<HashMap<String, String>> aprv = iApprovalService.getApp(params);
				System.out.println(aprv.get(0));
				if((aprv.get(0).get("APRV_TYPE")).equals("캠페인 등록")) {
					iApprovalService.campAprvSuc(aprv.get(0));
					aprv.get(0).get("APRV_TITLE"); //제목
					
					params.put("campno",String.valueOf(aprv.get(0).get("APRV_ETCNO"))); //캠페인 번호 넣기
					HashMap<String, String> campHash = iCampBatchService.getCampAprv(params); // 캠페인 테이블(발송일(시작일),캠페인 번호,상태번호)
					List<HashMap<String, String>> campCust = iCampBatchService.getCampCust(params);//캠페인고객 테이블(고객번호,채널번호)
					 HashMap<String, String> sendData = new HashMap<String, String>();
					
					for(int i=0; i<campCust.size();i++) {
						String custNo = String.valueOf(campCust.get(i).get("CUST_NO"));
						HashMap<String, String> custParam =  new HashMap<String, String>();
						custParam.put("custNo",custNo);
						HashMap<String, String> list = iCampBatchService.getCustPhone(custParam);
						sendData.put("phoneNo",list.get("CELL_NO")); //고객 전화번호
						sendData.put("title",aprv.get(0).get("APRV_TITLE")); //제목
						sendData.put("cont","cont"); //내용(템플릿으로 수정 필요 , 포기! 안해!)
						sendData.put("perd",campHash.get("START_PERD")); //발송일
						sendData.put("campno",String.valueOf(campHash.get("CAMP_NO"))); //기타1 캠페인번호
						sendData.put("stat", "4");//기타2 상태번호
						if(String.valueOf(campCust.get(i).get("CHAN_TYPE_NO")).equals("2")) {	//카카오톡
							sendData.put("table1","KAKAO_SEND");
							sendData.put("sendno","KAKAO_SEND_NO");
							sendData.put("seqno","KAKAO_SEND_SEQ.NEXTVAL");
							
							iCampBatchService.addSendData(sendData);
						}
						if(String.valueOf(campCust.get(i).get("CHAN_TYPE_NO")).equals("1")) {	//SNS
							sendData.put("table1","MSG_SEND");
							sendData.put("sendno","MSG_SEND_NO");
							sendData.put("seqno","MSG_SEND_SEQ.NEXTVAL");
							
							iCampBatchService.addSendData(sendData);
						}
						if(String.valueOf(campCust.get(i).get("CHAN_TYPE_NO")).equals("4")) {	//E-MAIL
							sendData.put("table1","EMAIL_SEND");
							sendData.put("sendno","EMAIL_SEND_NO");
							sendData.put("seqno","EMAIL_SEND_SEQ.NEXTVAL");
							
							iCampBatchService.addSendData(sendData);
						}
					}
					
				} else if((aprv.get(0).get("APRV_TYPE")).equals("연차사용결재")) {
					iApprovalService.anulUseAprvSuc(aprv.get(0));
				}
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
	
	@RequestMapping(value = "AppRepyAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")//반려사유입력Ajax
	@ResponseBody
	public String AppRepyAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iApprovalService.aprvRepy(params);
			if(cnt > 0) {
				List<HashMap<String, String>> aprv = iApprovalService.getApp(params);
				if((aprv.get(0).get("APRV_TYPE")).equals("캠페인 등록")) {
					iApprovalService.campAprvRepy(aprv.get(0));
				} else if((aprv.get(0).get("APRV_TYPE")).equals("연차사용결재")) {
					iApprovalService.anulUseAprvRepy(aprv.get(0));
				}
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
	
	@RequestMapping(value = "/gwAppSend")//상신함화면
	public ModelAndView gwAppSend(@RequestParam HashMap<String, String> params,	ModelAndView mav) throws Throwable {
		
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		
		mav.setViewName("gw/approval/gwAppSend");
		
		return mav;
	}
	
	@RequestMapping(value = "AppSendListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")//상신함목록Ajax
	@ResponseBody
	public String AppSendListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iApprovalService.getAppSendCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iApprovalService.getAppSendList(params);

		modelMap.put("pb", pb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "AppSendList_ingAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")//상신함목록(진행중)Ajax
	@ResponseBody
	public String AppSendList_ingAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iApprovalService.getAppSendCnt_ing(params);

		PagingBean pb
		= iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt,5,5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iApprovalService.getAppSendList_ing(params);

		modelMap.put("pb", pb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "AppSendList_endAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")//상신함목록(완료)Ajax
	@ResponseBody
	public String AppSendList_endAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iApprovalService.getAppSendCnt_end(params);

		PagingBean pb
		= iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt,5,5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iApprovalService.getAppSendList_end(params);

		modelMap.put("pb", pb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value ="/gwAppSendDetail")//상신함 상세보기 화면
	public ModelAndView gwAppSendDetail(@RequestParam HashMap<String, String> params,ModelAndView mav) throws Throwable {
		
		List<HashMap<String, String>> aprv = iApprovalService.getApp(params);
		HashMap<String, String> file = iApprovalService.getAppFile(params);
		HashMap<String, String> stat = iApprovalService.getAppStat(params);
		List<HashMap<String, String>> resn = iApprovalService.getAppResn(params);
		
		
		mav.addObject("aprv", aprv);	
		mav.addObject("file", file);
		mav.addObject("stat", stat);
		mav.addObject("resn", resn);
		
		mav.setViewName("gw/approval/gwAppSendDetail");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/gwAppMode")//양식함목록 화면
	public ModelAndView gwAppMode(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		mav.addObject("page", page);
		
		mav.setViewName("gw/approval/gwAppMode");
		
		return mav;
	}
	
	@RequestMapping(value = "AppModeListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")//양식함목록Ajax
	@ResponseBody
	public String AppModeListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iApprovalService.getAprvModeCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt,5,5);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iApprovalService.getAprvModeList(params);

		modelMap.put("pb", pb);
		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/gwAppModeAdd")//양식함 추가 화면
	public ModelAndView gwAppModeAdd(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		mav.setViewName("gw/approval/gwAppModeAdd");
		
		return mav;
	}
	
	@RequestMapping(value = "AppModeAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")//양식함추가Ajax
	@ResponseBody
	public String AppModeAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		String aprvmodeno = iApprovalService.getAppModeNo();
		params.put("aprvmodeno",aprvmodeno);
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iApprovalService.addAppMode(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value ="/gwAppModeDetail")//양식 상세보기
	public ModelAndView gwAppModeDetail(@RequestParam HashMap<String, String> params,
									ModelAndView mav) throws Throwable {
		
		HashMap<String, String> mode = iApprovalService.getAprvMode(params);
		
		mav.addObject("mode", mode);
		
		mav.setViewName("gw/approval/gwAppModeDetail");
		
		return mav;
	}
	
	@RequestMapping(value ="/gwAppModeUpdate")//양식수정
	public ModelAndView gwAppModeUpdate(@RequestParam HashMap<String, String> params,
									ModelAndView mav) throws Throwable {
		
		HashMap<String, String> mode = iApprovalService.getAprvMode(params);
		
		mav.addObject("mode", mode);
		
		mav.setViewName("gw/approval/gwAppModeUpdate");
		
		return mav;
	}
	
	@RequestMapping(value = "AppModeUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")//양식수정Ajax
	@ResponseBody
	public String AppModeUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iApprovalService.updateAprvMode(params);
			
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
	
	@RequestMapping(value = "/AppModeDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")//양식삭제Ajax
	@ResponseBody
	public String AppModeDeleteAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iApprovalService.deleteAprvMdoe(params);
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
