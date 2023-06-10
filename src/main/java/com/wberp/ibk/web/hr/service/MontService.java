package com.wberp.ibk.web.hr.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.hr.dao.IMontDao;

@Service
public class MontService implements IMontService {
	@Autowired
	public IMontDao iMontDao;

	@Override
	public int getMontCnt(HashMap<String, String> params) throws Throwable {
		return iMontDao.getMontCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getMontList(HashMap<String, String> params) throws Throwable {
		return iMontDao.getMontList(params);
	}

	@Override
	public HashMap<String, String> getMont(HashMap<String, String> params) throws Throwable {
		return iMontDao.getMont(params);
	}

	@Override
	public void montUpdate(HashMap<String, String> params) throws Throwable {
		iMontDao.montUpdate(params);
	}

	@Override
	public void montTest() throws Throwable {
		iMontDao.montTest();
	}

	@Override
	public String date(HashMap<String, String> params) throws Throwable {
		return iMontDao.date(params);
	}

	@Override
	public String sal(HashMap<String, String> params) throws Throwable {
		return iMontDao.sal(params);
	}

	@Override
	public List<HashMap<String, String>> getCodeList(HashMap<String, String> params) throws Throwable {
		return iMontDao.getCodeList(params);
	}

	@Override
	public int getMontDetailCnt(HashMap<String, String> params) throws Throwable {
		return iMontDao.getMontDetailCnt(params);
	}
	
}
