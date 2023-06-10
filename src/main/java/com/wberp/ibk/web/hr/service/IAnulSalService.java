package com.wberp.ibk.web.hr.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

public interface IAnulSalService {

	public int getAnulSalCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAnulSalList(HashMap<String, String> params) throws Throwable;

	public void excelUpload(File destFile) throws Throwable;
	
}
