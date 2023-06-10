package com.wberp.ibk.web.crm.dao;

import java.util.HashMap;
import java.util.List;

public interface ICustDao {

	public int getCustCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCust(HashMap<String, String> params) throws Throwable;

	public void addCust(HashMap<String, String> params) throws Throwable;

	public int getCustGroupCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCustGroup(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getArea() throws Throwable;

	public List<HashMap<String, String>> getChanNm() throws Throwable;

	public void custFlitAdd(HashMap<String, String> params) throws Throwable;

	public void custFlitAreaAdd(HashMap<String, String> params) throws Throwable;

	public void custFlitChanAdd(HashMap<String, String> params) throws Throwable;

	public String custGroupSeq() throws Throwable;

	public String custNoSeq() throws Throwable;

	public void addRecpAgre(HashMap<String, String> params) throws Throwable;

	public int updatecust(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> custDetail(HashMap<String, String> params) throws Throwable;

	public int custDelete(HashMap<String, String> params) throws Throwable;

	public int updatechan(HashMap<String, String> params) throws Throwable;



	public int custGroupUpdate(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> custGroupDetail(HashMap<String, String> params) throws Throwable;

	public int custGroupChanUpdate(HashMap<String, String> params) throws Throwable;

	public int custGroupAreaUpdate(HashMap<String, String> params) throws Throwable;

	public int custGroupDelete(HashMap<String, String> params) throws Throwable;

	public int custGroupAreaDelete(HashMap<String, String> params) throws Throwable;

	public int custGroupChanDelete(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getChanType(HashMap<String, String> params) throws Throwable;

	public void custFlitChanAdd2(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> recpDetail(HashMap<String, String> params) throws Throwable;

	public void addRecpAgre1(HashMap<String, String> params) throws Throwable;

}
