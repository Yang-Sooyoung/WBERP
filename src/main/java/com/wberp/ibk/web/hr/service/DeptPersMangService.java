package com.wberp.ibk.web.hr.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.hr.dao.IDeptPersMangDao;

@Service
public class DeptPersMangService implements IDeptPersMangService {
	@Autowired
	public IDeptPersMangDao iDeptPersMangDao;

	@Override
	public int getDeptPersMangCnt(HashMap<String, String> params) throws Throwable {
		return iDeptPersMangDao.getDeptPersMangCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getDeptPersMangList(HashMap<String, String> params) throws Throwable {
		return iDeptPersMangDao.getDeptPersMangList(params);
	}

	@Override
	public HashMap<String, String> getDeptPersMangDetailCont(HashMap<String, String> params) throws Throwable {
		return iDeptPersMangDao.getDeptPersMangDetailCont(params);
	}

	@Override
	public List<HashMap<String, String>> getCorpList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDeptPersMangDao.getCorpList(params);
	}

}
