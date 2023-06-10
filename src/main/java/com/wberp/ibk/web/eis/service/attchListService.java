package com.wberp.ibk.web.eis.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.eis.dao.IattchListDao;

@Service
public class attchListService implements IattchListService {
	@Autowired
	public IattchListDao iattchListDao;

	@Override
	public List<HashMap<String, String>> getattchList(HashMap<String, String> params) throws Throwable {
		return iattchListDao.getattchList(params);
	}

	@Override
	public int getAttchCnt(HashMap<String, String> params) throws Throwable {
		
		return iattchListDao.getAttchCnt(params);
	}

	@Override
	public HashMap<String, String> getattchDetail(HashMap<String, String> params) throws Throwable {
		
		return iattchListDao.getattchDetail(params);
	}

	@Override
	public void attchAdd(HashMap<String, String> params) throws Throwable {
		
		iattchListDao.attchAdd(params);
	}

	@Override
	public int attchDelete(HashMap<String, String> params) throws Throwable {
		
		return iattchListDao.attchDelete(params);
	}

	@Override
	public List<HashMap<String, Object>> getattchQuery(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iattchListDao.getattchQuery(params);
	}

	@Override
	public int attchUpdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iattchListDao.attchUpdate(params);
	}

	@Override
	public void addEisCate(HashMap<String, String> params) throws Throwable {
		iattchListDao.addEisCate(params);
		
	}

	@Override
	public int getcatgCnt2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iattchListDao.getcatgCnt2(params);
	}

	@Override
	public List<HashMap<String, String>> getcatgList2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iattchListDao.getcatgList2(params);
	}

	@Override
	public int catgDelete(HashMap<String, String> params) throws Throwable {
		return iattchListDao.catgDelete(params);
	}

	@Override
	public List<HashMap<String, String>> getAttSelecList(HashMap<String, String> params) throws Throwable {
	      return iattchListDao.getAttSelecList(params);
	   }

	   @Override
	   public HashMap<String, String> getAttSelecDetailList(HashMap<String, String> params) throws Throwable {
	      return iattchListDao.getAttSelecDetailList(params);
	   }

	   @Override
	   public List<HashMap<String, Object>> getTestQuery(HashMap<String, String> params) throws Throwable {
	      
	      return iattchListDao.getTestQuery(params);
	   }

	@Override
	public List<HashMap<String, Object>> getQuery1(HashMap<String, String> params) throws Throwable {
		return iattchListDao.getQuery1(params);
	}

	@Override
	public List<HashMap<String, Object>> getQuery2(HashMap<String, String> params) throws Throwable {
		return iattchListDao.getQuery2(params);
	}

	@Override
	public List<HashMap<String, Object>> getQuery3(HashMap<String, String> params) throws Throwable {
		return iattchListDao.getQuery3(params);
	}

	@Override
	public List<HashMap<String, Object>> getQuery4(HashMap<String, String> params) throws Throwable {
		return iattchListDao.getQuery4(params);
	}

	@Override
	public List<HashMap<String, Object>> getQuery5(HashMap<String, String> params) throws Throwable {
		return iattchListDao.getQuery5(params);
	}

	@Override
	public List<HashMap<String, Object>> getQuery6(HashMap<String, String> params) throws Throwable {
		return iattchListDao.getQuery6(params);
	}

	@Override
	public List<HashMap<String, Object>> getQuery7(HashMap<String, String> params) throws Throwable {
		return iattchListDao.getQuery7(params);
	}

	@Override
	public List<HashMap<String, Object>> getQuery8(HashMap<String, String> params) throws Throwable {
		return iattchListDao.getQuery8(params);
	}
	
} 
