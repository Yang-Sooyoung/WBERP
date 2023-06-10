package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface IAnulSalDao {

	public int getAnulSalCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAnulSalList(HashMap<String, String> params) throws Throwable;

	public void insertExcel(Map<String, Object> paramMap) throws Throwable;


}
