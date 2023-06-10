package com.wberp.ibk.web.gw.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao implements INoticeDao {

	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getNoticeCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("notice.getNoticeCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getNotice(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("notice.getNotice", params);
	}

	@Override
	public int getReadCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("notice.getReadCnt", params);
	}

	@Override
	public void noticeUpdate(HashMap<String, String> params) throws Throwable {
		sqlSession.update("notice.noticeUpdate", params);
	}
}
