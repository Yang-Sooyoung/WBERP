<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>일정 수정</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript" 
		src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>
<style type="text/css">
/* 개별 css는 여기에 */
/* 기간 검색 */
.Schedule_box{
    width: 850px;
    height: 560px;
    margin-top: 10px;
    margin-left: 100px;
    border-top: 1px solid;

}
.work_selbox {
     display: inline-block;
    vertical-align: top;
    width: 100%;
    height: 40px;
    font-size: 14px;
    margin-top: 4px;
    border-bottom: 1px solid;
}
.file_txt{
	display: inline-block;
}
.work_selbox1{
	display: inline-block;
    vertical-align: top;
    width: 100%;
    height: 180px;
    font-size: 14px;
    margin-top: 4px;
    border-bottom: 1px solid;
}
.sel_box0{
    display: inline-block;
    vertical-align: top;
    width: 330px;
    height: 39px;
   border:0px;
    margin-left: -6px;
}
.sel_box1{
    display: inline-block;
    vertical-align: top;
    width: 330px;
    height: 39px;
   border:0px;
    margin-left: -6px;
}
.sel_box2{
    display: inline-block;
    vertical-align: top;
    width: 200px;
    height: 39px;
   border:0px;
    margin-left: -6px;

}
.start_day{
    width: 128px;
    height: 33px;
    margin-left: -1px;

}
.end_day{
    width: 128px;
    height: 33px;
    margin-left: -1px;
}
.sche_name{
    width: 400px;
    height: 33px;
    margin-left: 5px;

}
.sche_empno{
    width: 200px;
    height: 33px;
    margin-left: 5px;
}
.sche_place{
    width: 300px;
    height: 33px;
    margin-left: -1px;
}
.sche_empno1{
    width: 200px;
    height: 33px;
    margin-left: -2px;
}
.sche_email{
    width: 200px;
    height: 33px;
    margin-left: 5px;
}

.sche_phone{
    width: 200px;
    height: 33px;
    margin-left: -2px;
}
.work_sel {
    width: 120px;
    height: 39px;
    line-height: 32px;
    font-size: 16px;
    text-align: center;
    border: 1px solid;
    margin-left: 0px;
    display: inline-block;
    vertical-align: top;
    background-color: #e4eaf2;
	border:0px; 
}
.work_sel1{
    width: 120px;
    height: 39px;
    line-height: 32px;
    font-size: 16px;
    text-align: center;
    border: 0px solid;
    margin-left: 40px;
    display: inline-block;
    vertical-align: top;
    background-color: #e4eaf2;
	border:0px; 
}
.work_sel2{
    width: 120px;
    height: 39px;
    line-height: 32px;
    font-size: 16px;
    text-align: center;
    border: 0px solid;
    margin-left: 90px;
    display: inline-block;
    vertical-align: top;
    background-color: #e4eaf2;
	border:0px;
}
.work_sel3{
    width: 120px;
    height: 177px;
    line-height: 177px;
    font-size: 16px;
    text-align: center;
    border: 0px solid;
    display: inline-block;
    vertical-align: top;
    background-color: #e4eaf2;
    border: 0px;
}
.underbox {
	width: 800px;
}

