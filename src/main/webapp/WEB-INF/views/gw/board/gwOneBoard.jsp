<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->

<title>한줄 게시판</title>

<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
body {
	margin: 0px;
	font-size: 0pt;
}

.ob_wrap {
	width: 200px;
	margin: 0px auto;
	border: 1px solid #444444;
}

.write_area {
	height: 100px;
}

.user_info {
	display: inline-table;
	width: 100px;
	height: 100px;
	vertical-align: top;
}

.user_name {
	display: table-cell;
	width: 100px;
	height: 100px;
	vertical-align: middle;
	text-align: center;
	font-size: 12pt;
	
}

.write_con_wrap {
	display: inline-block;
	width: 550px;
	height: 100px;
	vertical-align: top;
}

.write_con {
	width: 540px;
	height: 90px;
	resize: none;
	margin: 2px;
}

.btn_wrap {
	display: inline-block;
	width: 150px;
	height: 100px;
	vertical-align: top;
}

.actionBtn {
	width: 70px;
	height: 76px;
	margin: 2px;
	margin-top : 15px;
	background-color : #34537a;
	color: #fdfdfd;
	font-size: 12pt;
    font-weight: bold;
    border-color : #34537a;
    border-radius : 11px
}

.ActionBtn {
	width: 94px;
	height: 76px;
	margin: 2px;
	margin-top : 15px;
	margin-left : 24px;
	background-color : #022859;
	color: #fdfdfd;
	font-size: 12pt;
    font-weight: bold;
    border-color : #022859;
    border-radius : 11px
}

.action_btn {
	width: 146px;
	height: 96px;
	margin: 2px;
	background-color : #022859;
	color: #fdfdfd;
	font-size: 14pt;
    font-weight: bold;
    border-color : #022859;
    border-radius : 11px
}

.login_req_wrap {
	display: inline-table;
	width: 800px;
	height: 100px;
}

.login_req {
	display: table-cell;
	width: 800px;
	height: 100px;
	vertical-align: middle;
	text-align: center;
	font-size: 12pt;
}

.data_req_wrap {
	display: inline-table;
	width: 800px;
	height: 100px;
	border-top : 1px solid #444444;
	margin-bottom: 5px;
}

.data_req {
	display: table-cell;
	width: 800px;
	height: 100px;
	vertical-align: middle;
	text-align: center;
	font-size: 12pt;
}

.ob_data {
	width: 825px;
	border-top : 1px solid #022859;
	margin-bottom: 5px;
}

.con_info {
	display: inline-table;
	width: 550px;
	height: 100px;
	vertical-align: top;
}

.con {
	display: table-cell;
	width: 100px;
	height: 100px;
	vertical-align: middle;
	text-align: left;
	font-size: 12pt;
}



</style>
<!-- 추가스크립트 작업 -->
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	reloadList();
	
	//페이징
	$(".paging_nation").on("click","div", function(){
		$("#page").val($(this).attr("name"));
		reloadList();
	});
	
	//추가 
	$("#addBtn").on("click", function(){
		addList();	
	});	
	
	//삭제
	$(".ob_list_wrap").on("click", "#deleteBtn", function(){
		$("#BOARD_NO").val($(this).parent().parent().attr("name"));
			 if(confirm("삭제하시겠습니까?")) {
				 deleteList();
		} 
	});

	//수정
	$(".ob_list_wrap").on("click", "#updateBtn", function(){
		$("#BOARD_NO").val($(this).parent().parent().attr("name"));
			if(confirm("수정페이지로 가겠습니까?")){
				detailList();
			}	
	});
	
	//수정 2
	$(".btn_wrap").on("click", "#UpdateBtn", function(){
		updateList();
	});
		
