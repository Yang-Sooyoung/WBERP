<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 양식등록</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<style type="text/css">
.underbox {
	width: 900px;
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

		CKEDITOR.replace("modecont", { // modecont라는 객체를 CKEDITOR로 변환하겠다.
			resize_enabled : false, // 크기변환 가능 : 불가능
			language : "ko", // 언어 : 한국어
			enterMode : "2", // 엔터를 줄바꿈으로 사용하겠다
			width : "740",
			height : "300"
		});

		$(".detail_btn_area").on("click", "#addBtn", function() {
			$("#modecont").val(CKEDITOR.instances['modecont'].getData()); //#modecont의값에 modecont객체의 값을 넣겠다
			
			if($.trim($("#modetitle").val())=="" || $.trim($("#modeexpn").val())=="" || $.trim($("#modecont").val())=="") {
				makeBtn1Popup(1, "", "필수내용을 모두 작성해야합니다.", true, 400, 200,
						null, "확인", function() {
							closePopup(1);
							$("#modeexpn").focus();
					});
			} else {
				var params = $("#Form").serialize();

				$.ajax({
					type : "post",
					url : "AppModeAddAjax", //결재양식추가Ajax
					dataType : "json",
					data : params,
					success : function(res) {
						if (res.res == "SUCCESS") {
							makeBtn1Popup(1, "", "양식이 성공적으로 추가되었습니다.", true, 400, 200, //양식추가성공시 팝업창
								null, "확인", function() {
									closePopup(1);
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
			}
		});

		$(".detail_btn_area").on("click", "#cancelBtn", function() {
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
		<div class="contents_header_txt">양식작성</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" id="sampleForm" method="post">
		<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
		</form>
		<form action="#" id="Form" method="post" >
		<input type="hidden" name="empno" id="empno" value="${sEmpNo}" />
		<input type="hidden" name="aprvmodeno" id="aprvmodeno" />
		<div class="underbox">
			<div class="underline">
				<div class="line1">제목</div>
				<div class="con1">
					<input type="text" name="modetitle" id="modetitle" />
				</div>
			</div>
			<div class="underline">
				<div class="line1">양식설명</div>
				<div class="con3">
					<input type="text" name="modeexpn" id="modeexpn" />
				</div>
			</div>
			<div class="underline">
				<div class="line1">내용</div>
				<div class="con3">
				<textarea name="modecont" id="modecont"></textarea>
				</div>
			</div>
		</div>
		</form>
		<div class="detail_btn_area">
			<input type="button" value="추가" id="addBtn" /> <input type="button" value="취소" id="cancelBtn" />
		</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>