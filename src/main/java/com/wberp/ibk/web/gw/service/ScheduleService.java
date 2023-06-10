package com.wberp.ibk.web.gw.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.gw.dao.IScheduleDao;

@Service
public class ScheduleService implements IScheduleService {

	@Autowired
	public IScheduleDao iScheduleDao;

	@Override
	public HashMap<String, String> getgwScheDetail(HashMap<String, String> params) throws Throwable {
		return iScheduleDao.getgwScheDetail(params);
	}

	@Override
	public void gwSchUpdate(HashMap<String, String> params) throws Throwable {
		iScheduleDao.gwSchUpdate(params);
		
	}

	@Override
	public List<HashMap<String, String>> getFullcalendar(HashMap<String, String> params) throws Throwable {
		return iScheduleDao.getFullcalendar(params);
	}

	@Override
	public void getgwSchAdd(HashMap<String, String> params) throws Throwable {
		iScheduleDao.getgwSchAdd(params);
	}

	@Override
	public int getgwSchDelete(HashMap<String, String> params) throws Throwable {
		return iScheduleDao.getgwSchDelete(params);
	}

	@Override
	public HashMap<String, String> ScheAdd(HashMap<String, String> params) throws Throwable {
		return iScheduleDao.ScheAdd(params);
	}

	@Override
	public void addgwScheAtchFile(HashMap<String, String> params) throws Throwable {
		iScheduleDao.addgwScheAtchFile(params);
	}

	@Override
	public void gwSchUpdateFile(HashMap<String, String> params) throws Throwable {
		iScheduleDao.gwSchUpdateFile(params);
	}

	@Override
	public void gwSchDelFile(HashMap<String, String> params) throws Throwable {
		iScheduleDao.gwSchDelFile(params);
	}

	@Override
	public List<HashMap<String, String>> getgwScheAtchFileSelect(HashMap<String, String> params) throws Throwable {
		return iScheduleDao.getgwScheAtchFileSelect(params);
	}

	@Override
	public void addgwScheAtchFile0(HashMap<String, String> params) throws Throwable {
		iScheduleDao.addgwScheAtchFile0(params);
	}

	@Override
	public List<HashMap<String, String>> getgwWorkSort(HashMap<String, String> params) throws Throwable {
		return iScheduleDao.getgwWorkSort(params);
	}
}
