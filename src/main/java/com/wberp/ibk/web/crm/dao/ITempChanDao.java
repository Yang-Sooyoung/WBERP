package com.wberp.ibk.web.crm.dao;

import java.util.HashMap;
import java.util.List;

public interface ITempChanDao {

	public int getTempCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getTempList(HashMap<String, String> params) throws Throwable;

	public void tempMailAdd(HashMap<String, String> params) throws Throwable;

	public void tempMmsAdd(HashMap<String, String> params) throws Throwable;

	public void tempResrAdd(HashMap<String, Object> resrMap) throws Throwable;

	public String seq() throws Throwable;

	public HashMap<String, String> getTempBoardDetail(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getTempResrDetail(HashMap<String, String> params) throws Throwable;

	public void tempMmsUpdate(HashMap<String, String> params) throws Throwable;

	public void tempResrUpdate(HashMap<String, Object> resrMap) throws Throwable;

	public int tempBoardDelete(HashMap<String, String> params) throws Throwable;

	public int tempResrDelete(HashMap<String, String> params) throws Throwable;

	public void tempResrAddUpdate(HashMap<String, Object> resrMap) throws Throwable;

	public void tempMailUpdate(HashMap<String, String> params) throws Throwable;

	public int getUsedTemp(HashMap<String, String> params) throws Throwable;

	public int getTempCateCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getTempCateList(HashMap<String, String> params) throws Throwable;

	public void tempCateAdd(HashMap<String, String> params) throws Throwable;

	public int duplTempCateCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getTempChanList(HashMap<String, String> params) throws Throwable;
}
