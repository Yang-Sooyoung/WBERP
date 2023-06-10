package com.wberp.ibk.web.crm.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TempChanDao implements ITempChanDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getTempCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("temp.getTempCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getTempList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("temp.getTempList", params);
	}

	@Override
	public void tempMailAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("temp.tempMailAdd", params);
	}

	@Override
	public void tempMmsAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("temp.tempMmsAdd", params);
	}

	@Override
	public String seq() throws Throwable {
		return sqlSession.selectOne("temp.seq");
	}

	@Override
	public void tempResrAdd(HashMap<String, Object> resrMap) throws Throwable {
		sqlSession.insert("temp.tempResrAdd", resrMap);
		
	}

	@Override
	public HashMap<String, String> getTempBoardDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("temp.getTempBoardDetail", params);
	}

	@Override
	public List<HashMap<String, String>> getTempResrDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("temp.getTempResrDetail", params);
	}

	@Override
	public void tempMailUpdate(HashMap<String, String> params) throws Throwable {
		sqlSession.update("temp.tempMailUpdate", params);
		
	}
	
	@Override
	public void tempMmsUpdate(HashMap<String, String> params) throws Throwable {
		sqlSession.update("temp.tempMmsUpdate", params);
	}

	@Override
	public void tempResrUpdate(HashMap<String, Object> params) throws Throwable {
		sqlSession.update("temp.tempResrUpdate", params);
		
	}

	@Override
	public int tempBoardDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("temp.tempBoardDelete", params);
	}

	@Override
	public int tempResrDelete(HashMap<String, String> resrMap) throws Throwable {
		return sqlSession.delete("temp.tempResrDelete", resrMap);
	}

	@Override
	public void tempResrAddUpdate(HashMap<String, Object> resrMap) throws Throwable {
		sqlSession.insert("temp.tempResrAddUpdate", resrMap);		
	}

	@Override
	public int getUsedTemp(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("temp.getUsedTemp", params);
	}

	@Override
	public int getTempCateCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("temp.getTempCateCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getTempCateList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("temp.getTempCateList", params);
	}

	@Override
	public void tempCateAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("temp.tempCateAdd", params);
	}

	@Override
	public int duplTempCateCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("temp.duplTempCateCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getTempChanList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("temp.getTempChanList", params);
	}

	
}
