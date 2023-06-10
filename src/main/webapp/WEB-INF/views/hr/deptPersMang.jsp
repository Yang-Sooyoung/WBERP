<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 부서원조회</title>
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
.deptPers_list {
	margin-bottom: 10px;
}
.deptPers_detail {
	display: none;
	margin-bottom: 10px;
}
.deptPers_add {
	display: none;
	margin-bottom: 10px;
}
#ch2, #ch3, #ch4 {
	display: none;
}
#tx1, #tx2, #tx3, #tx4, #tx5, #tx6, #tx7, #tx8, #tx9, 
#tx10,#tx11,#tx12,#tx13,#tx14,#tx15,#tx16,#tx17 {
	display: none;
	width: 292px;
	height: 27.5px;
}
/* Contents default */
.content_wrap {
	min-width: 700px;
	margin: 0 auto;
	font-size: 0pt;
}

.corp_manage_wrap {
	width: 660px;
}

.corp_wrap {
	position: relative;
}

.corp_btn {
	height: 30px;
	font-size: 9pt;
	color: #454545;
	border: 1px solid #c5c5c5;
	border-radius: 2px;
	padding: 0px 3px;
	margin-right: 4px;
	line-height: 1.0em;
	vertical-align: middle;
}

.corp_btn:active {
	border: 1px solid #003eff;
    background: #007fff;
    font-weight: normal;
    color: #ffffff;
}

.corp_table_btn {
	height: 30px;
	font-size: 9pt;
	color: #454545;
	border: 1px solid #c5c5c5;
	border-radius: 2px;
	padding: 0px 8px;
	line-height: 1.0em;
	vertical-align: middle;
	margin-left: 3px;
}

.corp_table_btn:active {
	border: 1px solid #003eff;
    background: #007fff;
    font-weight: normal;
    color: #ffffff;
}

/* Group */
.group {
	width: 100%;
	margin-bottom: 15px;
}

.group_header {
	height: 60px;
	font-size: 20pt;
	font-weight: bold;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35);
	line-height: 2.2em;
}

.group_header_b {
	display: inline-block;
	vertical-align: top;
	width: calc(100% - 400px);
	height: 60px;
	font-size: 20pt;
	font-weight: bold;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35);
	line-height: 2.2em;
}

.group_header_btn {
	display: inline-block;
	vertical-align: top;
	width: 388px;
	height: 40px;
	padding: 10px 12px 10px 0px;
	text-align: right;
}

.group_blank {
	display: inline-block;
	width: 100%;
	height: 15px;
}

/* Group Content */
.group_con, .group_con_s, .group_con_title, .group_con_txt, .group_con_txt_l, .group_con_txt_free, .group_con_txta {
	display: inline-block;
	vertical-align: top;
	min-height: 40px;
}

.group_con, .group_con_s {
	margin-bottom: 10px;
}

.group_con {
	width: 100%;
}

.group_con_s {
	width: 50%;
}

.group_con_title {
	width: 90px;
	font-size: 12pt;
	/* text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35); */
	line-height: 2.2em;
	padding: 0px 5px;
	color: #333333;
}

.group_con_txt {
	width: calc(100% - 100px);
	height: 40px;
	font-size: 12pt;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35);
	line-height: 2.0em;
}

.group_con_txt_l {
	width: calc(100% - 110px);
	height: 40px;
	font-size: 12pt;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35);
	line-height: 2.0em;
	padding-right: 10px;
	text-align: right;
}

.group_con_txt_free {
	width: calc(100% - 100px);
	font-size: 12pt;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35);
	line-height: 2.0em;
}

.group_con_txta {
	width: calc(100% - 14px);
	font-size: 10pt;
    padding: 5px 10px;
	resize: none;
    background: #ffffff;
    border: 1px solid #cccccc;
    border-radius: 4px;
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-sizing: border-box;
    color: #333333;
}

.group_con_input {
	width: calc(100% - 14px);
    height: 100%;
    padding: 0px 10px;
    background: #ffffff;
    border: 1px solid #cccccc;
    border-radius: 4px;
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-sizing: border-box;
    color: #333333;
}

#dept {
	display: inline-block;
	vertical-align: top;
	width: 250px;
	min-height: 500px;
	font-size: 9pt;
	border: 1px solid #cccccc;
    border-radius: 4px;
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-sizing: border-box;
}

.corp_manage_wrap .top_btn_area {
	margin-bottom: 5px;
	margin-right: 5px;
}

