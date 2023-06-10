<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - Sample Page</title>
<style type="text/css">
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
	height: 560px;
    border-bottom: 1px solid #9aa9bd;
}
.request_user, .request_title, .request_category, .request_contents, .request_contents1, .reqs_refs{
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
	margin-right: 110px;
	font-size: 10pt;
}
.proc{
	width: 80px;
	height: 32px;
	background-color: #f7f7f7;
	margin: 0 3px;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
    padding: 1px 2px;
    outline: none;
    cursor: pointer;
    font-size: 10pt;
}
.proc:hover{
	background-color: #022859;
	color: #fff;
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
.request_page2{
	display: inline-table;
	width: 900px;
	height: 43px;
	border-bottom: 1px solid #9aa9bd;
}
.request_category{
	display: table-cell;
	width: 150px;
	height: 43px;
}
.request_category_text{
	display: inline-block;
	width: 600px;
	height: 28px;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	outline: none;
	margin-top: 6px;
	margin-left: 6px;
}
.request_page3{
	display: inline-table;
	width: 900px;
	height: 428px;
}
.request_contents{
	display: table-cell;
	width: 150px;
	height: 43px;
	margin: 10px 10px;
}
.request_contents_text{
	display: inline-block;
	width: 604px;
	height: 400px;
	margin-top: 10px;
	margin-left: 6px;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	font-size: 10pt;
	resize : none;
}
.request_page4{
	display: inline-table;
	width: 900px;
	height: 214px;
	border-bottom: 1px solid #9aa9bd;
}
.request_contents1{
	display: table-cell;
	width: 150px;
	height: 43px;
	margin: 10px 10px;
}
.request_contents_text1{
	display: inline-block;
	width: 600px;
	height: 188px;
	margin-top: 10px;
	margin-left: 6px;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	font-size: 10pt;
	resize : none;
}
.request_page5{
	display: inline-table;
	width: 900px;
	height: 213px;
	border-bottom: 1px solid #9aa9bd;
}
.reqs_refs{
	display: table-cell;
	width: 150px;
	height: 43px;
	margin: 10px 10px;
}
.reqs_refs_text{
	display: inline-block;
	width: 600px;
	height: 188px;
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
	margin-bottom: 30px;
}
.update_button, .list_button, .delete_button{
	width: 80px;
	height: 32px;
	background-color: #f7f7f7;
	margin: 0 3px;
	float: right;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
    padding: 1px 2px;
    outline: none;
    cursor: pointer;
}
.update_button:hover, .list_button:hover, .delete_button:hover{
	background-color: #022859;
	color: #fff;
}
.list_button{
	margin-left: 3px;
}
.reqs_comt_area{
	width : 900px;
	/* height : 100px; */
	font-size : 15pt;
	color: #022859;
	border-top: 2px solid #9aa9bd;
}
.reqs_comt_list{
	font-size : 13pt;
	color: #000000;
	border-top: 1px solid #9aa9bd;
	border-bottom: 1px solid #9aa9bd;
	margin-top: 30px;
}
.comt_No{
	border-bottom: 1px solid #9aa9bd;
}
.emp_info{
	margin-bottom: 10px;
}
.comt_area{
	margin-bottom: 10px;
}
.reqs_comt{
	display: inline-block;
	width: 600px;
	margin-left: 30px;
	vertical-align: top;
	font-size : 11pt;
}
pre{
    overflow: auto;
    white-space: pre-wrap;
} 
.comt_date{
	display: inline-block;
	float: right;
	font-size : 11pt;
}
.btn_wrap{
	height: 40px;
}
.comtUpdateBtn, .comtDeleteBtn{
	width: 50px;
	height: 32px;
	background-color: #f7f7f7;
	margin: 0 3px;
	float: right;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
    padding: 1px 2px;
    outline: none;
    cursor: pointer;
}
.comtUpdateBtn:hover, .comtDeleteBtn:hover, .comt_Add:hover, .cancel_Btn:hover{
	background-color: #022859;
	color: #fff;
}
.comt_page{
	height: 35px;
}
.input_area{
	font-size : 13pt;
	color: #000000;
}
.reqs_comt_input{
	margin-top : 10px; 
	width : 900px;
	border : 1px solid #9aa9bd;
	border-radius: 5px;
}
.input_emp_info{
	margin : 10px 0 0 10px;
}
.comt_txt{
	margin : 10px 0 10px 10px;
	width : 785px;
	height : 50px;
	border : 0px;
	border-bottom : 1px solid #9aa9bd;
	resize: none;
}
.btn_area{
	display: inline-block;
	width: 90px;
	vertical-align: top;
}
.comt_Add{
	width: 80px;
	height: 32px;
	background-color: #f7f7f7;
	/* float: right; */
	margin: 0 8px;
	/* margin-top: 30px; */
	float: right;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
    padding: 1px 2px;
    outline: none;
    cursor: pointer;
}
.cancel_Btn{
	width: 80px;
	height: 32px;
	background-color: #f7f7f7;
	/* float: right; */
	margin: 0 8px;
	margin-bottom: 5px;
	float: right;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
    padding: 1px 2px;
    outline: none;
    cursor: pointer;
}
.request_refs_popup{
	display: inline-block;
	height: 215px;
    border-top: 1px solid #9aa9bd;
    border-bottom: 1px solid #9aa9bd;
}
.request_refs1{
	display: inline-table;
	width: 470px;
	height: 43px;
	border-bottom: 1px solid #9aa9bd;
}
.request_title1{
	display: table-cell;
	width: 100px;
	height: 30px;
	text-align: center;
	background-color: #e4eaf2;
	vertical-align: middle;
}
.request_title_text1{
	display: inline-block;
	width: 350px;
	height: 28px;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	outline: none;
	margin-top: 6px;
	margin-left: 6px;
	font-size: 10pt;
	vertical-align: top;
}
.request_refs2{
	display: inline-table;
	width: 470px;
	height: 43px;
	border-bottom: 1px solid #9aa9bd;
}
.request_catg{
	display: table-cell;
	width: 100px;
	height: 30px;
	text-align: center;
	background-color: #e4eaf2;
	vertical-align: middle;
}
.request_catg_text{
	display: inline-block;
	width: 350px;
	height: 28px;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	outline: none;
	margin-top: 6px;
	margin-left: 6px;
	font-size: 10pt;
	vertical-align: top;
}
.request_refs3{
	display: inline-table;
	width: 470px;
	height: 43px;
	border-bottom: 1px solid #9aa9bd;
}
.request_cont{
	display: table-cell;
	width: 100px;
	height: 150px;
	text-align: center;
	background-color: #e4eaf2;
	vertical-align: middle;
}
.request_cont_text{
	display: inline-block;
	width: 350px;
	height: 148px;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	outline: none;
	margin-top: 6px;
	margin-bottom: 6px;
	margin-left: 6px;
	font-size: 10pt;
	vertical-align: top;
	resize: none;
}
.refs{
	display: inline-table;
	width: 470px;
	height: 43px;
	border-bottom: 1px solid #9aa9bd;
}
.refs_title{
	display: table-cell;
	width: 100px;
	height: 209px;
	text-align: center;
	background-color: #e4eaf2;
	vertical-align: middle;
}
.refs_resn{
	display: inline-block;
	width: 350px;
	height: 197px;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	outline: none;
	margin-top: 6px;
	margin-bottom: 6px;
	margin-left: 6px;
	font-size: 10pt;
	vertical-align: top;
	resize: none;
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
function emptyCheck(sel) {
	if ($.trim($(sel).val()) == '') {
		return true;
	} else {
		return false;
	}
}
	$(document).ready(function() {
		
		reloadComt();
		
		if($("#proc_code").val() == "요청"){
			$("#proc0").css("background-color", "#022859")
			$("#proc0").css("color", "#fff")
		}
		if($("#proc_code").val() == "처리중"){
			$("#proc4").css("background-color", "#022859")
			$("#proc4").css("color", "#fff")
		}
		if($("#proc_code").val() == "처리완료"){
			$("#proc1").css("background-color", "#022859")
			$("#proc1").css("color", "#fff")
		}
		if($("#proc_code").val() == "거부"){
			$("#proc2").css("background-color", "#022859")
			$("#proc2").css("color", "#fff")
		}
		
		/* $("#proc0").on("click", function(){
				console.log("${data.PROC_CODE}");
		}); */
		
		//댓글등록
		$("#comt_Add").on("click", function(){
			if(emptyCheck(".comt_txt")){
				alert("내용을 입력해주세요.");
				$(".comt_txt").focus();
			}else{
				if($(this).val() == "등록"){
					comtAdd();
					$("#comt_txt").val("");
				}else if($(this).val() == "수정"){
					comtUpdate();
					$("#comt_txt").val("");
				}
				$("#comt_Add").val("등록");
			}
		});
		
		//댓글삭제
		$(".reqs_comt_list").on("click", ".comtDeleteBtn", function(){
			$("#comtNo").val($(this).parent().parent().attr("name"));
			if(confirm("삭제하시겠습니까?")){
				comtDelete();
			}
		});
		
		//댓글수정
		$(".reqs_comt_list").on("click", "#comtUpdateBtn", function(){
			$("#comtNo").val($(this).parent().parent().attr("name"));
			if(confirm("수정하시겠습니까?")){
				$("#comt_txt").val($(this).parent().parent().children(".comt_area").children(".reqs_comt").children("pre").html());
				$("#comt_Add").val("수정");
			}
		});
		
		//댓글 등록, 수정 취소
		$(".cancel_Btn").on("click", function(){
			if($("#comt_Add").val() == "수정"){
				$("#comt_txt").val("");
				$("#comt_Add").val("등록");
			}else{
				$("#comt_txt").val("");
			}
		});
		
		//댓글 페이징
		$(".page_nation").on("click", "div", function() {
			$("#cpage").val($(this).attr("name"));
			reloadComt();
		});
		
		$("#proc4").on(
				"click",
				function() {
					if($("#proc_code").val() == "요청"){
					makeBtn2Popup(2, "요청처리", "요청을 진행하시겠습니까?", true, 300, 200,
							null, "확인", function() {
								proc4Update();
								closePopup(2);
							}, "취소", function() {
								closePopup(2);
							});
					}else if($("#proc_code").val() == "처리중"){
						makeBtn1Popup(1, "요청처리", "이미 처리중인 게시글입니다.", true, 300, 200,
								null, "확인", function() {
									closePopup(1);
								});
					}else if($("#proc_code").val() == "처리완료"){
						makeBtn1Popup(1, "요청처리", "처리완료된 게시글입니다.", true, 300, 200,
								null, "확인", function() {
									closePopup(1);
								});
					}else{
						makeBtn1Popup(1, "요청처리", "거부된 게시글입니다.", true, 300, 200,
								null, "확인", function() {
									closePopup(1);
								});
					}
				});
		
		$("#proc1").on(
				"click",
				function() {
					if($("#proc_code").val() == "요청"){
						makeBtn1Popup(1, "요청처리완료", "처리중 상태가 아닙니다.", true, 300, 200,
								null, "확인", function() {
									closePopup(1);
								});
					}else if($("#proc_code").val() == "거부"){
						makeBtn1Popup(1, "요청처리완료", "거부된 게시글입니다.", true, 300, 200,
								null, "확인", function() {
									closePopup(1);
								});
					}else if($("#proc_code").val() == "처리완료"){
						makeBtn1Popup(1, "요청처리완료", "처리완료된 게시글입니다.", true, 300, 200,
								null, "확인", function() {
									closePopup(1);
								});
					}else{
					makeBtn2Popup(2, "요청처리완료", "요청을 완료하시겠습니까?", true, 300, 200,
							null, "확인", function() {
								proc1Update();
								closePopup(2);
							}, "취소", function() {
								closePopup(2);
							});
					}
					
				});
		
		$("#proc2").on(
				"click",
				function() {
					if($("#proc_code").val() == "요청"){
					makeBtn2Popup(2, "요청거부", drawRefs(), true, 500, 350,
							null, "저장", function() {
								console.log($("#reqsNo").val());
								console.log($("#request_title_text1").val());
								console.log($("#request_catg_text").val());
								console.log($("#request_cont_text").val());
						proc2Update();
								refsAdd();
							}, "취소", function() {
								closePopup(2);
							});
					}else if($("#proc_code").val() == "거부"){
						makeBtn1Popup(1, "요청거부", "이미 거부된 게시글입니다.", true, 300, 200,
								null, "확인", function() {
									closePopup(1);
								});
					}else{
						makeBtn1Popup(1, "요청거부", "요청 상태에서만 거부 할 수 있습니다.", true, 300, 200,
								null, "확인", function() {
									closePopup(1);
								});
					}
				});
		
		//게시글목록으로이동
		$("#list_button").on("click", function(){
			$("#actionForm").attr("action", "reqsList");
			$("#actionForm").submit();
		});
		
		//게시글수정
		$("#update_button").on("click", function(){
			$("#actionForm").attr("action", "reqsUpdate");
			$("#actionForm").submit();
		});
		
		//게시글삭제
		$("#delete_button").on("click", function(){
			if(confirm("삭제하시겠습니까?")){
				var params = $("#actionForm").serialize();
				
				$.ajax({
					type : "post",
					url : "reqsDeleteAjax",
					dataType : "json",
					data : params,
					success: function(res){ 
						if(res.res == "SUCCESS"){
							$("#actionForm").attr("action", "reqsList")
							$("#actionForm").submit();
						}else{
							$("#alert").attr("title", "알림");
							$("#alert p").html("삭제 실패!");
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
		
		//처리상태 처리중으로변경
		function proc4Update(){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "proc4UpdateAjax",
				dataType : "json",
				data : params,
				success: function(res){ 
					if(res.res == "SUCCESS"){
						$("#actionForm").attr("action", "reqsDetail")
						$("#actionForm").submit();
					}else{
						$("#alert").attr("title", "알림");
						$("#alert p").html("변경 실패");
						$("#alert").dialog({
							buttons: {
								Ok: function(){
									$(this).dialog("close");
								}
							}
						});
					}
				}
			});
		}
		
		//처리상태 처리완료로변경
		function proc1Update(){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "proc1UpdateAjax",
				dataType : "json",
				data : params,
				success: function(res){ 
					if(res.res == "SUCCESS"){
						$("#actionForm").attr("action", "reqsDetail")
						$("#actionForm").submit();
					}else{
						$("#alert").attr("title", "알림");
						$("#alert p").html("변경 실패");
						$("#alert").dialog({
							buttons: {
								Ok: function(){
									$(this).dialog("close");
								}
							}
						});
					}
				}
			});
		}
		
		//처리상태 거부로변경
		function proc2Update(){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "proc2UpdateAjax",
				dataType : "json",
				data : params,
				success: function(res){ 
					if(res.res == "SUCCESS"){
						$("#actionForm").attr("action", "reqsDetail")
						$("#actionForm").submit();
					}else{
						$("#alert").attr("title", "알림");
						$("#alert p").html("변경 실패");
						$("#alert").dialog({
							buttons: {
								Ok: function(){
									$(this).dialog("close");
								}
							}
						});
					}
				}
			});
		}
		
		//거부사유등록
		function refsAdd(){
				var params = $("#RefsactionForm").serialize();
				
				$.ajax({
					type : "post",
					url : "refsAddAjax",
					dataType : "json",
					data : params,
					success: function(res){ 
						if(res.res == "SUCCESS"){
							$("#actionForm").attr("action", "reqsDetail")
							$("#actionForm").submit();
						}else{
							$("#alert").attr("title", "알림");
							$("#alert p").html("등록 실패");
							$("#alert").dialog({
								buttons: {
									Ok: function(){
										$(this).dialog("close");
									}
								}
							});
						}
					}
				});
		}
		
		//댓글등록
		function comtAdd(){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "comtAddAjax",
				dataType : "json",
				data : params,
				success: function(res){ 
					if(res.res == "SUCCESS"){
						reloadComt();						
					}else{
						$("#alert").attr("title", "알림");
						$("#alert p").html("저장 실패!");
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
		
		//댓글삭제
		function comtDelete(){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "comtDeleteAjax",
				dataType : "json",
				data : params,
				success: function(res){ 
					if(res.res == "SUCCESS"){
						reloadComt();
					}else{
						$("#alert").attr("title", "알림");
						$("#alert p").html("삭제 실패!");
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
		
		//댓글수정
		function comtUpdate(){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "comtUpdateAjax",
				dataType : "json",
				data : params,
				success: function(res){ 
					if(res.res == "SUCCESS"){
						reloadComt();
					}else{
						$("#alert").attr("title", "알림");
						$("#alert p").html("수정 실패!");
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
		
		//거부사유팝업
		function drawRefs(){
			var html = "";
			
			html += "<form action=\"RefsactionForm\" method=\"post\" id=\"RefsactionForm\">";
			html += "<input type=\"hidden\" id=\"reqsNo\" name=\"reqsNo\" value=\"${data.REQS_NO}\"/>";
			html += "	<div class=\"request_refs_popup\" style=\"width: 100%\"> 			";
			html += "		<div class=\"request_refs\">									";
			/* html += "			<div class=\"request_refs1\">								";
			html += "			<div class=\"request_title1\">제목</div>						";
			html += "			<input type=\"text\" class=\"request_title_text1\" id=\"request_title_text1\" name=\"request_title_text1\" disabled=\"disabled\" value=\"${data.REQS_TITLE}\">";
			html += "			</div>														";
			html += "			<div class=\"request_refs2\">								";
			html += "			<div class=\"request_catg\">카테고리</div>						";
			html += "			<input type=\"text\" class=\"request_catg_text\" id=\"request_catg_text\" name=\"request_catg_text\" disabled=\"disabled\" value=\"${data.EIS_CATG_NM}\">";
			html += "			</div>														";
			html += "			<div class=\"request_refs3\">								";
			html += "			<div class=\"request_cont\">내용</div>						";
			html += "			<textarea class=\"request_cont_text\" id=\"request_cont_text\" name=\"request_cont_text\" disabled=\"disabled\">${data.REQS_CONT}</textarea>";
			html += "			</div>														"; */
			html += "			<div class=\"refs\">										";
			html += "			<div class=\"refs_title\">거부사유</div>						";
			html += "			<textarea class=\"refs_resn\" id=\"refs_resn\" name=\"refs_resn\"></textarea>";
			html += "			</div>														";
			html += "		</div>															";
			html += "	</div>																";
			html += "</form>																";
			return html;
		}
		
		//댓글Ajax
		function reloadComt(){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "reqsComtAjax",
				dataType : "json",
				data : params,
				success: function(res){
					drawList(res.list, res.comtCnt);
					drawPaging(res.cpb, "#cpage");
				},
				error : function(req, status, error){
					console.log("code : " + req.status);
					console.log("message : " + req.responseText);
				}
			});
		}
		
		//댓글
		function drawList(list, cnt){
			var html = "";
			if(cnt == 0){
				html += "<div class=\"data_req_wrap\">";
				html += "<div class=\"data_req\">데이터가 없습니다.</div>";
				html += "</div>";
			}else{
				for(var i = 0; i < list.length; i++){
					html += "<div class=\"comt_No\" name=\"" + list[i].COMT_NO + "\">";
					html += "<div class=\"emp_info\">" + "<b>" + list[i].EMP_NM + "</b>" + "</div>";
					html += "<div class=\"comt_area\">";
					html += "<div class=\"reqs_comt\">" + "<pre>" + list[i].COMT_CONT + "</pre>" + "</div>";
					html += "<div class=\"comt_date\">" + list[i].WRITE_DATE + "</div>";
					html += "</div>";
					html += "<div class=\"btn_wrap\">";
					 if(list[i].EMP_NM == '${sEmpNm}'){
						html += "<input type=\"button\" value=\"삭제\" class=\"comtDeleteBtn\">";
						html += "<input type=\"button\" value=\"수정\" class=\"comtUpdateBtn\" id=\"comtUpdateBtn\" name=" + list[i].COMT_NO + ">";
					}
					html += "</div>";
					html += "</div>";
				}
			}
			$(".reqs_comt_list").html(html);
		}
		
		//댓글 페이징
		function drawPaging(pb, name) {
		    var html = "";
	
		    if ($(name).val() == 1) {
		    	html += "<div class=\"arrow prev\" name=\"1\"></div>";
			    } else {
			    html += "<div class=\"arrow prev\" name =\""
			         + ($(name).val() - 1) + "\"></div> ";
			    }
	
			for (var i = pb.startPcount; i <= pb.endPcount; i++) {
			  	if ($(name).val() == i) {
			   		html += "<div class=\"page_on\" name=\"" + i + "\">" + i
			             + "</b></div> ";
			    } else {
			      html += "<div class=\"page\" name=\"" + i + "\">" + i
			           + "</div> ";
			    }
			}
			if ($(name).val() == pb.maxPcount) {
			  	html += "<div name =\"" +pb.maxPcount + "\"></div>";
			  	} else {
			  		html += "<div class=\"arrow next\" name =\""
			             + ($(name).val() * 1 + 1) + "\"></div> ";
			    }   
			$(".page_nation").html(html);
		}	
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
		<div class="contents_header_txt">게시글 상세조회</div> 
	</div>
	<div class="contents"> 
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" id="reqsNo" name="reqsNo" value = "${data.REQS_NO}"/>
			<input type="hidden" id="comtNo" name="comtNo"/>
			<input type="hidden" name="sEmpNo" id = "sEmpNo" value="${sEmpNo}" />
			<input type="hidden" name="page" value="${param.page}" />
			<input type="hidden" name="request_filter" value="${param.request_filter}" />
			<input type="hidden" id="cpage" name="cpage" value="1"/>
			<input type="hidden" id="eisCatgNo" name="eisCatgNo" value = "${data.EIS_CATG_NO}"/>
			<input type="hidden" id="proc_code" name="proc_code" value = "${data.PROC_CODE}"/>
			<input type="hidden" id="refs_txt" name="refs_txt" value = "${data.REFS_RESN}"/>
		<div class="request_process_page">
			<div class="request_page">
			<div class="request_user_area">
				<div class="request_user">작성자</div>
				<input type="text" class="request_user_name"  disabled="disabled" value = "${data.EMP_NM}">
				<input type="button" class="proc" id = "proc0" name = "proc0" value = "요청" />
				<input type="button" class="proc" id = "proc4" name = "proc4" value = "처리중" />
				<input type="button" class="proc" id = "proc1" name = "proc1" value = "처리완료" />
				<input type="button" class="proc" id = "proc2" name = "proc2" value = "거부" />
			</div>
				<div class="request_page1">
					<div class="request_title">제목</div>
					<input type="text" class="request_title_text" id = "request_title_text"
										name = "request_title_text" disabled="disabled" value = "${data.REQS_TITLE}">
				</div><br>
				<div class="request_page2">
					<div class="request_category">카테고리</div>
							<input type="text" class="request_category_text" name = "eisCatgNo" id = "eisCatgNo" disabled="disabled" value = "${data.EIS_CATG_NM}">
					<!-- <input type="button" class="category_search" id = "category_search" value="찾기"/> -->
				</div><br>
				<c:choose>
					<c:when test="${data.PROC_CODE eq '거부'}">
						<div class="request_page4">
							<div class="request_contents1">내용</div>
							<textarea class="request_contents_text1" id = "request_contents_text1"
										name = "request_contents_text1" disabled="disabled">${data.REQS_CONT}</textarea>
						</div><br>
						<div class="request_page5">
							<div class="reqs_refs">거부사유</div>
							<textarea class="reqs_refs_text" id = "refs_resn"
										name = "refs_resn" disabled="disabled">${data.REFS_RESN}</textarea>
						</div>
					</c:when>
					<c:otherwise>
						<div class="request_page3">
							<div class="request_contents">내용</div>
							<textarea class="request_contents_text" id = "request_contents_text"
										name = "request_contents_text" disabled="disabled">${data.REQS_CONT}</textarea>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>	
		<div class="button_area1">
			<input type="button" class="list_button" id = "list_button" value="목록"/>
			<c:if test = "${data.EMP_NM eq sEmpNm}">
				<c:if test="${data.PROC_CODE eq '요청'}">
					<input type="button" class="update_button" id = "update_button" value="수정"/>
				</c:if>
				<input type="button" class="delete_button" id = "delete_button" value="삭제"/>
			</c:if>
			
		</div>
		<!-- </form>
		<form action = "comtForm" id = "comtForm" method = "post"> -->
		<div class = "reqs_comt_area" id = "reqs_comt_area" name = "reqs_comt_area"><b>댓글</b>
			<div class = "reqs_comt_list" id = "reqs_comt_list" name = "reqs_comt_list">
			</div>
			<div id = "comt_page" class = "page_wrap">
				<div class = "page_nation"></div>
			</div>
			<div class = "reqs_comt_input">
				<div class = "input_area">
					<div class = "input_emp_info" id = "input_emp_info" name = "input_emp_info"><b>${sEmpNm}</b></div>
					<div class = "comt_input" id = "comt_input" name = "comt_input">
						<textarea class = "comt_txt" id = "comt_txt" name = "comt_txt"></textarea>
						<div class = "btn_area">
							<input type = "button" class = "cancel_Btn" id = "cancel_Btn" name = "cancel_Btn" value = "취소"/><br>
							<input type = "button" class = "comt_Add" id = "comt_Add" name = "comt_Add" value = "등록"/>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>