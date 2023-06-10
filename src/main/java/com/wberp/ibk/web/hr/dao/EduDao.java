package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EduDao implements IEduDao {
	
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getEduCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("edu.getEduCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getEduList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("edu.getEduList", params);
	}

	@Override
	public HashMap<String, String> getEduDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("edu.getEduDetail", params);
	}

	@Override
	public int eduUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("edu.eduUpdate",params);
	}

	@Override
	public int eduDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("edu.eduDelete",params);
	}
	
	@Override
	public void eduAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("edu.eduAdd", params);
	}
	
	@Override
	public int getEduaplyCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("edu.getEduaplyCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getEduaplyList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("edu.getEduaplyList", params);
	}
	
	@Override
	public int eduaplyDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("edu.eduaplyDelete",params);
	}
	
	@Override
	public void eduaplyAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("edu.eduaplyAdd", params);
		
	}
	//교육장
	
	@Override
	public int getEducenterCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("edu.getEducenterCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getEducenterList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("edu.getEducenterList", params);
	}

	@Override
	public HashMap<String, String> getEducenterDetail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("edu.getEducenterDetail", params);
	}

	@Override
	public int educenterUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("edu.educenterUpdate",params);
	}

	@Override
	public int educenterDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("edu.educenterDelete",params);
	}
	
	@Override
	public void educenterAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("edu.educenterAdd", params);
	}
	//교육자
	
		@Override
		public int getEdupersCnt(HashMap<String, String> params) throws Throwable {
			return sqlSession.selectOne("edu.getEdupersCnt", params);
		}

		@Override
		public List<HashMap<String, String>> getEdupersList(HashMap<String, String> params) throws Throwable {
			return sqlSession.selectList("edu.getEdupersList", params);
		}

		@Override
		public HashMap<String, String> getEdupersDetail(HashMap<String, String> params) throws Throwable {
			return sqlSession.selectOne("edu.getEdupersDetail", params);
		}

		@Override
		public int edupersUpdate(HashMap<String, String> params) throws Throwable {
			return sqlSession.update("edu.edupersUpdate",params);
		}

		@Override
		public int edupersDelete(HashMap<String, String> params) throws Throwable {
			return sqlSession.delete("edu.edupersDelete",params);
		}
		
		@Override
		public void edupersAdd(HashMap<String, String> params) throws Throwable {
			sqlSession.insert("edu.edupersAdd", params);
		}

		@Override
		public int eduperscarrUpdate(HashMap<String, String> params) throws Throwable {
			return sqlSession.update("edu.eduperscarrUpdate",params);
		}
		@Override
		public void eduperscarrAdd(HashMap<String, String> params) throws Throwable {
			sqlSession.insert("edu.eduperscarrAdd", params);
		}
		
		@Override
		public int eduperscarrDelete(HashMap<String, String> params) throws Throwable {
			return sqlSession.delete("edu.eduperscarrDelete",params);
		}
		@Override
		public int getEduperscarrCnt(HashMap<String, String> params) throws Throwable {
			return sqlSession.selectOne("edu.getEduperscarrCnt", params);
		}

		@Override
		public List<HashMap<String, String>> getEduperscarrList(HashMap<String, String> params) throws Throwable {
			return sqlSession.selectList("edu.getEduperscarrList", params);
		}
}
