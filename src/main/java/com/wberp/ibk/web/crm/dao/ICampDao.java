package com.wberp.ibk.web.crm.dao;

import java.util.HashMap;
import java.util.List;

public interface ICampDao {

	public int getCampCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCamp(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCampArea() throws Throwable;

	public void addCamp(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCgList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getCgData(HashMap<String, String> params) throws Throwable;

	public void addCampCg(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getCampNo(HashMap<String, String> params) throws Throwable;

	public String getCampCgNum() throws Throwable;

	public void cgAreaAdd(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getTempList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getChanList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getTempConData(HashMap<String, String> params) throws Throwable;

	public int getSendTableCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSendTable(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getCampCgNo(HashMap<String, String> params) throws Throwable;

	public void addCgChanTemp(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSimulData(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCampCustList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getCustCountData(HashMap<String, String> params) throws Throwable;

	public void addCampCust(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getCampDetail(HashMap<String, String> params) throws Throwable;

	public void cgChanAdd(HashMap<String, String> params) throws Throwable;

	public String getCampNum() throws Throwable;

	public int campUpdate(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getCampDept(HashMap<String, String> params) throws Throwable;

	public int custGroupUpdate(HashMap<String, String> params) throws Throwable;

	public int custGroupAreaUpdate(HashMap<String, String> params) throws Throwable;

	public int custGroupChanUpdate(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCampChanTypeList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, Object> getKakaoRectWhet(HashMap<String, String> params) throws Throwable;

	public HashMap<String, Object> getSmsRectWhet(HashMap<String, String> params) throws Throwable;

	public HashMap<String, Object> getEmailRectWhet(HashMap<String, String> params) throws Throwable;

	public void updateCampCust(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getChanDetail(HashMap<String, String> params) throws Throwable;

	public void custGroupChanDelete(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getChanList2(HashMap<String, String> params) throws Throwable;

	public int campCustDelete(HashMap<String, String> params) throws Throwable;

	public void updateStat(HashMap<String, String> params) throws Throwable;

}
