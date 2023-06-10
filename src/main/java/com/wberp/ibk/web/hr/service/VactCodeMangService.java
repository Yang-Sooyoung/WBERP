package com.wberp.ibk.web.hr.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.hr.dao.IVactCodeMangDao;

@Service
public class VactCodeMangService implements IVactCodeMangService {
	@Autowired
	public IVactCodeMangDao iVactCodeDao;

	@Override
	public int getVactCodeCnt(HashMap<String, String> params) throws Throwable {
		return iVactCodeDao.getVactCodeCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getVactCodeList(HashMap<String, String> params) throws Throwable {
		return iVactCodeDao.getVactCodeList(params);
	}

	@Override
	public HashMap<String, String> getVactCodeDetailCont(HashMap<String, String> params) throws Throwable {
		return iVactCodeDao.getVactCodeDetailCont(params);
	}

	@Override
	public void vactCodeAdd(HashMap<String, String> params) throws Throwable {
		iVactCodeDao.vactCodeAdd(params);
	}

	@Override
	public int vactCodeUpdate(HashMap<String, String> params) throws Throwable {
		return iVactCodeDao.vactCodeUpdate(params);
	}

	@Override
	public int vactCodeDelete(HashMap<String, String> params) throws Throwable {
		return iVactCodeDao.vactCodeDelete(params);
	}
}
