package com.wberp.ibk.web.gw.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ApprovalDao implements IApprovalDao {

	@Autowired SqlSession sqlSession;

	@Override
	public int addAppMode(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("aprv.addAppMode", params);
	}

	@Override
	public int getAprvModeCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("aprv.getAprvModeCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getAprvModeList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("aprv.getAprvModeList", params);
	}

	@Override
	public HashMap<String, String> getAprvMode(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("aprv.getAprvMode", params);
	}

	@Override
	public int deleteAprvMdoe(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("aprv.deleteAprvMode", params);
	}

	@Override
	public int updateAprvMode(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("aprv.updateAprvMode", params);
	}

	@Override
	public void addApp(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("aprv.addApp", params);
		
	}

	@Override
	public void addAppRef(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("aprv.addAppRef", params);
		
	}

	@Override
	public void addAppAthr(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("aprv.addAppAthr", params);
		
	}

	@Override
	public int getAppErcpCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("aprv.getAppErcpCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getAppErcpList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("aprv.getAppErcpList", params);
	}

	@Override
	public List<HashMap<String, String>> getAppErcpList_req(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("aprv.getAppErcpList_req", params);
	}

	@Override
	public List<HashMap<String, String>> getAppErcpList_ref(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("aprv.getAppErcpList_ref", params);
	}

	@Override
	public List<HashMap<String, String>> getAppErcpList_adm(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("aprv.getAppErcpList_adm", params);
	}

	@Override
	public int getAppErcpCnt_req(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("aprv.getAppErcpCnt_req", params);
	}

	@Override
	public int getAppErcpCnt_ref(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("aprv.getAppErcpCnt_ref", params);
	}

	@Override
	public int getAppErcpCnt_adm(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("aprv.getAppErcpCnt_adm", params);
	}

	@Override
	public List<HashMap<String, String>> getApp(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("aprv.getApp", params);
	}

	@Override
	public void addAppFile(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("aprv.addAppFile", params);
	}

	@Override
	public HashMap<String, String> getAppFile(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("aprv.getAppFile", params);
	}

	@Override
	public int aprvSuc(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("aprv.aprvSuc", params);
	}
	
	@Override
	public int aprvRepy(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("aprv.aprvRepy", params);
	}

	@Override
	public HashMap<String, String> getAppStat(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("aprv.getAppStat", params);
	}

	@Override
	public int getAppSendCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("aprv.getAppSendCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getAppSendList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("aprv.getAppSendList", params);
	}

	@Override
	public int getAppSendCnt_ing(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("aprv.getAppSendCnt_ing", params);
	}

	@Override
	public List<HashMap<String, String>> getAppSendList_ing(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("aprv.getAppSendList_ing", params);
	}

	@Override
	public int getAppSnedCnt_end(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("aprv.getAppSendCnt_end", params);
	}

	@Override
	public List<HashMap<String, String>> getAppSendList_end(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("aprv.getAppSendList_end", params);
	}

	@Override
	public List<HashMap<String, String>> getAppResn(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("aprv.getAppResn", params);
	}

	@Override
	public void PublicAppAdd(HashMap<String,String> params) throws Throwable {
		sqlSession.insert("aprv.PublicAddApp", params);
	}

	@Override
	public String getAppNo() throws Throwable {
		return sqlSession.selectOne("aprv.aprvNoSelect");
	}

	@Override
	public String getAppFileNo() throws Throwable {
		return sqlSession.selectOne("aprv.aprvFileNoSelect");
	}

	@Override
	public String getAppModeNo() throws Throwable {
		return sqlSession.selectOne("aprv.aprvModeNoSelect");
	}

	@Override
	public String returnPublicApp(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("aprv.returnPublicApp", params);
	}

	@Override
	public void campAprvSuc(HashMap<String, String> etcno) throws Throwable {
		sqlSession.update("aprv.campAprvSuc", etcno);
	}

	@Override
	public void anulUseAprvSuc(HashMap<String, String> etcno) throws Throwable {
		sqlSession.update("aprv.anulUseAprvSuc", etcno);
	}

	@Override
	public void campAprvRepy(HashMap<String, String> etcno) throws Throwable {
		sqlSession.update("aprv.campAprvRepy", etcno);
	}

	@Override
	public void anulUseAprvRepy(HashMap<String, String> etcno) throws Throwable {
		sqlSession.update("aprv.anulUseAprvRepy", etcno);
	}

	@Override
	public void addNotice(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("aprv.addNotice", params);
	}

	@Override
	public List<HashMap<String, String>> getEmpList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("aprv.getEmpList", params);
	}

	@Override
	public int getEmpCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("aprv.getEmpCnt", params);
	}
	
	
}
