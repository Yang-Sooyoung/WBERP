package com.wberp.ibk.web.sales.dao;

import java.util.HashMap;
import java.util.List;

public interface IGodsDao {

	public int getGodsCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getGods(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getGodsDetail(HashMap<String, String> params) throws Throwable;

	public void godsAdd(HashMap<String, String> params) throws Throwable;

	public void godsUpdate(HashMap<String, String> params) throws Throwable;

	public void godsDelete(HashMap<String, String> params) throws Throwable;

	public int getCotrDayQGodsCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCotrDayQGods(HashMap<String, String> params) throws Throwable;

}
