package com.wberp.ibk.web.eis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.eis.dao.IChartDao;

@Service
public class ChartService implements IChartService {
	@Autowired
	public IChartDao iChartDao;

	
	
} 
