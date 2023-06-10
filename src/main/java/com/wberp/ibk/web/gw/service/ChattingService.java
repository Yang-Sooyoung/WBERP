package com.wberp.ibk.web.gw.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.gw.dao.IChattingDao;

@Service
public class ChattingService implements IChattingService{
	@Autowired
	public IChattingDao iChattingDao;

	@Override
	public int getChattingCnt(HashMap<String, String> params) throws Throwable {
		return iChattingDao.getChattingCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getChatting(HashMap<String, String> params) throws Throwable {
		return iChattingDao.getChatting(params);
	}

	@Override
	public List<HashMap<String, String>>getChatDetail(HashMap<String, String> params) throws Throwable {
		return iChattingDao.getChatDetail(params);
	}

	@Override
	public void getChatSend(HashMap<String, String> params) throws Throwable {
		iChattingDao.getChatSend(params);
	}

	@Override
	public List<HashMap<String, String>> getName(HashMap<String, String> params) throws Throwable {
		return iChattingDao.getName(params);
	}

	@Override
	public int getChatDetailCnt(HashMap<String, String> params) throws Throwable {
		return iChattingDao.getChatDetailCnt(params);
	}

	@Override
	public int updateChat(HashMap<String, String> params) throws Throwable {
		return iChattingDao.updateChat(params);
	}

	@Override
	public int getMaxNo(HashMap<String, String> params) throws Throwable {
		return iChattingDao.getMaxNo(params);
	}

	@Override
	public int chatReadCnt(HashMap<String, String> params) throws Throwable {
		return iChattingDao.chatReadCnt(params);
	}

	@Override
	public void addChatFile(HashMap<String, String> params) throws Throwable {
		iChattingDao.addChatFile(params);
	}

	@Override
	public int deleteChat(HashMap<String, String> params) throws Throwable {
		return iChattingDao.deleteChat(params);
	}

	@Override
	public void getChatRoom(HashMap<String, String> params) throws Throwable {
		iChattingDao.getChatRoom(params);
	}

	@Override
	public String getChatRoomNO() throws Throwable {
		return iChattingDao.getChatRoomNO();
	}

	@Override
	public void getChatRoomPers(HashMap<String, String> params) throws Throwable {
		iChattingDao.getChatRoomPers(params);
	}

	





}
