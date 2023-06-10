<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
.search_area{
	display: inline-block;
	width: 1100px;
	height: 32px;
} 
.search{
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
.filter{
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

tr td{
	border-bottom: 1px solid #c2c2c2;
}

.button_area{
	display: inline-block;
	width: 300px;
	height: 32px;
	float: right;
}

.page_button_area{
	display: inline-block;
	width: 1100px;
	height: 30px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
}


.dasb_area{
	display: inline-block;
	width: 100%;
	height: 700px;
	background-color: #eaeaea;
}

.dasb_set_area, .widg_set_area{
	display: inline-block;
	width: calc(100% - 40px);
	height: 40px;
	margin-top: 20px;
	margin-left: 20px;
	/* background-color: white; */
}

.dasb_selc{
	display: inline-block;
	margin-top: 5px;
	margin-left: 5px;
	border: 0px;
	background-color: #eaeaea;
	font-size: 20px;
	font-weight: bold;
}

.dasb_set_name, .widg_set_name{
	display:inline-block;
	font-size: 15px;
	border: 1px solid ;
	margin-left: 5px;
}

.dasb_set_btn_area, .widg_set_btn_area{
	display: inline-block;
	margin-left: 5px;
}

.dash_add_btn{
	display: inline-block;
	margin-left: 5px;
}

.widg_state{
	display: inline-block;
	font-size: 15px;
	
}
.btnArea {
	margin-bottom: 10px;
}
.dasb_dateail, .widg_list_area{
	font-size: 15px;
	
}
.widg_list_area{
	margin-top: 5px;
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
$(document).ready(function(){
	$("#list_Btn").on("click", function(){
		$("#actionForm").attr("action", "dasbMang");
		$("#actionForm").submit();
	});
	
	$("#update_Btn").on("click", function(){
		$("#actionForm").attr("action", "dasbUpdate");
		$("#actionForm").submit();
	});
	
	$("#add_Btn").on("click", function(){
		$("#actionForm").attr("action", "widgAdd");
		$("#actionForm").submit();
	});
	
	$(".page_nation").on("click", "div", function() {
		$("#page").val($(this).attr("name"));
		reloadList();
	});
	
	$("tbody").on("click", "tr", function(){
		$("#WIDG_NO").val($(this).attr("name")); 
		$("#actionForm").attr("action", "widgDetail");
		$("#actionForm").submit();
		
	})	
	reloadList();
		
	$("#del_Btn").on("click", function(){
		if(confirm("삭제하시겠습니까?")){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "dasbDeleteAjax",
				dataType : "json",
				data : params,
				success: function(res){ 
					if(res.res == "SUCCESS"){
						$("#actionForm").attr("action", "dasbMang")
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
});



	function reloadList() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post", //데이터를 주고받는 방식
			url : "widgListAjax", // {키:값, 키:값}// ""데이터가 넘어갈 주소 (결과를 받을 주소)
			dataType : "json",
			data : params, // 보내는 데이터
			success : function(res) { // 성공 시 해당 함수 실행, 결과는 result로 받겠다.
				drawList(res.widg, res.cnt);
				drawPaging(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	function drawList(widg, cnt) {
		var html = "";

		if (cnt == 0) {
			html += "<tr>";
			html += "<td colspan=\"5\"> 데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
			for(var i = 0; i < widg.length; i++){
				html += "<tr name=\"" + widg[i].WIDG_NO + "\">";
				html += "<td>" + widg[i].WIDG_NO + "</td>";
				html += "<td>" + widg[i].DASB_NO + "</td>";
				html += "<td>" + widg[i].ATTCH_NO + "</td>";
				html += "<td>" + widg[i].TITLE + "</td>";
				html += "</tr>";
				
			}
		
			
		}
		
		$(".widg_list_area table tbody").html(html);

		
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
		<div class="contents_header_txt">대시보드 상세조회</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
		<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="DASB_NO" id="DASB_NO" value="${param.DASB_NO}"/>
			<input type="hidden" name="WIDG_NO" id="WIDG_NO" />
			<input type="hidden" name="page" id="page" value="${page}" />
			
			<div class="dasb_dateail">

				번호: ${list.DASB_NO}<br/>
				제목: ${list.DASB_NM}<br/>
				설명: ${list.EXPN}<br/>

			
			</div>
			<div class="btnArea">
			
				
				<input type="button" class="update_Btn" value="수정" id="update_Btn">
				<input type="button" class="del_Btn" value="삭제" id="del_Btn">
			</div>
			저장된 위젯 수 ${cnt} 
			<div class="contents_header_txt">위젯 조회</div>
			<div class="widg_list_area"> <!-- 위젯 리스트  -->
				<table class="widg_table">
				<colgroup>
					<col width="100px">
					<col width="100px">
					<col width="100px">
					<col width="300px">
					
				</colgroup>
				<thead>
					<tr class="top">
						<th>위젯 번호</th>
						<th>대시보드 번호</th>
						<th>장표 번호</th>
						<th>제목</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div class="btnArea">
			
				<input type="button" class="list_Btn" value="목록" id="list_Btn">
				<input type="button" class="add_Btn" value="추가" id="add_Btn">
				
				
			</div>
			
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