package com.wberp.ibk.web.eis.service;

import java.util.HashMap;
import java.util.List;

public interface IDashboardService {

	public List<HashMap<String, String>> getDashboard(HashMap<String, String> params) throws Throwable;

	public void addDashboard(HashMap<String, String> params) throws Throwable;

	public int getDashboardCnt(HashMap<String, String> params) throws Throwable;

	public int dasbUpdate(HashMap<String, String> params) throws Throwable;

	public int dasbDelete(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getLoginInfo(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getDashboardDetail(HashMap<String, String> params) throws Throwable;

	public int getWidgCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getWidg(HashMap<String, String> params) throws Throwable;

	public void addWidg(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getWidgDetail(HashMap<String, String> params) throws Throwable;

	public int widgUpdate(HashMap<String, String> params) throws Throwable;

	public int widgDelete(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getChartDrawList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getDashboardList(HashMap<String, String> params) throws Throwable;

	public int updateOrder(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> checkOrder(HashMap<String, String> params) throws Throwable;

	public int getChartDrawCnt(HashMap<String, String> params)  throws Throwable;

	public int deleteWidg(HashMap<String, String> params) throws Throwable;

	public int deleteDasb(HashMap<String, String> params) throws Throwable;

	
	


	


 
}
