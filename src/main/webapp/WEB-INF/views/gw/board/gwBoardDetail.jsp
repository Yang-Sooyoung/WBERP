<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 전사게시판 상세보기</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 상세보기영역 가로변경 시 */
.underbox {
	width: 800px;
}

/* 버튼영역 가로변경 시 */
.detail_btn_area {
	width: 800px;
}
/* 개별 css는 여기에 */
.list {
	display: inline-block;
	vertical-align: top;
	width: 800px;
	height: 35px;
	text-align: right;
	font-size: 11pt;
	margin-bottom: 10px;
}
.list_txt {
	width: 80px;
	height: 32px;
	background-color: #f7f7f7;
	font-size: 10pt;
	border-radius: 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
	cursor: pointer;
}
.list_txt:hover {
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}

.post_lists {
	display: inline-block;
	vertical-align: top;
	width: 80px;
}
.post_pre, .post_next {
	height: 29px;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	padding-bottom: 1px;
	background-color: #f7f7f7;
	font-size: 10pt;
	outline: none;
	cursor: pointer;
}
.post_pre:hover, .post_next:hover{
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}
.post_img {
	margin-top: 4px;
}
.date {
	font-size: 11pt;
	text-align: center;
}
.con_area {
	width: 500px;
	height: 300px;
}
</style>
<!-- 추가스크립트 작업 -->
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".list").on("click", "#listBtn", function() {
		$("#actionForm").attr("action", "gwOneBoard");
		$("#actionForm").submit();
	});
	
	$(".detail_btn_area").on("click", "#updateBtn", function() {
		$("#actionForm").attr("action", "gwBoardUpdate");
		$("#actionForm").submit();
	});
	

	
	$(".detail_btn_area").on("click", "#deleteBtn", function() {
		if(confirm("삭제하시겠습니까?")) {
			var params = $("#actionForm").serialize();
	
			$.ajax({
				type : "post",
				url : "boardDeleteAjax",
				dataType : "json", 
				data : params, 
				success : function(res) {
					if(res.res == "SUCCESS") {
						$("#actionForm").attr("action", "gwBoard");
						$("#actionForm").submit();
					} else {
						
						makeAlert(1, "알림", "삭제에 실패하였습니다.", null);
						$("#alert").dialog({
							buttons: {
								Ok: function() {
									$(this).dialog("close");
								}
							}
						});	
					}
				},
				error : function(req, status, error) {
					console.log("code : " + req.status);
					console.log("message : " + req.responseText);
				}
			});
		}
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
		<div class="contents_header_txt">전사 게시판 상세보기</div>
	</div>
	
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="BOARD_NO" id="BOARD_NO" value="${data.BOARD_NO}"/>
			
			<div class="list">
			<input type="button" class="list_txt" id="listBtn" value="목록" />
			<div class="post_lists">
				<div class="post_pre">이전글
				<img src="resources/images/gw/down.png" width="15" height="15" class="post_img"/></div>
			</div>
			<div class="post_lists">
				<div class="post_next">다음글
				<img src="resources/images/gw/up.png" width="15" height="15" class="post_img"/></div>
			</div>
		</div>
		
		
			<div class="underbox">
			<div class="underline">
				<div class="line1">번호</div>
				<div class="con1 date">${data.BOARD_NO}</div>
				<div class="line1">작성자</div>
				<div class="con1 date">${data.EMP_NM}</div>
				<div class="line1">작성일</div>
				<div class="con1 date">${data.BOARD_REG_DATE}</div>
			</div>
			<div class="underline">
				<div class="line1">제목</div>
				<div class="con3">${data.BOARD_TITLE}</div>
			</div>
			<div class="underline">
				<div class="line1">첨부파일</div>
				 <div class="con3"><a href="resources/upload/${filedata.BOARD_FILE}" download>${filedata.BOARD_FILE}</a></div>
			</div> 
			<div class="underline">
				<div class="line1">내용</div>
				<div class="con3 con_area">${data.BOARD_CONT}</div>
			</div>
		</div>
		</form>
		<div class="detail_btn_area">
			<input type="button" id="updateBtn" value="수정" />
			<input type="button" id="deleteBtn" value="삭제" />
		</div>
	</div>
	
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
	
</body>
</html>