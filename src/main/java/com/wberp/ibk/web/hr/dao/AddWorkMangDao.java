package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddWorkMangDao implements IAddWorkMangDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getAddWorkCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("addwork.getAddWorkCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getAddWorkList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("addwork.getAddWorkList", params);
	}

	@Override
	public HashMap<String, String> getAddWorkDetailCont(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("addwork.getAddWorkDetailCont", params);
	}

	@Override
	public void addWorkAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("addwork.addWorkAdd", params);
	}

	@Override
	public int addWorkUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("addwork.addWorkUpdate", params);
	}

	@Override
	public int addWorkDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("addwork.addWorkDelete", params);
	}

}
