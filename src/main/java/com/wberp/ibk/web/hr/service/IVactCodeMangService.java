package com.wberp.ibk.web.hr.service;

import java.util.HashMap;
import java.util.List;

public interface IVactCodeMangService {

	public int getVactCodeCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getVactCodeList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getVactCodeDetailCont(HashMap<String, String> params) throws Throwable;

	public void vactCodeAdd(HashMap<String, String> params) throws Throwable;

	public int vactCodeUpdate(HashMap<String, String> params) throws Throwable;
	
	public int vactCodeDelete(HashMap<String, String> params) throws Throwable;

}
