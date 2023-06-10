<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 상신함</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<style>
.default_search_area {
	width: 800px;
}

/* 목록영역 가로변경 시 */
.default_board {
	width: 800px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var type="";
		if('${param.searchGbn}' != '') {
			$("#searchGbn").val('${param.searchGbn}');
		}
		reloadList();
		console.log(type);
		
		$("#SendList").on("click", "tr", function() {
			$("#aprvno").val($(this).attr("name"));
			$("#sampleForm").attr("action", "gwAppSendDetail");
			$("#sampleForm").submit();
		});
		
		$(".default_search_area").on("click", "#searchBtn", function() {
			$("#page").val("1");
			reloadList();
		});
		
		$(".search_btn_area").on("click", "#totalBtn", function() {
			$("#page").val("1");
			$("#searchTxt").val('');
			type="total";
			reloadList();
		});
		
		$(".search_btn_area").on("click", "#ingBtn", function() {  //상신함목록(진행)버튼
			$("#page").val("1");
			$("#searchTxt").val('');
			type="ing";
			ingloadList();
		});
		
		$(".search_btn_area").on("click", "#endBtn", function() {  //상신함목록(완료)버튼
			$("#page").val("1");
			$("#searchTxt").val('');
			type="end";
			endloadList();
		});
		
		$(".page_nation").on("click", "div", function() {
			if(type=="ing") {
				$("#page").val($(this).attr("name"));
				ingloadList();
			} else if(type=="end") {
				$("#page").val($(this).attr("name"));
				endloadList();
			} else {
				$("#page").val($(this).attr("name"));
				reloadList();
			}
		});
		
	});
	
	function reloadList() {
		var params = $("#sampleForm").serialize();
		$.ajax({
			type : "post",
			url : "AppSendListAjax",  //상신함목록Ajax
			dataType : "json",
			data : params, 
			success : function(res) { 
				drawList(res.list,res.cnt);
				drawPaging(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	function ingloadList() {
		var params = $("#sampleForm").serialize();
		$.ajax({
			type : "post",
			url : "AppSendList_ingAjax",  //상신함 진행목록Ajax
			dataType : "json",
			data : params, 
			success : function(res) { 
				drawList(res.list,res.cnt);
				drawPaging(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	function endloadList() {
		var params = $("#sampleForm").serialize();
		$.ajax({
			type : "post",
			url : "AppSendList_endAjax",  //상신함 완료목록Ajax
			dataType : "json",
			data : params, 
			success : function(res) { 
				drawList(res.list,res.cnt);
				drawPaging(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	
	function drawList(list, cnt) {
		var html = "";
		var stat="";
		if(cnt == 0) {
			html += "<tr>";
			html += "<td colspan=\"4\">데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
			for(var i = 0; i < list.length; i++){
				html += "<tr name=\""+list[i].APRV_NO+"\">";
				html += "<td>" +list[i].APRV_NO+ "</td>";
				html += "<td>" +list[i].APRV_TITLE+ "</td>";
				html += "<td>" +list[i].EMP_NM+" "+ list[i].POSN_NM+ "<br/>("+list[i].DEPT_NM+")</td>";
				
				if(list[i].REPY>0 || list[i].TOTAL==list[i].APP){
					html += "<td>완료</td>";	
				} else{
					html += "<td>진행</td>";
				}
				html += "</tr>";
			}
		}
		
		$("#SendList tbody").html(html);
		
	}
	
	function drawPaging(pb) {
	      var html = "";

	      if ($("#page").val() == 1) {
	         html += "<div class=\"arrow prev\"></div>";
	      } else {
	         html += "<div class=\"arrow prev\" name =\"" + ($("#page").val() - 1) + "\"></div> ";
	      }

	      for (var i = pb.startPcount; i <= pb.endPcount; i++) {
	         if ($("#page").val() == i) {
	            html += "<div class=\"page_on\" name=\"" + i + "\">" + i + "</b></div> ";
	         } else {
	            html += "<div class=\"page\" name=\"" + i + "\">" + i + "</div> ";
	         }
	      }

	      if ($("#page").val() == pb.maxPcount) {
	         html += "<div class=\"arrow next\" name =\"" +pb.maxPcount + "\"></div>";
	      } else {
	         html += "<div class=\"arrow next\" name =\"" + ($("#page").val() * 1 + 1) + "\"></div> ";
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
		<div class="contents_header_txt">상신함</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="sampleForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" id="page" name="page" value="${page}"/>
			<input type="hidden" name="empno" id="empno" value="${sEmpNo}" />
			<input type="hidden" name="aprvno" id="aprvno"  />
			
			<div class="default_search_area">
				<select name="searchGbn" id="searchGbn">
					<option value="0">제목</option>
					<option value="1">수신자</option>
				</select>
				<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
				<input type="button" id="searchBtn" value="검색" />
				<div class="search_btn_area">
					<input type="button" id="totalBtn" value="전체" />
					<input type="button" id="ingBtn" value="진행" />
					<input type="button" id="endBtn" value="완료" />
				</div>
			</div>
		</form>
			<div class="default_board">
				<table id="SendList">
					<colgroup>
						<col width="200px">
						<col width="440px">
						<col width="200px">
						<col width="200px">
					</colgroup>
					<thead>
						<tr class="top">
							<th>번호</th>
							<th>결재제목</th>
							<th>기안자</th>
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
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>