package com.wberp.ibk.web.sales.dao;

import java.util.HashMap;
import java.util.List;

public interface ISaleScheDao {

	public int getSaleScheMangCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getSaleScheMang(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getSaleScheDetail(HashMap<String, String> params)throws Throwable;

	public void addSaleScheMang(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getFullcalendar(HashMap<String, String> params)throws Throwable;

	public void addScheAdd(HashMap<String, String> params)throws Throwable;

	public void addSaleScheAtchFile(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getScheAddMap(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getSaleScheAddMap(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getSaleScheAdd(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getSaleScheAddSearchCustComp(HashMap<String, String> params)throws Throwable;

	public int getSaleScheAddSearchCustCompCnt(HashMap<String, String> params)throws Throwable;

	public int getSaleScheAddSearchInsdCustCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getSaleScheAddSearchInsdCust(HashMap<String, String> params)throws Throwable;

	public int getSaleScheAddSearchGodsCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getSaleScheAddSearchGods(HashMap<String, String> params)throws Throwable;

	public String getScheNo()throws Throwable;

	public String getSaleSchecheNo()throws Throwable;

	public String getSaleScheAtchFile()throws Throwable;

	public void addScheMang(HashMap<String, String> params)throws Throwable;

	public void addSaleScheAtchFileScheMang(HashMap<String, String> params)throws Throwable;

	public int deleteSaleSche(HashMap<String, String> params)throws Throwable;


	public void updateScheMang(HashMap<String, String> params)throws Throwable;

	public void updateSaleScheAtchFileScheMang(HashMap<String, String> params)throws Throwable;

	public void updateSaleSche(HashMap<String, String> params)throws Throwable;

	public void deleteSaleScheAtchFileScheMang(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getSaleScheAtchFileSelect(HashMap<String, String> params)throws Throwable;
}
