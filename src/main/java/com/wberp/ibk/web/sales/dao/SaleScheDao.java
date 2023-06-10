package com.wberp.ibk.web.sales.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SaleScheDao implements ISaleScheDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getSaleScheMangCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salesche.getSaleScheMangCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getSaleScheMang(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salesche.getSaleScheMang", params);
	}

	@Override
	public HashMap<String, String> getSaleScheDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salesche.getSaleScheDetail", params);
	}

	@Override
	public void addSaleScheMang(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("salesche.addSaleScheMang", params);
	}

	@Override
	public List<HashMap<String, String>> getFullcalendar(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salesche.getFullcalendar", params);
	}

	@Override
	public void addScheAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("salesche.addScheAdd", params);
	}

	@Override
	public void addSaleScheAtchFile(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("salesche.addSaleScheAtchFile", params);
	}

	@Override
	public HashMap<String, String> getScheAddMap(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salesche.getScheAddMap", params);
	}

	@Override
	public HashMap<String, String> getSaleScheAddMap(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salesche.getSaleScheAddMap", params);
	}

	@Override
	public HashMap<String, String> getSaleScheAdd(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salesche.getSaleScheAdd", params);
	}

	@Override
	public List<HashMap<String, String>> getSaleScheAddSearchCustComp(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salesche.getSaleScheAddSearchCustComp", params);
	}

	@Override
	public int getSaleScheAddSearchCustCompCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salesche.getSaleScheAddSearchCustCompCnt", params);
	}

	@Override
	public int getSaleScheAddSearchInsdCustCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salesche.getSaleScheAddSearchInsdCustCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getSaleScheAddSearchInsdCust(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salesche.getSaleScheAddSearchInsdCust", params);
	}

	@Override
	public int getSaleScheAddSearchGodsCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salesche.getSaleScheAddSearchGodsCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getSaleScheAddSearchGods(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salesche.getSaleScheAddSearchGods", params);
	}

	@Override
	public String getScheNo() throws Throwable {
		return sqlSession.selectOne("salesche.getScheNo");
	}

	@Override
	public String getSaleSchecheNo() throws Throwable {
		return sqlSession.selectOne("salesche.getSaleSchecheNo");
	}

	@Override
	public String getSaleScheAtchFile() throws Throwable {
		return sqlSession.selectOne("salesche.getSaleScheAtchFile");
	}

	@Override
	public void addScheMang(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("salesche.addScheMang", params);
	}

	@Override
	public void addSaleScheAtchFileScheMang(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("salesche.addSaleScheAtchFileScheMang", params);
	}

	@Override
	public int deleteSaleSche(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("salesche.deleteSaleSche", params);
	}

	

	@Override
	public void updateScheMang(HashMap<String, String> params) throws Throwable {
		sqlSession.update("salesche.updateScheMang", params);
	}

	@Override
	public void updateSaleScheAtchFileScheMang(HashMap<String, String> params) throws Throwable {
		sqlSession.update("salesche.updateSaleScheAtchFileScheMang", params);
	}

	@Override
	public void updateSaleSche(HashMap<String, String> params) throws Throwable {
		sqlSession.update("salesche.updateSaleSche", params);
	}

	@Override
	public void deleteSaleScheAtchFileScheMang(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("salesche.deleteSaleScheAtchFileScheMang", params);
	}

	@Override
	public List<HashMap<String, String>> getSaleScheAtchFileSelect(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salesche.getSaleScheAtchFileSelect", params);
	}

	
		
	
}
