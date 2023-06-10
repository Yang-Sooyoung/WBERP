<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - Sample Page</title>
<style type="text/css">
/* 상품상세보기화면 */
/* 개별 css는 여기에 */

#write, #trash, #pamphlet {
	float: right;
	border: 0px solid rgb(190, 190, 190);
	width: 35px;
	height: 35px;
	background-color: #FFF;
	margin: 10px 10px 5px 10px;
	cursor: pointer;
}

.t {
	width: 1200px;
	height: 250px;
	border: 1px solid rgb(199, 199, 199);
	font-size: 11pt;
}

#title {
	margin: 40px 30px 5px 50px;
	font-size: 15pt;
	font-weight: bold;
}

#line {
	margin: 0 50px;
	font-size: 9pt;
	color: rgb(211, 84, 0);
}

#list {
	margin: 50px;
}

.b {
	margin-top: 30px;
	width: 1200px;
	height: 1200px;
	border: 1px solid rgb(199, 199, 199);
	font-size: 11pt;
}

#t_list {
	margin: 40px 30px;
	line-height: 200%;
}

#b_list {
	width: 1000px;
	margin-top: 40px;
	margin-left: 40px;
	line-height: 200%;
	font-size: 13pt;
	font-weight: bold;
}

#b_list span {
	font-size: 11pt;
	font-weight: 100;
	margin-left: 10px;
	color: rgb(19, 19, 19);
}

#b_list span #col {
	color: rgb(211, 84, 0);
	font-weight: bold;
}
.btnF {
	margin-left: 970px;
}
#deleteBtn {
	margin-left: 1100px;
}
.updateBtnBox, .deleteBtnBox, .listBtnBox {
    display: inline-block;
    margin: 10px;
    padding: 10px;
    width: 100px;
    float: none;
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
$(document).ready(function() {
			reloadList();
			console.log("${param.page}");
	
			$("#updateBtn").on("click", function() {
				$("#actionForm").attr("action", "godsUpdate");
				$("#actionForm").submit();
			});
			
			$("#listBtn").on("click", function() {
				$("#actionForm").attr("action", "godsCheck");
				$("#actionForm").submit();
			});
			
			$("#deleteBtn").on("click", function() {
				if(confirm("삭제하시겠습니까?")) {
			var params = $("#actionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "godsDeleteAjax",
						dataType : "json", // {키:값, 키:값}
						data : params, // 보낼데이터
						success : function(res) { // 성공 시 해당 함수 실행, 결과는 result로 받겠다.
							if(res.res == "SUCCESS") {
								 $("#actionForm").attr("action", "godsCheck");
							     $("#actionForm").submit();
							} else {
								$("#alert").attr("title", "알림");
								$("#alert p").html("삭제에 실패하였습니다.");
								$("#alert").dialog({
									buttons: {
										Ok: function() {
											$(this).dialog("close");
										}
									}
								});
							}
						},
						error : function(req, status, error) { // 결과, 상태값, 에러
							console.log("code : " + req.status);
							console.log("message : " + req.responseText);
						}
					});
				}
			});
});
			
	function reloadList(){
		var params = $("#actionForm").serialize(); 
		
		$.ajax({ 
			type : "post", 
			url : "godsDetailAjax",
			dataType : "json",
			data : params,
			success : function(res){		
				drawList(res.data);
			}, 
			error : function(req, status, error){ 
				console.log("code : " + req.status); 
				console.log("message : " + req.responseText);
			}
		});
	}
	
	function drawList(data){ 
		var html = "";
		
				html +=	"<div class=\"t\">";
				html += "<p id=\"title\">" + data.GODS_NM + "</p>";
				html += "<p id=\"line\">" + data.SUMR + "</p>";
				
				html += "<ul id=\"t_list\">";
				html += "	<li>대출종류 : " + data.LOAN_KIND + "</li>";
				html += "	<li>대출기간 : " + data.LOAN_PERD + "</li>";
				html += "	<li>대출한도 : " + data.LOAN_LIMT + " </li>";
				html += "</ul>";
				html += "</div>";
				html += "<div class=\"b\">";
				html += "<ul id=\"b_list\">";
				html += "	<li>상품명<br/> <span>" + data.GODS_NM + "</span>	</li>";
				html += "	<li>출시일자<br/> <span>" + data.GOD_START_DAY + "</span>	</li>";
				html += "	<li>대출종류 <br/> <span>" + data.LOAN_KIND + "</span> </li> ";
				html += "	<li>개요  <br/> <span>" + data.SUMR + "</span></li>";
				html += "	<li>특징  <br/><span>" + data.DIST + "</span></li>	";
				html += "	<li>대출대상  <br/> <span> " + data.LOAN_PERS + "  </span></li>";
				html += "	<li>대출한도금액   <br/> <span>" + data.LOAN_LIMT + " </span></li>";
				html += "	<li>대출기간  <br/> <span>" + data.LOAN_PERD + " </span></li>";
				html += "	<li>금리 <br/> <span> <span id=\"col\">" + data.INTR+ "</span></li>";
				html += "	<li>금리유형 <br/> <span> <span id=\"col\">" + data.GODS_INTR_TYPE + "</span></li>";	
				html += "	<li>상환방법 <br/> <span>" + data.GODS_REPM_METH + "</span> </li>";
				html += "	<li>담보유형 <br/> <span>" + data.COLT + "</span> </li>";
				if (data.NOTE != null){
					html += "<li>유의사항 <br/> <span> " + data.NOTE + " </span> </li>";
				} else {                                                                                    
					html += "<li>유의사항 <br/> <span> 공란  </span> </li>";
				}                                                                                           
				if (data.REMK != null){
					html += "<li>비고 <br/> <span> " + data.REMK + " </span> </li>";
				} else {                                                                                    
					html += "<li>비고 <br/> <span> 공란  </span> </li>";
				}                                                                                           
				if (data.PHOTO_ADDR != "") {
					html += "<li>첨부파일<br/><span><a href=\"resources/upload/${data.PHOTO_ADDR}\" download>" + data.PHOTO_ADDR + "</a></span></li>";
				}
		
		$(".default_board").html(html);
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
		<div class="contents_header_txt">상세보기</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
					<input type="hidden" name="page" id="page" value="${param.page}"/>
			<input type="hidden" name="gods_no" id="gods_no" value="${param.gods_no}" />
			
			<!-- 전페이지에서 누른 해당 번호를 받아온다 --> 
			<!-- 팜플렛/ 개요 옆 사진/ 수정 / 삭제 -->
		</form>

			<!-- 상세보기 화면 그려주기  -->
			<div class = "btnF">
				<input type ="button" value="수정" class= "updateBtnBox" id ="updateBtn">
				<input type ="button" value="목록으로" class= "listBtnBox" id ="listBtn">
			</div>
			<div class="default_board">
			
			</div>
				<input type ="button" value="삭제" class= "deleteBtnBox" id ="deleteBtn">
			</div>
	<c:import url="/bottom"></c:import>
</body>
</html>