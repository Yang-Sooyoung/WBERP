<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 부서조회</title>
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
.dept_list {
	margin-bottom: 10px;
}
.dept_detail {
	display: none;
	margin-bottom: 10px;
}
.dept_add {
	display: none;
	margin-bottom: 10px;
}
#ch2, #ch3, #ch4 {
	display: none;
}
#tx1, #tx2, #tx3, #tx4, #tx5 {
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
 		$("#ch3").hide();
 		$("#ch4").hide();
 		$(".dept_list").css('display', 'table'); /* 테이블  */
 		$(".dept_list tbody").css('display', '');
		$(".dept_detail").css('display', 'none');
 		$(".dept_add").css('display', 'none');
		$(".default_search_area").show(); /* 검색  */
		$(".detail_btn_area").hide(); /* 아래 버튼  */
		$(".page_wrap").show(); /* 페이징 */
		$("#tx6").val("");
		$("#tx7").val("");
		$("#tx8").val("");
		$("#tx9").val("");
		$("#tx10").val("");
	});
	/* 상세조회 */
	$(".dept_list").on("click", "tbody tr", function() {
		$("#dept_no").val($(this).attr("name")); /* 글번호 */
 		$("#ch1").hide(); /* 제목  */
 		$("#ch2").css('display', 'table-cell');
 		$("#ch3").hide();
 		$("#ch4").hide();
 		$(".top2").css('padding', '0px'); /* 패딩  */
 		$(".cont2").css('display', 'none'); /* 내용  */
 		$("#tx1").css('display', 'none'); 
 		$("#tx2").css('display', 'none');
 		$("#tx3").css('display', 'none'); 
 		$("#tx4").css('display', 'none');
 		$("#tx5").css('display', 'none');
		$(".dept_list").css('display', 'none'); /* 테이블  */
		$(".dept_detail").css('display', 'table');
 		$(".dept_add").css('display', 'none');
		$(".default_search_area").hide(); /* 검색  */
		$(".detail_btn_area").show(); /* 아래 버튼  */
		$(".page_wrap").hide(); /* 페이징 */
		$("#saveBtn").hide(); /* 버튼  */
		$("#updateBtn").show();
		$("#deleteBtn").show();
		$("#listBtn").show();
		
		reloadDetail();
	});
	/* 등록  */
	$(".search_btn_area").on("click", "#addBtn", function() {
		$("#ch1").hide(); /* 제목  */
 		$("#ch2").hide();
 		$("#ch3").css('display', 'table-cell');
 		$("#ch4").hide();
		$(".top2").css('padding', '0px'); /* 패딩  */
		$(".cont2").css('display', 'block'); /* 내용  */
		$("#tx6").css('display', 'block'); 
 		$("#tx7").css('display', 'block');
		$("#tx8").css('display', 'block'); 
 		$("#tx9").css('display', 'block');
		$("#tx10").css('display', 'block'); 

		$(".dept_list").css('display', 'none'); /* 테이블  */
		$(".dept_detail").css('display', 'none');
		$(".dept_add").css('display', 'table');
		$(".default_search_area").hide(); /* 검색  */
		$(".detail_btn_area").show(); /* 아래 버튼  */
		$(".page_wrap").hide(); /* 페이징 */
		$("#saveBtn").show(); /* 버튼  */
		$("#updateBtn").hide();
		$("#deleteBtn").hide();
		$("#listBtn").show();	
	/* 저장  */
	$(".detail_btn_area").off("click.saveBtn").on("click.saveBtn", "#saveBtn", function() {
 		if ($.trim($("#tx7").val()) == "") {
			alert("상위부서번호를 입력해주세요.");
			$("#tx7").focus();
		} else if ($.trim($("#tx8").val()) == "") {
			alert("부서장번호를 입력해주세요.");
			$("#tx8").focus();
		}
		 else if ($.trim($("#tx9").val()) == "") {
			alert("부서명을 입력해주세요.");
			$("#tx9").focus();
		}
		 else if ($.trim($("#tx10").val()) == "") {
			alert("부서설명을 입력해주세요.");
			$("#tx10").focus();
		}else {
			saved1();
		}
	});
});
 	/* 수정  */
	$(".detail_btn_area").on("click", "#updateBtn", function(){
 		$("#ch1").hide();
 		$("#ch2").hide();
 		$("#ch3").hide();
 		$("#ch4").css('display', 'table-cell');
		$(".top2").css('padding', '0px');
		$(".cont1").hide();
		$("#tx1").css('display', 'block');
		$("#tx2").css('display', 'block');
		$("#tx3").css('display', 'block');
		$("#tx4").css('display', 'block');
		$("#tx5").css('display', 'block');
		$(".default_search_area").hide();
		$(".dept_list tbody").hide();
		$(".dept_detail tbody").show();
		$(".detail_btn_area").show();
		$(".page_wrap").hide();
		$("#saveBtn").show();
		$("#updateBtn").hide();
		$("#deleteBtn").hide();
		$("#listBtn").show();	
	 /* 저장  */
	$(".detail_btn_area").off("click.saveBtn").on("click.saveBtn", "#saveBtn", function() {
 		if ($.trim($("#tx2").val()) == "") {
			alert("상위부서번호를 입력해주세요.");
			$("#tx2").focus();
		}   else if ($.trim($("#tx3").val()) == "") {
			alert("부서장번호를 입력해주세요.");
			$("#tx3").focus();
		} else if ($.trim($("#tx4").val()) == "") {
			alert("부서이름을 입력해주세요.");
			$("#tx4").focus();
		} else if ($.trim($("#tx5").val()) == "") {
			alert("부서설명을 입력해주세요.");
			$("#tx5").focus();
		}else {
			saved2();
		}
	});
});
	/* 삭제 */
	$(".detail_btn_area").on("click", "#deleteBtn", function() {
		if (confirm("삭제하시겠습니까?")) {
			$("#tx2").val($(this).parent().parent().attr("name"));
			var params = $("#actionForm").serialize();

			$.ajax({
				type : "post",
				url : "DeptMangDeleteAjax",
				dataType : "json", // {키:값, 키:값}
				data : params, // 보낼데이터
				success : function(res) { // 성공 시 해당 함수 실행, 결과는 result로 받겠다.
					if (res.res == "SUCCESS") {
						$("#ch1").show();
				 		$("#ch2").hide();
				 		$("#ch3").hide();
				 		$("#ch4").hide();
						$(".dept_list").css('display', 'table');
						$(".dept_detail").css('display', 'none');
				 		$(".dept_add").css('display', 'none');
						$(".default_search_area").css('display', 'block');
						$(".page_wrap").css('display', 'block');
						$("#listBtn").css('display', 'none');
						$("#updateBtn").css('display', 'none');
						$("#deleteBtn").css('display', 'none');
						$(".detail_btn_area").css('display', 'none');
						$("#tx1").val("");
						$("#tx2").val("");
						$("#tx3").val("");
						$("#tx4").val("");
						$("#tx5").val("");

						reloadList();
					} else {
						$("#alert").attr("title", "알림");
						$("#alert p").html("삭제에 실패하였습니다.");
						$("#alert").dialog({
							buttons : {
								Ok : function() {
									$(this).dialog("close");
								}
							}
						});
					}
				},
				error : function(req, status, error) { // 결과, 상태값, 에러
					console.log("code : " + req.status);
					console.log("message : " + req.responseText);
				}
			});
		}
	});
});
/* 등록  */
function saved1 () {
	var params = $("#actionForm").serialize();
	$.ajax({
		type : "post",
		url : "DeptMangAddAjax",
		dataType : "json", // {키:값, 키:값}
		data : params, //보낼데이터
		success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
			if (res.res == "SUCCESS") {
				$("#ch1").show();
		 		$("#ch2").hide();
		 		$("#ch3").hide();
		 		$("#ch4").hide();
		 		$(".dept_list").css('display', 'table');
				$(".dept_detail").css('display', 'none');
		 		$(".dept_add").css('display', 'none');
				$(".default_search_area").css('display', 'block');
				$(".page_wrap").css('display', 'block');
				$("#saveBtn").css('display', 'none');
				$("#listBtn").css('display', 'none');
				$("#tx6").val("");
				$("#tx7").val("");
				$("#tx8").val("");
				$("#tx9").val("");
				$("#tx10").val("");
				reloadList();
			} else if(res.res == "FAILED") {
				alert("잘못된 데이터를 입력하셨습니다.");
			} else {
				alert("수정중 문제가 발생하였습니다.");
			}
		},
		error : function(req, status, error) {
			
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}	
/* 수정  */
function saved2 () {
	var params = $("#actionForm").serialize();

	$.ajax({
		type : "post",
		url : "DeptMangUpdateAjax",
		dataType : "json", // {키:값, 키:값}
		data : params, //보낼데이터
		success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
			if (res.res == "SUCCESS") {
				$("#ch1").show();
		 		$("#ch2").hide();
		 		$("#ch3").hide();
		 		$("#ch4").hide();
		 		$(".dept_list").css('display', 'table');
				$(".dept_detail").css('display', 'none');
				$(".dept_add").css('display', 'none');
				$(".default_search_area").css('display', 'block');
				$(".page_wrap").css('display', 'block');
				$("#saveBtn").css('display', 'none');
				$("#listBtn").css('display', 'none');
				reloadList();
			} else if(res.res == "FAILED") {
				alert("잘못된 데이터를 입력하셨습니다.");
			} else {
				alert("수정중 문제가 발생하였습니다.");
			}
		},
		error : function(req, status, error) {
			
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}
/* 조회  */
function reloadList() {
	var params = $("#actionForm").serialize();

	$.ajax({
		type : "post",
		url : "DeptMangAjax",
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
		html += "<col width=\"100px\">";
		html += "<col width=\"150px\">";
		html += "<col width=\"250px\">";
		html += "</colgroup>";
		html += "<thead>";
		html += "<tr class=\"top\">";
		html += "<th>No</th>";
		html += "<th>부서명</th>";
		html += "<th>부서장번호</th>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody>";
		for (var i = 0; i < list.length; i++) {
			html += "<tr name=\"" + list[i].DEPT_NO + "\">";
			html += "<td>" + list[i].DEPT_NO + "</td>";
			html += "<td>" + list[i].DEPT_NM + "</td>";
			html += "<td>" + list[i].DEPT_HEAD_NO + "</td>";

			html += "</tr>";
		}
		html += "</tbody>";
	}
	$(".dept_list").html(html);
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
		url : "DeptMangDetailContAjax",
		dataType : "json", // {키:값, 키:값}
		data : params, // 보낼데이터
		success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로 받겠다.
			drawDetail(res.deptMang);
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);

		}
	});
}
/* 상세보기  */
function drawDetail(dept) {
	var html = "";
	html += "<colgroup>";
	html += "<col width=\"150px\">";
	html += "<col width=\"300px\">";
	html += "</colgroup>";
	html += "<tr name=\"" + dept.DEPT_NO + "\">"
	html += "<th class=\"top2\">" + "부서번호" + "</th>";
	html += "<td class=\"cont1\">"
			+ dept.DEPT_NO
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx1\" name=\"dept_no\" value=\"" + dept.DEPT_NO + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "상위부서번호" + "</th>";
	html += "<td class=\"cont1\">"
			+ dept.DEPT_OVER_NO
			+ "</td>";
	html += "<td class=\"cont2\">"
			+ "<input type=\"text\" id=\"tx2\" name=\"dept_over_no\" value=\"" + dept.DEPT_OVER_NO + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "부서장번호" + "</th>";
	html += "<td class=\"cont1\">"
			+ dept.DEPT_HEAD_NO
			+ "</td>";
	html += "<td class=\"cont2\">"
			+ "<input type=\"text\" id=\"tx3\" name=\"dept_head_no\" value=\"" + dept.DEPT_HEAD_NO + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "부서이름" + "</th>";
	html += "<td class=\"cont1\">"
			+ dept.DEPT_NM
			+ "</td>";
	html += "<td class=\"cont2\">"
			+ "<input type=\"text\" id=\"tx4\" name=\"dept_nm\" value=\"" + dept.DEPT_NM + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "부서설명" + "</th>";
	html += "<td class=\"cont1\">"
			+ dept.DEPT_EXPN
			+ "</td>";
	html += "<td class=\"cont2\">"
			+ "<input type=\"text\" id=\"tx5\" name=\"dept_expn\" value=\"" + dept.DEPT_EXPN + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";

	$(".dept_detail tbody").html(html);
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
		<div class="contents_header_txt" id="ch1">부서 조회</div>
		<div class="contents_header_txt" id="ch2">부서 상세조회</div>
		<div class="contents_header_txt" id="ch3">부서 등록</div>
		<div class="contents_header_txt" id="ch4">부서 수정</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<input type="hidden" id="top" name="top" value="${param.top}" /> 
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="dept_no" id="dept_no" value="${param.dept_no}" /> 
			<input type="hidden" name="page" id="page" value="1" />
			<div class="default_search_area">
				<select name="searchGbn" id="searchGbn">
					<option value="0">부서명</option>
					<option value="1">부서장번호</option>
				</select> 
				<input type="text" name="searchTxt" value="${param.searchTxt}" placeholder="검색어를 입력해주세요." />
				<div class="search_btn_area">
					<input type="button" id="searchBtn" name="searchBtn " value="검색" />
					<input type="button" id="addBtn" name="addBtn" value="등록" />
				</div>
			</div>
			<div class="default_board">
				<table class="dept_list">
				</table>
				<table class="dept_detail">
					<tbody>
					</tbody>
				</table>
				<table class="dept_add">
					<tbody>
					<colgroup>			
						<col width="150px">
					</colgroup>
					<tr>
						<th class="top2">부서번호</th>
						<td class="cont2">
				 			<input type="hidden" id="tx6" name="dept_no" placeholder="내용을 입력해주세요." />
				 		</td>
					</tr>
					<tr>
						<th class="top2">상위부서번호</th>
						<td class="cont2">
				 			<input type="text" id="tx7" name="dept_over_no" placeholder="내용을 입력해주세요." />
				 		</td>
					</tr>
				 	<tr>
						<th class="top2">부서장번호</th>
						<td class="cont2">
				 			<input type="text" id="tx8" name="dept_head_no" placeholder="내용을 입력해주세요." />
				 		</td>
					</tr>
					<tr>
						<th class="top2">부서이름</th>
						<td class="cont2">
				 			<input type="text" id="tx9" name="dept_nm" placeholder="내용을 입력해주세요." />
				 		</td>
					</tr>
				 	<tr>
						<th class="top2">부서설명</th>
						<td class="cont2">
				 			<input type="text" id="tx10" name="dept_expn" placeholder="내용을 입력해주세요." />
				 		</td>
					</tr>			
					</tbody>
				</table>
				<div class="detail_btn_area">
					<input type="button" id="saveBtn" name="saveBtn" value="저장" /> 
					<input type="button" id="updateBtn" name="updateBtn" value="수정" /> 
					<input type="button" id="deleteBtn" name="deleteBtn" value="삭제" /> 
					<input type="button" id="listBtn" name="listBtn" value="목록" />
				</div>
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