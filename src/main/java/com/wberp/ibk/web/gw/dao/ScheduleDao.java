package com.wberp.ibk.web.gw.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDao implements IScheduleDao{

	@Autowired
	public SqlSession sqlSession;


	//조회
	@Override
	public HashMap<String, String> getgwScheDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Sche.getgwScheDetail",params);
	}
	@Override
	public void gwSchUpdate(HashMap<String, String> params) throws Throwable {
		sqlSession.selectOne("Sche.gwSchUpdate",params);
		
	}
	@Override
	public List<HashMap<String, String>> getFullcalendar(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Sche.getFullcalendar",params);
	}
	@Override
	public void getgwSchAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("Sche.getgwSchAdd",params);
	}
	@Override
	public int getgwSchDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("Sche.getgwSchDelete",params);
	}
	@Override
	public HashMap<String, String> ScheAdd(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Sche.ScheAdd",params);
	}
	@Override
	public void addgwScheAtchFile(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("Sche.addgwScheAtchFile",params);
	}
	@Override
	public void gwSchUpdateFile(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("Sche.gwSchUpdateFile",params);
	}
	@Override
	public void gwSchDelFile(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.delete("Sche.gwSchDelFile",params);
	}
	@Override
	public List<HashMap<String, String>> getgwScheAtchFileSelect(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Sche.getgwScheAtchFileSelect",params);
	}
	@Override
	public void addgwScheAtchFile0(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("Sche.addgwScheAtchFile0",params);
		
	}
	@Override
	public List<HashMap<String, String>> getgwWorkSort(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Sche.getgwWorkSort",params);
	}


	}

