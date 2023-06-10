<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->

<title>게시판</title>

<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 검색영역 변경 시 */
.default_search_area {
	width: 900px;
}

/* 목록영역 가로변경 시 */
.default_board {
	width: 900px;
}

/* 추가 스크립트*/
.border{
   display: block;
   border-top : 6px solid #022859;
   width: 808px;
   margin-top: 15px;
   margin-left: 110px;
}

.menu_border_L{
	display: block;
	border : 2px solid #022859;
	background-color: #022859;
	width: 230px;
	margin-top: 10px;
	margin-left: 149px;
}

.menu_border_R{
	display: block;
	border : 2px solid #022859;
	background-color: #022859;
	width: 230px;
	margin-top: -4px;
	margin-left: 641px;
}


.box{
   display: block;
   width : 300px;
   height : 400px;
   border : 2px solid #022859;
   margin-top : 33px;
   margin-left : 605px;
}
.box_two{
   display: block;
   width : 300px;
   height : 400px;
   border : 2px solid #022859;
   margin-top : -402px;
   margin-left : 114px;
   padding : 0px 
}
.plusbtn{
   display : block;
   width : 90px;
   height : 80px;
   margin-top : -312px;
   margin-left : 470px;
   font-size : 35px;
   font-weight : 600;
   background-color : #022859;
   border : 1px solid #022859;
   color : white ;
   hover : black;
   cursor: pointer;
}
.delbtn{
   display : block;
   width : 90px;
   height : 80px;
   margin-top : 39px;
   margin-left : 470px;
   font-size : 35px;
   font-weight : 600;
   background-color : #022859;
   border : 1px solid #022859;
   color : white ;
   hover : #3c3c3d;
   cursor: pointer;
}
.txt{
   display: block;
    margin-top: -6px;
    margin-left: 114px;
    font-weight: 600;
    font-size: 21px;
    color : #022859;
}

.txt_L{
   	display: block;
    margin-top: 30px;
    margin-left: 208px;
    font-weight: 600;
    font-size: 21px;
    color : #022859;
}

.txt_R{
   	display: block;
    margin-top: -28px;
    margin-left: 682px;
    font-weight: 600;
    font-size: 21px;
    color : #022859;
}
.boxtxt{
   	display: inline-block;
    margin-top: 30px;
    margin-left: 54px;
    font-weight: 600;
    font-size: 20px;
}

.btn{
   display: block;
   margin-top : 131px;
   padding: 10px;
   margin-left : 466px;
   width: 100px;
   border: 1px solid #022859;
   border-radius: 40px;
   text-align: center;
   font-weight : 800;
   background-color : #022859;
   font-size: 16px;
   color : #ffffff;
   cursor: pointer;
}

.border_two{
   display: block;
   border-top : 2px solid rgba(2,40,89,0.3);
   width: 183px;
   margin-top: 12px;
   margin-left: 55px;
}

</style>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
$(document).ready(function(){
	reloadList();
	loadList();
	
	//+버튼 눌렀을때
	$("body").on("click", "#plusbtn", function(){
		addList();
		loadList();
		reloadList();
	});
	
	//-버튼 눌렀을때
	$("body").on("click", "#delbtn", function(){
		delList();
		loadList();
		reloadList();
	});
	
	// 저장버튼 누를때
	$("body").on("click", "#btn", function(){
		$("#actionForm").attr("action","gwBoardManage");
		$("#actionForm").submit();
	});
	
});



// 왼쪽목록 띄우기
function reloadList() {
	var params = $("actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "boardMangAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			drawList_box_two(res.list, res.cnt);
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}



// 왼쪽 박스
function drawList_box_two(list, cnt) {
	var html ="";
	
	if(cnt == 0) {
		html += "<div class=\"box_two\">";
		html += "<div class=\"box_two\">데이터가 없습니다.</div>";		
		html += "</div>";
	} else {
		for(var i = 0 ; i < list.length; i ++) {
			html += "<div name=\"" +list[i].BOARD_MANG_NO+ "\">";		      
		    html += "<div class=\"boxtxt\"><input type=\"checkbox\" name=\"BOARD_MANG_NO\" value=\""+list[i].BOARD_MANG_NO+"\"/>"+list[i].BOARD_NM+"</div>";
			html += "<div class=\"border_two\"></div>"
		    html +="</div>";
		}
	}
	$(".box_two").html(html);
}

//추가
function addList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "addAjax",
		dataType : "json",
		data : params,
		success : function(res){
			if(res.res == "SUCCESS") {
				console.log("성공띠");
			}
		},
		error :function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}

// 호출 아작스
function loadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "loadAjax",
		dataType : "json",
		data : params,
		success : function(res){
			draw_box(res.list,res.cnt);
		},
		error :function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}

//삭제 아작스
function delList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "delAjax",
		dataType : "json",
		data : params,
		success : function(res){
			if(res.res == "SUCCESS") {
				console.log("성공띠");
			}
		},
		error :function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}


//Right_box
function draw_box(list,cnt) {
	var html ="";
	
	if(cnt == 0) {
		html += "<div class=\"box\">";
		html += "<div class=\"box\">데이터가 없습니다.</div>";		
		html += "</div>";
	} else {
		for(var i = 0 ; i < list.length; i++){
			html += "<div name=\"" +list[i].BOARD_MANG_NO+ "\">";		      
			html += "<div class=\"boxtxt\"><input type=\"checkbox\" name=\"BOARD_MANG_NO\" value=\""+list[i].BOARD_MANG_NO+"\"/>"+list[i].BOARD_NM+"</div>";
			html += "<div class=\"border_two\"></div>"
		    html +="</div>";
		}
		
	}
	$(".box").html(html);
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
		<div class="contents_header_txt">게시판관리</div>
	</div>
	
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
		
		<div class="txt"> 게시판 관리</div>
      <div class="border"></div>
      	<div class="txt_L"> 게시판 종류</div>
      	<div class="txt_R"> 사용중인 게시판</div>
       <div class="menu_border_L"></div>
       <div class="menu_border_R"></div>
       
       <!-- 오른쪽 박스 -->
      <div class="box">
       </div>
       
       
       <!-- 왼쪽 박스 -->
       <div class="box_two">       
       	<div class="border_two">
       	</div>
       </div>
		</form>

      <input type="button" value="+" class= "plusbtn" id="plusbtn"/>
      <input type="button" value="-" class= "delbtn" id="delbtn"/>
	  <input type="button" value="저장하기"  class="btn" id="btn"/>
      </div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>