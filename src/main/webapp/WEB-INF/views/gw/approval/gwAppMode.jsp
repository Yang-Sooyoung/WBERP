<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 양식함</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<style type="text/css">
.default_search_area {
	width: 800px;
}
.default_board {
	width: 800px;
}
.default_search_area {
	height: 32px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		reloadList();

		$(".search_btn_area").on("click", "#addBtn", function() {
			$("#sampleForm").attr("action", "gwAppModeAdd");
			$("#sampleForm").submit();
		});
		
		$("#modeList").on("click", "tr", function() {
			$("#modeNo").val($(this).attr("name"));
			$("#sampleForm").attr("action", "gwAppModeDetail");
			$("#sampleForm").submit();
		});
		
		$(".page_nation").on("click", "div", function() {
			$("#page").val($(this).attr("name"));
			reloadList();
		});
		

	});

	function reloadList() {
		var params = $("#sampleForm").serialize();
		
		$.ajax({
			type : "post",
			url : "AppModeListAjax", //결재양식목록Ajax
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
		
		if(cnt == 0) {
			html += "<tr>";
			html += "<td colspan=\"2\">데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
			for(var i = 0; i < list.length; i++){
				html += "<tr name=\""+list[i].APRV_MODE_NO+"\">";
				html += "<td>" +list[i].APRV_MODE_NO+ "</td>";
				html += "<td>" +list[i].APRV_MODE_NM+ "</td>";
				html += "<td>" +list[i].APRV_MODE_EXPN+ "</td>";
				html += "</tr>";
			}
		}
		
		$("#modeList tbody").html(html);
		
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
		<div class="contents_header_txt">양식함</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="sampleForm" method="post">
		<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" id="page" name="page" value="${page}"/>
			<input type="hidden" name="modeNo" id="modeNo"/>
		</form>
		
		<div class="default_search_area">
			<div class="search_btn_area">
				<input type="button" value="등록" id="addBtn" />
			</div>
		</div>
		<div class="default_board">
			<table id="modeList">
				<colgroup>
					<col width="200px">
					<col width="200px">
					<col width="400px">
				</colgroup>
				<thead>
					<tr class="top">
						<th>양식번호</th>
						<th>양식이름</th>
						<th>양식설명</th>
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
	<c:import url="/bottom"></c:import>
</body>
</html>