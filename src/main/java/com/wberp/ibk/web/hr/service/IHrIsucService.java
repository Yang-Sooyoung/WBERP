package com.wberp.ibk.web.hr.service;

import java.util.HashMap;
import java.util.List;

public interface IHrIsucService {

	public HashMap<String, String> gethrIsucDetailCont(HashMap<String, String> params) throws Throwable;

	public int gethrIsucCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> gethrIsucList(HashMap<String, String> params) throws Throwable;

	
}
