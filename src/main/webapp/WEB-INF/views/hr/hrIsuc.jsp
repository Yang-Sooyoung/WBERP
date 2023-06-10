<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 인사발령조회</title>
<style type="text/css">
.default_search_area {
	width: 500px !important;
}
.default_board {
	width: 500px !important;
}
.page_wrap {
	width: 500px !important;
}
.top2 {
	width:30px;
	background-color: #E4EAF2;
}
.detail_btn_area {
	display: none;
	width: 450px !important;
}
.hrIsuc_list {
	margin-bottom: 10px;
	widht:1000px;
}
.hrIsuc_detail {
	display: none;
	margin-bottom: 10px;
}
#ch2, #ch3, #ch4 {
	display: none;
}
#tx1, #tx2, #tx3, #tx4, #tx5 ,#tx6 , #tx7,#tx8{
	display: none;
	width: 292px;
	height: 40px;
}

</style>
</head>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
$(document).ready(function() {
	/* 검색 구분 */
	if('${param.searchGbn}' != '') {
		$("#searchGbn").val('${param.searchGbn}');
	}
	reloadList();
	/* 검색 페이징 유지 */
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		reloadList();
	});
	/* 페이징 */
	$(".page_nation").on("click", "div", function() {
		$("#page").val($(this).attr("name"));
		reloadList();
	});
	/* 조회목록으로 돌아가기 */
	$(".detail_btn_area").on("click", "#listBtn", function() {
		$("#ch1").show(); /* 제목  */
 		$("#ch2").hide();
 		$(".hrIsuc_list").css('display', 'table'); /* 테이블  */
 		$(".hrIsuc_list tbody").css('display', '');
		$(".hrIsuc_detail").css('display', 'none');
		$(".default_search_area").show(); /* 검색  */
		$(".detail_btn_area").hide(); /* 아래 버튼  */
		$(".page_wrap").show(); /* 페이징 */
		$("#tx9").val("");
		$("#tx10").val("");
		$("#tx11").val("");
		$("#tx12").val("");
		$("#tx13").val("");
		$("#tx14").val("");
		$("#tx15").val("");
		$("#tx16").val("");
	});
	/* 상세조회 */
	$(".hrIsuc_list").on("click", "tbody tr", function() {
		$("#hrIsuc_no").val($(this).attr("name")); /* 글번호 */
 		$("#ch1").hide(); /* 제목  */
 		$("#ch2").css('display', 'table-cell');
 		$(".top2").css('padding', '0px'); /* 패딩  */
 		$(".cont2").css('display', 'none'); /* 내용  */
 		$("#tx1").css('display', 'none'); 
 		$("#tx2").css('display', 'none');
 		$("#tx3").css('display', 'none'); 
 		$("#tx4").css('display', 'none');
 		$("#tx5").css('display', 'none');
 		$("#tx6").css('display', 'none');
 		$("#tx7").css('display', 'none');
 		$("#tx8").css('display', 'none');
		$(".hrIsuc_list").css('display', 'none'); /* 테이블  */
		$(".hrIsuc_detail").css('display', 'table');
		$(".default_search_area").hide(); /* 검색  */
		$(".detail_btn_area").show(); /* 아래 버튼  */
		$(".page_wrap").hide(); /* 페이징 */
		$("#saveBtn").hide(); /* 버튼  */
		$("#updateBtn").show();
		$("#deleteBtn").show();
		$("#listBtn").show();
		
		reloadDetail();
	});
		

