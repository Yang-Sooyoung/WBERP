package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

public interface IDeptPersMangDao {

	public int getDeptPersMangCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getDeptPersMangList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getDeptPersMangDetailCont(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCorpList(HashMap<String, String> params) throws Throwable;

}
