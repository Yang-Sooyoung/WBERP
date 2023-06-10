package com.wberp.ibk.web.eis.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.eis.dao.IDashboardDao;
import com.wberp.ibk.web.eis.dao.IattchListDao;

@Service
public class DasboardService implements IDashboardService {
	@Autowired
	public IDashboardDao iDashboardDao;

	@Override
	public List<HashMap<String, String>> getDashboard(HashMap<String, String> params) throws Throwable {
		
		return iDashboardDao.getDashboard(params);
	}

	@Override
	public void addDashboard(HashMap<String, String> params) throws Throwable {
		iDashboardDao.addDashboard(params);
		
		
	}

	@Override
	public int getDashboardCnt(HashMap<String, String> params) throws Throwable {
		return iDashboardDao.getDashboardCnt(params);
	}

	@Override
	public int dasbUpdate(HashMap<String, String> params) throws Throwable {
		return iDashboardDao.dasbUpdate(params);
	}

	@Override
	public int dasbDelete(HashMap<String, String> params) throws Throwable {
		return iDashboardDao.dasbDelete(params);
	}

	@Override
	public HashMap<String, String> getLoginInfo(HashMap<String, String> params) throws Throwable {
		return iDashboardDao.getLoginInfo(params);
	}

	@Override
	public HashMap<String, String> getDashboardDetail(HashMap<String, String> params) throws Throwable {
		
		return iDashboardDao.getDashboardDetail(params);
	}

	
	
	@Override
	public int getWidgCnt(HashMap<String, String> params) throws Throwable {
		return iDashboardDao.getWidgCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getWidg(HashMap<String, String> params) throws Throwable {
		return iDashboardDao.getWidg(params);
	}

	@Override
	public void addWidg(HashMap<String, String> params) throws Throwable {
		iDashboardDao.addWidg(params);
		
	}

	@Override
	public HashMap<String, String> getWidgDetail(HashMap<String, String> params) throws Throwable {
		return iDashboardDao.getWidgDetail(params);
	}

	@Override
	public int widgUpdate(HashMap<String, String> params) throws Throwable {
		return iDashboardDao.widgUpdate(params);
	}

	@Override
	public int widgDelete(HashMap<String, String> params) throws Throwable {
		return iDashboardDao.widgDelete(params);
	}

	@Override
	public List<HashMap<String, String>> getChartDrawList(HashMap<String, String> params) throws Throwable {
		return iDashboardDao.getChartDrawList(params);
	}

	@Override
	public List<HashMap<String, String>> getDashboardList(HashMap<String, String> params) throws Throwable {
		return iDashboardDao.getDashboardList(params);
	}

	@Override
	public int updateOrder(HashMap<String, String> params) throws Throwable {
		return iDashboardDao.updateOrder(params);
		
	}

	@Override
	public List<HashMap<String, String>> checkOrder(HashMap<String, String> params) throws Throwable {
		return iDashboardDao.checkOrder(params);
	}

	@Override
	public int getChartDrawCnt(HashMap<String, String> params) throws Throwable {
		return iDashboardDao.getChartDrawCnt(params);
	}

	@Override
	public int deleteWidg(HashMap<String, String> params) throws Throwable {
		return iDashboardDao.deleteWidg(params);
	}

	@Override
	public int deleteDasb(HashMap<String, String> params) throws Throwable {
		return iDashboardDao.deleteDasb(params);
	}

	

	

	

	
} 
