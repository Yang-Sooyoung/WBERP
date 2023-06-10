package com.wberp.ibk.web.sales.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.sales.dao.ISaleScheDao;

@Service
public class SaleScheService implements ISaleScheService {
	@Autowired
	public ISaleScheDao iSaleScheDao;

	@Override
	public int getSaleScheMangCnt(HashMap<String, String> params) throws Throwable {
		return iSaleScheDao.getSaleScheMangCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getSaleScheMang(HashMap<String, String> params) throws Throwable {
		return iSaleScheDao.getSaleScheMang(params);
	}

	@Override
	public HashMap<String, String> getSaleScheDetail(HashMap<String, String> params) throws Throwable {
		return iSaleScheDao.getSaleScheDetail(params);
	}

	@Override
	public void addSaleScheMang(HashMap<String, String> params) throws Throwable {
		iSaleScheDao.addSaleScheMang(params);
	}

	@Override
	public List<HashMap<String, String>> getFullcalendar(HashMap<String, String> params) throws Throwable {
		return iSaleScheDao.getFullcalendar(params);
	}

	@Override
	public void addScheAdd(HashMap<String, String> params) throws Throwable {
		iSaleScheDao.addScheAdd(params);
	}

	@Override
	public void addSaleScheAtchFile(HashMap<String, String> params) throws Throwable {
		iSaleScheDao.addSaleScheAtchFile(params);
	}

	@Override
	public HashMap<String, String> getScheAddMap(HashMap<String, String> params) throws Throwable {
		return iSaleScheDao.getScheAddMap(params);
	}

	@Override
	public HashMap<String, String> getSaleScheAddMap(HashMap<String, String> params) throws Throwable {
		return iSaleScheDao.getSaleScheAddMap(params);
	}

	@Override
	public HashMap<String, String> getSaleScheAdd(HashMap<String, String> params) throws Throwable {
		return iSaleScheDao.getSaleScheAdd(params);
	}

	@Override
	public List<HashMap<String, String>> getSaleScheAddSearchCustComp(HashMap<String, String> params) throws Throwable {
		return iSaleScheDao.getSaleScheAddSearchCustComp(params);
	}

	@Override
	public int getSaleScheAddSearchCustCompCnt(HashMap<String, String> params) throws Throwable {
		return iSaleScheDao.getSaleScheAddSearchCustCompCnt(params);
	}

	@Override
	public int getSaleScheAddSearchInsdCustCnt(HashMap<String, String> params) throws Throwable {
		return iSaleScheDao.getSaleScheAddSearchInsdCustCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getSaleScheAddSearchInsdCust(HashMap<String, String> params) throws Throwable {
		return iSaleScheDao.getSaleScheAddSearchInsdCust(params);
	}

	@Override
	public int getSaleScheAddSearchGodsCnt(HashMap<String, String> params) throws Throwable {
		return iSaleScheDao.getSaleScheAddSearchGodsCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getSaleScheAddSearchGods(HashMap<String, String> params) throws Throwable {
		return iSaleScheDao.getSaleScheAddSearchGods(params);
	}

	@Override
	public String getScheNo() throws Throwable {
		return iSaleScheDao.getScheNo();
	}

	@Override
	public String getSaleSchecheNo() throws Throwable {
		return iSaleScheDao.getSaleSchecheNo();
	}

	@Override
	public String getSaleScheAtchFile() throws Throwable {
		return iSaleScheDao.getSaleScheAtchFile();
	}

	@Override
	public void addScheMang(HashMap<String, String> params) throws Throwable {
		iSaleScheDao.addScheMang(params);
	}

	@Override
	public void addSaleScheAtchFileScheMang(HashMap<String, String> params) throws Throwable {
		iSaleScheDao.addSaleScheAtchFileScheMang(params);
	}

	@Override
	public int deleteSaleSche(HashMap<String, String> params) throws Throwable {
		return iSaleScheDao.deleteSaleSche(params);
	}

	

	@Override
	public void updateScheMang(HashMap<String, String> params) throws Throwable {
		iSaleScheDao.updateScheMang(params);
	}

	@Override
	public void updateSaleScheAtchFileScheMang(HashMap<String, String> params) throws Throwable {
		iSaleScheDao.updateSaleScheAtchFileScheMang(params);
	}

	@Override
	public void updateSaleSche(HashMap<String, String> params) throws Throwable {
		iSaleScheDao.updateSaleSche(params);
	}

	@Override
	public void deleteSaleScheAtchFileScheMang(HashMap<String, String> params) throws Throwable {
		iSaleScheDao.deleteSaleScheAtchFileScheMang(params);
	}

	@Override
	public List<HashMap<String, String>> getSaleScheAtchFileSelect(HashMap<String, String> params) throws Throwable {
		return iSaleScheDao.getSaleScheAtchFileSelect(params);
	}

	
}
