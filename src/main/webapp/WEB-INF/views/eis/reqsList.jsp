<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>요청게시판</title>
<style type="text/css">
/* 개별 css는 여기에 */
.search_area{
	display: inline-block;
	width: 1100px;
	height: 32px;
} 
.searchTxt{
	width: 200px;
	height: 28px;
	font-size: 14px;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	margin: 0 3px;
	padding: 1px 2px;
	outline: none;
	vertical-align: top;
}
.search_button{
	width: 32px;
	height: 32px;
	border: 0px;
	border-radius: 3px;
	vertical-align: top;
	outline: none;
	cursor: pointer;
}
.search_filter{
	background-color: #f7f7f7;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	font-size: 14px;
	width: 70px;
	height: 32px;
	margin: 0 3px;
	padding: 1px 2px;
	outline: none;
	vertical-align: top;
}
.request_area{
	display: inline-block;
	width:1100px;
	margin-top: 10px;
}
.request{
	width: 1100px;
	border-top: 2px solid #7f7f7f;
	border-bottom: 2px solid #7f7f7f;
	border-spacing: 0px;
}
.request_head{
	font-size: 11pt;
	color: #292d33;
	background-color: #E4EAF2;
}
.request_head_top{
	height: 45px;
}
.request_head1{
	width: 7%;
}
.request_head2{
	width: 33%;
}
.request_head3, .request_head4, .request_head5{
	width: 15%;
}
.request_head5_filter{
	width: 100px;
	border-color: #E4EAF2; 
	color: #292d33;
	background-color: #E4EAF2;
	font-size: 11pt;
	font-weight: bold;
	outline: none;
}
.request_post{
	font-size: 10pt;
	text-align: center;
}
.request_post tr{
	height : 45px;
}
tr td{
	border-bottom: 1px solid #c2c2c2;
}
.request_post tr td:nth-child(2){
	cursor: pointer;
}
.request_post tr:hover{
	background-color: #022859;
	color: #fff;
}
.button_area{
	display: inline-block;
	width: 300px;
	height: 32px;
	float: right;
}
.reqs_list, .reqs_add{
	width: 80px;
	height: 32px;
	font-size: 14px;
	background-color: #f7f7f7;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	margin: 0 3px;
	padding: 1px 2px;
	float: right;
	outline: none;
}
.reqs_list:hover, .reqs_add:hover{
	background-color: #022859; 
	color: #fff;
	cursor: pointer;
}
.page_button_area{
	display: inline-block;
	width: 1100px;
	height: 30px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
}
.request_button_page1{
	width: 28px;
	height: 28px;
	background-color: #022859;
    color: #fff;
    border: 1px solid #022859;
	border-radius: 3px;
	margin: 3px 3px;
}
.request_button_left, .request_button_right, 
.request_button_page2, .request_button_page3{
	width: 28px;
	height: 28px;
	background-color: #f7f7f7;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	margin: 3px 3px;
	cursor: pointer;
}
.request_button_left:hover, .request_button_right:hover, 
.request_button_page1:hover, .request_button_page2:hover, .request_button_page3:hover{
	background-color: #022859;
	color: #fff;
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
$(document).ready(function(){
	if('${param.search_filter}' != ''){
		$("#search_filter").val('${param.search_filter}')
	}
	
	if('${param.request_filter}' != ''){
		$("#request_filter").val('${param.request_filter}')
	}
	
	reloadList();
	
	$("#search_button").on("click", function(){
		$("#page").val("1");
		reloadList();
	})
	
	$("#reqs_list").on("click", function(){
		$("#searchTxt").val("");
		$("#request_filter").val("");
		reloadList();
	});
	
	$(".page_nation").on("click", "div", function() {
		$("#page").val($(this).attr("name"));
		reloadList();
	});
	
	$("tbody").on("click", "tr", function(){
		$("#reqsNo").val($(this).attr("name"));
		$("#actionForm").attr("action", "reqsDetail");
		$("#actionForm").submit(); 
	})
	
	$("#reqs_add").on("click", function() {
		$("#actionForm").attr("action", "reqsAdd");
		$("#actionForm").submit();
	});
	
	$("#request_filter").on("change", function(){
        console.log($(this).find("option[value='" + $(this).val() + "']").text());
        console.log($("#request_filter").val());
        console.log($("select[id = request_filter] option:selected").text());
        $("#page").val("1");
		reloadList();
    });
	
	
})
	
	function reloadList(){
	
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "reqsListAjax",
			dataType : "json",
			data : params,
			success: function(res){
				drawList(res.list, res.cnt);
				drawPaging(res.pb);
			},
			error : function(req, status, error){
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	function drawList(list, cnt){
		var html = "";
		
		if(cnt == 0){
			html += "<tr>";
			html += "<td colspan=\"5\">데이터가 없습니다.</td>";
			html += "</tr>";
		}else{
			for(var i = 0; i < list.length; i++){
				html += "<tr name=\"" + list[i].REQS_NO + "\">";
				html += "<td>" + list[i].REQS_NO + "</td>";
				html += "<td>" + list[i].REQS_TITLE + "</td>";
				html += "<td>" + list[i].EMP_NM + "</td>";
				html += "<td>" + list[i].REQS_DATE + "</td>";
				html += "<td>" + list[i].PROC_CODE + "</td>";
				html += "</tr>";
			}
		}
		
		$(".request_area table tbody").html(html);
	}
	
	function drawPaging(pb) {
		var html = "";

		if ($("#page").val() == 1) {
			html += "<div class=\"arrow prev\" name=\"1\"></div>";
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
			html += "<div name =\"" +pb.maxPcount + "\"></div>";
		} else {
			html += "<div class=\"arrow next\" name =\""
					+ ($("#page").val() * 1 + 1) + "\"></div> ";
		}

		$(".page_nation").html(html);
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
		<div class="contents_header_txt">요청목록</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
		<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" id="reqsNo" name="reqsNo" />
			<input type="hidden" name="page" id="page" value="${page}" />
			<input type="hidden" id="catgNo" name="catgNo" value = "${param.EIS_CATG_NO}"/>
			<input type="hidden" id="refs_txt" name="refs_txt" value = "${param.REFS_RESN}"/>
		<div class="request_process_page">
			<div class="search_area">
				<select class="search_filter" id = "search_filter" name = "search_filter">
					<option value = "0">제목</option>
					<option value = "1">작성자</option>
				</select>
				<input type="text" class="searchTxt" id = "searchTxt" name = "searchTxt" placeholder="검색어" value="${param.searchTxt}">
				<button type="button" class="search_button" id = "search_button"><img src="resources/images/eis/search.png" width="20" height="20"></button>
				<div class="button_area">
					<input type="button" id = reqs_list class="reqs_list" value="목록"/>
					<input type="button" id = reqs_add class="reqs_add" value="등록"/>
				</div>
			</div><br>
			<div class="request_area">
				<table class="request">
					<thead class="request_head">
						<tr class="request_head_top">
							<th class="request_head1">번호</th>
							<th class="request_head2">제목</th>
							<th class="request_head3">작성자</th>
							<th class="request_head4">요청일자</th>
							<th class="request_head5">
								<select class="request_head5_filter" id = "request_filter" name = "request_filter">
									<option value = "" selected="selected">처리상태</option>
									<option value = "0">요청</option>
									<option value = "4">처리중</option>
									<option value = "1">처리완료</option>
									<option value = "2">거부</option>
								</select></th>
						</tr>
					</thead>
					<tbody class="request_post">
					</tbody>
				</table>
				<div class="page_wrap">
					<div class="page_nation"></div>
				</div>
			</div>
		</div>
		</form>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>