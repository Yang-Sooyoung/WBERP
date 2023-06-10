<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - Sample Page</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
	$(document).ready(
			
			});
	/* 페이징 드로우리스트 리로드리스트 작성 */
</script>
</head>
<body>
	<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNo">${param.menuNo}</c:param>
	</c:import>
	<!-- 화면에 맞추어 제목작성 -->
	<div class="contents_header">
		<div class="contents_header_txt">영업리스트</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="sampleForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
		</form>
		<div class="default_search_area">
			<select>
				<option>제목</option>
				<option>내용</option>
				<option>작성자</option>
			</select>
			<input type="text" placeholder="검색어" />
			<div class="search_btn_area">
				<input type="button" value="등록" />
			</div>
		</div>
		<div class="default_board">
			<table>
				<colgroup>
					<col width="160px">
					<col width="400px">
					<col width="160px">
					<col width="160px">
					<col width="160px">
				</colgroup>
				<thead>
					<tr class="top">
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			<div class="page_wrap">
				
			</div>
		</div>

	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>