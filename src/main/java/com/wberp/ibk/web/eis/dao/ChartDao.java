package com.wberp.ibk.web.eis.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDao implements IChartDao {
	@Autowired
	public SqlSession sqlSession;

	
	

}
