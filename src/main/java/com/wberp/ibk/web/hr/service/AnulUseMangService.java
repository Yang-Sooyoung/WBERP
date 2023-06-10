package com.wberp.ibk.web.hr.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.hr.dao.IAnulUseMangDao;
@Service
public class AnulUseMangService implements IAnulUseMangService {
	@Autowired
	public IAnulUseMangDao iAnulUseDao;
	
	@Override
	public int getAnulUseCnt(HashMap<String, String> params) throws Throwable {
		return iAnulUseDao.getAnulUseCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getAnulUseList(HashMap<String, String> params) throws Throwable {
		return iAnulUseDao.getAnulUseList(params);
	}

	@Override
	public HashMap<String, String> getAnulUseDetailCont(HashMap<String, String> params) throws Throwable {
		return iAnulUseDao.getAnulUseDetailCont(params);
	}

	@Override
	public void anulUseAdd(HashMap<String, String> params) throws Throwable {
		iAnulUseDao.anulUseAdd(params);
	}

	@Override
	public int anulUseUpdate(HashMap<String, String> params) throws Throwable {
		return iAnulUseDao.anulUseUpdate(params);
	}

	@Override
	public int anulUseDelete(HashMap<String, String> params) throws Throwable {
		return iAnulUseDao.anulUseDelete(params);
	}

	@Override
	public String nextVar(HashMap<String, String> params) throws Throwable {
		return iAnulUseDao.nextVar(params);
	}
}