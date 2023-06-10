<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - Sample Page</title>
<style type="text/css">
.star{
	display: inline-block;
	width: 900px;
	font-size: 9pt;
	color: red;
	text-align: right;
	padding: 0 20px;
}
.request_process_page{
	width: 900px;
	border-top: 2px solid #9aa9bd;
    border-bottom: 1px solid #9aa9bd;
    margin-bottom: 10px;
}
.nexticon{
	width: 40px;
	height: 40px;
	text-align: left;
	float: right;
}
.request_page{
	display: inline-block;
	width: 900px;
	height: 585px;
    border-bottom: 1px solid #9aa9bd;
}
.request_user, .request_title, .request_category, .request_contents{
	text-align: center;
	font-size: 10pt;
	vertical-align: middle;
	background-color: #e4eaf2;
}
.request_user_area{
	display: inline-table;
	width: 900px;
	height: 43px;
	border-bottom: 1px solid #9aa9bd;
}
.request_user{
	display: table-cell;
	width: 150px;
	height: 43px;
}
.user_name_area{
	display: inline-block;
	width: 200px;
	height: 43px;
}
.request_user_name{
	display: inline-block;
	width: 150px;
	height: 28px;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	outline: none;
	margin-top: 6px;
	margin-left: 6px;
	font-size: 10pt;
}
.request_page1{
	display: inline-table;
	width: 900px;
	height: 43px;
	border-bottom: 1px solid #9aa9bd;
}
.request_title{
	display: table-cell;
	width: 150px;
	height: 43px;
}
.request_title_text{
	display: inline-block;
	width: 600px;
	height: 28px;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	outline: none;
	margin-top: 6px;
	margin-left: 6px;
	font-size: 10pt;
}
.catg{
	display: inline-block;
	width: 444px;
	height: 28px;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	outline: none;
	margin-top: 6px;
	margin-left: 6px;
	font-size: 10pt;
}
.request_page2{
	display: inline-table;
	width: 900px;
	height: 70px;
	border-bottom: 1px solid #9aa9bd;
}
.request_category{
	display: table-cell;
	width: 150px;
	height: 43px;
}
.catgSelect{
	display: inline-block;
}
.catg_null{
	display: inline-block;
	margin-top: 6px;
	margin-left: 6px;
	font-size: 10pt;
}
.eisCatgNo{
	display: inline-block;
    width: 150px;
    height: 32px;
    border: 1px solid #c2c2c2;
    border-radius: 3px;
    outline: none;
    margin-top: 6px;
    margin-left: 6px;
    font-size: 10pt;
    vertical-align: top;
}
.request_page3{
	display: inline-table;
	width: 900px;
	height: 426px;
}
.request_contents{
	display: table-cell;
	width: 150px;
	height: 43px;
	margin: 10px 10px;
}
.request_contents_text{
	display: inline-block;
	width: 600px;
	height: 400px;
	margin-top: 10px;
	margin-left: 6px;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	font-size: 10pt;
	resize : none;
}
.button_area1{
	display: inline-block;
	width: 900px;
	height: 35px;
}
.save_button, .cancel_button{
	width: 80px;
	height: 32px;
	background-color: #f7f7f7;
	float: right;
	margin: 0 3px;
	float: right;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
    padding: 1px 2px;
    outline: none;
    cursor: pointer;
}
.save_button:hover, .cancel_button:hover{
	background-color: #022859;
	color: #fff;
}
.cancel_button{
	margin-left: 3px;
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#cancel_button").on("click", function(){
			history.back();
		});
		
		
		reloadCatg();
		
		
		function reloadCatg(){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "catgListAjax",
				dataType : "json",
				data : params,
				success: function(res){
					catgList(res.list, res.catgCnt);
					$("#eisCatgNo > option[value="+'<c:out value="${param.eisCatgNo}"/>'+"]").attr("selected","selected");
				},
				error : function(req, status, error){
					console.log("code : " + req.status);
					console.log("message : " + req.responseText);
				}
			});
		}
		
		function catgList(list, catgCnt){
			var html = "";
					html += "<option value=\"0\">" + "선택" + "</option>";
				for(var i = 0; i < list.length; i++){
					html += "<option value=" + list[i].EIS_CATG_NO + ">" + list[i].EIS_CATG_NM + "</option>";
				}
			
			$(".eisCatgNo").html(html);
		}
		
		$("#eisCatgNo").change(
				function(e) {
						
					$("#catg").val(
							$('#eisCatgNo option:selected')
									.text());
				});
		

		$("#save_button").on("click", function(){
			if($.trim($("#request_title_text").val()) == ""){
				alert("제목을 입력해주세요");
				$("#request_title_text").focus();
			}else if($.trim($("#eisCatgNo").val()) == "" || $.trim($("#eisCatgNo").val()) == "0" ){
				alert("카테고리을 선택해주세요");
				$("#eisCatgNo").focus();
			}else if($.trim($("#request_contents_text").val()) == ""){
				alert("내용을 입력해주세요");
				$("#request_contents_text").focus();
			}else {
				var params = $("#actionForm").serialize();
				
				$.ajax({
					type : "post",
					url : "reqsUpdateAjax",
					dataType : "json",
					data : params,
					success: function(res){ 
						if(res.res == "SUCCESS"){
							$("#actionForm").attr("action", "reqsDetail")
							$("#actionForm").submit();
						}else{
							$("#alert").attr("title", "알림");
							$("#alert p").html("추가 실패");
							$("#alert").dialog({
								buttons: {
									Ok: function(){
										$(this).dialog("close");
									}
								}
							});
						}
					},
					error : function(req, status, error){
						console.log("code : " + req.status);
						console.log("message : " + req.responseText);
					}
				});
			}
		});
		
		$("#actionForm").on("keypress", "input", function(e){
			if(e.keyCode == 13){
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
		<div class="contents_header_txt">게시글 수정</div> 
	</div>
	<div class="star">*은 필수항목입니다.</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="sEmpNo" id = "sEmpNo" value="${sEmpNo}" />
			<input type="hidden" id="reqsNo" name="reqsNo" value = "${data.REQS_NO}"/>
			<%-- <input type="hidden" id="eisCatgNo" name="eisCatgNo" value = "${data.EIS_CATG_NO}"/> --%>
			<input type="hidden" name="page" value="${param.page}" />
		<div class="request_process_page">
			<div class="request_page">
			<div class="request_user_area">
				<div class="request_user">작성자*</div>
				<input type="text" class="request_user_name" value = "${sEmpNm}" disabled="disabled">
			</div>
				<div class="request_page1">
					<div class="request_title">제목*</div>
					<input type="text" class="request_title_text" id = "request_title_text"
										name = "request_title_text" value = "${data.REQS_TITLE}">
				</div><br>
				<div class="request_page2">
					<div class="request_category">카테고리 *</div>
					<div class="catgSelect">
					<input type = "text" class="catg" id="catg"/>
					<select class = "eisCatgNo" name = "eisCatgNo" id = "eisCatgNo" value = "${data.EIS_CATG_NM}">
					</select>
					</div><br>
					<div class=catg_null>찾으시는 카테고리가 없을 시  <b>'추가요청'</b> 선택 후  요청내용에 추가요청하실 카테고리를 입력해주세요.</div>			   
				</div><br>
				<div class="request_page3">
					<div class="request_contents">내용*</div>
					<textarea class="request_contents_text" id = "request_contents_text"
							  name = "request_contents_text">${data.REQS_CONT}</textarea>
				</div>
			</div>
		</div>	
		</form>
		<div class="button_area1">
			<input type="button" class="cancel_button" id = "cancel_button" value="취소"/>
			<input type="button" class="save_button" id = "save_button" value="저장"/>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>