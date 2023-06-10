package com.wberp.ibk.web.gw.service;

import java.util.HashMap;
import java.util.List;

public interface IApprovalService {

	public int addAppMode(HashMap<String, String> params) throws Throwable;

	public int getAprvModeCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAprvModeList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getAprvMode(HashMap<String, String> params) throws Throwable;

	public int deleteAprvMdoe(HashMap<String, String> params) throws Throwable;

	public int updateAprvMode(HashMap<String, String> params) throws Throwable;

	public void addApp(HashMap<String, String> params) throws Throwable;

	public void addAppRef(HashMap<String, String> params) throws Throwable;
	
	public void addAppAthr(HashMap<String, String> params) throws Throwable;

	public int getAppErcpCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAppErcpList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAppErcpList_req(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAppErcpList_ref(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAppErcpList_adm(HashMap<String, String> params) throws Throwable;

	public int getAppErcpCnt_req(HashMap<String, String> params) throws Throwable;
	
	public int getAppErcpCnt_ref(HashMap<String, String> params) throws Throwable;
	
	public int getAppErcpCnt_adm(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getApp(HashMap<String, String> params) throws Throwable;

	public void addAppFile(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getAppFile(HashMap<String, String> params) throws Throwable;
	
	public int aprvSuc(HashMap<String, String> params) throws Throwable;

	public int aprvRepy(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getAppStat(HashMap<String, String> params) throws Throwable;

	public int getAppSendCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAppSendList(HashMap<String, String> params) throws Throwable;

	public int getAppSendCnt_ing(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAppSendList_ing(HashMap<String, String> params) throws Throwable;

	public int getAppSendCnt_end(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAppSendList_end(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAppResn(HashMap<String, String> params) throws Throwable;
	
	/*다른화면 결재처리
	gbnNo = 해당결재번호(ex 캠페인등록이면 캠페인번호)
	empno = 사원번호
	athrno = 결재권자번호
	title = 결재제목
	cont = 결재내용
	type = 결재유형
	*/
	public void PublicAppAdd(String gbnNo, String empno, String athrno, String title, String cont, String type) throws Throwable; //공용결재함수
	
	public String returnPublicApp(String gbnNo) throws Throwable;  /*결재상태 돌려주는 함수
																   	 컬럼명 TYPE로 돌려줍니다. String타입으로  요청, 반려, 승인 다 구현해놨으니
																   	 메소드 호출하시고 TYPE로 돌려받으신거 객체이름정하셔서 넣고 쓰시면 됩니다
																	*/
	

	public String getAppNo() throws Throwable;

	public String getAppFileNo() throws Throwable;

	public String getAppModeNo() throws Throwable;

	public void campAprvSuc(HashMap<String, String> etcno) throws Throwable;

	public void anulUseAprvSuc(HashMap<String, String> etcno) throws Throwable;

	public void campAprvRepy(HashMap<String, String> etcno) throws Throwable;

	public void anulUseAprvRepy(HashMap<String, String> etcno) throws Throwable;

	public void addNotice(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getEmpList(HashMap<String, String> params) throws Throwable;

	public int getEmpCnt(HashMap<String, String> params) throws Throwable;

}
