package com.wberp.ibk.web.gw.service;

import java.util.HashMap;
import java.util.List;

public interface IBoardService {

	public List<HashMap<String, String>> getBoardMang(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBoard(HashMap<String, String> params) throws Throwable;

	public int getBoardCnt(HashMap<String, String> params) throws Throwable;

	public int addAjax(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> ajaxBoard(HashMap<String, String> params) throws Throwable;

	public int delAjax(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> gwBoardDetail(HashMap<String, String> params) throws Throwable;

	public void gwBoardHit(HashMap<String, String> params) throws Throwable;

	public int gwBoardDelete(HashMap<String, String> params) throws Throwable;

	public void gwBoardAdd(HashMap<String, String> params) throws Throwable;

	public int getObCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getOb(HashMap<String, String> params) throws Throwable;

	public void addOneBoard(HashMap<String, String> params) throws Throwable;

	public int deleteOb(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> oneDetail(HashMap<String, String> params) throws Throwable;

	public int oneUpdate(HashMap<String, String> params) throws Throwable;

	public void gwBoardFile(HashMap<String, String> params) throws Throwable;

	public String getBoardNo() throws Throwable;

	public int getBokcnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBokBoard(HashMap<String, String> params) throws Throwable;

	public void getBokImg(HashMap<String, String> params) throws Throwable;

	public int getBokCancel(HashMap<String, String> params) throws Throwable;

	public void boardUpdate(HashMap<String, String> params) throws Throwable;

	public int fileDelete(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> gwBoardFileDetail(HashMap<String, String> params) throws Throwable;

	public void gwBoardFile2(HashMap<String, String> params) throws Throwable;



}
