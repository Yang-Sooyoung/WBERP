package com.wberp.ibk.web.gw.dao;

import java.util.HashMap;
import java.util.List;

public interface IDocDao {

	int getDocCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getDoc(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> docDetail(HashMap<String, String> params) throws Throwable;

	void docAdd(HashMap<String, String> params) throws Throwable;

	void docUpdate(HashMap<String, String> params) throws Throwable;

	int docDelete(HashMap<String, String> params) throws Throwable;

	void updateDocHit(HashMap<String, String> params) throws Throwable;

	int getFavCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getFavDoc(HashMap<String, String> params) throws Throwable;

	void favUpdate(HashMap<String, String> params) throws Throwable;

	int favDelete(HashMap<String, String> params) throws Throwable;

}
