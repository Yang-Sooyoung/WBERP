<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - Sample Page</title>
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
<script type="text/javascript">
	$(document).ready(function() {
		
		$(".detail_btn_area").on("click", "#listBtn", function() {
			$("#sampleForm").attr("action", "gwAppSend");
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
		</form>
		<div class="underbox">
				<div class="underline">
					<div class="line1">제목</div>
					<div class="con1">
						${aprv[0].APRV_TITLE}
					</div>
				</div>
				<div class="underline">
					<div class="line1">기안자</div>
					<div class="con1">
						${aprv[0].SUBNM} (${aprv[0].SUBDP} ${aprv[0].SUBPS})
					</div>
					<div class="line1">참조자</div>
					<div class="con1">
						<c:choose>
							<c:when test="${aprv[0].EMP_NM != null}">
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

			<c:choose>
				<c:when test="${stat.REPY > 0}">
					<div class="underline">
						<div class="line1">반려사유</div>
						<div class="con3">
							<c:forEach var="resn" items="${resn}">
									${resn.APRV_ATHR_RESN} - ${resn.EMP_NM}(${resn.DEPT_NM} ${resn.POSN_NM})
							</c:forEach>
						</div>
					</div>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</div>
			
			<div class="detail_btn_area">
				<input type="button" id="listBtn" value="목록으로" />
			</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>