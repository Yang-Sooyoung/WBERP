package com.wberp.ibk.web.common.service;

import java.util.HashMap;
import java.util.List;

public interface ICommonService {

	public HashMap<String, String> loginCheck(HashMap<String, String> params) throws Throwable;

	public String menuAthrCheck(String athrNo, String menuNo) throws Throwable;

	public List<HashMap<String, String>> getTopMenu(String athrNo) throws Throwable;

	public List<HashMap<String, String>> getLeftMenu(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getComnCode(String bigFrac) throws Throwable;

}
