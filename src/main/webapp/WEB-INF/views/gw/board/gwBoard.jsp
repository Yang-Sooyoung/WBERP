
ll<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->

<title>전사 게시판</title>

<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 검색영역 변경 시 */
.default_search_area {
	width: 900px;
}

/* 목록영역 가로변경 시 */
.default_board {
	width: 900px;
}
table th {
	pointer-events: none;
}

.fav_page_wrap {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
}

.fav_paging {
	display: inline-block;
}

.fav_paging .none {
	display: none;
}

.fav_paging div {
	display: inline-block;
	vertical-align: top;
	margin: 0 3px;
	float: left;
	border: 1px solid #c2c2c2;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #f7f7f7;
	font-size: 10pt;
	border-radius: 3px;
	cursor: pointer;
}

.fav_paging .arrow {
	border: 1px solid #c2c2c2;
}

.fav_paging .prev {
	background: #f8f8f8 url('resources/images/common/left.png') no-repeat center center;
}

.fav_paging .next {
	background: #f8f8f8 url('resources/images/common/right.png') no-repeat center center;
}

.fav_paging div:hover, .fav_paging .page_on	{
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}
</style>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
$(document).ready(function(){
	reloadList();
	
	if('${param.searchGbn}' != '') {
		$("#searchGbn").val('${param.searchGbn}');
	}
	

	$(".boardList").on("click", "tr td:nth-child(n+2)", function(){
		$("#BOARD_NO").val($(this).parent().attr("name"));
		
		$("#actionForm").attr("action", "gwBoardDetail");
		$("#actionForm").submit();			
	});
	
	//별 클릭시 모양 변환
	$(".boardList").on("click", "tr #img_e", function(){
		$("#BOARD_NO").val($(this).parent().attr("name"));
		
		var params = $("#actionForm").serialize();
		
		
		$.ajax({ 
			type : "post",
			url : "gwBokImgAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				reloadList();
				
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	});
	
	// 글목록에서 즐겨찾기 해제
	$(".boardList").on("click","tr #img_y", function(){
		$("#BOARD_NO").val($(this).parent().attr("name"));
		
		var params = $("#actionForm").serialize();
		
		
		$.ajax({ 
			type : "post",
			url : "bokCancleAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				if(res.res == "SUCCESS"){
					reloadList();
				}
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});	
	});
	
	//즐겨찾기 페이지에서 즐겨찾기 해제
	$(".boardList").on("click", "tr #img_f", function(){
		$("#BOARD_NO").val($(this).parent().attr("name"));
		
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "bokCancleAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				if(res.res == "SUCCESS") {
					favList();
				}
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	});
	
	
	//검색
	$(".default_search_area").on("click","#searchGbn",function(){
		$("#page").val("1");
		reloadList();
	});
	
	//추가
	$(".search_btn_area").on("click","#addBtn", function(){
		$("#actionForm").attr("action", "gwBoardAdd");
		$("#actionForm").submit();
	});
	
	// 목록 페이지
	$(".page_nation").on("click", "div", function(){
		$("#page").val($(this).attr("name"));
		reloadList();
	});
	
	
	
	//즐겨찾기
	$(".default_search_area").on("click", "#bokBtn", function(){
		$(".page_wrap").remove();
		$(".fav_page_wrap").show();
		favList();
	});
	
	$(".fav_paging").on("click", "div", function(){
		$("#favPage").val($(this).attr("name"));	
		favList();
	});
	
	
	
});



// ajax
function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "boardAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			boardList(res.list,res.cnt);
			drawPaging(res.pb);
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}

//목록
function boardList(list, cnt) {
	var html ="";
	if(cnt == 0) {
		html +="<tr>";
		html +="<tr colspan=\"5\">데이터가 없습니다.</td>";
		html +="</tr>";
	} else {
		for(var i =0 ; i < list.length ; i++) {
			html += "<tr name=\"" + list[i].BNO + "\">";
			if(list[i].BKNO != null) {
				html += "<td id=\"img_y\" >";
				html += "<img src=\"resources/images/gw/yellow_star.png\" width=\"20px\" height=\"20px\"/>";
				html += "</td>";
			} else {
				html += "<td id=\"img_e\">";
				html += "<img src=\"resources/images/gw/star_empty.png\" width=\"20px\" height=\"20px\"/>";
				html += "</td>";
			}
			html += "<td>" + list[i].BNO +"</td>";
			html += "<td>" + list[i].BOARD_TITLE + "</td>";
			html += "<td>" + list[i].DEPT_NM + "<br />" + list[i].EMP_NM + "</td>";
			html += "<td>" + list[i].BOARD_DT + "</td>";
			html += "<td>" + list[i].BOARD_HIT + "</td>";
			html += "</tr>";
		}
	}
	
	$(".boardList tbody").html(html);
}

