package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

public interface IAddWorkMangDao {

	public int getAddWorkCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAddWorkList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getAddWorkDetailCont(HashMap<String, String> params) throws Throwable;

	public void addWorkAdd(HashMap<String, String> params) throws Throwable;

	public int addWorkUpdate(HashMap<String, String> params) throws Throwable;

	public int addWorkDelete(HashMap<String, String> params) throws Throwable;

}
