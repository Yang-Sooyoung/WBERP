<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 교육장 상세보기</title>
<style type="text/css">

.default_board {
	width: 840px;
}
.underbox {
	width: 700px;
}

/* 버튼영역 가로변경 시 */
.detail_btn_area {
	width: 800px;
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<script type="text/javascript">
$(document).ready(function(){
	$("#listBtn").on("click", function(){
		$("#actionForm").attr("action","educenterList");
		$("#actionForm").submit();
	});
	
	$("#updateBtn").on("click", function(){
		$("#actionForm").attr("action","educenterUpdate");
		$("#actionForm").submit();
	});
	
	$("#deleteBtn").on("click", function(){
		if(confirm("삭제하시겠습니까?")) {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "educenterDeleteAjax",
				dataType : "json",
				data : params,
				success : function(res) {
					if(res.res == "SUCCESS") {
						$("#actionForm").attr("action", "educenterList");
						$("#actionForm").submit();
					} else if(res.res == "FAILED") {
						alert("삭제실패");
						history.back();
					} else {
						alert("이미 선택된 강의장이여서 삭제가 불가능합니다.");
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
		<div class="contents_header_txt">교육장 상세보기</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<!-- -->
			<input type="hidden" name="edu_center_no" id="edu_center_no" value="${param.edu_center_no}" />
			<input type="hidden" name="page" id="page" value="${param.page}" />
		</form> 
			<div class="underbox">
				<div class="underline">
					<div class="line1">교육장명</div>
					<div class="con1">
						${edu.EDU_CENTER_NM}<br/>
					</div>
					<div class="line1">주소</div>
					<div class="con1">
						${edu.ADDR}<br/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">연락처</div>
					<div class="con1">
						${edu.PHONE_NUM}<br/>
					</div>
					<div class="line1">수용가능인원</div>
					<div class="con1">
						${edu.ACPT_PSBL_PERS}</div>
				</div>
				<div class="underline">
					<div class="line1">사진</div>
					<div class="con1">
						<img alt="" width ="300px" src="resources/upload/${edu.PHOTO_ADDR}">
					</div>
		</div>
			<input type ="button" value ="수정" id="updateBtn"/>
			<input type ="button" value ="삭제" id="deleteBtn"/>
			<input type ="button" value ="목록" id="listBtn"/>
		</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>