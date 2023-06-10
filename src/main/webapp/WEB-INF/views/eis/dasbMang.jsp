<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>대시보드관리</title>
<style type="text/css">
/* 개별 css는 여기에 */
th {
    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: -internal-center;
    background-color: #E4EAF2;
    height: 36px;
    
}
.dasb_table{
	border-collapse: collapse;
    text-align: center;
    border-color: #c2c2c2;
    margin-top: 10px;
    border-top: 2px solid #7f7f7f;
    border-bottom: 2px solid #7f7f7f;
    font-size: 10pt;
}
.search_area {
	display: inline-block;
	width: 1100px;
	height: 32px;
}

.search {
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

.search_button {
	width: 32px;
	height: 32px;
	border: 0px;
	border-radius: 3px;
	vertical-align: top;
	outline: none;
	cursor: pointer;
}

.filter {
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

tr td {
	border-bottom: 1px solid #c2c2c2;
	font-size: 14px;
}

.button_area {
	display: inline-block;
	width: 300px;
	height: 32px;
	float: right;
}

.page_button_area {
	display: inline-block;
	width: 1100px;
	height: 30px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
}

.dasb_area {
	display: inline-block;
	width: 100%;
	height: 700px;
	background-color: #eaeaea;
}

.dasb_set_area, .widg_set_area {
	display: inline-block;
	width: calc(100% - 40px);
	height: 40px;
	margin-top: 20px;
	margin-left: 20px;
	/* background-color: white; */
}

.dasb_selc {
	display: inline-block;
	margin-top: 5px;
	margin-left: 5px;
	border: 0px;
	/* background-color: #eaeaea; */
	font-size: 20px;
	font-weight: bold;
}

.dasb_set_name, .widg_set_name {
	display: inline-block;
	font-size: 15px;
	border: 1px solid;
	margin-left: 5px;
}

.dasb_set_btn_area, .widg_set_btn_area {
	display: inline-block;
	margin-left: 5px;
}

.dash_add_btn {
	display: inline-block;
	margin-left: 5px;
}

.widg_state {
	display: inline-block;
	font-size: 15px;
}

.dasb_list, .dasb_list_area{
	font-size: 15px;
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
$(document).ready(function() {
		$("#add_Btn").on("click", function() {
			$("#actionForm").attr("action", "dasbAdd");
			$("#actionForm").submit();
		});
		
		$(".page_nation").on("click", "div", function() {
			$("#page").val($(this).attr("name"));
			reloadList();
		});
		
		
		$("tbody").on("click", "tr", function(){
			$("#DASB_NO").val($(this).attr("name")); 
			$("#actionForm").attr("action", "dasbDetail");
			$("#actionForm").submit();
			
		})
		
		
	
	reloadList();
	});
	
	function reloadList() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post", //데이터를 주고받는 방식
			url : "dasbMangListAjax", // {키:값, 키:값}// ""데이터가 넘어갈 주소 (결과를 받을 주소)
			dataType : "json",
			data : params, // 보내는 데이터
			success : function(res) { // 성공 시 해당 함수 실행, 결과는 result로 받겠다.
				drawList(res.list, res.cnt);
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

		if (cnt == 0) {
			html += "<tr>";
			html += "<td colspan=\"5\"> 데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
			for(var i = 0; i < list.length; i++){
				html += "<tr name=\"" + list[i].DASB_NO + "\">";
				html += "<td>" + list[i].DASB_NO + "</td>";
				html += "<td>" + list[i].DASB_NM + "</td>";
				html += "</tr>";
				
			}
		
			
		}
		
		$(".dasb_list_area table tbody").html(html);

		
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
		<div class="contents_header_txt">대시보드 조회</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" id="DASB_NO" name="DASB_NO" value= />
			<input type="hidden" name="page" id="page" value="${page}" />
		</form>
		<!-- 
		<div class="default_search_area">
			<select>
				<option>제목</option>
				<option>내용</option>
			
			</select>
			
		</div>
			 -->
		<!-- 	<input type="text" placeholder="검색어" />
			 -->
			<div class="search_btn_area">
				<input type="button" id="add_Btn" value="등록" />
			</div>
			
			
		<div class="dasb_list_area">
		
		
			<table class="dasb_table">
				<colgroup>
					<col width="160px">
					<col width="400px">
					
				</colgroup>
				<thead>
					<tr class="top">
						<th>번호</th>
						<th>이름</th>
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