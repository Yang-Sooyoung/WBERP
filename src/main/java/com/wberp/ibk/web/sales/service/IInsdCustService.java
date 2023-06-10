package com.wberp.ibk.web.sales.service;

import java.util.HashMap;
import java.util.List;

public interface IInsdCustService {

	public int getInsdCustCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getInsdCustList(HashMap<String, String> params)throws Throwable;

	public void CustComAdd(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getCustCom(HashMap<String, String> params)throws Throwable;

	public int CustComDelete(HashMap<String, String> params)throws Throwable;

	public int getCustGodsCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getCustGodsList(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getCustComUpdate(HashMap<String, String> params)throws Throwable;

	public int updateCustCom(HashMap<String, String> params)throws Throwable;

	public int getInsdCustCnt2(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getInsdCustList2(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getCustDetail(HashMap<String, String> params)throws Throwable;

	public int CustDelete(HashMap<String, String> params)throws Throwable;

	public void CustAdd(HashMap<String, Object> susin)throws Throwable;

	public int updateCust(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getCust(HashMap<String, String> params)throws Throwable;

	public int updateOpnn(HashMap<String, String> params)throws Throwable;

	public int getopnnCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getopnnList(HashMap<String, String> params)throws Throwable;

	public void OpnAdd(HashMap<String, String> params)throws Throwable;

	public int getCustListPopCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getCustListPop(HashMap<String, String> params)throws Throwable;

	public int getCustComCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getCustComList(HashMap<String, String> params)throws Throwable;

	public String nextVar(HashMap<String, String> params)throws Throwable;




}
