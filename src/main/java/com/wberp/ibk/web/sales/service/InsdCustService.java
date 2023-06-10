package com.wberp.ibk.web.sales.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.sales.dao.IInsdCustDao;

@Service
public class InsdCustService implements IInsdCustService{
	@Autowired
	public IInsdCustDao iInsdCustDao;

	@Override
	public int getInsdCustCnt(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.getInsdCustCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getInsdCustList(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.getInsdCustList(params);
	}

	@Override
	public void CustComAdd(HashMap<String, String> params) throws Throwable {
		iInsdCustDao.CustComAdd(params);
	}

	@Override
	public HashMap<String, String> getCustCom(HashMap<String, String> params) throws Throwable {
		
		return iInsdCustDao.getCustCom(params);
	}

	@Override
	public int CustComDelete(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.CustComDelete(params);
	}

	@Override
	public int getCustGodsCnt(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.getCustGodsCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getCustGodsList(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.getCustGodsList(params);
	}

	@Override
	public HashMap<String, String> getCustComUpdate(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.getCustComUpdate(params);
	}

	@Override
	public int updateCustCom(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.updateCustCom(params);
	}

	@Override
	public int getInsdCustCnt2(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.getInsdCustCnt2(params);
	}

	@Override
	public List<HashMap<String, String>> getInsdCustList2(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.getInsdCustList2(params);
	}

	@Override
	public HashMap<String, String> getCustDetail(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.getCustDetail(params);
	}

	@Override
	public int CustDelete(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.CustDelete(params);
	}

	@Override
	public void CustAdd(HashMap<String, Object> susin) throws Throwable {
		iInsdCustDao.CustAdd(susin);
	}

	@Override
	public int updateCust(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.updateCust(params);
	}

	@Override
	public HashMap<String, String> getCust(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.getCust(params);
	}

	@Override
	public int updateOpnn(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.updateOpnn(params);
	}

	@Override
	public int getopnnCnt(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.getopnnCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getopnnList(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.getopnnList(params);
	}

	@Override
	public void OpnAdd(HashMap<String, String> params) throws Throwable {
		iInsdCustDao.OpnAdd(params);
	}

	@Override
	public int getCustListPopCnt(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.getCustListPopCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getCustListPop(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.getCustListPop(params);
	}

	@Override
	public int getCustComCnt(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.getCustComCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getCustComList(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.getCustComList(params);
	}

	@Override
	public String nextVar(HashMap<String, String> params) throws Throwable {
		return iInsdCustDao.nextVar(params);
	}



}
