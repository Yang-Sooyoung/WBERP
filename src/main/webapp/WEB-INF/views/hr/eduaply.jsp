<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 신청자 조회</title>
<style type="text/css">
.default_search_area {
	width: 720px;
}
.default_board {
	width: 720px;
}

.page_wrap {
	width: 500px;
}

</style>
</head>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->

<script type="text/javascript">
$(document).ready(function() {
	if('${param.searchGbn}' != '') {
		$("#searchGbn").val('${param.searchGbn}');
	}
	
	reloadList();
	
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		reloadList();
	});
	
	$("#listBtn").on("click", function(){
		$("#actionForm").attr("action","eduDetail");
		$("#actionForm").submit();
	});
	
	$("#cancleBtn").on("click", function() {
		makeBtn2Popup(2, "신청 취소", "신청을 취소 하시겠습니까?", true, 400, 200,
			null, "예", function() {
				deleteEduaply();
				closePopup(2);
			}, "아니오", function() {
				closePopup(2);
			});
	});
	
	$(".page_nation").on("click", "div", function() {
		$("#page").val($(this).attr("name"));
		reloadList();
	});
	
	$("#addBtn").on("click", function() {
		makeBtn2Popup(2, "신청 확인", "신청 하시겠습니까?", true, 400, 200,
				null, "예", function() {
					addEduaply();
					closePopup(2);
				}, "아니오", function() {
					closePopup(2);
				});
		
	});
		
	function addEduaply(){
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "eduaplyAddAjax",
			dataType : "json", 
			data : params, 
			success : function(res) {
				if(res.res == "SUCCESS") {
					$("#actionForm").attr("action", "eduaply");
					$("#actionForm").submit();
				} else {
					$("#alert").attr("title", "알림");
					$("#alert p").html("저장에 실패했다"); 
					$("#alert").dialog({
						buttons: {
							Ok: function(){
								$(this).dialog("close");
							}	
						 }
					});
				}	
			},
			error : function(req,status,error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText );
			}
		});
}
	function deleteEduaply(){
		var params = $("#actionForm").serialize();
		
		$.ajax({ 
			type : "post", 
			url : "eduaplyDeleteAjax",
			dataType : "json",
			data : params,
			success : function(res){		
				if(res.res == "SUCCESS"){
					reloadList();
				}else{
					$("#alert").attr("title", "알림");
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
			error : function(req, status, error){ 
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
function drawList(list, cnt) {
	var html = "";
	
	if(cnt == 0) {
		html += "<tr>";
		html += "<td colspan=\"3\">신청자가 없습니다.</td>";
		html += "</tr>";
	} else {
		for(var i = 0 ; i < list.length ; i++) {
			html += "<tr name=\"" + list[i].EDU_NO + "\">";
			html += "<input type=\"hidden\" id=\""+list[i].EMP_NO+"\"  />";
			html += "<td>" + list[i].EMP_NM + "</td>";
			html += "<td>" + list[i].APLY_DAY + "</td>";
			html += "<td>" + list[i].STAT + "</td>";
			html += "</tr>";
		}  
	}
	$(".edu_aply tbody").html(html);
}

function drawPaging(pb) {
	var html = "";

	if ($("#page").val() == 1) {
		html += "<div class=\"arrow prev\"></div>";
	} else {
		html += "<div class=\"arrow prev\" name =\""
				+ ($("#page").val() - 1) + "\"></div> ";
	}

	for (var i = pb.startPcount; i <= pb.endPcount; i++) {
		if ($("#page").val() == i) {
			html += "<div class=\"page_on\" name=\"" + i + "\">" + i
					+ "</b></div> ";
		} else {
			html += "<div class=\"page\" name=\"" + i + "\">" + i
					+ "</div> ";
		}
	}

	if ($("#page").val() == pb.maxPcount) {
		html += "<div class =\"arrow next\"></div>";
	} else {
		html += "<div class=\"arrow next\" name =\""
				+ ($("#page").val() * 1 + 1) + "\"></div> ";
	}

	$(".page_nation").html(html);
}

function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "eduaplyListAjax",
		dataType : "json",
		data : params, 
		success : function(res) {
			drawList(res.list, res.cnt);
			drawPaging(res.pb);
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
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
		<div class="contents_header_txt">신청자 조회</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<!-- -->
			<input type="hidden" name="edu_no" id="edu_no" value="${param.edu_no}" />
			<input type="hidden" name="sEmpNo" id="sEmpNo" value="${sEmpNo}" />
			<input type="hidden" name="sign_pers" id="sign_pers" value="${param.sign_pers}" />
			<input type="hidden" name="page" id="page" value="${param.page}" />
		<div class="default_search_area">
			<select name ="searchGbn">
				<option value="0">사원명</option>
			</select>
				<input type="text" name="searchTxt" value="${param.searchTxt}"/>
				<input type="button" value="검색" id="searchBtn" />
			<div class="search_btn_area" >
					<input type="button" value="상세보기로" id="listBtn" />
					<input type="button" value="신청" id="addBtn" />
					<input type="button" value="신청취소" id="cancleBtn" />
			</div>
		</div>  
			<div class="default_board">
				<table class ="edu_aply">
					<colgroup>
						<col width="240px">
						<col width="240px">
						<col width="240px">
					</colgroup>
					<thead>
						<tr class="top">
							<th>사원명</th>
							<th>신청일</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div class="page_wrap">
					<div class="page_nation">
					</div>
				</div>
			</div>
		</form>
		</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>