.corp_manage_wrap .user_info_wrap {
	display: inline-block;
	vertical-align: top;
	width: 400px;
	margin-left: 10px;
	min-height: 500px;
}

.corp_manage_wrap .user_info {
	width: 400px;
	font-size: 10pt;
	text-align: center;
	border-collapse: collapse;
}

.corp_manage_wrap .user_info tr {
	height: 30px;
	vertical-align: middle;
}

.corp_manage_wrap .user_info tr th {
	vertical-align: middle;
	padding: 0 0 10px 0;
	font-size: 11pt;
}

.corp_manage_wrap .user_info tr td {
	vertical-align: middle;
	padding: 0;
}

.corp_manage_wrap .user_info tr td input[type='text'], .corp_manage_wrap .user_info tr td input[type='password'], .corp_manage_wrap .user_info tr td input[type='number'] {
	width: 146px;
}

.corp_manage_wrap .user_info tr td .user_img {
	display: table-cell;
	vertical-align: middle;
	border: 1px solid #9e9e9e;
	width: 100px;
	height: 118px;
	cursor: pointer;
}

.corp_manage_wrap .user_info tr td .user_img img {
	width: 97px;
	max-height: 118px;
}

.corp_manage_wrap .user_info tr td .user_img_hidden {
	display: none;
}

.corp_manage_wrap .corp_popup_div #startDt, .corp_manage_wrap .corp_popup_div #endDt {
	width: 260px !important;
    border: 1px solid !important;
    border-radius: 3px !important;
    padding: 5px !important;
    margin-right: 5px !important;
}
</style>
</head>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<link rel="stylesheet" href="resources/css/jstree/themes/default/style.css" />
<script type="text/javascript" src="resources/script/jquery/jstree.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	updateCorpTree();
	/* 검색 구분 */
	if('${param.searchGbn}' != '') {
		$("#searchGbn").val('${param.searchGbn}');
	}
	reloadList();
	
	$('.corp_manage_wrap #dept').jstree({
		"core" : {
			"check_callback": true,
			"multiple" : false,
			"animation" : 0,
			"expand_selected_onload" : true,
			"restore_focus" : true
		},
		"types" : {
			"group" : {
				"valid_children" : ["group"]
			}
		},
		"plugins" : [
			"contextmenu", "dnd", "search",
			"state", "types", "wholerow"
		],
		"search": {
            "case_insensitive": true,
            "show_only_matches" : true
        }
	}).on('select_node.jstree', function(e, data) {
		$("#dept_no").val(data.node.id);
		reloadList();
	});
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
 		$(".corp_manage_wrap #dept").show();
 		$(".deptPers_list").css('display', 'table'); /* 테이블  */
 		$(".deptPers_list tbody").css('display', '');
		$(".deptPers_detail").css('display', 'none');
 		$(".deptPers_add").css('display', 'none');
		$(".default_search_area").show(); /* 검색  */
		$(".detail_btn_area").hide(); /* 아래 버튼  */
		$(".page_wrap").show(); /* 페이징 */
		$("#tx99").val("");
		$("#tx98").val("");
		$("#tx97").val("");
		$("#tx96").val("");
		$("#tx95").val("");
		$("#tx94").val("");
		$("#tx93").val("");
		$("#tx92").val("");
		$("#tx91").val("");
		$("#tx90").val("");
		$("#tx89").val("");
		$("#tx88").val("");
		$("#tx87").val("");
		$("#tx86").val("");
		$("#tx85").val("");
		$("#tx84").val("");
		$("#tx83").val("");
	});
	/* 상세조회 */
	$(".deptPers_list").on("click", "tbody tr", function() {
		$("#emp_no").val($(this).attr("name")); /* 글번호 */
 		$("#ch1").hide(); /* 제목  */
 		$("#ch2").css('display', 'table-cell');
 		$("#ch3").hide();
 		$("#ch4").hide();
 		$(".corp_manage_wrap #dept").hide();
 		$(".group_header").hide();
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
 		$("#tx9").css('display', 'none');
 		$("#tx10").css('display', 'none');
 		$("#tx11").css('display', 'none'); 
 		$("#tx12").css('display', 'none');
 		$("#tx13").css('display', 'none'); 
 		$("#tx14").css('display', 'none');
 		$("#tx15").css('display', 'none');
 		$("#tx16").css('display', 'none');
 		$("#tx17").css('display', 'none');
		$(".deptPers_list").css('display', 'none'); /* 테이블  */
		$(".deptPers_detail").css('display', 'table');
 		$(".deptPers_add").css('display', 'none');
		$(".default_search_area").hide(); /* 검색  */
		$(".detail_btn_area").show(); /* 아래 버튼  */
		$(".page_wrap").hide(); /* 페이징 */
		$("#saveBtn").hide(); /* 버튼  */
		$("#updateBtn").show();
		$("#deleteBtn").show();
		$("#listBtn").show();
		
		reloadDetail();
	});
	//트리
	function updateCorpTree() {
		$.ajax({
			type : "post",
			url : "getCorpListAjax",
			dataType : "json",
			success : function(result) {
				console.log(result.list);
				$('.corp_manage_wrap #dept').jstree(true).settings.core.data = result.list;
				clearNodeSelectData();
				$('.corp_manage_wrap #dept').jstree(true).deselect_all();
				$('.corp_manage_wrap #dept').jstree(true).refresh();
			}
		});
	}

	function clearNodeSelectData() {
		$(".corp_manage_wrap #selId").val("");
		$(".corp_manage_wrap #selText").val("");
		$(".corp_manage_wrap #selLevel").val("");
		$(".corp_manage_wrap #selCnt").val("");
	}
