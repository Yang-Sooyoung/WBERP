package com.wberp.ibk.web.eis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class reqsListDao implements IreqsListDao { 
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getreqsList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("reqsList.getreqsList", params);
	}

	@Override
	public int getreqsCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("reqsList.getreqsCnt", params);
	}

	@Override
	public HashMap<String, String> getreqsDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("reqsList.getreqsDetail", params);
	}

	@Override
	public void reqsAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("reqsList.reqsAdd", params);
	}

	@Override
	public int reqsUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("reqsList.reqsUpdate", params);
	}

	@Override
	public int reqsDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("reqsList.reqsDelete", params);
	}

	@Override
	public int proc4Update(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("reqsList.proc4Update", params);
	}

	@Override
	public int proc1Update(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("reqsList.proc1Update", params);
	}

	@Override
	public int proc2Update(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("reqsList.proc2Update", params);
	}

	@Override
	public int refsAdd(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("reqsList.refsAdd", params);
	}

	@Override
	public int getreqsComtCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("reqsList.getreqsComtCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getreqsComt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("reqsList.getreqsComt", params);
	}

	@Override
	public void comtAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("reqsList.comtAdd", params);
	}

	@Override
	public int comtDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("reqsList.comtDelete", params);
	}

	@Override
	public int comtUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("reqsList.comtUpdate", params);
	}

	@Override
	public List<HashMap<String, String>> getcatgList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("reqsList.getcatgList", params);
	}

	@Override
	public int getcatgCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("reqsList.getcatgCnt", params);
	}


}
