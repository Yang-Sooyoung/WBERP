package com.wberp.ibk.web.gw.dao;

import java.util.HashMap;
import java.util.List;

public interface IApprovalDao {

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

	public int getAppSnedCnt_end(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAppSendList_end(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAppResn(HashMap<String, String> params) throws Throwable;

	public void PublicAppAdd(HashMap<String, String> params) throws Throwable;

	public String getAppNo() throws Throwable;

	public String getAppFileNo() throws Throwable;

	public String getAppModeNo() throws Throwable;

	public String returnPublicApp(HashMap<String, String> params) throws Throwable;

	public void campAprvSuc(HashMap<String, String> etcno) throws Throwable;

	public void anulUseAprvSuc(HashMap<String, String> etcno) throws Throwable;

	public void campAprvRepy(HashMap<String, String> etcno) throws Throwable;

	public void anulUseAprvRepy(HashMap<String, String> etcno) throws Throwable;

	public void addNotice(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getEmpList(HashMap<String, String> params) throws Throwable;

	public int getEmpCnt(HashMap<String, String> params) throws Throwable;

}