//목록	
function reloadList() {
	var params = $("#actionForm").serialize();
		
	$.ajax({
		type : "post",
		url : "gwOneBoardAjax",
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

//목록 function
function drawList(list, cnt) {
	var html = "";
		
	if( cnt == 0) {
		html +="<div class=\"data_req_wrap\">";
		html +="<div class=\"data_req\">데이터가 없습니다.</div>"
		html +="</div>";
	} else {
		for(var i = 0 ; i < list.length ; i++) {
			html += "<div class =\"ob_data\" name=" + list[i].BOARD_NO + ">";
			html += "<div class=\"user_info\">" ;
			html += "<div class=\"user_name\">" + list[i].EMP_NM + "</div>";
			html += "</div>";
			html += "<div class=\"con_info\">";
			html += "<div class=\"con\">" + list[i].BOARD_CONT + "</div>";
			html += "</div>";
			html += "<div class=\"btn_wrap\">";
			if( $("#EMP_NO").val() == list[i].EMP_NO ) {
				html += "<input type=\"button\" value=\"수정\" id=\"updateBtn\" class=\"actionBtn\" />";
				html += "<input type=\"button\" value=\"삭제\" id=\"deleteBtn\" class=\"actionBtn\" />"; 	
			}
			html += "</div>";
			html += "</div>";
		}
	}
		
	$(".ob_list_wrap").html(html);
}
	


//페이징
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
			html += "<div class=\"arrow next\" name =\"" +pb.maxPcount + "\"></div>";
		} else {
			html += "<div class=\"arrow next\" name =\"" + ($("#page").val() * 1 + 1) + "\"></div> ";
		}

		$(".page_nation").html(html);
}	

//추가 function
function addList() {
	var params = $("#addForm").serialize();
	console.log(params);
	$.ajax({
		type : "post",
		url : "addObAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			if(res.res == "SUCCESS") {
				console.log(res);
				$("#BOARD_CONT").val("");
				reloadList();
			}
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}

//값 삭제
function deleteList() {
	var params = $("#addForm").serialize();
	
	$.ajax({
		type : "post",
		url : "deleteObAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			if(res.res == "SUCCESS") {
				reloadList();
			}
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});	
}

//수정을 위한 상세보기

function detailList() {
	var html="";
	var params = $("#addForm").serialize();
	console.log(params);
	$.ajax({
		type : "post",
		url : "detailObAjax",
		dataType : "json", 
		data : params, 	
		success : function(res) {
			$("#BOARD_CONT").val(res.data.BOARD_CONT);
			html += "<input type= \"button\" value= \"수정\" id=\"UpdateBtn\" class = \"ActionBtn\" name=" + res.data.BOARD_NO + "/>";
			html += "<input type=\"hidden\" name=\"BOARD_NO\" id =\"BOARD_NO\" value=" + ${BOARD_NO} + " />";
			$("#btn").html(html);
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}

// 수정 
function updateList() {
	var params = $("#addForm").serialize();
	
	$.ajax({
		type : "post",
		url : "updateObAjax",
		dataType : "json", 
		data : params,
		success : function(res) { 
			if(res.res == "SUCCESS"){
				location.href = "gwOneBoard";
				$("#BOARD_CONT").val("");
			} 
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
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
		<div class="contents_header_txt">한줄 게시판</div>
	</div>
	
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="page" id="page" value="${page}" />
			<input type="hidden" name="EMP_NO" id="EMP_NO" value="${sEmpNo}"/>
			
		</form>
		<form id="addForm">
			<input type="hidden" name="BOARD_NO" id="BOARD_NO"/>
			<input type="hidden" name="EMP_NO" id="EMP_NO" value="${sEmpNo}"/>
			<input type="hidden" name="BOARD_TITLE" id="BOARD_TITLE" value="${param.BOARD_TITLE}"/>	
			<input type="hidden" name="BOARD_MANG_NO" id="BOARD_MANG_NO" value="${param.BOARD_MANG_NO}"/>	
				<div class="user_info">
					<div class="user_name">${sEmpNm}</div>
				</div>
				<div class="write_con_wrap">
					<textarea class="write_con" name="BOARD_CONT" id="BOARD_CONT"></textarea>
				</div>
				<div class="btn_wrap" id="btn">
					<input type="button" value="저장" id= "addBtn" class="action_btn" />
				</div>
		</form>	
	
	<!-- 목록 -->
	<div class="ob_list_wrap">
	</div>
	
	<!-- 페이지 -->
	<div class="page_wrap">
		<div class="page_nation"></div>
	</div>

	</div>
	
	<!-- bottom -->
	<c:import url="/bottom"></c:import>	
</body>
</html>