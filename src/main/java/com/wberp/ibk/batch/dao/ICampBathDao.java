package com.wberp.ibk.batch.dao;

import java.util.HashMap;
import java.util.List;

public interface ICampBathDao {

	public List<HashMap<String, String>> getKaKao(String time1)throws Throwable;

	public void updateKakao(HashMap<String, String> updatekakao) throws Throwable;

	public List<HashMap<String, String>> getEmail(String time1)throws Throwable;

	public List<HashMap<String, String>> getMsg(String time1)throws Throwable;

	public void updateEmail(HashMap<String, String> updateEmail)throws Throwable;

	public void updateMsg(HashMap<String, String> updateMsg)throws Throwable;

	public List<HashMap<String, String>> getCamp(String time1)throws Throwable;

	public void updateStat(HashMap<String, String> hashp)throws Throwable;

	public HashMap<String, String> getCampAprv(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getCampCust(HashMap<String, String> params)throws Throwable;


	public void addSendData(HashMap<String, String> sendData)throws Throwable;

	public void finishSend(HashMap<String, String> hashp)throws Throwable;

	public HashMap<String, String> getCustPhone(HashMap<String, String> custParam)throws Throwable;


}
