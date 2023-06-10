package com.wberp.ibk.batch.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnulProdDao implements IAnulProdDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public void anulTest() throws Throwable {
		sqlSession.insert("anulprod.anulTest()");
	}
}
