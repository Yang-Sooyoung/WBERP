package com.wberp.ibk.web.common.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDao implements ICommonDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public HashMap<String, String> loginCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("common.loginCheck", params);
	}

	@Override
	public String menuAthrCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("common.menuAthrCheck", params);
	}

	@Override
	public List<HashMap<String, String>> getTopMenu(String athrNo) throws Throwable {
		return sqlSession.selectList("common.getTopMenu", athrNo);
	}

	@Override
	public List<HashMap<String, String>> getLeftMenu(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("common.getLeftMenu", params);
	}

	@Override
	public List<HashMap<String, String>> getComnCode(String bigFrac) throws Throwable {
		return sqlSession.selectList("common.getComnCode", bigFrac);
	}
}
