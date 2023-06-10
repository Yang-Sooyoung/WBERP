package com.wberp.ibk.web.crm.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.crm.dao.ITempChanDao;

@Service
public class TempChanService implements ITempChanService {
	@Autowired
	public ITempChanDao iTempChanDao;

	@Override
	public int getTempCnt(HashMap<String, String> params) throws Throwable {
		return iTempChanDao.getTempCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getTempList(HashMap<String, String> params) throws Throwable {
		return iTempChanDao.getTempList(params);
	}

	@Override
	public void tempMailAdd(HashMap<String, String> params) throws Throwable {
		iTempChanDao.tempMailAdd(params);
	}

	@Override
	public void tempMmsAdd(HashMap<String, String> params) throws Throwable {
		iTempChanDao.tempMmsAdd(params);
		
	}
	@Override
	public String seq() throws Throwable {
		return iTempChanDao.seq();
		
	}

	@Override
	public void tempResrAdd(HashMap<String, Object> resrMap) throws Throwable {
		iTempChanDao.tempResrAdd(resrMap);
		
	}

	@Override
	public HashMap<String, String> getTempBoardDetail(HashMap<String, String> params) throws Throwable {
		return iTempChanDao.getTempBoardDetail(params);
	}

	@Override
	public List<HashMap<String, String>> getTempResrDetail(HashMap<String, String> params) throws Throwable {
		return iTempChanDao.getTempResrDetail(params);
	}

	@Override
	public void tempMmsUpdate(HashMap<String, String> params) throws Throwable {
		iTempChanDao.tempMmsUpdate(params);
		
	}

	@Override
	public void tempResrUpdate(HashMap<String, Object> resrMap) throws Throwable {
		iTempChanDao.tempResrUpdate(resrMap);
		
	}

	@Override
	public int tempBoardDelete(HashMap<String, String> params) throws Throwable {
		return iTempChanDao.tempBoardDelete(params);
	}

	@Override
	public int tempResrDelete(HashMap<String, String> params) throws Throwable {
		return iTempChanDao.tempResrDelete(params);
	}

	@Override
	public void tempResrAddUpdate(HashMap<String, Object> resrMap) throws Throwable {
		iTempChanDao.tempResrAddUpdate(resrMap);
	}

	@Override
	public void tempMailUpdate(HashMap<String, String> params) throws Throwable {
		iTempChanDao.tempMailUpdate(params);
		
	}

	@Override
	public int getUsedTemp(HashMap<String, String> params) throws Throwable {
		return iTempChanDao.getUsedTemp(params);
	}

	@Override
	public int getTempCateCnt(HashMap<String, String> params) throws Throwable {
		return iTempChanDao.getTempCateCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getTempCateList(HashMap<String, String> params) throws Throwable {
		return iTempChanDao.getTempCateList(params);
	}

	@Override
	public void tempCateAdd(HashMap<String, String> params) throws Throwable {
			iTempChanDao.tempCateAdd(params);
	}

	@Override
	public int duplTempCateCnt(HashMap<String, String> params) throws Throwable {
		return iTempChanDao.duplTempCateCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getTempChanList(HashMap<String, String> params) throws Throwable {
		return iTempChanDao.getTempChanList(params);
	}

	
}
