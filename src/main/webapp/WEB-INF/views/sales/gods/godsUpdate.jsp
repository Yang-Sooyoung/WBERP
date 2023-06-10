<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 상품 등록</title>
<style type="text/css">
.con1_in{
	width : 150px;
}
.con2_in{
	width : 400px;
}
.con3_in{
	width : 500px;
}

.underline textarea {
    max-width: calc(100% - 12px);
  	font: 400 13.3333px Arial;
    border-radius: 3px;
    margin: 0 3px;
    border: 1px solid #c2c2c2;
    padding: 1px 2px;
    outline: none;
}
.updateCon {
	color : red;
}


</style>

<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#listBtn").on("click",function(){
			history.back();
		});
		
	
		
		// 등록시 * 달린 필수입력 필드만 작성
		$("#saveBtn").on("click",function(){
			
				var params=$("#actionForm").serialize();
				$.ajax({
					type : "post",
					url : "godsUpdateAjax",
					dataType : "json", // {키:값, 키:값}
					data : params, //보낼데이터
					success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
						if(res.res=="SUCCESS"){
							  $("#actionForm").attr("action", "godsDetail");
						      $("#actionForm").submit();
						}else{
							$("#alert").attr("title","알림");
							$("#alert p").html("저장에 실패하였습니다.");
							$("#alert").dialog({
								buttons: {
									Ok: function(){
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
			});
			
		$("#actionForm").on("keypress","input",function(e){
			if(e.keyCode==13){
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
	<!-- 화면에 맞추어 제목작성 -->
	<div class="contents_header">
		<div class="contents_header_txt">상품 수정</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="sEmpNo" value="${sEmpNo}" />
			<input type="hidden" id="gods_no" name="gods_no" value="${param.gods_no}" />

			<!-- 등록사원번호 로그인 정보에서 가져오기   -->
			
			<div class="underbox">
				<div class="underline">
					<div class="line1">상품명 *</div>
					<div class="con3">
						<input type="text" class="con3_in" name="gods_nm" id="gods_nm" value="${data.GODS_NM}" readonly >
					</div>
				</div>
				<div class="underline">
					<div class="line1">대출종류 *</div>
					<div class="con3">
						<input type="text" class="con1_in" value="${data.LOAN_KIND}" name="loan_kind_searchGbn" id="loan_kind_searchGbn" readonly>
					</div>
				</div>
				<div class="underline">
					<div class="line1">개요 *</div>
					<div class="con3">
						<textarea rows="4" class="con3_in" cols="70" placeholder=${data.SUMR}  name="sumr" id="sumr" readonly></textarea>
					</div>
				</div>
				<div class="underline">
					<div class="line1 updateCon">특징</div>
					<div class="con3">
						<input type="text" class="con3_in" value = "${data.DIST}" name="dist" id="dist">
					</div>
				</div>
				<div class="underline">
					<div class="line1 updateCon">대출대상*</div>
					<div class="con3">
						<input type="text" class="con3_in" value = "${data.LOAN_PERS}" name="loan_pers" id="loan_pers">
					</div>
				</div>
				<div class="underline">
					<div class="line1">대출한도금액*</div>
					<div class="con3">
						<input type="text" class="con3_in" value="${data.LOAN_LIMT}" name="loan_limt" id="loan_limt" readonly>
					</div>
				</div>
				<div class="underline">
					<div class="line1">대출기간*</div>
					<div class="con3">
						<input type="text" class="con1_in" value="${data.LOAN_PERD}" name="loan_perd_searchGbn" id="loan_perd_searchGbn" readonly>
					</div>
				</div>
				<div class="underline">
					<div class="line1">금리*</div>
					<div class="con3">
						<input type="text" class="con1_in" value="${data.INTR}" name="intr" id="intr" readonly>
					</div>
				</div>
				<div class="underline">
					<div class="line1">금리유형*</div>
					<div class="con3">
						<input type="text" class="con1_in" value="${data.GODS_INTR_TYPE}" name="intr_type_searchGbn" id="intr_type_searchGbn" readonly>
					</div>
				</div>
				<div class="underline">
					<div class="line1">상환방법*</div>
					<div class="con3">
						<input type="text" class="con1_in" value="${data.GODS_REPM_METH}" name="repm_meth_searchGbn" id="repm_meth_searchGbn" readonly>
					</div>
				</div>
				<div class="underline">
					<div class="line1">담보*</div>
					<div class="con3">
						<input type="text" class="con1_in" value="${data.COLT}" name="colt_searchGbn" id="colt_searchGbn" readonly>
					</div>
				</div>
				<div class="underline">
					<div class="line1 updateCon">유의사항</div>
					<div class="con3">
					<textarea rows="8" cols="70" placeholder="${data.NOTE}" name="note" id="note">${data.NOTE}</textarea>
					<input type=hidden value="${data.NOTE}">
					</div>
				</div>
				<div class="underline">
					<div class="line1 updateCon">비고</div>
					<div class="con3">
						<textarea rows="5" cols="70" placeholder="${data.REMK}" name="remk" id="remk">${data.REMK}</textarea>
						<input type=hidden value="${data.REMK}">
					</div>
				</div> 
			</div>
			<div class="detail_btn_area">
				<input type="button" value="저장" id="saveBtn" />
				<input type="button" value="취소" id="listBtn"/>
			</div>
		</form>
		
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>
