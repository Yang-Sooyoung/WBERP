package com.wberp.ibk.web.hr.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.hr.dao.IDeptMangDao;

@Service
public class DeptMangService implements IDeptMangService {
	@Autowired
	public IDeptMangDao iDeptMangDao;

	@Override
	public int getDeptMangCnt(HashMap<String, String> params) throws Throwable {
		return iDeptMangDao.getDeptMangCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getDeptMangList(HashMap<String, String> params) throws Throwable {
		return iDeptMangDao.getDeptMangList(params);
	}

	@Override
	public HashMap<String, String> getDeptMangDetailCont(HashMap<String, String> params) throws Throwable {
		return iDeptMangDao.getDeptMangDetailCont(params);
	}

	@Override
	public void DeptMangAdd(HashMap<String, String> params) throws Throwable {
		iDeptMangDao.DeptMangAdd(params);
	}

	@Override
	public int DeptMangUpdate(HashMap<String, String> params) throws Throwable {
		return iDeptMangDao.DeptMangUpdate(params);
	}

	@Override
	public int DeptMangDelete(HashMap<String, String> params) throws Throwable {
		return iDeptMangDao.DeptMangDelete(params);
	}
}
