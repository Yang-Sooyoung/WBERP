package com.wberp.ibk.web.eis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class attchListDao implements IattchListDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getattchList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("attchList.getattchList", params);
	}

	@Override
	public int getAttchCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("attchList.getAttchCnt", params);
	}

	@Override
	public HashMap<String, String> getattchDetail(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("attchList.getattchDetail", params);
	}

	@Override
	public void attchAdd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("attchList.attchAdd", params);
	}

	@Override
	public int attchDelete(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("attchList.attchDelete", params);
	}

	@Override
	public List<HashMap<String, Object>> getattchQuery(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("attchList.getattchQuery", params);
	}

	@Override
	public int attchUpdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("attchList.attchUpdate", params);
	}

	@Override
	public void addEisCate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("attchList.addEisCate", params);
	}

	@Override
	public int getcatgCnt2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("attchList.getcatgCnt2", params);
	}

	@Override
	public List<HashMap<String, String>> getcatgList2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("attchList.getcatgList2", params);
	}

	@Override
	public int catgDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("attchList.catgDelete", params);
	}
	
	@Override
	   public List<HashMap<String, String>> getAttSelecList(HashMap<String, String> params) throws Throwable {
	      return sqlSession.selectList("attchList.getAttSelecList", params);
	}
	   
	@Override
	public List<HashMap<String, Object>> getTestQuery(HashMap<String, String> params) throws Throwable {
	      
	      return sqlSession.selectList("attchList.getTestQuery", params);
	}

	@Override
	public HashMap<String, String> getAttSelecDetailList(HashMap<String, String> params) throws Throwable {
	      
	      return sqlSession.selectOne("attchList.getAttSelecDetailList", params);
	}

	
	
	
	
	@Override
	public List<HashMap<String, Object>> getQuery1(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("attchList.getQuery1", params);
	}

	@Override
	public List<HashMap<String, Object>> getQuery2(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("attchList.getQuery2", params);
	}

	@Override
	public List<HashMap<String, Object>> getQuery3(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("attchList.getQuery3", params);
	}

	@Override
	public List<HashMap<String, Object>> getQuery4(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("attchList.getQuery4", params);
	}

	@Override
	public List<HashMap<String, Object>> getQuery5(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("attchList.getQuery5", params);
	}

	@Override
	public List<HashMap<String, Object>> getQuery6(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("attchList.getQuery6", params);
	}

	@Override
	public List<HashMap<String, Object>> getQuery7(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("attchList.getQuery7", params);
	}

	@Override
	public List<HashMap<String, Object>> getQuery8(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("attchList.getQuery8", params);
	}
}
