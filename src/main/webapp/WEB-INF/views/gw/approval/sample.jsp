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
			function() {
				$("#alertBtn").on("click", function() {
					makeAlert(1, "하이", "내용임", null);
				});

				$("#oneBtn").on(
						"click",
						function() {
							makeBtn1Popup(1, "버튼하나팝업", "내용들감", true, 400, 200,
									null, "하이", function() {
										closePopup(1);
									});
						});

				$("#twoBtn").on(
						"click",
						function() {
							makeBtn2Popup(2, "버튼둘팝업", "내용들감", true, 600, 400,
									null, "어라라", function() {
										makeAlert(3, "하이", "내용임", null);
									}, "하이", function() {
										closePopup(2);
									});
						});

				$("#threeBtn").on(
						"click",
						function() {
							makeBtn3Popup(3, "버튼셋팝업", "내용들감", false, 400, 600,
									null, "어라라", function() {
										closePopup(3);
									}, "하이", function() {
										closePopup(3);
									}, "마지막", function() {
										closePopup(3);
									});
						});

				$("#fourBtn").on(
						"click",
						function() {
							makeBtn4Popup(4, "버튼넷팝업", "내용들감", false, 400, 600,
									null, "엣헴", function() {
										popupBtnChange(4, 1, "버튼변경",
												function() {
													closePopup(4);
												});
									}, "하이", function() {
										closePopup(4);
									}, "하이", function() {
										closePopup(4);
									}, "마지막", function() {
										closePopup(4);
									});
						});
			});
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
					<tr>
						<td>1</td>
						<td>테스트중입니다.</td>
						<td>
							홍길동 사원
							<br />
							(신사동 영업2팀)
						</td>
						<td>2020.10.20</td>
						<td>10</td>
					</tr>
					<tr>
						<td>1</td>
						<td>테스트중입니다.</td>
						<td>
							홍길동 사원
							<br />
							(신사동 영업2팀)
						</td>
						<td>2020.10.20</td>
						<td>10</td>
					</tr>
				</tbody>
			</table>
			<div class="page_wrap">
				<div class="page_nation">
					<div class="arrow prev"></div>
					<div class="page_on">1</div>
					<div class="page">2</div>
					<div class="page">3</div>
					<div class="page">4</div>
					<div class="arrow next"></div>
				</div>
			</div>
		</div>
		<!-- 버튼샘플 -->
		<input type="button" value="알림창" id="alertBtn" />
		<input type="button" value="1버튼" id="oneBtn" />
		<input type="button" value="2버튼" id="twoBtn" />
		<input type="button" value="3버튼" id="threeBtn" />
		<input type="button" value="4버튼" id="fourBtn" />
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>