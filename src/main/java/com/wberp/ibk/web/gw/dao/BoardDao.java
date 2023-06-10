package com.wberp.ibk.web.gw.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao implements IBoardDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getBoardMang(HashMap<String, String> params) throws Throwable {
		// 게시판관리 글 목록
		return sqlSession.selectList("board.getBoardMang",params);
	}

	@Override
	public List<HashMap<String, String>> getBoard(HashMap<String, String> params) throws Throwable {
		// 게시판 글목록
		return sqlSession.selectList("board.getBoard",params);
	}

	@Override
	public int getBoardCnt(HashMap<String, String> params) throws Throwable {
		// 게시판 목록 페이지
		return sqlSession.selectOne("board.getBoardCnt", params);
	}

	@Override
	public int addAjax(HashMap<String, String> params) throws Throwable {
		// 추가
		return sqlSession.update("board.addAjax", params);
	}

	@Override
	public List<HashMap<String, String>> ajaxBoard(HashMap<String, String> params) throws Throwable {
		// 오른쪽 박스 목록
		return sqlSession.selectList("board.ajaxBoard",params);
	}

	@Override
	public int delAjax(HashMap<String, String> params) throws Throwable {
		// 삭제
		return sqlSession.update("board.delAjax", params);
	}

	@Override
	public HashMap<String, String> gwBoardDetail(HashMap<String, String> params) throws Throwable {
		// 전사겟판 상세보기
		return sqlSession.selectOne("board.gwBoardDetail", params);
	}

	@Override
	public void gwBoardHit(HashMap<String, String> params) throws Throwable {
		// 조회수
		sqlSession.update("board.gwBoardHit", params);
	}

	@Override
	public int gwBoardDelete(HashMap<String, String> params) throws Throwable {
		// 전사게시판 삭제
		return sqlSession.update("board.gwBoardDelete", params);
	}

	@Override
	public void gwBoardAdd(HashMap<String, String> params) throws Throwable {
		// 전사게시판 추가
		sqlSession.insert("board.gwBoardAdd", params);
	}
	
	@Override
	public void gwBoardFile(HashMap<String, String> params) throws Throwable {
		//전사 게시판 파일첨부
		sqlSession.insert("board.gwBoardFile", params);
	}

	@Override
	public String getBoardNo() throws Throwable {
		// 전사게시판 파일첨부를 위한 넘버
		return sqlSession.selectOne("board.getBoardNo");
	}
	
	@Override
	public void boardUpdate(HashMap<String, String> params) throws Throwable {
		// 수정페이지
		sqlSession.update("board.boardUpdate", params);
	}
	
	@Override
	public int fileDelete(HashMap<String, String> params) throws Throwable {
		// 전사게시판 수정 파일 삭제 
		return sqlSession.update("board.fileDelete", params);
	}
	
	@Override
	public int getBokcnt(HashMap<String, String> params) throws Throwable {
		// 즐겨찾기 페이지 카운터
		return sqlSession.selectOne("board.getBokcnt", params);
	}

	@Override
	public List<HashMap<String, String>> getBokBoard(HashMap<String, String> params) throws Throwable {
		// 즐겨찾기 글 목록
		return sqlSession.selectList("board.getBokBoard",params);
	}

	@Override
	public void getBokImg(HashMap<String, String> params) throws Throwable {
		// 별모양 클릭시 모양 변환
		sqlSession.insert("board.getBokImg",params);
	}

	@Override
	public int getBokCancel(HashMap<String, String> params) throws Throwable {
		// 즐겨찾기 해제
		return sqlSession.delete("board.getBokCancel", params);
	}
	
	@Override
	public int getObCnt(HashMap<String, String> params) throws Throwable {
		// 한줄게시판 페이징
		return sqlSession.selectOne("board.getObCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getOb(HashMap<String, String> params) throws Throwable {
		// 한줄게시판 목록
		return sqlSession.selectList("board.getOb",params);
	}

	@Override
	public void addOneBoard(HashMap<String, String> params) throws Throwable {
		// 한줄게시판 추가
		sqlSession.insert("board.addOneBoard", params);
	}

	@Override
	public int deleteOb(HashMap<String, String> params) throws Throwable {
		// 한줄게시판 삭제
		return sqlSession.update("board.deleteOb", params);
	}

	@Override
	public HashMap<String, String> oneDetail(HashMap<String, String> params) throws Throwable {
		// 한줄게시판 수정을 위한 상세보기
		return sqlSession.selectOne("board.oneDetail", params);
	}

	@Override
	public int oneUpdate(HashMap<String, String> params) throws Throwable {
		// 한줄게시판 수정
		return sqlSession.update("board.oneUpdate", params);
	}

	@Override
	public HashMap<String, String> gwBoardFileDetail(HashMap<String, String> params) throws Throwable {
		// 전사게시판 파일 상세보기 페이지
		return sqlSession.selectOne("board.gwBoardFileDetail", params);
	}

	@Override
	public void gwBoardFile2(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("board.gwBoardFile2", params);
	}






	
 

	


}
