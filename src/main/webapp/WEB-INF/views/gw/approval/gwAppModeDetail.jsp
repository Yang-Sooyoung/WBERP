<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 양식보기</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<style type="text/css">
.underbox {
	width: 900px;
	font-size: 12px;
}
.detail_btn_area {
	width: 900px;
}
.con1 {
	width: 280px;
}
</style>
<script type="text/javascript"
		src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$(".detail_btn_area").on("click", "#updateBtn", function() {
			$("#sampleForm").attr("action", "gwAppModeUpdate");
			$("#sampleForm").submit();
		});
		
		$(".detail_btn_area").on("click", "#delBtn", function() {
			makeBtn2Popup(2, "", "정말로 삭제하시겠습니까?", true, 400, 200,
				null, "확인", function() {
				var params = $("#Form").serialize();
				
				$.ajax({
					type : "post",
					url : "AppModeDeleteAjax", //양식삭제Ajax
					dataType : "json",
					data : params,
					success : function(res) {
						if (res.res == "SUCCESS") {
							makeAlert(3, "", "삭제되었습니다.", function() { //삭제성공시 팝업창
								$("#sampleForm").attr("action", "gwAppMode");
								$("#sampleForm").submit();
							});
						}
					},
					error : function(req, status, error) {
						console.log("code : " + req.status);
						console.log("message : " + req.responseText);
					}
				});
				
				}, "취소", function() {
					closePopup(2);
			});
		});
		
		$(".detail_btn_area").on("click", "#listBtn", function() {
			$("#sampleForm").attr("action", "gwAppMode");
			$("#sampleForm").submit();
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
		<div class="contents_header_txt">양식보기</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" id="sampleForm" method="post">
		<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="modeNo" id="modeNo" value="${mode.APRV_MODE_NO}"/>
			<input type="hidden" id="page" name="page" value="${param.page}"/>
		</form>
		<form action="#" id="Form" method="post" >
		<input type="hidden" name="empno" id="empno" value="${sEmpNo}" />
		<input type="hidden" name="modeNo" id="modeNo" value="${mode.APRV_MODE_NO}"/>
		<div class="underbox">
			<div class="underline">
				<div class="line1">제목</div>
				<div class="con1">
					${mode.APRV_MODE_NM}
				</div>
			</div>
			<div class="underline">
				<div class="line1">양식설명</div>
				<div class="con3">
					${mode.APRV_MODE_EXPN}
				</div>
			</div>
			<div class="underline">
				<div class="line1">내용</div>
				<div class="con3">
					${mode.APRV_MODE_MODE}
				</div>
			</div>
		</div>
		</form>
		<div class="detail_btn_area">
			<input type="button" value="수정" id="updateBtn" /><input type="button" value="삭제" id="delBtn" /><input type="button" value="목록" id="listBtn" />
		</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>