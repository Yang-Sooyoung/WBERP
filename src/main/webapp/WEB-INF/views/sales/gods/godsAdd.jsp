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
</style>

<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
	$(document).ready(function() {
		
			
			$("#cancelBtn").on("click", function() {
						makeBtn2Popup(1, "등록 중 취소", "등록 중인 내용을 취소하고 돌아가시겠습니까?", true, 400, 200,
								null, "네", function() {
							history.back();
								}, "아니오", function() {
									closePopup(1);
								});
					});
	
		
	
		
		// 등록시 * 달린 필수입력 필드만 작성
		$("#addBtn").on("click",function(){
			if($.trim($("#gods_nm").val())==""){
				alert("상품명은 필수입력사항입니다.");
				$("#gods_nm").focus();
			}else if($.trim($("#loan_kind_searchGbn").val())=="선택"){
				alert("대출종류는 필수선택사항입니다.");
				$("#loan_kind_searchGbn").focus();
			}else if($.trim($("#sumr").val())==""){
				alert("개요는 필수입력사항입니다.");
				$("#sumr").focus();
			}else if($.trim($("#loan_pers").val())==""){
				alert("대출대상은 필수입력사항입니다.");
				$("#loan_pers").focus();
			}else if($.trim($("#loan_limt").val())==""){
				alert("대출한도금액은 필수입력사항입니다.");
				$("#loan_limt").focus();
			}else if($.trim($("#loan_perd_searchGbn").val())=="선택"){
				alert("대출기간은 필수선택사항입니다.");
				$("#loan_perd_searchGbn").focus();
			}else if($.trim($("#intr_type_searchGbn").val())=="선택"){
				alert("금리유형은 필수선택사항입니다.");
				$("#intr_type_searchGbn").focus();
			}else if($.trim($("#repm_meth_searchGbn").val())=="선택"){
				alert("상환방법은 필수선택사항입니다.");
				$("#repm_meth_searchGbn").focus();
			}else if($.trim($("#colt_searchGbn").val())=="선택"){
				alert("담보는 필수선택사항입니다.");
				$("#colt_searchGbn").focus();
			}else{
				// 선 파일 업로드, 후 글저장
				var fileForm = $("#fileForm");
			
			fileForm.ajaxForm({ 
				success: function(res){ 
					if(res.result =="SUCCESS"){ 
						if(res.fileName.length > 0){ // 올린 파일이 1개라도 있는 경우
							$("#photo_addr").val(res.fileName[0]); // 올린파일명 추가
						}
				var params=$("#actionForm").serialize();
				$.ajax({
					type : "post",
					url : "godsAddAjax",
					dataType : "json", // {키:값, 키:값}
					data : params, //보낼데이터
					success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
						if(res.res=="SUCCESS"){
							  $("#actionForm").attr("action", "godsCheck");
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
			} else {
				alert("파일저장실패");
			} 
		}, 
		error: function(req){
			console.log(req.responseText);
			alert("파일저장 에러"); 
		}
			
		});
			
		fileForm.submit(); // fileForm 실행 
			
			}
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
		<div class="contents_header_txt">상품 등록</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="sEmpNo" value="${sEmpNo}"/> 
			<input type="hidden" name="photo_addr" id="photo_addr" /> <!-- 첨부파일 -->
			<!-- 등록사원번호 로그인 정보에서 가져오기   -->
			
			<div class="underbox">
				<div class="underline">
					<div class="line1">상품명 *</div>
					<div class="con3">
						<input type="text" class="con3_in" placeholder="내용을 입력해주세요 " name="gods_nm" id="gods_nm">
					</div>
				</div>
				<div class="underline">
					<div class="line1">대출종류 *</div>
					<div class="con3">
						<select class="con1_in" name="loan_kind_searchGbn" id="loan_kind_searchGbn" >
							<option>선택</option>
							<option value="0">기업운전</option>
							<option value="1">기업시설</option>
							<option value="2">기업정책</option>
						</select>
					</div>
				</div>
				<div class="underline">
					<div class="line1">개요 *</div>
					<div class="con3">
						<textarea rows="4" class="con3_in" cols="70" placeholder="내용을 입력해주세요 " name="sumr" id="sumr"></textarea>
					</div>
				</div>
				<div class="underline">
					<div class="line1">특징</div>
					<div class="con3">
						<input type="text" class="con3_in" name="dist" id="dist" value= "">
					</div>
				</div>
				<div class="underline">
					<div class="line1">대출대상*</div>
					<div class="con3">
						<input type="text" class="con3_in" placeholder="내용을 입력해주세요 " name="loan_pers" id="loan_pers">
					</div>
				</div>
				<div class="underline">
					<div class="line1">대출한도금액*</div>
					<div class="con3">
						<input type="text" class="con3_in" placeholder="내용을 입력해주세요 " name="loan_limt" id="loan_limt">
					</div>
				</div>
				<div class="underline">
					<div class="line1">대출기간*</div>
					<div class="con3">
						<select class="con1_in" name="loan_perd_searchGbn" id="loan_perd_searchGbn" >
							<option>선택</option>
							<option value="0">6개월 이내</option>
							<option value="1">1년 이내</option>
							<option value="2">2년 이내</option>
							<option value="3">3년 이내</option>
							<option value="4">3년 이상</option>
						</select>
					</div>
				</div>
				<div class="underline">
					<div class="line1">금리*</div>
					<div class="con3">
						<input type="text" class="con1_in" placeholder="숫자만 입력가능합니다." name="intr" id="intr">
					</div>
				</div>
				<div class="underline">
					<div class="line1">금리유형*</div>
					<div class="con3">
						<select class="con1_in" name="intr_type_searchGbn" id="intr_type_searchGbn" >
							<option>선택</option>
							<option value="0">고정금리</option>
							<option value="1">변동금리</option>
							<option value="2">혼합금리</option>
					</select>
					</div>
				</div>
				<div class="underline">
					<div class="line1">상환방법*</div>
					<div class="con3">
						<select class="con1_in" name="repm_meth_searchGbn" id="repm_meth_searchGbn" >
							<option>선택</option>
							<option value="0">만기일시상환</option>
						<option value="1">원리금균등분할상환</option>
						<option value="2">원금균등분할상환</option>
					</select>
					</div>
				</div>
				<div class="underline">
					<div class="line1">담보*</div>
					<div class="con3">
						<select class="con1_in" name="colt_searchGbn" id="colt_searchGbn" >
							<option>선택</option>
							<option value="0">신용</option>
							<option value="1">보증</option>
							<option value="2">부동산담보</option>
							<option value="3">예적금담보</option>
							<option value="4">기타</option>
							<option value="5">해당없음</option>
						</select>
					</div>
				</div>
			<div class="underline">
					<div class="line1">유의사항</div>
					<div class="con3">
						<textarea rows="8" cols="70" name="note"></textarea>
					</div>
				</div>
				<div class="underline">
					<div class="line1">비고</div>
					<div class="con3">
						<textarea rows="5" cols="70" name="remk"></textarea>
					</div>
				</div> 
			</div>
		</form>
		<form id="fileForm" name="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
		첨부파일<input type="file" name="attFile" />
		</form>
			<div class="detail_btn_area">
				<input type="button" value="등록" id="addBtn" />
				<input type="button" value="취소" id="cancelBtn" />
			</div>
	</div>
		
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>
