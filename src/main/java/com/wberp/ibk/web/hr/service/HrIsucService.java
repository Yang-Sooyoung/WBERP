package com.wberp.ibk.web.hr.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.hr.dao.hrIsucDao;


@Service
public class HrIsucService implements IHrIsucService {
	@Autowired
	public hrIsucDao ihrIsucDao;

	@Override
	public HashMap<String, String> gethrIsucDetailCont(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return ihrIsucDao.gethrIsucDetailCont(params);
	}

	@Override
	public int gethrIsucCnt(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return ihrIsucDao.gethrIsucCnt(params);
	}

	@Override
	public List<HashMap<String, String>> gethrIsucList(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return ihrIsucDao.gethrIsucList(params);
	}

	
	
}