.time_txt1 , .time_txt2 , .time_txt3 , .time_txt4{
	width: 45px;
	height: 30px;

}
.gwscheworktype{
font-size:10px;
}
#updateBtn{
	width: 130px;
	height: 40px;
	display: inline-block;
	vertical-align: top;
	margin-top: 3px;
	margin-left: 334px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
	cursor: pointer;
	background-color: #f7f7f7;
	font-size: 12pt;
	border-radius: 3px;
}
#cancelBtn{
	width: 130px;
	height: 40px;
	display: inline-block;
	vertical-align: top;
	margin-top: 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
	cursor: pointer;
	background-color: #f7f7f7;
	font-size: 12pt;
	border-radius: 3px;
}
.em{
	display: inline-block;
 	vertical-align: top;
    font-size: 10pt;
    color: red;
    margin: 0px 0px 0px 720px;

}
</style>
<script type="text/javascript">
$(document).ready(function(){
	console.log($("#gwshceno").val());
	console.log($("#docmatchfilenm").val());
	if('${data.SCHE_ATCH_FILE_NM}' != ''){
		$("#work_selbox1").hide();
	}
	
	$("#cancelBtn").on("click",function(){
		$("#actionForm").attr("action", "gwSchDetail");
		$("#actionForm").submit();
	});
	
	$("#fileDelBtn").on("click",function(){
		$("#docmatchfilenm").val("");
		$("#work_selbox0").remove();
		$("#work_selbox1").show();
	});
	
	$(".contents").on("click","#updateBtn",function(){
		
	if($.trim($(".gwscheworktype").val())==""){
			alert("내,외근을 선택해주세요");
			$(".gwscheworktype").focus();
		}else if($.trim($("#gwschenm").val())==""){
			alert("일정명을 입력해주세요");
			$("#gwschenm").focus();
		}else if($.trim($("#gwschestartday").val())==""){
			alert("시작 일을 선택해주세요");
			$("#gwschestartday").focus();
		}else if($.trim($("#gwscheendday").val())==""){
			alert("종료 일을 선택해주세요");
			
			$("#gwscheendday").focus();
		}else if($.trim($("#time_txt1").val())==""){
			alert("시 입력행");
			$('#time_txt1').focus();
		}else if($.trim($("#time_txt3").val())==""){
			alert("시 입력행");
			$('#time_txt3').focus();
		}else{
			if($("#fileForm").is(":visible") && $("#attFile").val() != ''){
				//선 파일 업로드, 후 글저장
				var fileForm = $("#fileForm");
				
				fileForm.ajaxForm({ //fileForm을 ajaxForm으로 변환하겠다 =이 폼을 실행하면 Ajax로 구동하겠다.(설정)
				success: function(res){
					if(res.result =="SUCCESS"){
						if(res.fileName.length > 0){//올린 파일이 1개라도 있는 경우
							$("#docmatchfilenm").val(res.fileName[0]); // 올린 파일명 추가
						}	
						gwScheUpateList();						
					} else {
						alert("파일저장실패");
					} 
				}, //ajax error
				error: function(req){
					console.log(req.responseText);
					alert("파일저장 에러"); 
				}
			});
			
				fileForm.submit();//fileForm 실행, 이 시점에서 Ajax로 구동됨.(실행)
			}else{
				gwScheUpateList();
			}
			
			
		}
				
});
});

