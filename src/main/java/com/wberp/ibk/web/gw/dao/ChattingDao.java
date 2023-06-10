package com.wberp.ibk.web.gw.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChattingDao implements IChattingDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getChattingCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("chatting.getChattingCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getChatting(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("chatting.getChatting", params);
	}

	@Override
	public List<HashMap<String, String>> getChatDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("chatting.getChatDetail", params);
	}
	

	@Override
	public void getChatSend(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("chatting.getChatSend", params);
	}

	@Override
	public List<HashMap<String, String>> getName(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("chatting.getName", params);
	}

	@Override
	public int getChatDetailCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("chatting.getChatDetailCnt", params);
	}

	@Override
	public int updateChat(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("chatting.updateChat", params);
	}

	@Override
	public int getMaxNo(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("chatting.getMaxNo", params);
	}

	@Override
	public int chatReadCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("chatting.chatReadCnt", params);
	}

	@Override
	public void addChatFile(HashMap<String, String> params) throws Throwable {
		sqlSession.selectOne("chatting.addChatFile", params);
	}

	@Override
	public int deleteChat(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("chatting.deleteChat", params);
	}

	@Override
	public void getChatRoom(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("chatting.getChatRoom", params);
	}

	@Override
	public String getChatRoomNO() throws Throwable {
		return sqlSession.selectOne("chatting.getChatRoomNO");
	}

	@Override
	public void getChatRoomPers(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("chatting.getChatRoomPers", params);
	}



}
