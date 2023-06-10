package com.wberp.ibk.web.crm.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.crm.dao.ICustDao;

@Service
public class CustService implements ICustService {
	@Autowired
	public ICustDao iCustDao;

	@Override
	public int getCustCnt(HashMap<String, String> params) throws Throwable {
		return iCustDao.getCustCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getCust(HashMap<String, String> params) throws Throwable {
		return iCustDao.getCust(params);
	}

	@Override
	public void addCust(HashMap<String, String> params) throws Throwable {
		iCustDao.addCust(params);
	}

	@Override
	public int getCustGroupCnt(HashMap<String, String> params) throws Throwable {
		return iCustDao.getCustGroupCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getCustGroup(HashMap<String, String> params) throws Throwable {
		return iCustDao.getCustGroup(params);
	}

	@Override
	public List<HashMap<String, String>> getArea() throws Throwable {
		return iCustDao.getArea();
	}

	@Override
	public List<HashMap<String, String>> getChanNm() throws Throwable {
		return iCustDao.getChanNm();
	}

	@Override
	public void custFlitAdd(HashMap<String, String> params) throws Throwable {
		iCustDao.custFlitAdd(params);
	}

	@Override
	public void custFlitAreaAdd(HashMap<String, String> params) throws Throwable {
		iCustDao.custFlitAreaAdd(params);
	}

	@Override
	public void custFlitChanAdd(HashMap<String, String> params) throws Throwable {
		iCustDao.custFlitChanAdd(params);
	}

	@Override
	public String custGroupSeq() throws Throwable {
		return iCustDao.custGroupSeq();
	}

	@Override
	public String custNoSeq() throws Throwable {
		return iCustDao.custNoSeq();
	}

	@Override
	public void addRecpAgre(HashMap<String, String> params) throws Throwable {
		iCustDao.addRecpAgre(params);
	}

	@Override
	public int updatecust(HashMap<String, String> params) throws Throwable {
		return iCustDao.updatecust(params);
	}

	@Override
	public HashMap<String, String> custDetail(HashMap<String, String> params) throws Throwable {
		return iCustDao.custDetail(params);
	}

	@Override
	public int custDelete(HashMap<String, String> params) throws Throwable {
		return iCustDao.custDelete(params);
	}

	@Override
	public int updatechan(HashMap<String, String> params) throws Throwable {
		return iCustDao.updatechan(params);
	}

	@Override
	public int custGroupUpdate(HashMap<String, String> params) throws Throwable {
		return iCustDao.custGroupUpdate(params);
	}

	@Override
	public HashMap<String, String> custGroupDetail(HashMap<String, String> params) throws Throwable {
		return iCustDao.custGroupDetail(params);
	}

	@Override
	public int custGroupChanUpdate(HashMap<String, String> params) throws Throwable {
		return iCustDao.custGroupChanUpdate(params);
	}

	@Override
	public int custGroupAreaUpdate(HashMap<String, String> params) throws Throwable {
		return iCustDao.custGroupAreaUpdate(params);
	}

	@Override
	public int custGroupDelete(HashMap<String, String> params) throws Throwable {
		return iCustDao.custGroupDelete(params);
	}

	@Override
	public int custGroupAreaDelete(HashMap<String, String> params) throws Throwable {
		return iCustDao.custGroupAreaDelete(params);
	}

	@Override
	public int custGroupChanDelete(HashMap<String, String> params) throws Throwable {
		return iCustDao.custGroupChanDelete(params);
	}

	@Override
	public List<HashMap<String, String>> getChanType(HashMap<String, String> params) throws Throwable {
		return iCustDao.getChanType(params);
	}

	@Override
	public void custFlitChanAdd2(HashMap<String, String> params) throws Throwable {
		 iCustDao.custFlitChanAdd2(params);
	}

	@Override
	public List<HashMap<String, String>> recpDetail(HashMap<String, String> params) throws Throwable {
		return iCustDao.recpDetail(params);
	}

	@Override
	public void addRecpAgre1(HashMap<String, String> params) throws Throwable {
		iCustDao.addRecpAgre1(params);
	}

}
