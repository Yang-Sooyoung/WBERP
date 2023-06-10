package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnulUseMangDao implements IAnulUseMangDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getAnulUseCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("anuluse.getAnulUseCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getAnulUseList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("anuluse.getAnulUseList", params);
	}

	@Override
	public HashMap<String, String> getAnulUseDetailCont(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("anuluse.getAnulUseDetailCont", params);
	}

	@Override
	public void anulUseAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("anuluse.anulUseAdd", params);
	}

	@Override
	public int anulUseUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("anuluse.anulUseUpdate", params);
	}

	@Override
	public int anulUseDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("anuluse.anulUseDelete", params);
	}

	@Override
	public String nextVar(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("anuluse.nextVar", params);
	}
}
