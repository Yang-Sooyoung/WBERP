package com.wberp.ibk.web.crm.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.crm.dao.ICampDao;

@Service
public class CampService implements ICampService {
	@Autowired
	public ICampDao iCampDao;

	@Override
	public int getCampCnt(HashMap<String, String> params) throws Throwable {
		return iCampDao.getCampCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getCamp(HashMap<String, String> params) throws Throwable {
		return iCampDao.getCamp(params);
	}

	@Override
	public List<HashMap<String, String>> getCampArea() throws Throwable {
		return iCampDao.getCampArea();
	}

	@Override
	public void addCamp(HashMap<String, String> params) throws Throwable {
		iCampDao.addCamp(params);
	}

	@Override
	public List<HashMap<String, String>> getCgList(HashMap<String, String> params) throws Throwable {
		return iCampDao.getCgList(params);
	}

	@Override
	public HashMap<String, String> getCgData(HashMap<String, String> params) throws Throwable {
		return iCampDao.getCgData(params);
	}

	@Override
	public void addCampCg(HashMap<String, String> params) throws Throwable {
		iCampDao.addCampCg(params);
	}

	@Override
	public HashMap<String, String> getCampNo(HashMap<String, String> params) throws Throwable {
		return iCampDao.getCampNo(params);
	}

	@Override
	public String getCampCgNum() throws Throwable {
		return iCampDao.getCampCgNum();
	}

	@Override
	public void cgAreaAdd(HashMap<String, String> params) throws Throwable {
		iCampDao.cgAreaAdd(params);
	}

	@Override
	public List<HashMap<String, String>> getTempList(HashMap<String, String> params) throws Throwable {
		return iCampDao.getTempList(params);
	}

	@Override
	public List<HashMap<String, String>> getChanList(HashMap<String, String> params) throws Throwable {
		return iCampDao.getChanList(params);
	}

	@Override
	public HashMap<String, String> getTempConData(HashMap<String, String> params) throws Throwable {
		return iCampDao.getTempConData(params);
	}

	@Override
	public int getSendTableCnt(HashMap<String, String> params) throws Throwable {
		return iCampDao.getSendTableCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getSendTable(HashMap<String, String> params) throws Throwable {
		return iCampDao.getSendTable(params);
	}

	@Override
	public HashMap<String, String> getCampCgNo(HashMap<String, String> params) throws Throwable {
		return iCampDao.getCampCgNo(params);
	}

	@Override
	public void addCgChanTemp(HashMap<String, String> params) throws Throwable {
		iCampDao.addCgChanTemp(params);
	}

	@Override
	public List<HashMap<String, String>> getSimulData(HashMap<String, String> params) throws Throwable {
		return iCampDao.getSimulData(params);
	}

	@Override
	public List<HashMap<String, String>> getCampCustList(HashMap<String, String> params) throws Throwable {
		return iCampDao.getCampCustList(params);
	}

	@Override
	public HashMap<String, String> getCustCountData(HashMap<String, String> params) throws Throwable {
		return iCampDao.getCustCountData(params);
	}

	@Override
	public void addCampCust(HashMap<String, String> params) throws Throwable {
		iCampDao.addCampCust(params);
	}

	@Override
	public HashMap<String, String> getCampDetail(HashMap<String, String> params) throws Throwable {
		return iCampDao.getCampDetail(params);
	}

	@Override
	public void cgChanAdd(HashMap<String, String> params) throws Throwable {
		iCampDao.cgChanAdd(params);
	}

	@Override
	public String getCampNum() throws Throwable {
		return iCampDao.getCampNum();
	}

	@Override
	public int campUpdate(HashMap<String, String> params) throws Throwable {
		return iCampDao.campUpdate(params);
	}

	@Override
	public HashMap<String, String> getCampDept(HashMap<String, String> params) throws Throwable {
		return iCampDao.getCampDept(params);
	}

	@Override
	public int custGroupUpdate(HashMap<String, String> params) throws Throwable {
		return iCampDao.custGroupUpdate(params);
	}

	@Override
	public int custGroupAreaUpdate(HashMap<String, String> params) throws Throwable {
		return iCampDao.custGroupAreaUpdate(params);
	}

	@Override
	public int custGroupChanUpdate(HashMap<String, String> params) throws Throwable {
		return iCampDao.custGroupChanUpdate(params);
	}

	@Override
	public List<HashMap<String, String>> getCampChanTypeList(HashMap<String, String> params) throws Throwable {
		return iCampDao.getCampChanTypeList(params);
	}

	@Override
	public HashMap<String, Object> getKakaoRectWhet(HashMap<String, String> params) throws Throwable {
		return iCampDao.getKakaoRectWhet(params);
	}

	@Override
	public HashMap<String, Object> getSmsRectWhet(HashMap<String, String> params) throws Throwable {
		return iCampDao.getSmsRectWhet(params);
	}

	@Override
	public HashMap<String, Object> getEmailRectWhet(HashMap<String, String> params) throws Throwable {
		return iCampDao.getEmailRectWhet(params);
	}

	@Override
	public void updateCampCust(HashMap<String, String> params) throws Throwable {
		iCampDao.updateCampCust(params);
	}

	@Override
	public List<HashMap<String, String>> getChanDetail(HashMap<String, String> params) throws Throwable {
		return iCampDao.getChanDetail(params);
	}

	@Override
	public void custGroupChanDelete(HashMap<String, String> params) throws Throwable {
		iCampDao.custGroupChanDelete(params);
	}

	@Override
	public List<HashMap<String, String>> getChanList2(HashMap<String, String> params) throws Throwable {
		return iCampDao.getChanList2(params);
	}

	@Override
	public int campCustDelete(HashMap<String, String> params) throws Throwable {
		return iCampDao.campCustDelete(params);
	}

	@Override
	public void updateStat(HashMap<String, String> params) throws Throwable {
		iCampDao.updateStat(params);
	}

}
