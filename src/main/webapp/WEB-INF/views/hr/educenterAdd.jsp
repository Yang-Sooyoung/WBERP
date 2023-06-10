<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 교육장 등록</title>
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
	if('${edu.photo_addr}' != ''){
		$("#fileForm").hide();
		}
	
	$("#listBtn").on("click", function() {
		history.back();
	});
	
	$("#addBtn").on("click", function() {
		            
		if($.trim($("#edu_center_nm").val()) ==""){
			alert("교육장이름을 입력하세요");
			$("#edu_center_nm").focus();
		} else if($.trim($("#addr").val()) ==""){
			alert("주소를 입력하세요");
			$("#addr").focus();
		} else if($.trim($("#phone_num").val()) ==""){
			alert("핸드폰 번호를 입력하세요");
			$("#phone_num").focus();
		} else if($.trim($("#acpt_psbl_pers").val()) ==""){
			alert("수용가능인원을 입력하세요");
			$("#acpt_psbl_pers").focus();	
		} else { 
			if($("#fileForm").is(":visible") && $("#attFile").val() != ''){
				var fileForm = $("#fileForm");
				
				fileForm.ajaxForm({ 
					success: function(res) { 
						if(res.result =="SUCCESS"){
							if(res.fileName.length > 0){
								$("#photo_addr").val(res.fileName[0]);
							}
							addAjax();
						} else {
							alert("파일저장실패");
						} 
					},
					error: function(req){
						console.log(req.responseText);
						alert("파일 저장에러"); 
					}
				});
				
				fileForm.submit(); 
			} else {
				addAjax();
			}
		}				
	});
	
	function addAjax(){
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "educenterAddAjax",
			dataType : "json", 
			data : params, 
			success : function(res) {
				if(res.res == "SUCCESS") {
					$("#actionForm").attr("action", "educenterList");
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
		<div class="contents_header_txt">교육장 등록</div>
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
			<input type="hidden" name="edu_center_no" id="edu_center_no" value="${edu_center_no}" />
			<input type="hidden" name="page" id="page" value="${param.page}" />
			<input type="hidden" name="photo_addr" id="photo_addr" value="${edu.photo_addr}" />
		<div class="underbox">
				<div class="underline">
					<div class="line1">교육장명</div>
					<div class="con1">
						<input type ="text" name= "edu_center_nm" id="edu_center_nm" />
					</div>
					<div class="line1">주소</div>
					<div class="con1">
						<input type ="text" name= "addr" id="addr" />
					</div>
				</div>
				<div class="underline">
					<div class="line1">연락처</div>
					<div class="con1">
						<input type ="text" name= "phone_num" id="phone_num" />
					</div>
					<div class="line1">수용가능인원</div>
					<div class="con1">
						<input type ="text" name= "acpt_psbl_pers" id="acpt_psbl_pers" />
				</div>
		</div>
		<div class="detail_btn_area">
				<input type="button" value="저장" id="addBtn" />
				<input type="button" value="취소" id="listBtn"/>
			</div>
	</div>
	</form>
	<form id="fileForm" name="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
				첨부파일 <input type="file" name="attFile" /> 
				</form>
	</div>
</body>
</html>