/* 조회  */
function reloadList() {
	var params = $("#actionForm").serialize();

	$.ajax({
		type : "post",
		url : "deptPersMangAjax",
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
		html += "<th>사원번호</th>";
		html += "<th>부서번호</th>";
		html += "<th>사원이름</th>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody>";
		for (var i = 0; i < list.length; i++) {
			html += "<tr name=\"" + list[i].EMP_NO + "\">";
			html += "<td>" + list[i].EMP_NO + "</td>";
			html += "<td>" + list[i].DEPT_NO + "</td>";
			html += "<td>" + list[i].EMP_NM + "</td>";
			

			html += "</tr>";
		}
		html += "</tbody>";
	}
	$(".deptPers_list").html(html);
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
		url : "deptPersMangDetailContAjax",
		dataType : "json", // {키:값, 키:값}
		data : params, // 보낼데이터
		success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로 받겠다.
			drawDetail(res.deptPersMang);
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);

		}
	});
}
/* 상세보기  */
function drawDetail(deptPersMang) {
	var html = "";
	html += "<colgroup>";
	html += "<col width=\"150px\">";
	html += "<col width=\"300px\">";
	html += "</colgroup>";
	
	html += "<tr name=\"" + deptPersMang.EMP_NO + "\">"
	html += "<th class=\"top2\">" + "사원번호" + "</th>";
	html += "<td class=\"cont1\">"
			+ deptPersMang.EMP_NO
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx1\" name=\"EMP_NO\" value=\"" + deptPersMang.EMP_NO + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	
	html += "<tr>";
	html += "<th class=\"top2\">" + "사원이름" + "</th>";
	html += "<td class=\"cont1\">"
			+ deptPersMang.EMP_NM
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx2\" name=\"emp_nm\" value=\"" + deptPersMang.EMP_NM + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	
	html += "<tr>";
	html += "<th class=\"top2\">" + "사진주소" + "</th>";
	html += "<td class=\"cont1\">"
			+ deptPersMang.PHOTO_ADDR
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx3\" name=\"photo_addr\" value=\"" + deptPersMang.PHOTO_ADDR + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	
	html += "<tr>";
	html += "<th class=\"top2\">" + "주소" + "</th>";
	html += "<td class=\"cont1\">"
			+ deptPersMang.ADDR
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx4\" name=\"addr\" value=\"" + deptPersMang.ADDR + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	
	html += "<tr>";
	html += "<th class=\"top2\">" + "상세주소" + "</th>";
	html += "<td class=\"cont1\">"
			+ deptPersMang.DETL_ADDR
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx5\" name=\"detl_addr\" value=\"" + deptPersMang.DETL_ADDR + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	
	html += "<tr>";
	html += "<th class=\"top2\">" + "우편번호" + "</th>";
	html += "<td class=\"cont1\">"
			+ deptPersMang.POST_NO
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx6\" name=\"post_no\" value=\"" + deptPersMang.POST_NO + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	
	html += "<tr>";
	html += "<th class=\"top2\">" + "전화번호" + "</th>";
	html += "<td class=\"cont1\">"
			+ deptPersMang.TEL_NO
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx7\" name=\"tell_no\" value=\"" + deptPersMang.TEL_NO + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";

	html += "<tr>";
	html += "<th class=\"top2\">" + "핸드폰번호" + "</th>";
	html += "<td class=\"cont1\">"
			+ deptPersMang.CELL_NO
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx8\" name=\"cell_no\" value=\"" + deptPersMang.CELL_NO + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	
	html += "<tr>";
	html += "<th class=\"top2\">" + "이메일" + "</th>";
	html += "<td class=\"cont1\">"
			+ deptPersMang.EMAIL
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx9\" name=\"email\" value=\"" + deptPersMang.EMAIL + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	
	html += "<tr>";
	html += "<th class=\"top2\">" + "생년월일" + "</th>";
	html += "<td class=\"cont1\">"
			+ deptPersMang.BIRTH
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx10\" name=\"birth\" value=\"" + deptPersMang.BIRTH + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	
	html += "<tr>";
	html += "<th class=\"top2\">" + "성별코드" + "</th>";
	html += "<td class=\"cont1\">"
			+ deptPersMang.SEX_CODE
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx11\" name=\"sex_code\" value=\"" + deptPersMang.SEX_CODE + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	
	html += "<tr>";
	html += "<th class=\"top2\">" + "예금주" + "</th>";
	html += "<td class=\"cont1\">"
			+ deptPersMang.ACNT_NM
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx12\" name=\"acnt_nm\" value=\"" + deptPersMang.ACNT_NM + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";

	html += "<tr>";
	html += "<th class=\"top2\">" + "은행번호" + "</th>";
	html += "<td class=\"cont1\">"
			+ deptPersMang.BANK_NO
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx13\" name=\"bank_no\" value=\"" + deptPersMang.BANK_NO + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";

	html += "<tr>";
	html += "<th class=\"top2\">" + "계좌번호" + "</th>";
	html += "<td class=\"cont1\">"
			+ deptPersMang.ACNT_NO
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx14\" name=\"acnt_no\" value=\"" + deptPersMang.ACNT_NO + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";

	html += "<tr>";
	html += "<th class=\"top2\">" + "권한번호" + "</th>";
	html += "<td class=\"cont1\">"
			+ deptPersMang.ATHR_NO
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx15\" name=\"athr_no\" value=\"" + deptPersMang.ATHR_NO + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";

	html += "<tr>";
	html += "<th class=\"top2\">" + "비밀번호" + "</th>";
	html += "<td class=\"cont1\">"
			+ deptPersMang.EMP_PW
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx16\" name=\"emp_pw\" value=\"" + deptPersMang.EMP_PW + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";

	html += "<tr>";
	html += "<th class=\"top2\">" + "내외국인코드" + "</th>";
	html += "<td class=\"cont1\">"
			+ deptPersMang.LOCAL_CODE
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx17\" name=\"local_code\" value=\"" + deptPersMang.LOCAL_CODE + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";

	$(".deptPers_detail tbody").html(html);
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
		<div class="contents_header_txt" id="ch1">부서원 조회</div>
		<div class="contents_header_txt" id="ch2">부서원 상세조회</div>
		<div class="contents_header_txt" id="ch3">부서원 등록</div>
		<div class="contents_header_txt" id="ch4">부서원 수정</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<input type="hidden" id="top" name="top" value="${param.top}" /> 
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="emp_no" id="emp_no" value="${param.emp_no}" /> 
			<input type="hidden" name="dept_no" id="dept_no" /> 
			<input type="hidden" name="page" id="page" value="1" />	
			<div class="default_search_area">
				<select name="searchGbn" id="searchGbn">
					<option value="0">부서번호</option>
					<option value="1">사원명</option>
				</select> 
				<input type="text" name="searchTxt" value="${param.searchTxt}" placeholder="검색어를 입력해주세요." />
				<div class="search_btn_area">
					<input type="button" id="searchBtn" name="searchBtn" value="검색" />
				</div>
			</div>
			<div class="default_board">
			<div class="content_wrap corp_manage_wrap">
	<div class="corp_wrap">
		<div class="group">
			<div class="group_header">조직도</div>
			<input type="hidden" id="selId" />
			<input type="hidden" id="selText" />
			<input type="hidden" id="selLevel" />
			<input type="hidden" id="selCnt" />
			<div id="dept"></div>
			<div class="user_info_wrap">
				<table class="deptPers_list">
				</table>	
				<table class="deptPers_detail">
					<tbody>
					</tbody>		
				</table>
				</div>
					</div>
				</div>
				</div>
				<div class="detail_btn_area">
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