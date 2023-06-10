<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 교육 상세보기</title>
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
.popup_contents1,.popup_contents2,.popup_contents3 {
	display: inline-block;
	margin: 0px 5px 0px 15px;
	padding: 10px;
	overflow-y: auto;
	font-size: 10pt;
}
.pl_popup {
	max-width: calc(100% - 12px);
	width: 330px;
	height: 28px;
	font-size: 10pt;
	border-radius: 3px;
	margin: 0px 3px 0px 0px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
}

/* 개별 css는 여기에 */
.page_nation1,.page_nation2,.page_nation3 {
	display: inline-block;
}

.page_nation1 .none {
	display: none;
}
.page_nation2 .none {
	display: none;
}
.page_nation3 .none {
	display: none;
}
.page_nation1 div,.page_nation2 div,.page_nation3 div{
	display: inline-block;
	vertical-align: top;
	margin: 0 3px;
	float: left;
	border: 1px solid #c2c2c2;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #f7f7f7;
	font-size: 10pt;
	border-radius: 3px;
	cursor: pointer;
}

.page_nation1 .arrow {
	border: 1px solid #c2c2c2;
}
.page_nation2 .arrow {
	border: 1px solid #c2c2c2;
}
.page_nation3 .arrow {
	border: 1px solid #c2c2c2;
}
.page_nation1 .prev {
	background: #f8f8f8 url('resources/images/common/left.png') no-repeat center center;
}
.page_nation2 .prev {
	background: #f8f8f8 url('resources/images/common/left.png') no-repeat center center;
}
.page_nation3 .prev {
	background: #f8f8f8 url('resources/images/common/left.png') no-repeat center center;
}
.page_nation1 .next {
	background: #f8f8f8 url('resources/images/common/right.png') no-repeat center center;
}
.page_nation2 .next {
	background: #f8f8f8 url('resources/images/common/right.png') no-repeat center center;
}
.page_nation3 .next {
	background: #f8f8f8 url('resources/images/common/right.png') no-repeat center center;
}
.page_nation1 div:hover, .page_nation1 .page_on	{
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}
.page_nation2 div:hover, .page_nation2 .page_on	{
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}
.page_nation3 div:hover, .page_nation3 .page_on	{
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}

.edu_aply,.edu_pers,.default_board3{
	width: 570px;
}

.edu_aply table,.edu_pers table,.default_board3 table  {
	border-collapse: collapse;
	text-align: center;
	border-color: #c2c2c2;
	margin-top: 10px;
	border-top: 2px solid #7f7f7f;
	border-bottom: 2px solid #7f7f7f;
	font-size: 10pt;
}

.edu_aply table th,.edu_pers table th,.default_board3 table th {
	color: #3c3c3d;
	font-size: 11pt;
}

.edu_aply table tbody tr,.edu_pers table tbody tr,.default_board3 table tbody tr {
	height: 40px;
	border-top: 1px solid #c2c2c2;
	cursor: pointer;
}

.edu_aply table tbody tr:hover ,.edu_pers table tbody tr:hover,.default_board3 table tbody tr:hover {
	background-color: #022859;
	color: #fff;
}

.edu_aply .top .edu_pers{
	height: 45px;
	padding: 10px 0px;
	color: #292d33;
	background-color: #E4EAF2;
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<script type="text/javascript">
$(document).ready(function(){
	$("#listBtn").on("click", function(){
		$("#actionForm").attr("action","eduList");
		$("#actionForm").submit();
	});
	
	$("#updateBtn").on("click", function(){
		$("#actionForm").attr("action","eduUpdate");
		$("#actionForm").submit();
	});
	
	//교육신청 버튼
	$("#aplyBtn").on("click", function() {
		$("#actionForm").attr("action","eduaply");
		$("#actionForm").submit();
	}); 
	
	$("#deleteBtn").on("click", function(){
		if(confirm("삭제하시겠습니까?")) {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "eduDeleteAjax",
				dataType : "json",
				data : params,
				success : function(res) {
					if(res.res == "SUCCESS") {
						$("#actionForm").attr("action", "eduList");
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
		<div class="contents_header_txt">교육 상세보기</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<!-- -->
			<input type="hidden" name="edu_no" id="edu_no" value="${edu.EDU_NO}" />
			<input type="hidden" name="emp_no" id="emp_no" value="${edu.EMP_NO}"/>
			<input type="hidden" name="emp_no" id="emp_no" value="${param.EMP_NO}"/>
			<input type="hidden" name="sign_pers" id="sign_pers" value="${edu.SIGN_PERS}"/>
			<input type="hidden" name="page" id="page" value="${param.page}" />
			<div class="underbox">
				<div class="underline">
					<div class="line1">교육명</div>
					<div class="con1">
						${edu.EDU_NM}<br/>
					</div>
					<div class="line1">교육분야</div>
					<div class="con1">
						${edu.EDU_FILD}<br/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">교육자</div>
					<div class="con1">
						${edu.NM}<br/>
					</div>
					<div class="line1">교육시간</div>
					<div class="con1">
						${edu.EDU_TIME}</div>
				</div>
					<div class="underline">
					<div class="line1">교육날짜</div>
					<div class="con1">
						${edu.EDU_DATE}</div>
					<div class="line1">교육장</div>
					<div class="con1">
						${edu.EDU_CENTER_NM}</div>
				</div>
				<div class="underline">
					<div class="line1">교육인원</div>
					<div class="con1">${edu.SIGN_PERS}</div>
				
					<div class="line1">등록자</div>
					<div class="con1">${edu.EMP_NM}</div>
					</div>
		</div>
		</form> 
		<input type ="button" value ="신청" id="aplyBtn"/>
		<c:if test="${sEmpNo eq edu.EMP_NO}">
			<input type ="button" value ="수정" id="updateBtn"/>
			<input type ="button" value ="삭제" id="deleteBtn"/>
		</c:if>
			<input type ="button" value ="목록" id="listBtn"/>
		</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>