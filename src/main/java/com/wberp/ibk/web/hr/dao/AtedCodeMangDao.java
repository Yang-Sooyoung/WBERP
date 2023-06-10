package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AtedCodeMangDao implements IAtedCodeMangDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getAtedCodeCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("atedcode.getAtedCodeCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getAtedCodeList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("atedcode.getAtedCodeList", params);
	}

	@Override
	public HashMap<String, String> getAtedCodeDetailCont(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("atedcode.getAtedCodeDetailCont", params);
	}

	@Override
	public void atedCodeAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("atedcode.atedCodeAdd", params);
	}

	@Override
	public int atedCodeUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("atedcode.atedCodeUpdate", params);
	}

	@Override
	public int atedCodeDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("atedcode.atedCodeDelete", params);
	}
	
	
}
