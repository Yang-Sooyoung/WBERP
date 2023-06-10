package com.wberp.ibk.web.hr.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.hr.dao.IAddWorkMangDao;

@Service
public class AddWorkMangService implements IAddWorkMangService {
	@Autowired
	public IAddWorkMangDao iAddWorkDao;
	
	@Override
	public int getAddWorkCnt(HashMap<String, String> params) throws Throwable {
		return iAddWorkDao.getAddWorkCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getAddWorkList(HashMap<String, String> params) throws Throwable {
		return iAddWorkDao.getAddWorkList(params);
	}

	@Override
	public HashMap<String, String> getAddWorkDetailCont(HashMap<String, String> params) throws Throwable {
		return iAddWorkDao.getAddWorkDetailCont(params);
	}

	@Override
	public void addWorkAdd(HashMap<String, String> params) throws Throwable {
		iAddWorkDao.addWorkAdd(params);
	}

	@Override
	public int addWorkUpdate(HashMap<String, String> params) throws Throwable {
		return iAddWorkDao.addWorkUpdate(params);
	}

	@Override
	public int addWorkDelete(HashMap<String, String> params) throws Throwable {
		return iAddWorkDao.addWorkDelete(params);
	}
}
