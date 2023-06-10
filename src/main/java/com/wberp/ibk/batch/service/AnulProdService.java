package com.wberp.ibk.batch.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.batch.dao.IAnulProdDao;

@Service
public class AnulProdService implements IAnulProdService {
	@Autowired
	public IAnulProdDao iAnulDao;

	@Override
	public void anulTest() throws Throwable {
		iAnulDao.anulTest();
	}
}
