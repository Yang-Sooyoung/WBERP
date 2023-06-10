<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 경력 수정,삭제</title>
<link rel = "stylesheet" href="resources/css/jquery/jquery-ui.css" />
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
		src="resources/script/jquery/jquery-ui.js"></script>
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
</style>
<script type="text/javascript"
		src="resources/script/jquery/jquery-ui.js"></script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	
	$("#listBtn").on("click", function() {
		history.back();
	});

	$("#updateBtn").on("click", function() {
		if($.trim($("#carr_nm").val()) ==""){
			alert("경력을 입력하세요");
			$("#carr_nm").focus();
		} else if($.trim($("#start_day").val()) ==""){
			alert("시작일을 입력하세요");
			$("#start_day").focus();
		} else if($.trim($("#agnc_nm").val()) ==""){
			alert("기관명을 입력하세요");
			$("#agnc_nm").focus();	
		} else {
			var params = $("#actionForm").serialize();
			console.log(params);
				$.ajax({
					type : "post",
					url : "eduperscarrUpdateAjax",
					dataType : "json", 
					data : params, 
					success : function(res) {
						if(res.res == "SUCCESS") {
							$("#actionForm").attr("action", "eduperscarrList");
							$("#actionForm").submit();
						} else {
							$("#alert").attr("title", "알림");
							$("#alert p").html("수정에 실패했다"); 
							$("#alert").dialog({
								buttons: {
									Ok: function(){
										$(this).dialog("close");
									}	
								 }
							});
						}	
					},
					error : function(req,status,error) {
						console.log("code : " + req.status);
						console.log("message : " + req.responseText );
					}
				});
			}
	});
	
	$("#deleteBtn").on("click", function(){
		if(confirm("삭제하시겠습니까?")) {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "eduperscarrDeleteAjax",
				dataType : "json",
				data : params,
				success : function(res) {
					if(res.res == "SUCCESS") {
						$("#actionForm").attr("action", "edupersDetail");
						$("#actionForm").submit();
					} else if(res.res == "FAILED") {
						alert("삭제실패");
						history.back();
					} else {
						alert("삭제중 문제가 발생");
						history.back();
					}
				},
				error : function(req, status, error) {
					console.log("code : " + req.status);
					console.log("message : " + req.responseText);
				}
			});
			
		}
	});
	
	
		$("#actionForm").on("keypress", "input", function(e) {
		if(e.keyCode == 13) {
			return false;
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
	<div class="contents_header">
		<div class="contents_header_txt">경력 수정,삭제</div>
	</div>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
		<div class="contents">
			<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<!-- -->
			<input type="hidden" name="edu_pers_no" id="edu_pers_no" value="${param.edu_pers_no}" />
			<input type="hidden" name="edu_pers_carr_no" id="edu_pers_carr_no" value="${param.edu_pers_carr_no}" />
			<input type="hidden" name="page" id="page" value="${param.page}" />
		<div class="underbox">
				<div class="underline">
					<div class="line1">경력명*</div>
					<div class="con1">
						<input type ="text" name= "carr_nm" id="carr_nm" value="${edu.CARR_NM}" />
					</div>
					<div class="line1">시작일*</div>
					<div class="con1">
						<input type ="text" placeholder='YYYY-MM-DD(연-월-일)' name= "start_day" id="start_day" value="${edu.START_DAY}" />
					</div>
				</div>
				<div class="underline">
					<div class="line1">종료일</div>
					<div class="con1">
						<input type ="text" placeholder='YYYY-MM-DD(연-월-일)' name= "end_day" id="end_day" value="${edu.END_DAY}" />
					</div>
					<div class="line1">기관명*</div>
					<div class="con1">
						<input type ="text" name= "agnc_nm" id="agnc_nm" value="${edu.AGNC_NM}" />
				</div>
			</div>
		<div class="detail_btn_area">
				<input type ="button" value ="삭제" id="deleteBtn"/>
				<input type="button" value="확인" id="updateBtn" />
				<input type="button" value="취소" id="listBtn"/>
			</div>
	</div>
	</form>
	</div>
</body>
</html>