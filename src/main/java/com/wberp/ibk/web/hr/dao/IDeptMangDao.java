package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

public interface IDeptMangDao {

	public int getDeptMangCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getDeptMangList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getDeptMangDetailCont(HashMap<String, String> params) throws Throwable;

	public void DeptMangAdd(HashMap<String, String> params) throws Throwable;

	public int DeptMangUpdate(HashMap<String, String> params) throws Throwable;

	public int DeptMangDelete(HashMap<String, String> params) throws Throwable;


}
