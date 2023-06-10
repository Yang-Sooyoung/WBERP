package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class hrIsucDao implements IhrIsucDao {
	@Autowired
	public SqlSession sqlSession;

	public HashMap<String, String> gethrIsucDetailCont(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("hrIsuc.gethrIsucDetailCont", params);

}

	public int gethrIsucCnt(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("hrIsuc.gethrIsucCnt", params);
	}

	public List<HashMap<String, String>> gethrIsucList(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("hrIsuc.gethrIsucList", params);
	}
	}

