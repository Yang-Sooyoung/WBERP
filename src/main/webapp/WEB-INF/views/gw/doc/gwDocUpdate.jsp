<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 문서수정</title>
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
.title {
	width: 600px;
}
</style>
<!-- 추가스크립트 작업 -->
<script type="text/javascript" 
		src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	CKEDITOR.replace("docmcont", {
		resize_enabled : false, 
		language : "ko",
		enterMode : "2" 
	});
	
	if('${doc.DOCM_ATCH_FILE_NM}' != '') {
		$("#docFile").hide();
	}
	
	$("#fileDelBtn").on("click", function() {
		$("#docmatchfilenm").val("");
		$("#fileDiv").remove();
		$("#docFile").show();
	});
	
	$(".detail_btn_area").on("click", "#cancelBtn", function() {
		history.back();
	});
	
	$(".detail_btn_area").on("click", "#updateBtn", function() {
		
		$("#docmcont").val(CKEDITOR.instances['docmcont'].getData());
		
		if($.trim($("#docmnm").val()) == "") {
			alert("제목을 입력해 주세요.");
			$("#docmnm").focus();
		} else if($.trim($("#docmcont").val()) == "") {
			alert("내용을 입력해 주세요.");
			$("#docmcont").focus();
		} else {
			if($("#fileForm").is(":visible") && $("#docFile").val() != '') {
				//선 파일 업로드, 후 글 저장
				var fileForm = $("#fileForm");
				
				fileForm.ajaxForm({
					success: function(res) {
						if(res.result == "SUCCESS") {
							if(res.fileName.length == 0) {
								alert("파일을 추가해주세요.");
							} else if(res.fileName.length > 0) { //올린 파일이 1개라도 있는 경우
								$("#docmatchfilenm").val(res.fileName[0]); //올린 파일명 추가
							}
							update();
						} else {
							alert("파일 저장 실패");
						}
					},
					error: function(req) {
						console.log(req.responseText);
						alert("파일 저장 에러");
					}
				});
				
				fileForm.submit(); //fileForm 실행
			} else {
				update();
			}
		}  
	}); 
	
	$("#actionForm").on("keypress", "input", function(e) {
		if(e.keyCode == 13) {
			return false;
		}
	});
});

function update() {
	var params = $("#fileForm").serialize();
	
	$.ajax({
		type : "post",
		url : "docUpdateAjax",
		dataType : "json", 
		data : params, 
		success : function(res) {
			if(res.res == "SUCCESS") {
				$("#actionForm").attr("action", "gwDocDetail");
				$("#actionForm").submit();
			} else {
				makeAlert(1, "알림", "등록에 실패하였습니다.", null);
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
		<div class="contents_header_txt">문서수정</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="docmno" value="${param.docmno}" />
		</form>
		<form id="fileForm" name="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
			<input type="hidden" name="docmno" value="${param.docmno}" />
			<input type="hidden" name="docmatchfilenm" id="docmatchfilenm" value="${doc.DOCM_ATCH_FILE_NM}" />
		
			<div class="underbox">
				<div class="underline">
					<div class="line1">제목 *</div>
					<div class="con3">
						<input type="text" class="title" name="docmnm" id="docmnm" value="${doc.DOCM_NM}"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">첨부파일 *</div>
					<div class="con3">
						<c:if test="${!empty doc.DOCM_ATCH_FILE_NM}">
							<div id="fileDiv">
								${doc.DOCM_ATCH_FILE_NM}<input type="button" value="첨부파일 삭제" id="fileDelBtn" />
							</div>
							<input type="file" name="docFile" id="docFile" />
						</c:if>
					</div>
				</div>
				<div class="underline">
					<div class="line1">보존시작일</div>
					<div class="con1">
						<input type="date" name="docmpresstart" id="docmpresstart" value="${doc.DOCM_PRES_START}"/>
					</div>
					<div class="line1">보존종료일</div>
					<div class="con1">
						<input type="date" name="docmpresend" id="docmpresend" value="${doc.DOCM_PRES_END}"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">내용 *</div>
					<div class="con3">
						<textarea name="docmcont" id="docmcont" >${doc.DOCM_CONT}</textarea>
					</div>
				</div>
			</div>
		</form>
		<div class="detail_btn_area">
			<input type="button" id="updateBtn" value="수정" />
			<input type="button" id="cancelBtn" value="취소" />
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>
