package com.wberp.ibk.batch.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CampBatchDao implements ICampBathDao{

	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getKaKao(String time1) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("CampSendBatch.kakaoSned",time1);
	}

	@Override
	public void updateKakao(HashMap<String, String> updatekakao) throws Throwable {
		sqlSession.update("CampSendBatch.updateKakao",updatekakao);
	}

	@Override
	public List<HashMap<String, String>> getEmail(String time1) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("CampSendBatch.EmailSend",time1);
	}

	@Override
	public List<HashMap<String, String>> getMsg(String time1) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("CampSendBatch.MsgSned",time1);
	}

	@Override
	public void updateEmail(HashMap<String, String> updateEmail) throws Throwable {
		sqlSession.update("CampSendBatch.updateEmail",updateEmail);
	}

	@Override
	public void updateMsg(HashMap<String, String> updateMsg) throws Throwable {
		sqlSession.update("CampSendBatch.updateMsg",updateMsg);		
	}

	@Override
	public List<HashMap<String, String>> getCamp(String time1) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("CampSendBatch.getCamp",time1);
	}

	@Override
	public void updateStat(HashMap<String, String> hashp) throws Throwable {
		sqlSession.update("CampSendBatch.updateStat",hashp);
	}

	@Override
	public HashMap<String, String> getCampAprv(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CampSendBatch.getCampAprv",params);
	}

	@Override
	public List<HashMap<String, String>> getCampCust(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("CampSendBatch.getCampCust",params);
	}


	@Override
	public void addSendData(HashMap<String, String> sendData) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("CampSendBatch.addSendData",sendData);
	}

	@Override
	public void finishSend(HashMap<String, String> hashp) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("CampSendBatch.finishSend",hashp);
	}

	@Override
	public HashMap<String, String> getCustPhone(HashMap<String, String> custParam) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CampSendBatch.getCustPhone",custParam);
	}

}
