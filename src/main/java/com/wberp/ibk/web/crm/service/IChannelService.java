package com.wberp.ibk.web.crm.service;

import java.util.HashMap;
import java.util.List;

import org.aspectj.org.eclipse.jdt.internal.codeassist.ThrownExceptionFinder;

public interface IChannelService {

	public int getChanCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getChan(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getchannelTypelist(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getsupplySubcSelect(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getsupplyType(HashMap<String, String> params)throws Throwable;

	public void chanAddAjax(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getChanDetail(HashMap<String, String> params)throws Throwable;

	public void ChanUpdate(HashMap<String, String> params)throws Throwable;

	public void ChanDelete(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getEtcList(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getEtcListCotr(HashMap<String, String> params) throws  Throwable;

	public List<HashMap<String, String>> getEtcListSupl(HashMap<String, String> params)throws Throwable;

	public void deleteEtcChanType(HashMap<String, String> params)throws Throwable;

	public void deleteEtcCotr(HashMap<String, String> params)throws Throwable;

	public void deleteEtcSupl(HashMap<String, String> params)throws Throwable;

	public void addEtcChanType(HashMap<String, String> params)throws Throwable;

	public void addEtcCotr(HashMap<String, String> params)throws Throwable;

	public void addEtcSupl(HashMap<String, String> params)throws Throwable;

}
