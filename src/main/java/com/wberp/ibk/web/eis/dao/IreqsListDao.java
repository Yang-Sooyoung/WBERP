package com.wberp.ibk.web.eis.dao;

import java.util.HashMap;
import java.util.List;

public interface IreqsListDao { 

	public List<HashMap<String, String>> getreqsList(HashMap<String, String> params) throws Throwable;

	public int getreqsCnt(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getreqsDetail(HashMap<String, String> params) throws Throwable;

	public void reqsAdd(HashMap<String, String> params) throws Throwable;

	public int reqsUpdate(HashMap<String, String> params) throws Throwable;

	public int reqsDelete(HashMap<String, String> params) throws Throwable;

	public int proc4Update(HashMap<String, String> params) throws Throwable;

	public int proc1Update(HashMap<String, String> params) throws Throwable;

	public int proc2Update(HashMap<String, String> params) throws Throwable;

	public int refsAdd(HashMap<String, String> params) throws Throwable;

	public int getreqsComtCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getreqsComt(HashMap<String, String> params) throws Throwable;

	public void comtAdd(HashMap<String, String> params) throws Throwable;

	public int comtDelete(HashMap<String, String> params) throws Throwable;

	public int comtUpdate(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getcatgList(HashMap<String, String> params) throws Throwable;

	public int getcatgCnt(HashMap<String, String> params) throws Throwable;

 
}
