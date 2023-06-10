package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

public interface IAtedCodeMangDao {

	public int getAtedCodeCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAtedCodeList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getAtedCodeDetailCont(HashMap<String, String> params) throws Throwable;

	public void atedCodeAdd(HashMap<String, String> params) throws Throwable;

	public int atedCodeUpdate(HashMap<String, String> params) throws Throwable;

	public int atedCodeDelete(HashMap<String, String> params) throws Throwable;

}


