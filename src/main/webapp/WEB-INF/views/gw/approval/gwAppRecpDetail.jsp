<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 수신함</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<style>
.underbox {
	width: 900px;
}

.detail_btn_area {
	width: 900px;
}
.con1 {
	width: 280px;
}
.file_name {
	display: inline-block;
	vertical-align: top;
	width:450px;
	height: 30px;
}
</style>
<script type="text/javascript"
		src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
				
		$(".detail_btn_area").on("click", "#listBtn", function() {
			$("#sampleForm").attr("action", "gwAppRecp");
			$("#sampleForm").submit();
		});
		
		$(".detail_btn_area").on("click", "#appBtn", function() {
			var params = $("#sampleForm").serialize();

			$.ajax({
				type : "post",
				url : "AppSucAjax",  //결재승인Ajax
				dataType : "json", 
				data : params, 
				success : function(res) {
					if (res.res == "SUCCESS") {
						makeBtn1Popup(1, "", "결재가 성공적으로 승인되었습니다.", true, 400, 200,  //결재성공시 팝업창
							null, "확인", function() {
								closePopup(1);
								$("#sampleForm").attr("action", "gwAppRecp");
								$("#sampleForm").submit();
						});
					}
				},
				error : function(req, status, error) {
					console.log("code : " + req.status);
					console.log("message : " + req.responseText);
				}
			});
		});
		
		$(".detail_btn_area").on("click", "#repyBtn", function() {  //결재반려버튼
			var html="";
			html="<textarea name=\"repycont\" id=\"repycont\"></textarea>";
			
			makeBtn2Popup(2, "반려사유", html, true, 630, 580,  //반려사유입력 팝업창
					function() {
						CKEDITOR.replace("repycont", { // rescont라는 객체를 CKEDITOR로 변환하겠다.
							resize_enabled : false, // 크기변환 가능 : 불가능
							language : "ko", // 언어 : 한국어
							enterMode : "2", // 엔터를 줄바꿈으로 사용하겠다
							width : "600",
							height : "300"
						});
					}, "반려", function() {
				
					$("#sampleForm #repycont").val(CKEDITOR.instances['repycont'].getData());
					
					var params = $("#sampleForm").serialize();
					
					$.ajax({
						type : "post",
						url : "AppRepyAjax",  //결재반려Ajax
						dataType : "json",
						data : params,
						success : function(res) {
							if (res.res == "SUCCESS") {
								makeAlert(3, "", "결재가 반려되었습니다", function() {
									$("#sampleForm").attr("action", "gwAppRecp");
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
		<div class="contents_header_txt">상세보기</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="sampleForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" id="page" name="page" value="${param.page}"/>
			<input type="hidden" name="empno" id="empno" value="${sEmpNo}" />
			<input type="hidden" name="aprvno" id="aprvno" value="${param.aprvno}" />
			<input type="hidden" name="repycont" id="repycont" />
		</form>
		<div class="underbox">
				<div class="underline">
					<div class="line1">제목</div>
					<div class="con1">
						${aprv[0].APRV_TITLE}
					</div>
				</div>
				<div class="underline">
					<div class="line1">참조자</div>
					<div class="con1">
						<c:choose>
							<c:when test="${aprv[0].REFNM != null}">
								<c:forEach var="data" items="${aprv}" >
									<c:if test="${aprv != null }">
										${data.REFNM} (${data.REFDP} ${data.REFPS})<br/>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								참조자가 없습니다
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="underline">
					<div class="line1">파일첨부</div>
					<div class="con1">
						<div class="file_name">
							<c:choose>
								<c:when test="${file.APRV_ATCH_FILE_NM != null}">
									<a href="resources/upload/${file.APRV_ATCH_FILE_NM}" download>${file.APRV_ATCH_FILE_NM}</a>
								</c:when>
								<c:otherwise>
									첨부된 파일이 없습니다
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="underline">
					<div class="line1">내용</div>
					<div class="con3">
						${aprv[0].APRV_CONT}
					</div>
				</div>
			</div>
			
			<div class="detail_btn_area">
				<c:choose>
					<c:when test="${stat.REPY > 0 || stat.TOTAL == stat.APP }">
						<input type="button" id="listBtn" value="목록으로" />
					</c:when>
					<c:otherwise>
						<input type="button" id="appBtn" value="승인" />
						<input type="button" id="repyBtn" value="반려" />
						<input type="button" id="listBtn" value="목록으로" />
					</c:otherwise>
				</c:choose>
			</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>