package com.wberp.ibk.web.common.dao;

import java.util.HashMap;
import java.util.List;

public interface ICommonDao {

	public HashMap<String, String> loginCheck(HashMap<String, String> params) throws Throwable;

	public String menuAthrCheck(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getTopMenu(String athrNo) throws Throwable;

	public List<HashMap<String, String>> getLeftMenu(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getComnCode(String bigFrac) throws Throwable;

}
