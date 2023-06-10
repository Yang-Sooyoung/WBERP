package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VactCodeMangDao implements IVactCodeMangDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getVactCodeCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("vactcode.getVactCodeCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getVactCodeList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("vactcode.getVactCodeList", params);
	}

	@Override
	public HashMap<String, String> getVactCodeDetailCont(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("vactcode.getVactCodeDetailCont", params);
	}

	@Override
	public void vactCodeAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("vactcode.vactCodeAdd", params);
	}

	@Override
	public int vactCodeUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("vactcode.vactCodeUpdate", params);
	}

	@Override
	public int vactCodeDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("vactcode.vactCodeDelete", params);
	}

}
