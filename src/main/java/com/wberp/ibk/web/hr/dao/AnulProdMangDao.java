package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnulProdMangDao implements IAnulProdMangDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getAnulProdCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("anulprod.getAnulProdCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getAnulProdList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("anulprod.getAnulProdList", params);
	}

	@Override
	public int anulProdUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("anulprod.anulProdUpdate", params);
	}
}