//페이징
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

// 즐겨찾기
function favList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "gwBoardBokAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			favorite(res.list, res.cnt);
			favPaging(res.favPb);
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}

// 즐겨찾기 목록
function favorite(list, cnt) {
	var html ="";
	
	if(cnt = 0) {
		html += "<tr>";
		html += "<td colspan=\"5\">데이터가 없습니다.</td>";
		html += "</tr>";	
	} else {
		for(var i = 0; i < list.length; i++) {
			html += "<tr name=\"" + list[i].BOARD_NO + "\">";
			html += "<td id=\"img_f\">";
			html += "<img src=\"resources/images/gw/yellow_star.png\" width=\"20px\" height=\"20px\"/>";
			html += "</td>";
			html += "<td>" + list[i].BOARD_NO +"</td>";
			html += "<td>" + list[i].BOARD_TITLE + "</td>";
			html += "<td>" + list[i].DEPT_NM + "<br />" + list[i].EMP_NM + "</td>";
			html += "<td>" + list[i].BOARD_DT + "</td>";
			html += "<td>" + list[i].BOARD_HIT + "</td>";
			html += "</tr>";
		}
	}
	$(".boardList tbody").html(html);
}

//즐겨찾기 페이징
function favPaging(favPb) {
	var html = "";

	if ($("#favPage").val() == 1) {
		html += "<div class=\"arrow prev\"></div>";
	} else {
		html += "<div class=\"arrow prev\" name =\"" + ($("#favPage").val() - 1) + "\"></div> ";
	}

	for (var i = favPb.startPcount; i <= favPb.endPcount; i++) {
		if ($("#favPage").val() == i) {
			html += "<div class=\"page_on\" name=\"" + i + "\">" + i + "</b></div> ";
		} else {
			html += "<div class=\"page\" name=\"" + i + "\">" + i + "</div> ";
		}
	}

	if ($("#favPage").val() == favPb.maxPcount) {
		html += "<div class=\"arrow next\" name =\"" +favPb.maxPcount + "\"></div>";
	} else {
		html += "<div class=\"arrow next\" name =\"" + ($("#favPage").val() * 1 + 1) + "\"></div> ";
	}

	$(".fav_paging").html(html);
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
		<div class="contents_header_txt">전사 게시판</div>
	</div>
	
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="EMP_NO" id="EMP_NO" value="${sEmpNo}" />
			<input type="hidden" name="BOARD_NO" id="BOARD_NO"/>
			<input type="hidden" name="page" id="page" value="1" />
			<input type="hidden" name="favPage" id="favPage" value="1" />
		
			<div class="default_search_area">
			<input type="button" id="bokBtn" value="즐겨찾기" />
				<select name="searchGbn" id="searchGbn">
					<option value="0">제목</option>
					<option value="1">내용</option>
					<option value="2">작성자</option>
				</select>
				<input type="text" name="searchTxt" value="${param.searchTxt}" placeholder="검색어" />
				<input type="button" id="searchBtn" value="검색" />
				<div class="search_btn_area">
					<input type="button" id="addBtn" value="등록" />
				</div>
			</div>
		</form>
		
		<div class="default_board">
			<table class="boardList">
					<colgroup>
						<col width="160px">
						<col width="160px">
						<col width="400px">
						<col width="160px">
						<col width="160px">
						<col width="160px">
					</colgroup>
					<thead>
						<tr class="top">
							<th>즐겨찾기</th>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
			<div class="page_wrap">
				<div class="page_nation"></div>
			</div>
			<div class="fav_page_wrap">
					<div class="fav_paging"></div>
				</div>
		</div>
	</div>
	
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
	
</body>
</html>