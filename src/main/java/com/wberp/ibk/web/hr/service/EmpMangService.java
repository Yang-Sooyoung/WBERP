package com.wberp.ibk.web.hr.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.hr.dao.IEmpMangDao;

@Service
public class EmpMangService implements IEmpMangService{
	@Autowired
	public IEmpMangDao iEmpMangDao;

	@Override
	public int getEmpMangCnt(HashMap<String, String> params) throws Throwable {
		return iEmpMangDao.getEmpMangCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getEmpMang(HashMap<String, String> params) throws Throwable {
		return iEmpMangDao.getEmpMang(params);
	}

	@Override
	public HashMap<String, String> getempMangDetail(HashMap<String, String> params) throws Throwable {
		return iEmpMangDao.getempMangDetail(params);
	}

	@Override
	public int getEmpMangDelete(HashMap<String, String> params) throws Throwable {
		return iEmpMangDao.getEmpMangDelete(params);
	}

	@Override
	public int getEmpMangUpdate(HashMap<String, String> params) throws Throwable {
		return iEmpMangDao.getEmpMangUpdate(params);
	}
	

}
