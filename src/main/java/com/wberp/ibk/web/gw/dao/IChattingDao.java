package com.wberp.ibk.web.gw.dao;

import java.util.HashMap;
import java.util.List;

public interface IChattingDao {

	public int getChattingCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getChatting(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getChatDetail(HashMap<String, String> params) throws Throwable;

	public void getChatSend(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getName(HashMap<String, String> params) throws Throwable;

	public int getChatDetailCnt(HashMap<String, String> params) throws Throwable;

	public int updateChat(HashMap<String, String> params) throws Throwable;

	public int getMaxNo(HashMap<String, String> params) throws Throwable;

	public int chatReadCnt(HashMap<String, String> params) throws Throwable;

	public void addChatFile(HashMap<String, String> params) throws Throwable;

	public int deleteChat(HashMap<String, String> params) throws Throwable;

	public void getChatRoom(HashMap<String, String> params) throws Throwable;

	public String getChatRoomNO() throws Throwable;

	public void getChatRoomPers(HashMap<String, String> params) throws Throwable;



}
