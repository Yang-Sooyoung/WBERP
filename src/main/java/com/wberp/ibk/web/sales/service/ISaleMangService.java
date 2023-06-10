package com.wberp.ibk.web.sales.service;

import java.util.HashMap;
import java.util.List;

public interface ISaleMangService {

	public int getSaleMangListCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSaleMangList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getSaleMangDetail(HashMap<String, String> params) throws Throwable;

	public int getSugsTabCnt(HashMap<String, String> params) throws Throwable;
	
	public int getNegtTabCnt(HashMap<String, String> params) throws Throwable;
	
	public int getCotrTabCnt(HashMap<String, String> params) throws Throwable;
	
	public HashMap<String, String> getSugsTabList(HashMap<String, String> params) throws Throwable;
	
	public HashMap<String, String> getNegtTabList(HashMap<String, String> params) throws Throwable;
	
	public HashMap<String, String> getCotrTabList(HashMap<String, String> params) throws Throwable;
	
	public String getSugsNo() throws Throwable;
	
	public void sugsAdd1(HashMap<String, String> params) throws Throwable;
	
	public void sugsAdd2(HashMap<String, String> params) throws Throwable;

	public String getNegtNo() throws Throwable;

	public void negtAdd1(HashMap<String, String> params) throws Throwable;
	
	public void negtAdd2(HashMap<String, String> params) throws Throwable;

	public void negtAdd3(HashMap<String, String> params) throws Throwable;

	public String getCotrNo() throws Throwable;

	public void cotrAdd1(HashMap<String, String> params) throws Throwable;
	
	public void cotrAdd2(HashMap<String, String> params) throws Throwable;

	public void cotrAdd3(HashMap<String, String> params) throws Throwable;
	
	public void sugsUpdate1(HashMap<String, String> params) throws Throwable;
	
	public void sugsUpdate2(HashMap<String, String> params) throws Throwable;
	
	public void negtUpdate1(HashMap<String, String> params) throws Throwable;
	
	public void negtUpdate2(HashMap<String, String> params) throws Throwable;
	
	public void negtUpdate3(HashMap<String, String> params) throws Throwable;
	
	public void cotrUpdate1(HashMap<String, String> params) throws Throwable;

	public void cotrUpdate2(HashMap<String, String> params) throws Throwable;
	
	public void cotrUpdate3(HashMap<String, String> params) throws Throwable;

	public void commentAdd1(HashMap<String, String> params) throws Throwable;
	
	public void commentAdd2(HashMap<String, String> params) throws Throwable;
	
	public void commentAdd3(HashMap<String, String> params) throws Throwable;

	public int commentUpdate1(HashMap<String, String> params) throws Throwable;
	
	public int commentUpdate2(HashMap<String, String> params) throws Throwable;
	
	public int commentUpdate3(HashMap<String, String> params) throws Throwable;

	public int commentDelete(HashMap<String, String> params) throws Throwable;

	public int getSugsCommentCnt(HashMap<String, String> params) throws Throwable;

	public int getNegtCommentCnt(HashMap<String, String> params) throws Throwable;

	public int getCotrCommentCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSugsCommentList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getNegtCommentList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCotrCommentList(HashMap<String, String> params) throws Throwable;

	public void saleMangAdd(HashMap<String, String> params) throws Throwable;

	public int getSaleMangAddSearchCustCompCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSaleMangAddSearchCustComp(HashMap<String, String> params) throws Throwable;

	public int getSaleMangAddSearchInsdCustCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSaleMangAddSearchInsdCust(HashMap<String, String> params) throws Throwable;

	public int getSaleMangAddSearchGodsCnt1(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSaleMangAddSearchGods1(HashMap<String, String> params) throws Throwable;
	
	public int getSaleMangAddSearchGodsCnt2(HashMap<String, String> params) throws Throwable;
	
	public List<HashMap<String, String>> getSaleMangAddSearchGods2(HashMap<String, String> params) throws Throwable;
	
	public int getSaleMangAddSearchGodsCnt3(HashMap<String, String> params) throws Throwable;
	
	public List<HashMap<String, String>> getSaleMangAddSearchGods3(HashMap<String, String> params) throws Throwable;
	
	public int getSaleMangAddSearchGodsCnt6(HashMap<String, String> params) throws Throwable;
	
	public List<HashMap<String, String>> getSaleMangAddSearchGods6(HashMap<String, String> params) throws Throwable;
	
	public int getSaleMangAddSearchGodsCnt7(HashMap<String, String> params) throws Throwable;
	
	public List<HashMap<String, String>> getSaleMangAddSearchGods7(HashMap<String, String> params) throws Throwable;
	
	public int getSaleMangAddSearchGodsCnt8(HashMap<String, String> params) throws Throwable;
	
	public List<HashMap<String, String>> getSaleMangAddSearchGods8(HashMap<String, String> params) throws Throwable;

	public void saleMangUpdate(HashMap<String, String> params) throws Throwable;

}
