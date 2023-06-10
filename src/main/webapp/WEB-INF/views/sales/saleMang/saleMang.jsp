<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 영업관리</title>
<style type="text/css">
/* 검색영역 가로변경 시 */
.default_search_area {
	width: 800px;
	min-height: 40px;
}

/* 목록영역 가로변경 시 */
.default_board {
	width: 800px;
}

/* 개별 css는 여기에 */
.contents{
	font-size: 10pt;
}
.btn_area{
	float: right;
}
.sales_searchBox{
	height: 120px;
	background-color: #E4EAF2;
	font-size: 10pt;
	border-radius: 5px;
	padding: 20px;
	box-shadow: 1px 1px 4px #c2c2c2;
}
.sales_searchBox1{
	padding-bottom: 15px;
}
.sales_searchBox_productName{
	display: inline-block;
	width: 60px;
	font-weight: bold;
	color: #022859;
}
.sales_searchBox_productName_box{
	display: inline-block;
	width: 160px;
}
.sales_searchBox_employeeName{
	display: inline-block;
	width: 60px;
	margin-left: 15px;
	font-weight: bold;
	color: #022859;
}
.sales_searchBox_employeeName_box{
	display: inline-block;
	width: 160px;
}
.sales_searchBox_customerName{
	display: inline-block;
	width: 60px;
	font-weight: bold;
	color: #022859;
}
.sales_searchBox_customerName_box{
	display: inline-block;
	width: 160px;
}
.sales_searchBox_companyName{
	display: inline-block;
	margin-left: 15px;
	width: 60px;
	font-weight: bold;
	color: #022859;
}
.sales_searchBox_companyName_box{
	display: inline-block;
	width: 160px;
}
.sales_searchBox2{
	padding-top: 15px;
}
.sales_searchBox_projectName{
	display: inline-block;
	width: 60px;
	font-weight: bold;
	color: #022859;
}
.sales_searchBox_projectName_box{
	display: inline-block;
	width: 585px;
}
.sales_searchBox_period1{
	display: inline-block;
	width: 60px;
	font-weight: bold;
	color: #022859;
}

.sales_searchBox_period2{
	display: inline-block;
	margin-left: 15px;
	width: 60px;
	font-weight: bold;
	color: #022859;
}
.sales_searchBox_periodBox{
	display: inline-block;
	width: 160px;
}
.sales_searchBox_condition{
	display: inline-block;
	margin-left: 15px;
	width: 60px;
	font-weight: bold;
	color: #022859;
}
.sales_searchBox_condition_box{
	display: inline-block;
	width: 75px;
}
.sales_searchBox_btn{
	display: inline-block;
	background-color: #022859;
	margin-left: 30px;
	border: 0px;
	color: #FFFFFF;
	width: 100px;
	height: 40px;
	border-radius: 5px;
}
.sales_searchResult{
	margin-top: 20px;
	margin-bottom: 20px;
}
.sales_searchResult_number{
	display: inline-block;
}
.sales_searchResult_sort{
	display: inline-block;
	float: right;
}
</style>
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
			
			$("#addBtn").on("click", function() {
				$("#actionForm").attr("action", "saleMangAdd");
				$("#actionForm").submit();
			});
			
			$("#searchBtn").on("click", function() {
				console.log(1);
				$("#page").val("1");
				reloadList();
			});
			
			$(".page_nation").on("click", "div", function() {
				$("#page").val($(this).attr("name"));
				reloadList();
			});
			
			$(".default_board").on("click", "tr", function() {
				$("#saleNo").val($(this).attr("name"));
				$("#custNo").val($(this).attr("id"));
				
				$("#actionForm").attr("action", "saleMangDetail");
				$("#actionForm").submit();
			});
			
	});
	
	function reloadList() {
		$("#formOrderGbn").val($("#orderGbn").val());
		
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "saleMangAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				drawList(res.list, res.cnt);
				drawPaging(res.pb);
			},
			error: function(req, status, error){ 
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
				console.log("error : " + req.error);
			}
		});
	}
	
	function drawList(list, cnt) {
		var html = "";
		if(cnt == 0) {
			html += "<tr>";
			html += "<td colspan=\"8\">데이터가 없습니다.</td>";
			html += "</tr>";
		} else{
			for(var i=0; i<list.length; i++) {
				html += "<tr name=\"" + list[i].SALE_NO + "\"id=\"" + list[i].CUST_NO + "\">";
				html += "<td>" + list[i].SALE_NO + "</td>";
				html += "<td>" + list[i].SALE_NM + "</td>";
				html += "<td>" + list[i].CUST_NM + "</td>";
				html += "<td>" + list[i].ENTP_NM + "</td>";
				html += "<td>" + list[i].EMP_NM + "</td>";
				html += "<td>" + list[i].START_DAY + "</td>";
				html += "<td>" + list[i].END_DAY + "</td>";
				html += "<td>" + list[i].CODE_NM + "</td>";
				html += "</tr>";
			}
		}
		$("table tbody").html(html);
	}

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
		<div class="contents_header_txt">영업관리</div>
	</div>
	<div class="contents">
		<form action="#" method="post" id="actionForm">
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="page" id="page" value="${page}" />
			<input type="hidden" name="saleNo" id="saleNo" />
			<input type="hidden" name="custNo" id="custNo" />
			<input type="hidden" name="orderGbn" id="formOrderGbn" />
		
		<div class="default_search_area">
			<div class="search_btn_area">
				<input type="button" value="등록" id="addBtn"/>
			</div>
		</div>
		<div class="default_search_area">
			<div class="sales_searchBox">
				<div class="sales_searchBox1">
					<div class="sales_searchBox_customerName">고객명</div>
					<input class="sales_searchBox_customerName_box" type="text" name="custNm" id="custNm" />
					<div class="sales_searchBox_companyName">고객사명</div>
					<input class="sales_searchBox_companyName_box" type="text" name="entpNm" id="entpNm" />
					<div class="sales_searchBox_employeeName">담당자명</div>
					<input class="sales_searchBox_employeeName_box" type="text" name="empNm" id="empNm" />
				</div>
				<div class="sales_searchBox_period1">시작일</div>
				<input type="date" class="sales_searchBox_periodBox" name="startDay" id="startDay" />
				<div class="sales_searchBox_period2">종료일</div>
				<input type="date" class="sales_searchBox_periodBox" name="endDay" id="endDay" />
					<div class="sales_searchBox_condition">진행현황</div>
					<select class="sales_searchBox_condition_box" name="searchGbn" id="searchGbn">
						<option>전체</option>
						<option value="0">제안</option>
						<option value="1">협상</option>
						<option value="2">계약</option>
					</select>
				<div class="sales_searchBox2">
					<div class="sales_searchBox_projectName">영업명</div>
					<input class="sales_searchBox_projectName_box" type="text" name="saleNm" id="saleNm" />
					<input type="button" value="검 색" id="searchBtn"/>
				</div>				
			</div>
		</div>	
		</form>

		<div class="default_board">
			<table>
				<colgroup>
					<col width="80px">
					<col width="240px">
					<col width="80px">
					<col width="80px">
					<col width="80px">
					<col width="80px">
					<col width="80px">
					<col width="80px">
				</colgroup>
				<thead>
					<tr class="top">
						<th>영업번호</th>
						<th>영업명</th>
						<th>고객명</th>
						<th>고객사명</th>
						<th>담당자</th>
						<th>시작일</th>
						<th>종료일</th>
						<th>진행현황</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>	
			<div class="page_wrap">
				<div class="page_nation"></div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>