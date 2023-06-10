package com.wberp.ibk.web.sales.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SaleMangDao implements ISaleMangDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getSaleMangListCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getSaleMangListCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getSaleMangList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salemang.getSaleMangList", params);
	}

	@Override
	public HashMap<String, String> getSaleMangDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getSaleMangDetail", params);
	}

	@Override
	public int getSugsTabCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getSugsTabCnt", params);
	}
	
	@Override
	public int getNegtTabCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getNegtTabCnt", params);
	}
	
	@Override
	public int getCotrTabCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getCotrTabCnt", params);
	}
	
	@Override
	public HashMap<String, String> getSugsTabList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getSugsTabList", params);
	}
	
	@Override
	public HashMap<String, String> getNegtTabList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getNegtTabList", params);
	}
	
	@Override
	public HashMap<String, String> getCotrTabList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getCotrTabList", params);
	}

	@Override
	public String getSugsNo() throws Throwable {
		return sqlSession.selectOne("salemang.getSugsNo");
	}
	
	@Override
	public void sugsAdd1(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("salemang.sugsAdd1", params);	
	}
	
	@Override
	public void sugsAdd2(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("salemang.sugsAdd2", params);	
	}

	@Override
	public String getNegtNo() throws Throwable {
		return sqlSession.selectOne("salemang.getNegtNo");
	}
	
	@Override
	public void negtAdd1(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("salemang.negtAdd1", params);		
	}
	
	@Override
	public void negtAdd2(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("salemang.negtAdd2", params);		
	}

	@Override
	public void negtAdd3(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("salemang.negtAdd3", params);	
	}
	@Override
	public String getCotrNo() throws Throwable {
		return sqlSession.selectOne("salemang.getCotrNo");
	}
	
	@Override
	public void cotrAdd1(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("salemang.cotrAdd1", params);			
	}
	
	@Override
	public void cotrAdd2(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("salemang.cotrAdd2", params);			
	}
	
	@Override
	public void cotrAdd3(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("salemang.cotrAdd3", params);	
	}

	@Override
	public void sugsUpdate1(HashMap<String, String> params) throws Throwable {
		sqlSession.update("salemang.sugsUpdate1", params);		
	}
	
	@Override
	public void sugsUpdate2(HashMap<String, String> params) throws Throwable {
		sqlSession.update("salemang.sugsUpdate2", params);		
	}

	@Override
	public void negtUpdate1(HashMap<String, String> params) throws Throwable {
		sqlSession.update("salemang.negtUpdate1", params);		
	}
	
	@Override
	public void negtUpdate2(HashMap<String, String> params) throws Throwable {
		sqlSession.update("salemang.negtUpdate2", params);		
	}
	
	@Override
	public void negtUpdate3(HashMap<String, String> params) throws Throwable {
		sqlSession.update("salemang.negtUpdate3", params);		
	}

	@Override
	public void cotrUpdate1(HashMap<String, String> params) throws Throwable {
		sqlSession.update("salemang.cotrUpdate1", params);		
	}
	
	@Override
	public void cotrUpdate2(HashMap<String, String> params) throws Throwable {
		sqlSession.update("salemang.cotrUpdate2", params);		
	}
	
	@Override
	public void cotrUpdate3(HashMap<String, String> params) throws Throwable {
		sqlSession.update("salemang.cotrUpdate3", params);		
	}
	
	@Override
	public void commentAdd1(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("salemang.commentAdd1", params);	
	}
	
	@Override
	public void commentAdd2(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("salemang.commentAdd2", params);	
	}
	
	@Override
	public void commentAdd3(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("salemang.commentAdd3", params);	
	}

	@Override
	public int commentUpdate1(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("salemang.commentUpdate1", params);
	}
	
	@Override
	public int commentUpdate2(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("salemang.commentUpdate2", params);
	}
	
	@Override
	public int commentUpdate3(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("salemang.commentUpdate3", params);
	}

	@Override
	public int commentDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("salemang.commentDelete", params);
	}

	@Override
	public int getSugsCommentCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getSugsCommentCnt", params);
	}

	@Override
	public int getNegtCommentCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getNegtCommentCnt", params);
	}

	@Override
	public int getCotrCommentCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getCotrCommentCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getSugsCommentList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salemang.getSugsCommentList", params);
	}

	@Override
	public List<HashMap<String, String>> getNegtCommentList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salemang.getNegtCommentList", params);
	}

	@Override
	public List<HashMap<String, String>> getCotrCommentList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salemang.getCotrCommentList", params);
	}

	@Override
	public void saleMangAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("salemang.saleMangAdd", params);
	}

	@Override
	public int getSaleMangAddSearchCustCompCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getSaleMangAddSearchCustCompCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getSaleMangAddSearchCustComp(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salemang.getSaleMangAddSearchCustComp", params);
	}

	@Override
	public int getSaleMangAddSearchInsdCustCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getSaleMangAddSearchInsdCustCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getSaleMangAddSearchInsdCust(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salemang.getSaleMangAddSearchInsdCust", params);
	}

	@Override
	public int getSaleMangAddSearchGodsCnt1(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getSaleMangAddSearchGodsCnt1", params);
	}

	@Override
	public List<HashMap<String, String>> getSaleMangAddSearchGods1(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salemang.getSaleMangAddSearchGods1", params);
	}
	
	@Override
	public int getSaleMangAddSearchGodsCnt2(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getSaleMangAddSearchGodsCnt2", params);
	}
	
	@Override
	public List<HashMap<String, String>> getSaleMangAddSearchGods2(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salemang.getSaleMangAddSearchGods2", params);
	}
	
	@Override
	public int getSaleMangAddSearchGodsCnt3(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getSaleMangAddSearchGodsCnt3", params);
	}
	
	@Override
	public List<HashMap<String, String>> getSaleMangAddSearchGods3(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salemang.getSaleMangAddSearchGods3", params);
	}
	
	@Override
	public int getSaleMangAddSearchGodsCnt6(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getSaleMangAddSearchGodsCnt6", params);
	}
	
	@Override
	public List<HashMap<String, String>> getSaleMangAddSearchGods6(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salemang.getSaleMangAddSearchGods6", params);
	}
	
	@Override
	public int getSaleMangAddSearchGodsCnt7(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getSaleMangAddSearchGodsCnt7", params);
	}
	
	@Override
	public List<HashMap<String, String>> getSaleMangAddSearchGods7(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salemang.getSaleMangAddSearchGods7", params);
	}
	
	@Override
	public int getSaleMangAddSearchGodsCnt8(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("salemang.getSaleMangAddSearchGodsCnt8", params);
	}
	
	@Override
	public List<HashMap<String, String>> getSaleMangAddSearchGods8(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("salemang.getSaleMangAddSearchGods8", params);
	}

	@Override
	public void saleMangUpdate(HashMap<String, String> params) throws Throwable {
		sqlSession.update("salemang.saleMangUpdate", params);
	}

}
