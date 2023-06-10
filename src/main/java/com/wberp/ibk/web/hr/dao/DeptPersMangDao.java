package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DeptPersMangDao implements IDeptPersMangDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getDeptPersMangCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("deptPers.getDeptPersMangCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getDeptPersMangList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("deptPers.getDeptPersMangList", params);
	}

	@Override
	public HashMap<String, String> getDeptPersMangDetailCont(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("deptPers.getDeptPersMangDetailCont", params);
	}

	@Override
	public List<HashMap<String, String>> getCorpList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("jstree.getCorpList", params);
	}


}
