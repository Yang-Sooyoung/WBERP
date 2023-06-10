package com.wberp.ibk.web.crm.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChannelDao implements IChannelDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getChanCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chan.getChanCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getChan(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chan.getChan",params);
	}

	@Override
	public List<HashMap<String, String>> getchannelTypelist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chan.getChanType",params);
	}

	@Override
	public List<HashMap<String, String>> getsupplySubcSelect(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chan.getsupplySubcSelect",params);
	}

	@Override
	public List<HashMap<String, String>> getsupplyType(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chan.getsupplyType",params);
	}

	@Override
	public Object chanAdd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("chan.chanAdd",params);
	}

	@Override
	public HashMap<String, String> getChanDetail(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chan.getChanDetail",params);
	}

	@Override
	public void ChanUpdate(HashMap<String, String> params) throws Throwable {
		sqlSession.update("chan.ChanUpdate",params);
		
	}

	@Override
	public void ChanDelete(HashMap<String, String> params) throws Throwable {
		sqlSession.update("chan.ChanDelete",params);
	}

	@Override
	public List<HashMap<String, String>> getEtcList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chan.getEtcList",params);
	}

	@Override
	public List<HashMap<String, String>> getEtcListCotr(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chan.getEtcListCotr",params);
	}

	@Override
	public List<HashMap<String, String>> getEtcListSupl(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chan.getEtcListSupl",params);
	}

	@Override
	public void deleteEtcChanType(HashMap<String, String> params) throws Throwable {
		sqlSession.update("chan.deleteEtcChanType",params);
	}

	@Override
	public void deleteEtcCotr(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("chan.deleteEtcCotr",params);
	}

	@Override
	public void deleteEtcSupl(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("chan.deleteEtcSupl",params);
	}

	@Override
	public void addEtcChanType(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("chan.addEtcChanType",params);
	}

	@Override
	public void addEtcCotr(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("chan.addEtcCotr",params);
	}

	@Override
	public void addEtcSupl(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("chan.addEtcSupl",params);
	}
	
	
}
