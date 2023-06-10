package com.wberp.ibk.web.gw.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.gw.dao.INoticeDao;

@Service
public class NoticeService implements INoticeService {

	@Autowired
	public INoticeDao iNoticeDao;

	@Override
	public int getNoticeCnt(HashMap<String, String> params) throws Throwable {
		return iNoticeDao.getNoticeCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getNotice(HashMap<String, String> params) throws Throwable {
		return iNoticeDao.getNotice(params);
	}

	@Override
	public int getReadCnt(HashMap<String, String> params) throws Throwable {
		return iNoticeDao.getReadCnt(params);
	}

	@Override
	public void noticeUpdate(HashMap<String, String> params) throws Throwable {
		iNoticeDao.noticeUpdate(params);
	}
}
