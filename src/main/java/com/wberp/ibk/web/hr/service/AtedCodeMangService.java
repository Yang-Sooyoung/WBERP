package com.wberp.ibk.web.hr.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.hr.dao.IAtedCodeMangDao;

@Service
public class AtedCodeMangService implements IAtedCodeMangService {
	@Autowired
	public IAtedCodeMangDao iAtedCodeDao;

	@Override
	public int getAtedCodeCnt(HashMap<String, String> params) throws Throwable {
		return iAtedCodeDao.getAtedCodeCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getAtedCodeList(HashMap<String, String> params) throws Throwable {
		return iAtedCodeDao.getAtedCodeList(params);
	}

	@Override
	public HashMap<String, String> getAtedCodeDetailCont(HashMap<String, String> params) throws Throwable {
		return iAtedCodeDao.getAtedCodeDetailCont(params);
	}

	@Override
	public void atedCodeAdd(HashMap<String, String> params) throws Throwable {
		iAtedCodeDao.atedCodeAdd(params);
	}

	@Override
	public int atedCodeUpdate(HashMap<String, String> params) throws Throwable {
		return iAtedCodeDao.atedCodeUpdate(params);
	}

	@Override
	public int atedCodeDelete(HashMap<String, String> params) throws Throwable {
		return iAtedCodeDao.atedCodeDelete(params);
	}
}
