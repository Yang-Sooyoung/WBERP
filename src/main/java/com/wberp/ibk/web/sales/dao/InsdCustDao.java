package com.wberp.ibk.web.sales.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InsdCustDao implements IInsdCustDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getInsdCustCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("insdcust.getInsdCustCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getInsdCustList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("insdcust.getInsdCustList",params);
	}

	@Override
	public void CustComAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("insdcust.CustComAdd",params);
	}

	@Override
	public HashMap<String, String> getCustCom(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("insdcust.getCustCom",params);
	}

	@Override
	public int CustComDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("insdcust.CustComDelete",params);
	}

	@Override
	public int getCustGodsCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("insdcust.getCustGodsCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getCustGodsList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("insdcust.getCustGodsList",params);
	}

	@Override
	public HashMap<String, String> getCustComUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("insdcust.getCustComUpdate",params);
	}

	@Override
	public int updateCustCom(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("insdcust.updateCustCom",params);
	}

	@Override
	public int getInsdCustCnt2(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("insdcust.getInsdCustCnt2",params);
	}

	@Override
	public List<HashMap<String, String>> getInsdCustList2(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("insdcust.getInsdCustList2",params);
	}

	@Override
	public HashMap<String, String> getCustDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("insdcust.getCustDetail",params);
	}

	@Override
	public int CustDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("insdcust.CustDelete",params);
	}

	@Override
	public void CustAdd(HashMap<String, Object> susin) throws Throwable {
		sqlSession.insert("insdcust.CustAdd",susin);
	}

	@Override
	public int updateCust(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("insdcust.updateCust",params);
	}

	@Override
	public HashMap<String, String> getCust(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("insdcust.getCust",params);
	}

	@Override
	public int updateOpnn(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("insdcust.updateOpnn",params);
	}

	@Override
	public int getopnnCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("insdcust.getopnnCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getopnnList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("insdcust.getopnnList",params);
	}

	@Override
	public void OpnAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("insdcust.OpnAdd",params);
	}

	@Override
	public int getCustListPopCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("insdcust.getCustListPopCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getCustListPop(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("insdcust.getCustListPop",params);
	}

	@Override
	public int getCustComCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("insdcust.getCustComCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getCustComList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("insdcust.getCustComList",params);
	}

	@Override
	public String nextVar(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("insdcust.nextVar",params);
	}


}
