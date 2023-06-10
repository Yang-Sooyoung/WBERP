package com.wberp.ibk.web.eis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DashboardDao implements IDashboardDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getDashboard(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectList("dashboard.getDashboard", params);
	}

	@Override
	public void addDashboard(HashMap<String, String> params) throws Throwable {
		
		sqlSession.insert("dashboard.addDashboard",params);
		
	}

	@Override
	public int getDashboardCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("dashboard.getDashboardCnt", params);
	}

	@Override
	public int dasbUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("dashboard.dasbUpdate", params);
	}

	@Override
	public int dasbDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("dashboard.dasbDelete", params);
	}

	@Override
	public HashMap<String, String> getLoginInfo(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("dashboard.getLoginInfo", params);
	}

	@Override
	public HashMap<String, String> getDashboardDetail(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectOne("dashboard.getDashboardDetail", params);
	}

	@Override
	public int getWidgCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("dashboard.getWidgCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getWidg(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("dashboard.getWidg", params);
	}

	@Override
	public void addWidg(HashMap<String, String> params) throws Throwable {
		
		sqlSession.insert("dashboard.addWidg",params);
		
	}

	@Override
	public HashMap<String, String> getWidgDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("dashboard.getWidgDetail", params);
	}

	@Override
	public int widgUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("dashboard.widgUpdate", params);
	}

	@Override
	public int widgDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("dashboard.widgDelete", params);
	}

	@Override
	public List<HashMap<String, String>> getChartDrawList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("dashboard.getChartDrawList", params);
	}

	@Override
	public List<HashMap<String, String>> getDashboardList(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectList("dashboard.getDashboardList", params);
	}

	@Override
	public int updateOrder(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("dashboard.updateOrder", params);
	}

	@Override
	public List<HashMap<String, String>> checkOrder(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("dashboard.checkOrder", params);
	}

	@Override
	public int getChartDrawCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("dashboard.getChartDrawCnt", params);
	}

	@Override
	public int deleteWidg(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("dashboard.deleteWidg", params);
	}

	@Override
	public int deleteDasb(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("dashboard.deleteDasb", params);
	}

	

	

	

}