function gwScheUpateList(){
	var params =$("#actionForm").serialize();
	
	$.ajax({
	type : "post", //주고 받는 방식, 주로 포스트 방식으로 주고 받음
	url : "gwSchUpdateAjax",//data를 url 주소에 보낸다
	dataType : "json",//{키:값, 키:값} > 제이슨 형태 , 제이슨 형태로 주고받겠다.
	data : params,//보낼 데이터(선택)
	success : function(res){		
		if(res.res == "SUCCESS"){
			$("#actionForm").attr("action", "gwSchDetail");
			$("#actionForm").submit();
		}else {
			$("#alert").attr("title", "알림");
			$("#alert p").html("수정에 실패하였습니다.");
			$("#alert").dialog({
				buttons :{
					ok: function(){
						$(this).dialog("close");
					}
				}
			});
		}
	},
	error : function(req, status, error){ //상태 코드 값(status, 볼필요는 없음)
		console.log("code : " + req.status); //기본 값
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
		<div class="contents_header_txt">일정 수정</div>
	</div>
	<div class="contents">
			<div class="em">*필수 입력 사항 입니다</div> 	
<div class="Schedule_box">
	<form action="#" id="actionForm" method="post">
	<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="sEmpNo" id="sEmpNo" value="${sEmpNo}"/>
			<input type="hidden" name="sEmpNo" value="${sEmpNo}" />
			<input type="hidden" name="gwshceno" id="gwshceno" value="${data.SCHE_NO }"/>
			<input type="hidden" name="docmatchfilenm" id="docmatchfilenm" value="${data.SCHE_ATCH_FILE_NM }" />
<!-- 여기에 내용을 작성하시오. -->
		<div class="work_selbox">
		<div class="work_sel">업무 선택 *</div>
		<div class="sel_box0">
		<select class="sel_work" name="gwschesort" id="gwschesort"
			 style="width:70px;font-size:16px;height: 35px;margin-left: 3px;margin-top: 2px;">
			<option value="0"<c:if test="${data.SCHE_SORT=='전사'}"> selected </c:if>>전사</option>
			<option value="1"<c:if test="${data.SCHE_SORT=='부서'}"> selected </c:if>>${sDeptNm}</option>
			<option value="2"<c:if test="${data.SCHE_SORT=='개인'}"> selected </c:if>>개인</option>
		</select>
			<input type="radio" class="gwscheworktype" name="gwscheworktype" value="0"<c:if test="${data.SCHE_WORK_TYPE== '내근'}"> checked </c:if>>내근
			<input type="radio" class="gwscheworktype" name="gwscheworktype" value="1"<c:if test="${data.SCHE_WORK_TYPE== '외근'}"> checked </c:if>>외근
		</div>
			</div>
			<div class="work_selbox">
				<div class="work_sel">일정명 *</div>
				<div class="sel_box1">
					<input type="text" class="sche_name" name="gwschenm" id="gwschenm" value="${data.SCHE_NM }"/>
				</div>
			</div>
			<div class="work_selbox">
			<div class="work_sel">담당자 </div>
				<div class="sel_box1">
					<input type="text" class="sche_empno"disabled="disabled" value="${sEmpNm}" />
				</div>
				<div class="work_sel1">부서</div>
			<!-- <div class="sel_box2"></div> -->
			<input type="text" class="sche_empno1"disabled="disabled" value="${sDeptNm}">
			</div>
			<!-- 이메일 & 폰 -->
			<div class="work_selbox">
				<div class="work_sel">이메일</div>
				<div class="sel_box1">
					<input type="text" class="sche_email"disabled="disabled" id= "email" value="${data.EMAIL}" />
			</div>
				<div class="work_sel1">핸드폰 번호</div>
			<input type="text" class="sche_phone" id="cellno" disabled="disabled" value="${data.CELL_NO}" />
			</div>
			<!-- 이메일 폰 끝 -->
				<div class="work_selbox">
			<div class="work_sel">날짜 *</div>
					<input type="date"class="start_day" name="gwschestartday"id="gwschestartday" value="${data.SCHE_START_DAY}">~<input type="date" class="end_day"name="gwscheendday" id="gwscheendday"value="${data.SCHE_END_DAY}"/>
					<div class="work_sel2">시간 *</div>
					<select class="time_txt1" name="time_txt1" id="time_txt1">
						<option value="00"<c:if test="${data.SCHE_START_DAY_TIME_H==00}"> selected </c:if>>00
						<option value="09"<c:if test="${data.SCHE_START_DAY_TIME_H==09}"> selected </c:if>>09
						<option value="10"<c:if test="${data.SCHE_START_DAY_TIME_H==10}"> selected </c:if>>10
						<option value="11"<c:if test="${data.SCHE_START_DAY_TIME_H==11}"> selected </c:if>>11
						<option value="12"<c:if test="${data.SCHE_START_DAY_TIME_H==12}"> selected </c:if>>12
						<option value="13"<c:if test="${data.SCHE_START_DAY_TIME_H==13}"> selected </c:if>>13
						<option value="14"<c:if test="${data.SCHE_START_DAY_TIME_H==14}"> selected </c:if>>14
						<option value="15"<c:if test="${data.SCHE_START_DAY_TIME_H==15}"> selected </c:if>>15
						<option value="16"<c:if test="${data.SCHE_START_DAY_TIME_H==16}"> selected </c:if>>16
						<option value="17"<c:if test="${data.SCHE_START_DAY_TIME_H==17}"> selected </c:if>>17
						<option value="18"<c:if test="${data.SCHE_START_DAY_TIME_H==18}"> selected </c:if>>18
						<option value="19"<c:if test="${data.SCHE_START_DAY_TIME_H==19}"> selected </c:if>>19
						<option value="20"<c:if test="${data.SCHE_START_DAY_TIME_H==20}"> selected </c:if>>20
						<option value="21"<c:if test="${data.SCHE_START_DAY_TIME_H==21}"> selected </c:if>>21
						<option value="22"<c:if test="${data.SCHE_START_DAY_TIME_H==22}"> selected </c:if>>22
						<option value="23"<c:if test="${data.SCHE_START_DAY_TIME_H==23}"> selected </c:if>>23
						
					</select> :
					<select class="time_txt2"name="time_txt2"id="time_txt2">
						<option value="00"<c:if test="${data.SCHE_START_DAY_TIME_M==00}"> selected </c:if>>00
						<option value="30"<c:if test="${data.SCHE_START_DAY_TIME_M==30}"> selected </c:if>>30
					
					</select> ~
					<select class="time_txt3"name="time_txt3"id="time_txt3">
					<option value="00"<c:if test="${data.SCHE_END_DAY_TIME_H==00}"> selected </c:if>>00
						<option value="09"<c:if test="${data.SCHE_END_DAY_TIME_H==09}"> selected </c:if>>09
						<option value="10"<c:if test="${data.SCHE_END_DAY_TIME_H==10}"> selected </c:if>>10
						<option value="11"<c:if test="${data.SCHE_END_DAY_TIME_H==11}"> selected </c:if>>11
						<option value="12"<c:if test="${data.SCHE_END_DAY_TIME_H==12}"> selected </c:if>>12
						<option value="13"<c:if test="${data.SCHE_END_DAY_TIME_H==13}"> selected </c:if>>13
						<option value="14"<c:if test="${data.SCHE_END_DAY_TIME_H==14}"> selected </c:if>>14
						<option value="15"<c:if test="${data.SCHE_END_DAY_TIME_H==15}"> selected </c:if>>15
						<option value="16"<c:if test="${data.SCHE_END_DAY_TIME_H==16}"> selected </c:if>>16
						<option value="17"<c:if test="${data.SCHE_END_DAY_TIME_H==17}"> selected </c:if>>17
						<option value="18"<c:if test="${data.SCHE_END_DAY_TIME_H==18}"> selected </c:if>>18
						<option value="19"<c:if test="${data.SCHE_END_DAY_TIME_H==19}"> selected </c:if>>19
						<option value="20"<c:if test="${data.SCHE_END_DAY_TIME_H==20}"> selected </c:if>>20
						<option value="21"<c:if test="${data.SCHE_END_DAY_TIME_H==21}"> selected </c:if>>21
						<option value="22"<c:if test="${data.SCHE_END_DAY_TIME_H==22}"> selected </c:if>>22
						<option value="23"<c:if test="${data.SCHE_END_DAY_TIME_H==23}"> selected </c:if>>233
					</select> :
					<select class="time_txt4"name="time_txt4"id="time_txt4">
						<option value="00"<c:if test="${data.SCHE_END_DAY_TIME_M==00}"> selected </c:if>>00
						<option value="30"<c:if test="${data.SCHE_END_DAY_TIME_M==30}"> selected </c:if>>30
					</select> 
				</div>
			<div class="work_selbox">
				<div class="work_sel">장소 *</div>
				<input type="text" class="sche_place"name="gwscheloct" id="gwscheloct" value="${data.SCHE_LOCT }"/>
			</div>
			<div class="work_selbox1">
				<div class="work_sel3">세부사항</div>
				<textarea rows="11" cols="93" class="sche_con" name="gwschecont" id="gwschecont" >${data.SCHE_CONT}</textarea>
				
			</div>
			<c:if test="${!empty data.SCHE_ATCH_FILE_NM }">
			<div class="work_selbox" id="work_selbox0">
			<div class="work_sel">첨부파일</div>
				<div class ="file_txt">
				${data.SCHE_ATCH_FILE_NM}<input type='button' value="파일 삭제" id="fileDelBtn">
					</div>
				</div>
				</c:if>
					</form>
				<div class="work_selbox" id="work_selbox1">
				<form id="fileForm"  action="fileUploadAjax" method="post" enctype="multipart/form-data">
					<div class="work_sel">첨부파일</div>
					<input type="file" name="attfile" id="docmatchfilenm" />
				</form>
				</div>
				<input type="button" id="updateBtn" value="수정" />
				<input type="button" id="cancelBtn" value="취소" />
					</div>	
			
		
			
					</div><!-- contents -->
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>