package com.wberp.ibk.web.sales.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GodsDao implements IGodsDao{
	@Autowired
	public SqlSession sqlSession;
	
	@Override
	public int getGodsCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("gods.getGodsCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getGods(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("gods.getGods", params);
	}

	/*
	 * @Override public List<HashMap<String, String>> getGodsDetail(HashMap<String,
	 * String> params) throws Throwable { return
	 * sqlSession.selectList("gods.getGodsDetail", params); }
	 */
	
	@Override
	public HashMap<String, String> getGodsDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("gods.getGodsDetail", params);
	}

	@Override
	public void godsAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("gods.godsAdd", params);
		
	}

	@Override
	public void godsUpdate(HashMap<String, String> params) throws Throwable {
		sqlSession.update("gods.godsUpdate", params);
		
	}

	@Override
	public void godsDelete(HashMap<String, String> params) throws Throwable {
		sqlSession.update("gods.godsDelete", params);
		
	}

	@Override
	public List<HashMap<String, String>> getCotrDayQGods(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("gods.getCotrDayQGods", params);
	}

	@Override
	public int getCotrDayQGodsCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("gods.getCotrDayQGodsCnt", params);

	}

}
