package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DeptMangDao implements IDeptMangDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getDeptMangCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("dept.getDeptMangCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getDeptMangList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("dept.getDeptMangList", params);
	}

	@Override
	public HashMap<String, String> getDeptMangDetailCont(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("dept.getDeptMangDetailCont", params);
	}

	@Override
	public void DeptMangAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("dept.DeptMangAdd", params);
	}

	@Override
	public int DeptMangUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("dept.DeptMangUpdate", params);
	}

	@Override
	public int DeptMangDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("dept.DeptMangDelete", params);
	}
	
	
}
