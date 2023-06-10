package com.wberp.ibk.web.sales.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.sales.dao.IGodsDao;

@Service
public class GodsService implements IGodsService {
	@Autowired
	public IGodsDao iGodsDao;
	
	@Override
	public int getGodsCnt(HashMap<String, String> params) throws Throwable {
		return iGodsDao.getGodsCnt(params);
	}
	
	@Override
	public List<HashMap<String, String>> getGods(HashMap<String, String> params) throws Throwable {
		return iGodsDao.getGods(params);
	}

	@Override
	public HashMap<String, String> getGodsDetail(HashMap<String, String> params) throws Throwable {
		return iGodsDao.getGodsDetail(params);
	}
	
	@Override
	public void godsAdd(HashMap<String, String> params) throws Throwable {
		iGodsDao.godsAdd(params);
	}

	@Override
	public void godsUpdate(HashMap<String, String> params) throws Throwable {
		iGodsDao.godsUpdate(params);
		
	}

	@Override
	public void godsDelete(HashMap<String, String> params) throws Throwable {
		iGodsDao.godsDelete(params);
		
	}

	@Override
	public int getCotrDayQGodsCnt(HashMap<String, String> params) throws Throwable {
		return iGodsDao.getCotrDayQGodsCnt(params);

	}

	@Override
	public List<HashMap<String, String>> getCotrDayQGods(HashMap<String, String> params) throws Throwable {
		return iGodsDao.getCotrDayQGods(params);
	}



}
