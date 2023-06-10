package com.wberp.ibk.web.crm.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CampDao implements ICampDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getCampCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("camp.getCampCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getCamp(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("camp.getCamp", params);
	}

	@Override
	public List<HashMap<String, String>> getCampArea() throws Throwable {
		return sqlSession.selectList("camp.getCampArea");
	}

	@Override
	public void addCamp(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("camp.addCamp", params);
	}

	@Override
	public List<HashMap<String, String>> getCgList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("camp.getCgList", params);
	}

	@Override
	public HashMap<String, String> getCgData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("camp.getCgData", params);
	}

	@Override
	public void addCampCg(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("camp.addCampCg", params);
	}

	@Override
	public HashMap<String, String> getCampNo(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("camp.getCampNo", params);
	}

	@Override
	public String getCampCgNum() throws Throwable {
		return sqlSession.selectOne("camp.getCampCgNum");
	}

	@Override
	public void cgAreaAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("camp.cgAreaAdd", params);
	}

	@Override
	public List<HashMap<String, String>> getTempList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("camp.getTempList", params);
	}

	@Override
	public List<HashMap<String, String>> getChanList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("camp.getChanList", params);
	}

	@Override
	public HashMap<String, String> getTempConData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("camp.getTempConData", params);
	}

	@Override
	public int getSendTableCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("camp.getSendTableCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getSendTable(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("camp.getSendTable", params);
	}

	@Override
	public HashMap<String, String> getCampCgNo(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("camp.getCampCgNo", params);
	}

	@Override
	public void addCgChanTemp(HashMap<String, String> params) throws Throwable {
		sqlSession.update("camp.addCgChanTemp", params);
	}

	@Override
	public List<HashMap<String, String>> getSimulData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("camp.getSimulData", params);
	}

	@Override
	public List<HashMap<String, String>> getCampCustList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("camp.getCampCustList", params);
	}

	@Override
	public HashMap<String, String> getCustCountData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("camp.getCustCountData", params);
	}

	@Override
	public void addCampCust(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("camp.addCampCust", params);
	}

	@Override
	public HashMap<String, String> getCampDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("camp.getCampDetail", params);
	}

	@Override
	public void cgChanAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("camp.cgChanAdd",params);
	}
	
	@Override
	public String getCampNum() throws Throwable {
		return sqlSession.selectOne("camp.getCampNum");
	}

	@Override
	public int campUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("camp.campUpdate", params);
	}


	@Override
	public HashMap<String, String> getCampDept(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("camp.getCampDept",params);
	}

	@Override
	public int custGroupUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("camp.custGroupUpdate", params);
	}

	@Override
	public int custGroupAreaUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("camp.custGroupAreaUpdate", params);
	}

	@Override
	public int custGroupChanUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("camp.custGroupChanUpdate", params);
	}

	@Override
	public List<HashMap<String, String>> getCampChanTypeList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("camp.getCampChanTypeList",params);
	}

	@Override
	public HashMap<String, Object> getKakaoRectWhet(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("camp.getKakaoRectWhet",params);
	}

	@Override
	public HashMap<String, Object> getSmsRectWhet(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("camp.getSmsRectWhet",params);
	}

	@Override
	public HashMap<String, Object> getEmailRectWhet(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("camp.getEmailRectWhet",params);
	}

	@Override
	public void updateCampCust(HashMap<String, String> params) throws Throwable {
		sqlSession.update("camp.updateCampCust",params);
	}

	@Override
	public List<HashMap<String, String>> getChanDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("camp.getChanDetail", params);
	}

	@Override
	public void custGroupChanDelete(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("camp.custGroupChanDelete", params);
	}

	@Override
	public List<HashMap<String, String>> getChanList2(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("camp.getChanList2", params);
	}

	@Override
	public int campCustDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("camp.campCustDelete", params);
	}

	@Override
	public void updateStat(HashMap<String, String> params) throws Throwable {
		sqlSession.update("camp.updateStat",params);
	}

}
