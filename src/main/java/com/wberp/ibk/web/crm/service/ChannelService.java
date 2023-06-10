package com.wberp.ibk.web.crm.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.crm.dao.IChannelDao;

@Service
public class ChannelService implements IChannelService{

	@Autowired
	public IChannelDao iChannelDao;

	@Override
	public int getChanCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iChannelDao.getChanCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getChan(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return	iChannelDao.getChan(params);
	}

	@Override
	public List<HashMap<String, String>> getchannelTypelist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iChannelDao.getchannelTypelist(params);
	}

	@Override
	public List<HashMap<String, String>> getsupplySubcSelect(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iChannelDao.getsupplySubcSelect(params);
	}

	@Override
	public List<HashMap<String, String>> getsupplyType(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iChannelDao.getsupplyType(params);
	}

	@Override
	public void chanAddAjax(HashMap<String, String> params) throws Throwable {
		iChannelDao.chanAdd(params);
	}

	@Override
	public HashMap<String, String> getChanDetail(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iChannelDao.getChanDetail(params);
	}

	@Override
	public void ChanUpdate(HashMap<String, String> params) throws Throwable {
		iChannelDao.ChanUpdate(params);
		
	}

	@Override
	public void ChanDelete(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iChannelDao.ChanDelete(params);
	}

	@Override
	public List<HashMap<String, String>> getEtcList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iChannelDao.getEtcList(params);
	}

	@Override
	public List<HashMap<String, String>> getEtcListCotr(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iChannelDao.getEtcListCotr(params);
	}

	@Override
	public List<HashMap<String, String>> getEtcListSupl(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iChannelDao.getEtcListSupl(params);
	}

	@Override
	public void deleteEtcChanType(HashMap<String, String> params) throws Throwable {
		iChannelDao.deleteEtcChanType(params);
		
	}

	@Override
	public void deleteEtcCotr(HashMap<String, String> params) throws Throwable {
		iChannelDao.deleteEtcCotr(params);
	}

	@Override
	public void deleteEtcSupl(HashMap<String, String> params) throws Throwable {
		iChannelDao.deleteEtcSupl(params);
	}

	@Override
	public void addEtcChanType(HashMap<String, String> params) throws Throwable {
		iChannelDao.addEtcChanType(params);
	}

	@Override
	public void addEtcCotr(HashMap<String, String> params) throws Throwable {
		iChannelDao.addEtcCotr(params);
	}

	@Override
	public void addEtcSupl(HashMap<String, String> params) throws Throwable {
		iChannelDao.addEtcSupl(params);
	}
}
