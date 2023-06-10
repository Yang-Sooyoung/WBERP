package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

public interface IAnulUseMangDao {

	public int getAnulUseCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAnulUseList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getAnulUseDetailCont(HashMap<String, String> params) throws Throwable;

	public void anulUseAdd(HashMap<String, String> params) throws Throwable;

	public int anulUseUpdate(HashMap<String, String> params) throws Throwable;

	public int anulUseDelete(HashMap<String, String> params) throws Throwable;

	public String nextVar(HashMap<String, String> params) throws Throwable;

}
