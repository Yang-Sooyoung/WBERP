package com.wberp.ibk.web.gw.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.gw.dao.IApprovalDao;

@Service
public class ApprovalService implements IApprovalService {
	
	@Autowired
	public IApprovalDao iApprovalDao;

	@Override
	public int addAppMode(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.addAppMode(params);
	}

	@Override
	public int getAprvModeCnt(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAprvModeCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getAprvModeList(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAprvModeList(params);
	}

	@Override
	public HashMap<String, String> getAprvMode(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAprvMode(params);
	}

	@Override
	public int deleteAprvMdoe(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.deleteAprvMdoe(params);
	}

	@Override
	public int updateAprvMode(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.updateAprvMode(params);
	}

	@Override
	public void addApp(HashMap<String, String> params) throws Throwable {
		iApprovalDao.addApp(params);
		
	}

	@Override
	public void addAppRef(HashMap<String, String> params) throws Throwable {
		iApprovalDao.addAppRef(params);
		
	}

	@Override
	public void addAppAthr(HashMap<String, String> params) throws Throwable {
		iApprovalDao.addAppAthr(params);
		
	}

	@Override
	public int getAppErcpCnt(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAppErcpCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getAppErcpList(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAppErcpList(params);
	}

	@Override
	public List<HashMap<String, String>> getAppErcpList_req(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAppErcpList_req(params);
	}

	@Override
	public List<HashMap<String, String>> getAppErcpList_ref(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAppErcpList_ref(params);
	}

	@Override
	public List<HashMap<String, String>> getAppErcpList_adm(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAppErcpList_adm(params);
	}

	@Override
	public int getAppErcpCnt_req(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAppErcpCnt_req(params);
	}

	@Override
	public int getAppErcpCnt_ref(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAppErcpCnt_ref(params);
	}

	@Override
	public int getAppErcpCnt_adm(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAppErcpCnt_adm(params);
	}

	@Override
	public List<HashMap<String, String>> getApp(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getApp(params);
	}

	@Override
	public void addAppFile(HashMap<String, String> params) throws Throwable {
		iApprovalDao.addAppFile(params);
	}

	@Override
	public HashMap<String, String> getAppFile(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAppFile(params);
	}
	
	@Override
	public int aprvSuc(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.aprvSuc(params);
	}

	@Override
	public int aprvRepy(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.aprvRepy(params);
	}

	@Override
	public HashMap<String, String> getAppStat(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAppStat(params);
	}

	@Override
	public int getAppSendCnt(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAppSendCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getAppSendList(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAppSendList(params);
	}

	@Override
	public int getAppSendCnt_ing(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAppSendCnt_ing(params);
	}

	@Override
	public List<HashMap<String, String>> getAppSendList_ing(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAppSendList_ing(params);
	}

	@Override
	public int getAppSendCnt_end(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAppSnedCnt_end(params);
	}

	@Override
	public List<HashMap<String, String>> getAppSendList_end(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAppSendList_end(params);
	}

	@Override
	public List<HashMap<String, String>> getAppResn(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getAppResn(params);
	}

	@Override
	public void PublicAppAdd(String gbnNo, String empno, String athrno, String title, String cont, String type)	throws Throwable {
		String aprvno = iApprovalDao.getAppNo();
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("gbnNo", gbnNo);
		params.put("empno", empno);
		params.put("apptitle", title);
		params.put("cont", cont);
		params.put("type", type);
		params.put("appathr", athrno);
		params.put("aprvno", aprvno);
		iApprovalDao.PublicAppAdd(params);
		iApprovalDao.addAppAthr(params);
		iApprovalDao.addNotice(params);
	}

	@Override
	public String getAppNo() throws Throwable {
		return iApprovalDao.getAppNo();
	}

	@Override
	public String getAppFileNo() throws Throwable {
		return iApprovalDao.getAppFileNo();
	}

	@Override
	public String getAppModeNo() throws Throwable {
		return iApprovalDao.getAppModeNo();
	}

	@Override
	public String returnPublicApp(String gbnNo) throws Throwable {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("gbnNo", gbnNo);
		return iApprovalDao.returnPublicApp(params);
		
	}

	@Override
	public void campAprvSuc(HashMap<String, String> etcno) throws Throwable {
		iApprovalDao.campAprvSuc(etcno);
	}

	@Override
	public void anulUseAprvSuc(HashMap<String, String> etcno) throws Throwable {
		iApprovalDao.anulUseAprvSuc(etcno);
	}

	@Override
	public void campAprvRepy(HashMap<String, String> etcno) throws Throwable {
		iApprovalDao.campAprvRepy(etcno);
	}

	@Override
	public void anulUseAprvRepy(HashMap<String, String> etcno) throws Throwable {
		iApprovalDao.anulUseAprvRepy(etcno);
	}

	@Override
	public void addNotice(HashMap<String, String> params) throws Throwable {
		iApprovalDao.addNotice(params);
	}

	@Override
	public List<HashMap<String, String>> getEmpList(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getEmpList(params);
	}

	@Override
	public int getEmpCnt(HashMap<String, String> params) throws Throwable {
		return iApprovalDao.getEmpCnt(params);
	}

}
