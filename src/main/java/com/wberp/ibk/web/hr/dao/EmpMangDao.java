package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmpMangDao implements IEmpMangDao {
	 @Autowired
	 public SqlSession sqlSession;

	@Override
	public int getEmpMangCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("EmpMang.getEmpMangCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getEmpMang(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("EmpMang.getEmpMang", params);
	}

	@Override
	public HashMap<String, String> getempMangDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("EmpMang.getempMangDetail", params);
	}

	@Override
	public int getEmpMangDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("EmpMang.getEmpMangDelete", params);
	}

	@Override
	public int getEmpMangUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("EmpMang.getEmpMangUpdate", params);
	}

}