/* 조회  */
function reloadList() {
	var params = $("#actionForm").serialize();

	$.ajax({
		type : "post",
		url : "hrIsucAjax",
		dataType : "json", // {키:값, 키:값}
		data : params, // 보낼데이터
		success : function(res) { // 성공 시 해당 함수 실행, 결과는 result로 받겠다.
			drawList(res.list, res.cnt);
			drawPaging(res.pb);
		},
		error : function(req, status, error) { // 결과, 상태값, 에러
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}
/* 조회  */
function drawList(list, cnt) {
	var html = "";

	if (cnt == 0) {
		html += "<tr>";
		html += "<td colspan=\"3\">데이터가 없습니다.</td>";
		html += "</tr>";
	} else {
		html += "<colgroup>";
		html += "<col width=\"500px\">";
		html += "<col width=\"500px\">";
		html += "<col width=\"500px\">";
		html += "<col width=\"500px\">";
		html += "<col width=\"350px\">";
		html += "<col width=\"350px\">";
		html += "<col width=\"350px\">";
		html += "<col width=\"200px\">";
		html += "</colgroup>";
		html += "<thead>";
		html += "<tr class=\"top\">";
		html += "<th>발령번호</th>";
		html += "<th>사원번호</th>";
		html += "<th>부서번호</th>";
		html += "<th>직급번호</th>";
		html += "<th>시작일</th>";
		html += "<th>등록일</th>";
		html += "<th>상태</th>";

		html += "</tr>";
		html += "</thead>";
		html += "<tbody>";
		for (var i = 0; i < list.length; i++) {
			html += "<tr name=\"" + list[i].ISUC_NO + "\">";
			html += "<td>" + list[i].ISUC_NO + "</td>";
			html += "<td>" + list[i].EMP_NO + "</td>";
			html += "<td>" + list[i].DEPT_NO + "</td>";
			html += "<td>" + list[i].POSN_NO + "</td>";
			html += "<td>" + list[i].START_DATE + "</td>";
			html += "<td>" + list[i].REGISTER_DATE + "</td>";
			html += "<td>" + list[i].STATE + "</td>";
			

			html += "</tr>";
		}
		html += "</tbody>";
	}
	$(".hrIsuc_list").html(html);
}
/* 페이징 */
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
/* 상세보기  */
function reloadDetail() {
	var params = $("#actionForm").serialize();
	$.ajax({
		type : "post",
		url : "hrIsucDetailContAjax",
		dataType : "json", // {키:값, 키:값}
		data : params, // 보낼데이터
		success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로 받겠다.
			drawDetail(res.hrIsuc);
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);

		}
	});
}
/* 상세보기  */
function drawDetail(hrIsuc) {
	var html = "";
	html += "<colgroup>";
	html += "<col width=\"150px\">";
	html += "<col width=\"300px\">";
	html += "</colgroup>";
	html += "<tr name=\"" + hrIsuc.ISUC_NO + "\">"
	html += "<th class=\"top2\">" + "발령번호" + "</th>";
	html += "<td class=\"cont1\">"
			+ hrIsuc.ISUC_NO
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx1\" name=\"hrIsuc_ISUC_NO\" value=\"" + hrIsuc.ISUC_NO + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "사원번호" + "</th>";
	html += "<td class=\"cont1\">"
			+ hrIsuc.EMP_NO
			+ "</td>";
	html += "<td class=\"cont2\">"
			+ "<input type=\"text\" id=\"tx2\" name=\"hrIsuc_EMP_NO\" value=\"" + hrIsuc.EMP_NO + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "부서번호" + "</th>";
	html += "<td class=\"cont1\">"
			+ hrIsuc.DEPT_NO
			+ "</td>";
	html += "<td class=\"cont2\">"
			+ "<input type=\"text\" id=\"tx3\" name=\"hrIsuc_DEPT_NO\" value=\"" + hrIsuc.DEPT_NO + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "직급번호" + "</th>";
	html += "<td class=\"cont1\">"
			+ hrIsuc.POSN_NO
			+ "</td>";
	html += "<td class=\"cont2\">"
			+ "<input type=\"text\" id=\"tx4\" name=\"hrIsuc_POSN_NO\" value=\"" + hrIsuc.POSN_NO + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "시작일" + "</th>";
	html += "<td class=\"cont1\">"
			+ hrIsuc.START_DATE
			+ "</td>";
	html += "<td class=\"cont2\">"
			+ "<input type=\"text\" id=\"tx5\" name=\"hrIsuc_START_DATE\" value=\"" + hrIsuc.START_DATE + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	
	html += "<tr>";
	html += "<th class=\"top2\">" + "등록일" + "</th>";
	html += "<td class=\"cont1\">"
			+ hrIsuc.REGISTER_DATE
			+ "</td>";
	html += "<td class=\"cont2\">"
			+ "<input type=\"text\" id=\"tx7\" name=\"hrIsuc_REGISTER_DATE\" value=\"" + hrIsuc.REGISTER_DATE + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	
	html += "<tr>";
	html += "<th class=\"top2\">" + "상태" + "</th>";
	html += "<td class=\"cont1\">"
			+ hrIsuc.STATE
			+ "</td>";
	html += "<td class=\"cont2\">"
			+ "<input type=\"text\" id=\"tx8\" name=\"hrIsuc_STATE\" value=\"" + hrIsuc.STATE + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";

	$(".hrIsuc_detail tbody").html(html);
}
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
		<div class="contents_header_txt" id="ch1">인사발령 조회</div>
		<div class="contents_header_txt" id="ch2">인사발령 상세조회</div>

	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<input type="hidden" id="top" name="top" value="${param.top}" /> 
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="hrIsuc_no" id="hrIsuc_no" value="${param.hrIsuc_no}" /> 
			<input type="hidden" name="page" id="page" value="1" />
			<div class="default_search_area">
				<select name="searchGbn" id="searchGbn">
					<option value="0">발령번호</option>
					<option value="1">사원번호번호</option>
				</select> 
				<input type="text" name="searchTxt" value="${param.searchTxt}" placeholder="검색어를 입력해주세요." />
				<div class="search_btn_area">
					<input type="button" id="searchBtn" name="searchBtn " value="검색" />
				</div>
			</div>
			<div class="default_board">
				<table class="hrIsuc_list">
				</table>
				<table class="hrIsuc_detail">
					<tbody>
					</tbody>
				</table>
				<div class="detail_btn_area">
					<input type="button" id="listBtn" name="listBtn" value="목록" />
				</div>
				<div class="page_wrap">
					<div class="page_nation"></div>
				</div>
			</div>
		</form>
	</div>
	<div class="corp_wrap">
		<div class="group">
			<div class="group_header">조직관리</div>
			<input type="hidden" id="selId" />
			<input type="hidden" id="selText" />
			<input type="hidden" id="selLevel" />
			<input type="hidden" id="selCnt" />
			
			<div id="dept"></div>
			<div class="user_info_wrap"></div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>