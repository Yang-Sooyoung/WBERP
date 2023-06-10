<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - Sample Page</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->

<script type="text/javascript">
	$(document).ready(
			function() {
				if('${param.searchGbn}' != '') {
					$("#searchGbn").val('${param.searchGbn}');
				} 
				reloadList();
				$("#searchBtn").on("click", function() {
					$("#page").val("1");
					reloadList();
				});
				$("#addBtn").on("click", function() {
					$("#actionForm").attr("action", "CustComAdd");
				    $("#actionForm").submit();
				});
				$(".page_nation").on("click", "div", function() {
					$("#page").val($(this).attr("name"));
					reloadList();
				});
				$(".custlist_table tbody").on("click", "tr", function() { // 상세페이지
			      	$("#entpNo").val($(this).attr("name"));
			      	$("#actionForm").attr("action", "CustComDetail");
			      	$("#actionForm").submit();
			  	});
			});
	
	function reloadList(){
		var params=$("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "custCompInfoMangAjax",
			dataType : "json", // {키:값, 키:값}
			data : params, //보낼데이터
			success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
				drawList(res.list, res.cnt);
				drawPaging(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
				console.log("error : " + error);
			}
		});
	}
	//리스트 뿌려주기
	function drawList(list,cnt){
		var html = "";
		if(cnt==0){
			html +="<tr>";
			html +="<td colspan=\"7\">데이터가 없습니다.</td>";
			html +="</tr>";
		}else{
			for(var i=0; i<list.length; i++){
				html +="<tr name=\""+list[i].ENTP_NO+"\">";
				html +="<td>"+list[i].ENTP_NO+ "</td>";
				html +="<td>"+list[i].ENTP_NM+ "</td>";
				html +="<td>"+list[i].BUSN_NO+"</td>";
				html +="<td>"+list[i].DELG_NM+"</td>";
				html +="<td>"+list[i].DELG_TEL+"</td>";
				html +="<td>"+list[i].ENTP_ADDR+"</td>";
				html +="<td>"+list[i].ENTP_MODF_DATE+"</td>";
				html +="</tr>";
			}
		}
		$(".custlist_table tbody").html(html);
	}
	//페이징 부분
	function drawPaging(pb) {
		var html = "";

		if ($("#page").val() == 1) {
			html += "<div class=\"arrow prev\" name=\"1\"></div>";
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
			html += "<div name =\"" +pb.maxPcount + "\"></div>";
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
		<div class="contents_header_txt">고객사리스트</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
		<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			
			<input type="hidden" name="entpNo" id="entpNo" />
			<input type="hidden" name="page" id="page" value="${page}" />
			<div class="default_search_area">
				<select name="searchGbn" id="searchGbn">
					<option value="0">기업번호</option>
					<option value="1">기업명</option>
					<option value="2">사업자번호</option>
					<option value="3">대표자이름</option>
				</select>
				<input type="text" placeholder="검색어" name="searchTxt" value="${param.searchTxt}"/>
				<div class="search_btn_area">
					<input type="button" value="검색" id="searchBtn" />
					<input type="button" value="등록" id="addBtn" />
				</div>
			</div>
		</form>
		<div class="default_board">
			<table class="custlist_table">
				<colgroup>
					<col width="120px">
					<col width="240px">
					<col width="160px">
					<col width="160px">
					<col width="160px">
					<col width="320px">
					<col width="160px">
				</colgroup>
				<thead>
					<tr class="top">
						<th>기업번호</th>
						<th>기업명</th>
						<th>사업자번호</th>
						<th>대표자</th>
						<th>대표번호</th>
						<th>소재지</th>
						<th>최종수정일</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			
			<!-- 페이징 -->
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