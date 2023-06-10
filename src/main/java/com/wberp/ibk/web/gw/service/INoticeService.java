package com.wberp.ibk.web.gw.service;

import java.util.HashMap;
import java.util.List;

public interface INoticeService {

	int getNoticeCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getNotice(HashMap<String, String> params) throws Throwable;

	int getReadCnt(HashMap<String, String> params) throws Throwable;

	void noticeUpdate(HashMap<String, String> params) throws Throwable;

}
