package com.wberp.ibk.web.eis.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.eis.dao.IreqsListDao;

@Service
public class reqsListService implements IreqsListService { 
	@Autowired
	public IreqsListDao ireqsListDao;

	@Override
	public List<HashMap<String, String>> getreqsList(HashMap<String, String> params) throws Throwable {
		return ireqsListDao.getreqsList(params);
	}

	@Override
	public int getreqsCnt(HashMap<String, String> params) throws Throwable {
		return ireqsListDao.getreqsCnt(params);
	}

	@Override
	public HashMap<String, String> getreqsDetail(HashMap<String, String> params) throws Throwable {
		return ireqsListDao.getreqsDetail(params);
	}

	@Override
	public void reqsAdd(HashMap<String, String> params) throws Throwable {
		ireqsListDao.reqsAdd(params);
	}

	@Override
	public int reqsUpdate(HashMap<String, String> params) throws Throwable {
		return ireqsListDao.reqsUpdate(params);
	}

	@Override
	public int reqsDelete(HashMap<String, String> params) throws Throwable {
		return ireqsListDao.reqsDelete(params);
	}

	@Override
	public int proc4Update(HashMap<String, String> params) throws Throwable {
		return ireqsListDao.proc4Update(params);
	}

	@Override
	public int proc1Update(HashMap<String, String> params) throws Throwable {
		return ireqsListDao.proc1Update(params);
	}

	@Override
	public int proc2Update(HashMap<String, String> params) throws Throwable {
		return ireqsListDao.proc2Update(params);
	}

	@Override
	public int refsAdd(HashMap<String, String> params) throws Throwable {
		return ireqsListDao.refsAdd(params);
	}

	@Override
	public int getreqsComtCnt(HashMap<String, String> params) throws Throwable {
		return ireqsListDao.getreqsComtCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getreqsComt(HashMap<String, String> params) throws Throwable {
		return ireqsListDao.getreqsComt(params);
	}

	@Override
	public void comtAdd(HashMap<String, String> params) throws Throwable {
		ireqsListDao.comtAdd(params);
	}

	@Override
	public int comtDelete(HashMap<String, String> params) throws Throwable {
		return ireqsListDao.comtDelete(params);
	}

	@Override
	public int comtUpdate(HashMap<String, String> params) throws Throwable {
		return ireqsListDao.comtUpdate(params);
	}

	@Override
	public List<HashMap<String, String>> getcatgList(HashMap<String, String> params) throws Throwable {
		return ireqsListDao.getcatgList(params);
	}

	@Override
	public int getcatgCnt(HashMap<String, String> params) throws Throwable {
		return ireqsListDao.getcatgCnt(params);
	}

} 
