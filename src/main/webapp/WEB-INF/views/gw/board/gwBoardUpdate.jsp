<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 전사게시판 등록</title>
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

.file_button {
	margin-top: 10px;
}

.file_input {
	display: inline-block;
	vertical-align: top;
	width: 150px;
	height: 25px;
	border: 1px solid #7f7f7f;
	border-radius: 2px;
	margin-top: 5px;
}

.date_from {
	display: inline-block;
	vertical-align: top;
	width: 50px;
	font-size: 15px;
	text-align: center;
	margin: 10px 50px 0 0;
}

.fileCon {
	width: 600px;
	font-size: 10pt;
	min-height: 43px;
	line-height: 43px;
	display: inline-block;
	padding: 0px 5px;
}

.fileLine {
	width: 60.2%;
	min-height: 43px;
	border-bottom: 1px solid #9aa9bd;
	display: inline-table;
	margin-top: -9px;
}

.detail_btn_area input[type='button'] {
	min-width: 80px;
	height: 32px;
	background-color: #f7f7f7;
	font-size: 10pt;
	border-radius: 3px;
	margin: 10px 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
	cursor: pointer;
}
</style>
<!-- 추가스크립트 작업 -->
<script type="text/javascript"
	src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
	src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	CKEDITOR.replace("BOARD_CONT", {
		resize_enabled : false, 
		language : "ko",
		enterMode : "2" 
	});
	
	
	if("${filedata.BOARD_FILE}" != "") {
		$("#docmatchfilenm").hide();
	}
	
	$("#fileDelBtn").on("click", function(){
		console.log("res");
		fileDel();
		$("#docmatchfilenm").val("");
		$("#file_box").remove();
		$("#docmatchfilenm").show();
	});
	
	//취소 버튼
	$(".detail_btn_area").on("click", "#cancelBtn", function() {
		history.back();
	});
	
	
	// 수정버튼 누를때
	$(".detail_btn_area").on("click","#updateBtn", function(){
		$("#BOARD_CONT").val(CKEDITOR.instances['BOARD_CONT'].getData());
		
		if($.trim($("#BOARD_TITLE").val()) == "") {
			alert("제목을 입력해 주세요.");
			$("#BOARD_TITLE").focus();
		} else if($.trim($("#BOARD_CONT").val()) == "") {
			alert("내용을 입력해주세요.");
			$("#BOARD_CONT").focus();
		} else {
			var fileForm = $("#fileForm");
			
			fileForm.ajaxForm({
				success : function(res) {
					if(res.result == "SUCCESS") {
						console.log(res);
						if(res.fileName.length > 0) { //파일이 1개라도 있을때
							
							$("#docmatchfilenm").val(res.fileName[0]); //올린 파일명을 화면구현
						}
						
						var params = $("#actionForm").serialize();
						
						$.ajax({
							type : "post",
							url : "gwFileAddAjax",
							dataType : "json", 
							data : params, 
							success : function(res) {
								
								if(res.res == "SUCCESS") {
									$("#actionForm").attr("action", "gwBoardDetail");
									$("#actionForm").submit();
								} else {
								}
							},
							error : function(req, status, error) {
								console.log("code : " + req.status);
								console.log("message : " + req.responseText);
							}
						});
					} else{
						alert("파일 저장 실패");
					}
				},
				error: function(req) {
					console.log(req.responseText);
					alert("파일 저장 에러");
				}
			});
			updateList();
			fileForm.submit(); //form 실행
			}
	});
	
	$("#actionForm").on("keypress", "input", function(e) {
		if(e.keyCode == 13) {
			return false;
		}
	});
});

//파일 삭제를 누르고 파일 첨부 div 생성 함수
function filedraw(){
	var html = "";
	
	html += "<div id=\"file_box\">";	    			
	html += "<input type=\"file\" name=\"docmatchfilenm\" id=\"docmatchfilenm\"/>";
	html +=	"</div>";
	
	$(".fileCon").html(html);
}
//파일 삭제  ajax
function fileDel() {
	var params = $("#fileForm").serialize();
	$.ajax({
		type : "post",
		url : "fileDeleteAjax",
		dataType : "json", 
		data : params, 
		success : function(res) {
			if(res.res == "SUCCESS") {
				filedraw();
			}
		},
		
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}

//수정 ajax
function updateList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "gwBoardUpdateAjax",
		dataType : "json", 
		data : params, 
		success : function(res) {
			if(res.res == "SUCCESS") {
				$("#actionForm").attr("action", "gwBoardDetail");
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
		<div class="contents_header_txt">전사 게시판 수정</div>
	</div>

	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" /> 
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" id="EMP_NO" name="EMP_NO" value="${sEmpNo}" />
			<input type="hidden" name="BOARD_NO" id="BOARD_NO" value="${data.BOARD_NO}"/> 
			<input type="hidden" name="updateFile" id="updateFile" /> 
			<input type="hidden" name="docmatchfilenm" id="docmatchfilenm" />
			
			<div class="underbox">
				<div class="underline">
					<div class="line1">제목 *</div>
					<div class="con3">
						<input type="text" class="title" name="BOARD_TITLE" id="BOARD_TITLE" value="${data.BOARD_TITLE}"/>
					</div>
				</div>

				<div class="underline">
					<div class="line1">내용 *</div>
					<div class="con3">
						<textarea name="BOARD_CONT" id="BOARD_CONT">${data.BOARD_CONT}</textarea>
					</div>
				</div>
			</div>

		</form>

		<form id="fileForm" name="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
			<input type="hidden" name="BOARD_NO" id="BOARD_NO" value="${data.BOARD_NO}" />
			
			<div class="fileLine">
				<div class="line1">첨부파일</div>
				<div class="fileCon">
				<c:choose>
					<c:when test="${filedata.IMG_DEL_WHETE eq 0}">
	        			<div id="file_box">
							${filedata.BOARD_FILE}<input type="button" value="첨부파일 삭제" id="fileDelBtn" />
						</div>
	    			</c:when>
	    			<c:otherwise>
	    				<div id="file_box">	    			
				        	<input type="file" name="docmatchfilenm" id="docmatchfilenm"/>
	    				</div>
	    			</c:otherwise>	
	    		</c:choose>
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