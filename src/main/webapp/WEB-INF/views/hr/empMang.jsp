<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>사원관리</title>
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
.exel_btn_area {
	
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
$(document).ready(function() {
		
		if('${param.searchGbn}' != '') {
			$("#searchGbn").val('${param.searchGbn}');
		}
		
		reloadList();
		
		// 검색버튼
		$("#searchBtn").on("click", function() {
			$("page").val("1");
			reloadList();
		}) ;
		
		//페이징
		$(".page_nation").on("click", "div", function() {
			$("#page").val($(this).attr("name"));
			reloadList();
		});
		
		//상세보기
		$("tbody").on("click", "tr", function() {
			$("#emp_no").val($(this).attr("name"));
			
			$("#actionForm").attr("action", "empMangDetail");
			$("#actionForm").submit();
		});

		//등록하기
		$("#addBtn").on("click", function() {
			$("#actionForm").attr("action", "empMangAdd");
			$("#actionForm").submit();
		});
	});
	
	// 첫화면 (수정)
	function reloadList() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "empMangListAjax",
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
	
	// 목록 (수정)
	function drawList(list, cnt) {
		var html = "";
		if(cnt == 0) {
			html += "<tr>";
			html += "<td colspan=\"5\">데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
			for(var i = 0; i < list.length; i++) {
				html += "<tr name=\"" + list[i].EMP_NO + "\">";
				html += "<td>" + list[i].EMP_NO + "</td>";
				html += "<td>" + list[i].EMP_NM + "</td>";
				html += "<td>" + list[i].DEPT_NM + "</td>";
				html += "<td>" + list[i].POSN_NM + "</td>";
				html += "<td>" + list[i].START_DATE + "</td>";
				html += "</tr>";
			}
		}
		$(".empMang tbody").html(html);
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
		<div class="contents_header_txt">사원관리</div>
	</div>

	
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 메뉴시작 -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" method="post" id="actionForm">
		<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="emp_no" id="emp_no" value="${emp_no}" /> <!-- 수정 -->
			<input type="hidden" name="page" id="page" value="1" />
		<div class="default_search_area">
			<select name="searchGbn" id="searchGbn">
				<option value="0">사원번호</option>
				<option value="1">성명</option>
			</select>
			<input type="text" placeholder="검색어" name="searchTxt" value="${param.searchTxt}"  />
			<div class="search_btn_area">
				<input type="button" value="검색" name="searchBtn" id="searchBtn" /><!-- 수정 -->
				<input type="button" value="등록" name="addBtn" id="addBtn" />
			</div>
		</div>
	  </form>

		<!-- 메뉴 끝 -->
		<!-- 목록 시작 -->
		<div class="default_board">
			<table class="empMang">
				<colgroup>
				 <col width="208px">
					<col width="208px">
					<col width="208px">
					<col width="208px">
					<col width="208px">  
				</colgroup>
				<thead>
					<tr class="top">
						<th>사원번호</th>
						<th>성명</th>
						<th>부서</th>
						<th>직급</th>
						<th>입사일자</th> 
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			<!-- 목록 끝 -->
			<div class="page_wrap">
				<div class="page_nation"></div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>