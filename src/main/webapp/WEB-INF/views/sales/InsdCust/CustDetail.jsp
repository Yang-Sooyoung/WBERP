<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - Sample Page</title>
<style type="text/css">
/* 개별 css는 여기에 */
#sample4_roadAddress{
	width:300px;
}
.line2 {
	font-size: 8pt;
	font-weight: bold;
	width: 50px;
	min-height: 23px;
	line-height: 23px;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	color:#004c9d;
}

.con4 {
	font-size: 8pt;
	min-height: 23px;
	line-height: 23px;
	display: inline-block;
	padding: 0px 5px;
}
.con5 {
	font-size: 10pt;
	min-height: 43px;
	line-height: 43px;
	display: inline-block;
	padding: 0px 5px;
}
.underline2 {
	width: 100%;
	min-height: 23px;
	display: inline-table;
}
.underbox2 {
	width: 350px;
	margin-bottom: 10px;
}
.OPNN_CONT {
	display: inline-block;
	width: 500px;
	height: 100px;
	vertical-align: top;
}
.EMP_NM{
	display: block;
}
.write_con_wrap{
	display: inline-block;
	width : 510px;
}
.btn_wrap{
	display: inline-block;
}
.opline{
	width : 100%;
	border : 0.5px solid #F2F2F2;
	
}
.user_name{
	color :#022859;
	font-weight :600;
}
.gods
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
	$(document).ready(function() {
		reloadList();
		$("#listBtn").on("click", function() {
			$("#actionForm").attr("action", "custInfoMang");
			$("#actionForm").submit();
		});
		$("#updateBtn").on("click", function() {
			$("#actionForm").attr("action", "CustEdit");
			$("#actionForm").submit();
		});
		$("#deleteBtn").on("click",function(){
			if(confirm("삭제하시겠습니까?")){
				var params=$("#actionForm").serialize();
				$.ajax({
					type : "post",
					url : "CustDeleteAjax",
					dataType : "json", // {키:값, 키:값}
					data : params, //보낼데이터
					success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
						if(res.res=="SUCCESS"){
							$("#actionForm").attr("action","custInfoMang");
							$("#actionForm").submit();
						}else{
							$("#alert").attr("title","알림");
							$("#alert p").html("삭제에 실패하였습니다.");
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
			}
		});
		$("#addOpBtn").on("click", function() {
			if($.trim($("#OPNN_CONT").val()) == "") {
				alert("내용을 입력해 주세요.");
				$("#OPNN_CONT").focus();
			} else {
				var params=$("#actionForm").serialize();
				$.ajax({
					type : "post",
					url : "opnAddAjax",
					dataType : "json", // {키:값, 키:값}
					data : params, //보낼데이터
					success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
						if(res.res=="SUCCESS"){
							$("#actionForm").attr("action","CustDetail");
							$("#actionForm").submit();
						}else{
							$("#alert").attr("title","알림");
							$("#alert p").html("수정에 실패하였습니다.");
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
			}
		});
		$("#opnnCont").on("click","#opDelBtn", function() {
			$("#OPNN_NO").val($(this).attr("name"));
			console.log($("#OPNN_NO").val());
			console.log($(this).attr("name"));
			if(confirm("삭제하시겠습니까?")) {
				var params=$("#actionForm").serialize();
				$.ajax({
					type : "post",
					url : "OpnnUpdateAjax",
					dataType : "json", // {키:값, 키:값}
					data : params, //보낼데이터
					success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
						if(res.res=="SUCCESS"){
							$("#actionForm").attr("action","CustDetail");
							$("#actionForm").submit();
						}else{
							$("#alert").attr("title","알림");
							$("#alert p").html("삭제에 실패하였습니다.");
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
			}
		});
		
	});
	
	function drawList(cmntList,cmntCnt){
		var html = "";
		if(cmntCnt==0){
			html +="<div>";
			html +="<div colspan=\"5\">등록된 의견이 아직 없습니다.</div>";
			html +="</div>";
		}else{
			for(var i=0; i<cmntList.length; i++){
				//13자리 타임 스탬프 일반 날짜로 변환하기
				const timestampToInit=new Date(cmntList[i].WRITE_DATE);
				html +="<div class=\"OPNN_NO\" no=\""+cmntList[i].OPNN_NO+"\" mnm=\""+cmntList[i].OPNN_CONT+"\" con=\""+timestampToInit+"\">";
				html +="<div class=\"OpDiv\"><div class=\"EMP_NM\"><div class=\"user_name\">"+"작성자 : ( "+cmntList[i].EMP_NM+" )"+" 등록일 : ( "+cmntList[i].WRITE_DATE+" )"+"</div></div>";
				html +="<div class=\"write_con_wrap\"><div class=\"opcon\" name=\""+cmntList[i].OPNN_CONT+"\">"+cmntList[i].OPNN_CONT+"</div></div>";
				html +="<div class=\"btn_wrap\">";
				if(cmntList[i].EMP_NO=="${sEmpNo}"){
					html +="<input type=\"button\" value=\"의견삭제\" name=\""+cmntList[i].OPNN_NO+"\" id=\"opDelBtn\" />";
					console.log(name);
				}
				html +="</div></div>";
				html +="<div class=\"opline\"></div>"
			}
		}
		$("#opnnCont").html(html);
	}
	
	function reloadList(){
		var params=$("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "opnnListAjax",
			dataType : "json", // {키:값, 키:값}
			data : params, //보낼데이터
			success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
				drawList(res.cmntList, res.cmntCnt);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
				console.log("error : " + error);
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
		<div class="contents_header_txt">고객 정보</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="custNo" id="custNo" value="${param.custNo}"/>
			<input type="hidden" name="cmntpage" id="cmntpage" value="${cmntpage}"/>
			<input type="hidden" name="sEmpNo" value="${sEmpNo}" />
			<input type="hidden" name="OPNN_NO" id="OPNN_NO" />
			<div class="underbox">
				
				<div class="underline">
					<div class="line1">고객이름</div>
					<div class="con1">
						<input type="text" name="CUST_NM" id="CUST_NM" disabled="disabled" value="${data.CUST_NM}"/>
					</div>
					<div class="line1">고객부서</div>
					<div class="con1">
						<input type="text" name="DEPT_NM" id="DEPT_NM" disabled="disabled" value="${data.DEPT_NM}"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">고객번호</div>
					<div class="con1">
						<input type="text" name="CUST_NO" id="CUST_NO" disabled="disabled" value="${data.CUST_NO}"/>
					</div>
					<div class="line1">기업번호</div>
					<div class="con1">
						<input type="text" name="ENTP_NO" id="ENTP_NO" disabled="disabled" value="${data.ENTP_NO}"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">영업담당자</div>
					<div class="con1">
						<input type="text" disabled="disabled" value="${sEmpNm}"/>
						
					</div>
					<div class="line1">영업사원번호</div>
					<div class="con1">
						<input type="text" disabled="disabled" value="${sEmpNo}"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">등록일</div>
					<div class="con1">
						<input type="text" name="ADD_DATE" id="ADD_DATE" disabled="disabled" value="${data.ADD_DATE}"/>
					</div>
					<div class="line1">수정일</div>
					<div class="con1">
						<input type="text" name="MODF_DATE" id="MODF_DATE" disabled="disabled" value="${data.MODF_DATE}"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">휴대폰번호</div>
					<div class="con5">
						<input type="text" name="CELL_1" id="CELL_1" value="${data.CELL_1}" disabled="disabled"/> -
					</div>
					<div class="con5">
						<input type="text" name="CELL_2" id="CELL_2" value="${data.CELL_2}" disabled="disabled"/> -
					</div>
					<div class="con5">
						<input type="text" name="CELL_3" id="CELL_3" value="${data.CELL_3}" disabled="disabled"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">대표번호</div>
					<div class="con1">
						<input type="text" name="CUST_TEL" id="CUST_TEL" value="${data.CUST_TEL}" disabled="disabled" placeholder="전화번호 '-'를 제외하고 입력"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">이메일</div>
					<div class="con1">
						<input type="text" name="CUST_EMAIL1" id="CUST_EMAIL1" disabled="disabled" value="${data.CUST_EMAIL1}"/> @
					</div>
					<div class="con1">
						<input type="text" name="CUST_EMAIL2" id="CUST_EMAIL2" disabled="disabled" value="${data.CUST_EMAIL2}"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">주소</div>
					<div class="con3">
						<input type="text" name="POST_NO" id="sample4_postcode" placeholder="우편번호" disabled="disabled" value="${data.POST_NO}">
						<input type="hidden" onclick="sample4_execDaumPostcode()" disabled="disabled" value="주소 찾기"><br>
						<input type="text" name="CUST_ADDR" id="sample4_roadAddress" placeholder="도로명주소" disabled="disabled" value="${data.CUST_ADDR}">
						<span id="guide" style="color:#999"></span> 					
					</div>
				</div>
				<div class="underline">
					<div class="line1">수신 동의</div>
					<div class="con2">
						<input type="checkbox" id="sns" name="susin" disabled="disabled" value=0/>문자 
						<input type="checkbox" id="kakao" name="susin" disabled="disabled" value=1/>카톡
						<input type="checkbox" id="email" name="susin" disabled="disabled" value=2/>이메일
					</div>
				</div>
				
			<div class="underline">
				<div class="line1">의견메모</div>
				<div class="con3" id="opnnCont2">
					<textarea class="OPNN_CONT" id="OPNN_CONT" name="OPNN_CONT"></textarea>
					<input type="button" value="등록" id="addOpBtn" />
				</div>
				<div class="con3" id="opnnCont">
				</div>

			</div>
			<div class="detail_btn_area">
				<input type="button" value="수정" id="updateBtn" />
				<input type="button" value="삭제" id="deleteBtn" />
				<input type="button" value="취소" id="listBtn"/>
			</div>
			</div>
		</form>
		
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>