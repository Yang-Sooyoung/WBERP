package com.wberp.ibk.web.hr.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.hr.dao.IAnulProdMangDao;


@Service
public class AnulProdMangService implements IAnulProdMangService {
	@Autowired
	public IAnulProdMangDao iAnulProdDao;
	
	@Override
	public int getAnulProdCnt(HashMap<String, String> params) throws Throwable {
		return iAnulProdDao.getAnulProdCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getAnulProdList(HashMap<String, String> params) throws Throwable {
		return iAnulProdDao.getAnulProdList(params);
	}

	@Override
	public int anulProdUpdate(HashMap<String, String> params) throws Throwable {
		return iAnulProdDao.anulProdUpdate(params);
	}
}