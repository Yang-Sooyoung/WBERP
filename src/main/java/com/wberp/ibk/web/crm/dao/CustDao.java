package com.wberp.ibk.web.crm.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CustDao implements ICustDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getCustCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("cust.getCustCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getCust(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("cust.getCust", params);
	}

	@Override
	public void addCust(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("cust.addCust", params);
	}

	@Override
	public int getCustGroupCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("cust.getCustGroupCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getCustGroup(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("cust.getCustGroup", params);
	}

	@Override
	public List<HashMap<String, String>> getArea() throws Throwable {
		return sqlSession.selectList("cust.getArea");
	}

	@Override
	public List<HashMap<String, String>> getChanNm() throws Throwable {
		return sqlSession.selectList("cust.getChanNm");
	}

	@Override
	public void custFlitAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("cust.custFlitAdd", params);
	}

	@Override
	public void custFlitAreaAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("cust.custFlitAreaAdd", params);
	}

	@Override
	public void custFlitChanAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("cust.custFlitChanAdd", params);
	}

	@Override
	public String custGroupSeq() throws Throwable {
		return sqlSession.selectOne("cust.custGroupSeq");
	}

	@Override
	public String custNoSeq() throws Throwable {
		return sqlSession.selectOne("cust.custNoSeq");
	}

	@Override
	public void addRecpAgre(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("cust.addRecpAgre",params);
	}

	@Override
	public int updatecust(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("cust.updatecust",params);
	}

	@Override
	public HashMap<String, String> custDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("cust.custDetail",params);
	}

	@Override
	public int custDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("cust.custDelete",params);
	}

	@Override
	public int updatechan(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("cust.updatechan", params);
	}

	

	@Override
	public HashMap<String, String> custGroupDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("cust.custGroupDetail", params);
	}

	@Override
	public int custGroupUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("cust.custGroupUpdate", params);
	}

	@Override
	public int custGroupChanUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("cust.custGroupChanUpdate", params);
	}

	@Override
	public int custGroupAreaUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("cust.custGroupAreaUpdate", params);
	}

	@Override
	public int custGroupDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("cust.custGroupDelete", params);
	}

	@Override
	public int custGroupAreaDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("cust.custGroupAreaDelete", params);
	}

	@Override
	public int custGroupChanDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("cust.custGroupChanDelete", params);
	}

	@Override
	public List<HashMap<String, String>> getChanType(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("cust.getChanType",params);
	}

	@Override
	public void custFlitChanAdd2(HashMap<String, String> params) throws Throwable {
		sqlSession.selectList("cust.custFlitChanAdd2",params);
	}

	@Override
	public List<HashMap<String, String>> recpDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("cust.recpDetail",params);
	}

	@Override
	public void addRecpAgre1(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("cust.addRecpAgre1",params);		
	}

}
