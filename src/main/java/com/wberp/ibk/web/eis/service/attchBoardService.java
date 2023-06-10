package com.wberp.ibk.web.eis.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.eis.dao.IattchBoardDao;

@Service
public class attchBoardService implements IattchBoardService {
	@Autowired
	public IattchBoardDao iattchBoardDao;

	@Override
	public List<HashMap<String, String>> getattchBoard(HashMap<String, String> params) throws Throwable {
		return iattchBoardDao.getattchBoard(params);
	}
} 
