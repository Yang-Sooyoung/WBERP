package com.wberp.ibk.batch.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.batch.dao.ICampBathDao;

@Service
public class CampBatchService implements ICampBatchService{
	@Autowired
	public ICampBathDao iCampBathDao;

	@Override
	public List<HashMap<String, String>> getKaKao(String time1) throws Throwable {
		// TODO Auto-generated method stub
		return iCampBathDao.getKaKao(time1);
	}

	@Override
	public void updateKakao(HashMap<String, String> updatekakao) throws Throwable {
		iCampBathDao.updateKakao(updatekakao);
	}

	@Override
	public List<HashMap<String, String>> getEmail(String time1) throws Throwable {
		// TODO Auto-generated method stub
		return iCampBathDao.getEmail(time1);
	}

	@Override
	public List<HashMap<String, String>> getMsg(String time1) throws Throwable {
		// TODO Auto-generated method stub
		return iCampBathDao.getMsg(time1);
	}

	@Override
	public void updateEmail(HashMap<String, String> updateEmail) throws Throwable {
		iCampBathDao.updateEmail(updateEmail);
	}

	@Override
	public void updateMsg(HashMap<String, String> updateMsg) throws Throwable {
		iCampBathDao.updateMsg(updateMsg);
	}

	@Override
	public List<HashMap<String, String>> getCamp(String time1) throws Throwable {
		// TODO Auto-generated method stub
		return iCampBathDao.getCamp(time1);
	}

	@Override
	public void updateStat(HashMap<String, String> hashp) throws Throwable {
		iCampBathDao.updateStat(hashp);
	}

	@Override
	public HashMap<String, String> getCampAprv(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCampBathDao.getCampAprv(params);
	}

	@Override
	public List<HashMap<String, String>> getCampCust(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCampBathDao.getCampCust(params);
	}



	@Override
	public void addSendData(HashMap<String, String> sendData) throws Throwable {
		iCampBathDao.addSendData(sendData);
	}

	@Override
	public void finishSend(HashMap<String, String> hashp) throws Throwable {
		// TODO Auto-generated method stub
		iCampBathDao.finishSend(hashp);
	}

	@Override
	public HashMap<String, String> getCustPhone(HashMap<String, String> custParam) throws Throwable {
		// TODO Auto-generated method stub
		return iCampBathDao.getCustPhone(custParam);
	}


	
}
