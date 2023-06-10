package com.wberp.ibk.web.gw.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.gw.dao.IDocDao;

@Service
public class DocService implements IDocService {

	@Autowired
	public IDocDao iDocDao;

	@Override
	public int getDocCnt(HashMap<String, String> params) throws Throwable {
		return iDocDao.getDocCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getDoc(HashMap<String, String> params) throws Throwable {
		return iDocDao.getDoc(params);
	}

	@Override
	public HashMap<String, String> docDetail(HashMap<String, String> params) throws Throwable {
		return iDocDao.docDetail(params);
	}

	@Override
	public void docAdd(HashMap<String, String> params) throws Throwable {
		iDocDao.docAdd(params);
	}

	@Override
	public void docUpdate(HashMap<String, String> params) throws Throwable {
		iDocDao.docUpdate(params);
	}

	@Override
	public int docDelete(HashMap<String, String> params) throws Throwable {
		return iDocDao.docDelete(params);
	}

	@Override
	public void updateDocHit(HashMap<String, String> params) throws Throwable {
		iDocDao.updateDocHit(params);
	}

	@Override
	public int getFavCnt(HashMap<String, String> params) throws Throwable {
		return iDocDao.getFavCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getFavDoc(HashMap<String, String> params) throws Throwable {
		return iDocDao.getFavDoc(params);
	}

	@Override
	public void favUpdate(HashMap<String, String> params) throws Throwable {
		iDocDao.favUpdate(params);
	}

	@Override
	public int favDelete(HashMap<String, String> params) throws Throwable {
		return iDocDao.favDelete(params);
	}
}
