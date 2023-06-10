<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>월간급여대장</title>
<style type="text/css">
/* 검색영역 가로변경 시 */
.default_search_area {
	width: 800px;
}

/* 목록영역 가로변경 시 */
.default_board {
	width: 800px;
}

/* 개별 css는 여기에 */

</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
	$(document).ready(function() {
		reloadList();
		
		if('${param.searchGbn}' != '') {
			$("#searchGbn").val('${param.searchGbn}');
		}
		
		
		// 검색버튼
		$(".default_search_area").on("click", "#searchBtn", function() {
			$("#page").val("1");
			reloadList();
		}) ;
		
		// 결재버튼
		$("#apprBtn").on("click", function() {
			var params = $("#actionForm").serialize();
			$.ajax({
				type : "post",
				url : "apprBtnAjax",
				dataType : "json",
				data : params,
				success : function(res) {
						drawList(res.list, res.cnt);
						
				},
				error : function(req, status, error) {
					console.log("code : " + req.status);
					console.log("message : " + req.responseText);
				}
			});
		});
		
		//페이징
		$(".page_nation").on("click", "div", function() {
			$("#page").val($(this).attr("name"));
			reloadList();
		});
		
		// 디테일
		$("tbody").on("click", "tr", function() {
			$("#mont_sort_sal_list_no").val($(this).attr("name"));
			
			$("#actionForm").attr("action", "montDetail");
			$("#actionForm").submit();
		});
	});
	
	// 첫화면
	function reloadList() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "MontSortSalListAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				drawList(res.list, res.cnt);
				drawPaging(res.pb);
			
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	// 목록
	function drawList(list, cnt) {
		var html = "";
		if(cnt == 0) {
			html += "<tr>";
			html += "<td colspan=\"8\">데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
			for(var i = 0; i < list.length; i++) {
				html += "<tr name=\"" + list[i].MONT_SORT_SAL_LIST_NO + "\">";
				html += "<td>" + list[i].MONT_SORT_SAL_LIST_NO + "</td>";
				html += "<td>" + list[i].EMP_NM + "</td>";
				html += "<td>" + list[i].DEPT_NM + "</td>";
				html += "<td>" + list[i].POSN_NM + "</td>";
				html += "<td>" + list[i].SALARY + "</td>";
				html += "<td>" + list[i].GONG + "</td>";
				html += "<td>" + list[i].REALSAL + "</td>";
				html += "<td>" + list[i].STAD_YEAR + "</td>";
				html += "</tr>";
			}
		}
		$(".mont tbody").html(html);
	}
	
	// 페이징
	function drawPaging(pb) {
		var html = "";
	
		if ($("#page").val() == 1) {
			html += "<div class=\"arrow prev\"></div>";
		} else {
			html += "<div class=\"arrow prev\" name =\"" + ($("#page").val() - 1) + "\"></div> ";
		}
	
		for (var i = pb.startPcount; i <= pb.endPcount; i++) {
			if ($("#page").val() == i) {
				html += "<div class=\"page_on\" name=\"" + i + "\">" + i + "</b></div> ";
			} else {
				html += "<div class=\"page\" name=\"" + i + "\">" + i + "</div> ";
			}
		}
	
		if ($("#page").val() == pb.maxPcount) {
			html += "<div class =\"arrow next\"></div>";
		} else {
			html += "<div class=\"arrow next\" name =\"" + ($("#page").val() * 1 + 1) + "\"></div> ";
		}
	
		$(".page_nation").html(html);
	}
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
		<div class="contents_header_txt">월간급여대장</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 메뉴시작 -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
		<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="mont_sort_sal_list_no" id="mont_sort_sal_list_no" value="${mont_sort_sal_list_no}" /><!-- 월간급여대장번호 -->
			<input type="hidden" name="empno" id="empno" value="5" /> <!-- 2.사원번호 -->
 			<input type="hidden" name="athrno" id="athrno" value="4" /> <!-- 3.결재권자 번호 --> <!-- 5변경 -->
			<input type="hidden" name="title" id="title" value="급여결재" /> <!-- 4.제목, 5.내용  -->
			<input type="hidden" name="type" id="type" value="급여결재" /> <!-- 6.결재유형  -->
			<input type="hidden" name="stad_year" id="stad_year" value="${STAD_YEAR}" />
			<input type="hidden" name="realsal" id="realsal" value="${REALSAL}" />
			<input type="hidden" name="page" id="page" value="${page}" />
			<input type="hidden" name="sal_code" id="sal_code" value="${sal_code}" />
			<div class="default_search_area" >
				<select name="searchGbn" id="searchGbn">
					<option value="0">부서명</option>
					<option value="1">직급명</option>
					<option value="2">사원이름</option>
					<option value="3">월별</option>
				</select>
				<input type="text" placeholder="예)02" name="searchTxt" value="${param.searchTxt}" />
				<div class="search_btn_area">
					<input type="button" value="검색" name="searchBtn" id="searchBtn" />
					<input type="button" value="결재" name="apprBtn" id="apprBtn" />
				</div>
			</div>
			<!-- 메뉴 끝 -->
			<!-- 목록 시작 -->
			<div class="default_board">
				<table class="mont">
					<colgroup>
						<col width="100px">
						<col width="100px">
						<col width="100px">
						<col width="100px">
						<col width="100px">
						<col width="100px">
						<col width="100px">
						<col width="100px">
					</colgroup>
					<thead>
						<tr class="top">
							<th>월간급여대장번호</th>
							<th>사원이름</th>
							<th>부서명</th>
							<th>직급명</th>
							<th>급여</th>
							<th>공제액</th>
							<th>실지급액</th>
							<th>지급일</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
				<div class="page_wrap">
					<div class="page_nation"></div>
				</div>
			</div>
		</form>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>