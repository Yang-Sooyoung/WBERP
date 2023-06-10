package com.wberp.ibk.web.sales.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.sales.dao.ISaleMangDao;

@Service
public class SaleMangService implements ISaleMangService {
	@Autowired
	public ISaleMangDao iSaleMangDao;

	@Override
	public int getSaleMangListCnt(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangListCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getSaleMangList(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangList(params);
	}

	@Override
	public HashMap<String, String> getSaleMangDetail(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangDetail(params);
	}
	
	@Override
	public int getSugsTabCnt(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSugsTabCnt(params);
	}
	
	@Override
	public int getNegtTabCnt(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getNegtTabCnt(params);
	}
	
	@Override
	public int getCotrTabCnt(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getCotrTabCnt(params);
	}
	
	@Override
	public HashMap<String, String> getSugsTabList(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSugsTabList(params);
	}
	
	@Override
	public HashMap<String, String> getNegtTabList(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getNegtTabList(params);
	}
	
	@Override
	public HashMap<String, String> getCotrTabList(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getCotrTabList(params);
	}
	
	@Override
	public String getSugsNo() throws Throwable {
		return iSaleMangDao.getSugsNo();
	}
	
	@Override
	public void sugsAdd1(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.sugsAdd1(params);		
	}
	
	@Override
	public void sugsAdd2(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.sugsAdd2(params);		
	}
	
	@Override
	public String getNegtNo() throws Throwable {
		return iSaleMangDao.getNegtNo();
	}

	@Override
	public void negtAdd1(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.negtAdd1(params);		
	}
	
	@Override
	public void negtAdd2(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.negtAdd2(params);		
	}

	@Override
	public void negtAdd3(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.negtAdd3(params);	
	}
	@Override
	public String getCotrNo() throws Throwable {
		return iSaleMangDao.getCotrNo();
	}

	@Override
	public void cotrAdd1(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.cotrAdd1(params);
	}
	
	@Override
	public void cotrAdd2(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.cotrAdd2(params);
	}
	
	@Override
	public void cotrAdd3(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.cotrAdd3(params);
	}
	
	@Override
	public void sugsUpdate1(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.sugsUpdate1(params);			
	}
	
	@Override
	public void sugsUpdate2(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.sugsUpdate2(params);			
	}

	@Override
	public void negtUpdate1(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.negtUpdate1(params);			
	}
	
	@Override
	public void negtUpdate2(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.negtUpdate2(params);			
	}
	
	@Override
	public void negtUpdate3(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.negtUpdate3(params);			
	}

	@Override
	public void cotrUpdate1(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.cotrUpdate1(params);			
	}
	
	@Override
	public void cotrUpdate2(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.cotrUpdate2(params);			
	}
	
	@Override
	public void cotrUpdate3(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.cotrUpdate3(params);			
	}
	
	@Override
	public void commentAdd1(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.commentAdd1(params);
	}
	
	@Override
	public void commentAdd2(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.commentAdd2(params);
	}
	
	@Override
	public void commentAdd3(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.commentAdd3(params);
	}

	@Override
	public int commentUpdate1(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.commentUpdate1(params);
	}
	
	@Override
	public int commentUpdate2(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.commentUpdate2(params);
	}
	
	@Override
	public int commentUpdate3(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.commentUpdate3(params);
	}

	@Override
	public int commentDelete(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.commentDelete(params);
	}

	@Override
	public int getSugsCommentCnt(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSugsCommentCnt(params);
	}

	@Override
	public int getNegtCommentCnt(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getNegtCommentCnt(params);
	}

	@Override
	public int getCotrCommentCnt(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getCotrCommentCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getSugsCommentList(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSugsCommentList(params);
	}

	@Override
	public List<HashMap<String, String>> getNegtCommentList(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getNegtCommentList(params);
	}

	@Override
	public List<HashMap<String, String>> getCotrCommentList(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getCotrCommentList(params);
	}

	@Override
	public void saleMangAdd(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.saleMangAdd(params);
	}
	
	@Override
	public int getSaleMangAddSearchCustCompCnt(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangAddSearchCustCompCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getSaleMangAddSearchCustComp(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangAddSearchCustComp(params);
	}

	@Override
	public int getSaleMangAddSearchInsdCustCnt(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangAddSearchInsdCustCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getSaleMangAddSearchInsdCust(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangAddSearchInsdCust(params);
	}

	@Override
	public int getSaleMangAddSearchGodsCnt1(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangAddSearchGodsCnt1(params);
	}

	@Override
	public List<HashMap<String, String>> getSaleMangAddSearchGods1(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangAddSearchGods1(params);
	}
	
	@Override
	public int getSaleMangAddSearchGodsCnt2(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangAddSearchGodsCnt2(params);
	}
	
	@Override
	public List<HashMap<String, String>> getSaleMangAddSearchGods2(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangAddSearchGods2(params);
	}
	
	@Override
	public int getSaleMangAddSearchGodsCnt3(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangAddSearchGodsCnt3(params);
	}
	
	@Override
	public List<HashMap<String, String>> getSaleMangAddSearchGods3(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangAddSearchGods3(params);
	}
	
	@Override
	public int getSaleMangAddSearchGodsCnt6(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangAddSearchGodsCnt6(params);
	}
	
	@Override
	public List<HashMap<String, String>> getSaleMangAddSearchGods6(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangAddSearchGods6(params);
	}
	
	@Override
	public int getSaleMangAddSearchGodsCnt7(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangAddSearchGodsCnt7(params);
	}
	
	@Override
	public List<HashMap<String, String>> getSaleMangAddSearchGods7(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangAddSearchGods7(params);
	}
	
	@Override
	public int getSaleMangAddSearchGodsCnt8(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangAddSearchGodsCnt8(params);
	}
	
	@Override
	public List<HashMap<String, String>> getSaleMangAddSearchGods8(HashMap<String, String> params) throws Throwable {
		return iSaleMangDao.getSaleMangAddSearchGods8(params);
	}

	@Override
	public void saleMangUpdate(HashMap<String, String> params) throws Throwable {
		iSaleMangDao.saleMangUpdate(params);
	}

}
