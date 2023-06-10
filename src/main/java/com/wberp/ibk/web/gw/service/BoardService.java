package com.wberp.ibk.web.gw.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wberp.ibk.web.gw.dao.IBoardDao;

@Service
public class BoardService implements IBoardService{
	@Autowired
	public IBoardDao iBoardDao ;

	@Override
	public List<HashMap<String, String>> getBoardMang(HashMap<String, String> params) throws Throwable {
		// 게시판 관리 페이지 목록
		return iBoardDao.getBoardMang(params);
	}

	@Override
	public List<HashMap<String, String>> getBoard(HashMap<String, String> params) throws Throwable {
		// 게시판 목록 
		return iBoardDao.getBoard(params);
	}

	@Override
	public int getBoardCnt(HashMap<String, String> params) throws Throwable {
		// 게시판 페이지
		return iBoardDao.getBoardCnt(params);
	}

	@Override
	public int addAjax(HashMap<String, String> params) throws Throwable {
		// 추가
		return iBoardDao.addAjax(params);
	}

	@Override
	public List<HashMap<String, String>> ajaxBoard(HashMap<String, String> params) throws Throwable {
		// 오른쪽 박스 리스트 목록
		return iBoardDao.ajaxBoard(params);
	}

	@Override
	public int delAjax(HashMap<String, String> params) throws Throwable {
		// 삭제
		return iBoardDao.delAjax(params);
	}

	@Override
	public HashMap<String, String> gwBoardDetail(HashMap<String, String> params) throws Throwable {
		// 전사게시판 상세보기 
		return iBoardDao.gwBoardDetail(params);
	}

	@Override
	public void gwBoardHit(HashMap<String, String> params) throws Throwable {
		// 조회수
		iBoardDao.gwBoardHit(params);
	}

	@Override
	public int gwBoardDelete(HashMap<String, String> params) throws Throwable {
		// 전사게시판 삭제
		return iBoardDao.gwBoardDelete(params);
	}

	@Override
	public void gwBoardAdd(HashMap<String, String> params) throws Throwable {
		// 전사게시판 추가
		iBoardDao.gwBoardAdd(params);
	}
	
	@Override
	public void gwBoardFile(HashMap<String, String> params) throws Throwable {
		// 전사게시판 파일첨부
		iBoardDao.gwBoardFile(params);
	}

	@Override
	public String getBoardNo() throws Throwable {
		// 넘버값을 가져오기 위한 리스트
		return iBoardDao.getBoardNo();
	}
	
	@Override
	public void boardUpdate(HashMap<String, String> params) throws Throwable {
		// 수정
		iBoardDao.boardUpdate(params);
		
	}
	
	@Override
	public int fileDelete(HashMap<String, String> params) throws Throwable {
		// 전사게시판 파일 삭제
		return iBoardDao.fileDelete(params);
	}
	
	@Override
	public int getBokcnt(HashMap<String, String> params) throws Throwable {
		// 즐겨찾기 페이지  페이징카운터  
		return iBoardDao.getBokcnt(params);
	}

	@Override
	public List<HashMap<String, String>> getBokBoard(HashMap<String, String> params) throws Throwable {
		// 즐겨찾기 글목록
		return iBoardDao.getBokBoard(params);
	}

	@Override
	public void getBokImg(HashMap<String, String> params) throws Throwable {
		// 클릭시 별 모양 변환
		iBoardDao.getBokImg(params);
	}

	@Override
	public int getBokCancel(HashMap<String, String> params) throws Throwable {
		// 즐겨찾기 해제
		return iBoardDao.getBokCancel(params);
	}

	@Override
	public int getObCnt(HashMap<String, String> params) throws Throwable {
		// 한줄게시판 페이징
		return iBoardDao.getObCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getOb(HashMap<String, String> params) throws Throwable {
		// 한줄게시판 목록
		return iBoardDao.getOb(params);
	}

	@Override
	public void addOneBoard(HashMap<String, String> params) throws Throwable {
		// 한줄게시판 추가
		iBoardDao.addOneBoard(params);
	}

	@Override
	public int deleteOb(HashMap<String, String> params) throws Throwable {
		// 한줄게시판 삭제
		return iBoardDao.deleteOb(params);
	}

	@Override
	public HashMap<String, String> oneDetail(HashMap<String, String> params) throws Throwable {
		// 한줄게시판 업데이트를 위한 상세보기
		return iBoardDao.oneDetail(params);
	}

	@Override
	public int oneUpdate(HashMap<String, String> params) throws Throwable {
		// 한줄게시판 수정
		return iBoardDao.oneUpdate(params);
	}

	@Override
	public HashMap<String, String> gwBoardFileDetail(HashMap<String, String> params) throws Throwable {
		// 전사게시판 파일 상세페이지
		return iBoardDao.gwBoardFileDetail(params);
	}

	@Override
	public void gwBoardFile2(HashMap<String, String> params) throws Throwable {
		iBoardDao.gwBoardFile2(params);
	}











}
