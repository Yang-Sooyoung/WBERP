package com.wberp.ibk.web.eis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class attchBoardDao implements IattchBoardDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getattchBoard(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("attchBoard.getattchBoard", params);
	} 

}
