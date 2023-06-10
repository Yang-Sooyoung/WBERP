package com.wberp.ibk.web.hr.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MontDao implements IMontDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getMontCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("mont.getMontCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getMontList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("mont.getMontList", params);
	}

	@Override
	public HashMap<String, String> getMont(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("mont.getMont", params);
	}

	@Override
	public void montUpdate(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("mont.montUpdate", params);
	}

	@Override
	public void montTest() throws Throwable {
		sqlSession.insert("mont.montTest()");
	}

	@Override
	public String date(HashMap<String, String> params) {
		return sqlSession.selectOne("mont.date", params);
	}

	@Override
	public String sal(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("mont.sal", params);
	}

	@Override
	public List<HashMap<String, String>> getCodeList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("mont.getCodeList", params);
	}

	@Override
	public int getMontDetailCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("mont.getMontDetailCnt", params);
	}

}
