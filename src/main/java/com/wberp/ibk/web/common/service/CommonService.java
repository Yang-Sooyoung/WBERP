package com.wberp.ibk.web.common.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.common.dao.ICommonDao;

@Service
public class CommonService implements ICommonService {
	@Autowired
	public ICommonDao iCommonDao;

	@Override
	public HashMap<String, String> loginCheck(HashMap<String, String> params) throws Throwable {
		return iCommonDao.loginCheck(params);
	}

	@Override
	public String menuAthrCheck(String athrNo, String menuNo) throws Throwable {
		HashMap<String, String> params = new HashMap<String, String>();
		
		params.put("athrNo", athrNo);
		params.put("menuNo", menuNo);
		
		return iCommonDao.menuAthrCheck(params);
	}

	@Override
	public List<HashMap<String, String>> getTopMenu(String athrNo) throws Throwable {
		return iCommonDao.getTopMenu(athrNo);
	}

	@Override
	public List<HashMap<String, String>> getLeftMenu(HashMap<String, String> params) throws Throwable {
		return iCommonDao.getLeftMenu(params);
	}

	@Override
	public List<HashMap<String, String>> getComnCode(String bigFrac) throws Throwable {
		return iCommonDao.getComnCode(bigFrac);
	}
}
