package com.wberp.ibk.web.hr.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnulSalDao implements IAnulSalDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getAnulSalCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("anulSal.getAnulSalCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getAnulSalList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("anulSal.getAnulSalList", params);
	}

	@Override
	public void insertExcel(Map<String, Object> paramMap) throws Throwable {
		System.out.println(paramMap.toString());
		
		ArrayList<HashMap<String, String>> list = (ArrayList<HashMap<String, String>>) paramMap.get("excelContent");
	    
	    for(int i = 0 ; i < list.size(); i++) {
	    	HashMap<String, String> data = list.get(i);
	    	System.out.println(data.get("A"));
	    	System.out.println(data.get("B"));
	    	System.out.println(data.get("C"));
	    	System.out.println(data.get("D"));
	    	System.out.println(data.get("E"));
	    	System.out.println(data.get("F"));
	    	System.out.println(data.get("G"));
	    	
	    	sqlSession.selectList("anulSal.insertExcel", data);
	    }
	    
	}

}
