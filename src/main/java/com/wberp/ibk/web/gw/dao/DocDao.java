package com.wberp.ibk.web.gw.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DocDao implements IDocDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getDocCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("doc.getDocCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getDoc(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("doc.getDoc", params);
	}

	@Override
	public HashMap<String, String> docDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("doc.docDetail", params);
	}

	@Override
	public void docAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("doc.docAdd", params);
	}

	@Override
	public void docUpdate(HashMap<String, String> params) throws Throwable {
		sqlSession.update("doc.docUpdate", params);
	}

	@Override
	public int docDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("doc.docDelete", params);
	}

	@Override
	public void updateDocHit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("doc.updateDocHit", params);
	}

	@Override
	public int getFavCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("doc.getFavCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getFavDoc(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("doc.getFavDoc", params);
	}

	@Override
	public void favUpdate(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("doc.favUpdate", params);
	}

	@Override
	public int favDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("doc.favDelete", params);
	}
}
