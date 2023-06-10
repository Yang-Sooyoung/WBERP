package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

public interface IhrIsucDao {

	public HashMap<String, String> gethrIsucDetailCont(HashMap<String, String> params) throws Throwable;

	public int gethrIsucCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> gethrIsucList(HashMap<String, String> params) throws Throwable;

}
