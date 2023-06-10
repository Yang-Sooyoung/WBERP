package com.wberp.ibk.web.gw.service;

import java.util.HashMap;
import java.util.List;

public interface IScheduleService {



	//public List<HashMap<String, String>> getgwScheDetail(HashMap<String, String> params)throws Throwable;
	public HashMap<String, String> getgwScheDetail(HashMap<String, String> params)throws Throwable;

	public void gwSchUpdate(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getFullcalendar(HashMap<String, String> params)throws Throwable;

	public void getgwSchAdd(HashMap<String, String> params) throws Throwable;

	public int getgwSchDelete(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> ScheAdd(HashMap<String, String> params) throws Throwable;

	public void addgwScheAtchFile(HashMap<String, String> params)throws Throwable;

	public void gwSchUpdateFile(HashMap<String, String> params)throws Throwable;

	public void gwSchDelFile(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getgwScheAtchFileSelect(HashMap<String, String> params)throws Throwable;

	public void addgwScheAtchFile0(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getgwWorkSort(HashMap<String, String> params)throws Throwable;





	


}
