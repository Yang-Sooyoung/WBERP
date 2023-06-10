package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

public interface IEduDao {

	public int getEduCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getEduList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getEduDetail(HashMap<String, String> params) throws Throwable;

	public int eduUpdate(HashMap<String, String> params)throws Throwable;

	public int eduDelete(HashMap<String, String> params)throws Throwable;

	public void eduAdd(HashMap<String, String> params) throws Throwable;
	
	//교육장
	
	public int getEducenterCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getEducenterList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getEducenterDetail(HashMap<String, String> params) throws Throwable;

	public int educenterUpdate(HashMap<String, String> params)throws Throwable;

	public int educenterDelete(HashMap<String, String> params)throws Throwable;

	public void educenterAdd(HashMap<String, String> params) throws Throwable;
	
	//교육자
	
		public int getEdupersCnt(HashMap<String, String> params) throws Throwable;

		public List<HashMap<String, String>> getEdupersList(HashMap<String, String> params) throws Throwable;

		public HashMap<String, String> getEdupersDetail(HashMap<String, String> params) throws Throwable;

		public int edupersUpdate(HashMap<String, String> params)throws Throwable;

		public int edupersDelete(HashMap<String, String> params)throws Throwable;

		public void edupersAdd(HashMap<String, String> params) throws Throwable;

		public int eduperscarrUpdate(HashMap<String, String> params) throws Throwable;

		public void eduperscarrAdd(HashMap<String, String> params)throws Throwable;

		public int eduperscarrDelete(HashMap<String, String> params)throws Throwable;
		
		public int getEduperscarrCnt(HashMap<String, String> params) throws Throwable;

		public List<HashMap<String, String>> getEduperscarrList(HashMap<String, String> params) throws Throwable;

		public int getEduaplyCnt(HashMap<String, String> params)throws Throwable;

		public List<HashMap<String, String>> getEduaplyList(HashMap<String, String> params)throws Throwable;

		public int eduaplyDelete(HashMap<String, String> params)throws Throwable;

		public void eduaplyAdd(HashMap<String, String> params)throws Throwable;

}
