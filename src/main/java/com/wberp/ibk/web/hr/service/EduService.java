package com.wberp.ibk.web.hr.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.hr.dao.IEduDao;

@Service
public class EduService implements IEduService{
	
	@Autowired
	public IEduDao iEduDao;
	
	@Override
	public int getEduCnt(HashMap<String, String> params) throws Throwable {
		return iEduDao.getEduCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getEduList(HashMap<String, String> params) throws Throwable {
		return iEduDao.getEduList(params);
	}
	
	@Override
	public HashMap<String, String> getEduDetail(HashMap<String, String> params) throws Throwable {
		return iEduDao.getEduDetail(params);
	}

	public int eduUpdate(HashMap<String, String> params) throws Throwable {
		return iEduDao.eduUpdate(params);
	}

	public int eduDelete(HashMap<String, String> params) throws Throwable {
		return iEduDao.eduDelete(params);
	}

	public void eduAdd(HashMap<String, String> params) throws Throwable {
		iEduDao.eduAdd(params);
	}
	
	//교육장
	
	@Override
	public int getEducenterCnt(HashMap<String, String> params) throws Throwable {
		return iEduDao.getEducenterCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getEducenterList(HashMap<String, String> params) throws Throwable {
		return iEduDao.getEducenterList(params);
	}
	
	@Override
	public HashMap<String, String> getEducenterDetail(HashMap<String, String> params) throws Throwable {
		return iEduDao.getEducenterDetail(params);
	}
	@Override
	public int educenterUpdate(HashMap<String, String> params) throws Throwable {
		return iEduDao.educenterUpdate(params);
	}
	@Override
	public int educenterDelete(HashMap<String, String> params) throws Throwable {
		return iEduDao.educenterDelete(params);
	}
	@Override
	public void educenterAdd(HashMap<String, String> params) throws Throwable {
		iEduDao.educenterAdd(params);
	}
	
	public int getEduaplyCnt(HashMap<String, String> params) throws Throwable {
		return iEduDao.getEduaplyCnt(params);
	}

	public List<HashMap<String, String>> getEduaplyList(HashMap<String, String> params) throws Throwable {
		return iEduDao.getEduaplyList(params);
	}
	
	//교육자
	
		@Override
		public int getEdupersCnt(HashMap<String, String> params) throws Throwable {
			return iEduDao.getEdupersCnt(params);
		}

		@Override
		public List<HashMap<String, String>> getEdupersList(HashMap<String, String> params) throws Throwable {
			return iEduDao.getEdupersList(params);
		}
		
		@Override
		public HashMap<String, String> getEdupersDetail(HashMap<String, String> params) throws Throwable {
			return iEduDao.getEdupersDetail(params);
		}
		@Override
		public int edupersUpdate(HashMap<String, String> params) throws Throwable {
			return iEduDao.edupersUpdate(params);
		}
		@Override
		public int edupersDelete(HashMap<String, String> params) throws Throwable {
			return iEduDao.edupersDelete(params);
		}
		@Override
		public void edupersAdd(HashMap<String, String> params) throws Throwable {
			iEduDao.edupersAdd(params);
		}
		@Override
		public int eduperscarrUpdate(HashMap<String, String> params) throws Throwable {
			return iEduDao.eduperscarrUpdate(params);
		}
		@Override
		public void eduperscarrAdd(HashMap<String, String> params) throws Throwable {
			iEduDao.eduperscarrAdd(params);
			
		}
	
		@Override
		public int eduperscarrDelete(HashMap<String, String> params) throws Throwable {
			return iEduDao.eduperscarrDelete(params);
		}
		@Override
		public int getEduperscarrCnt(HashMap<String, String> params) throws Throwable {
			return iEduDao.getEduperscarrCnt(params);
		}

		@Override
		public List<HashMap<String, String>> getEduperscarrList(HashMap<String, String> params) throws Throwable {
			return iEduDao.getEduperscarrList(params);
		}

		public int eduaplyDelete(HashMap<String, String> params) throws Throwable {
			return iEduDao.eduaplyDelete(params);
		}

		public void eduaplyAdd(HashMap<String, String> params) throws Throwable {
			iEduDao.eduaplyAdd(params);
			
		}

}

