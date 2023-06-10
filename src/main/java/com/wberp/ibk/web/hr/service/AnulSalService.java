package com.wberp.ibk.web.hr.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.hr.dao.IAnulSalDao;

@Service
public class AnulSalService implements IAnulSalService {
	@Autowired
	public IAnulSalDao iAnulSalDao;

	@Override
	public int getAnulSalCnt(HashMap<String, String> params) throws Throwable {
		return iAnulSalDao.getAnulSalCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getAnulSalList(HashMap<String, String> params) throws Throwable {
		return iAnulSalDao.getAnulSalList(params);
	}

	@Override
	public void excelUpload(File destFile) throws Throwable {
		ExcelReadOption excelReadOption = new ExcelReadOption();
		
		// 파일경로 추가
		excelReadOption.setFilePath(destFile.getAbsolutePath());
		// 추출할 컬럼명 추가
		excelReadOption.setOutputColumns("A", "B", "C", "D", "E", "F", "G");
		// 시작행
		excelReadOption.setStartRow(2);
		
		List<Map<String, String>>excelContent = ExcelRead.read(excelReadOption);
		
		Map<String, Object>paramMap = new HashMap<String, Object>();
		paramMap.put("excelContent", excelContent);
		
		try {
			iAnulSalDao.insertExcel(paramMap);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
