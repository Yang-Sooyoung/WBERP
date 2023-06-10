<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 문서목록</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 검색영역 가로변경 시 */
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
$(document).ready(function() {
	reloadList();
	
	if('${param.searchGbn}' != '') {
		$("#searchGbn").val('${param.searchGbn}');
	}
	
	//detail 이동
	$(".doclist").on("click", "tr td:nth-child(n+2)", function() { 
		$("#docmno").val($(this).parent().attr("name"));
		
		$("#actionForm").attr("action", "gwDocDetail");
		$("#actionForm").submit();
	});
	
	//별 버튼
	$(".doclist").on("click", "tr #img_e", function() {
		$("#docmno").val($(this).parent().attr("name"));
		
		var params = $("#actionForm").serialize();
		
		$.ajax({ 
			type : "post",
			url : "favImgAjax",
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
	
	//목록에서 해제
	$(".doclist").on("click", "tr #img_y", function() {
		$("#docmno").val($(this).parent().attr("name"));
		
		var params = $("#actionForm").serialize();
		
		$.ajax({ 
			type : "post",
			url : "favDeleteAjax",
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
	
	//즐겨찾기 목록에서 해제
	$(".doclist").on("click", "tr #img_f", function() {
		$("#docmno").val($(this).parent().attr("name"));
		
		var params = $("#actionForm").serialize();
		
		$.ajax({ 
			type : "post",
			url : "favDeleteAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				favList();
				
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	});
	
	//검색
	$(".default_search_area").on("click", "#searchBtn", function() {
		$("#page").val("1");
		reloadList();
	});
	
	//등록
	$(".search_btn_area").on("click", "#addBtn", function() {
		$("#actionForm").attr("action", "gwDocAdd");
		$("#actionForm").submit();
	});
	
	$(".page_nation").on("click", "div", function() {
		$("#page").val($(this).attr("name"));
		reloadList();
	});
	
	//즐겨찾기
	$(".default_search_area").on("click", "#bokBtn", function() {
		$(".page_wrap").remove();
		$(".fav_page_wrap").show();
		favList();
	});
	
	$(".fav_paging").on("click", "div", function() {
		$("#favPage").val($(this).attr("name"));
		favList();
	});
});

function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "docListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			docList(res.list, res.cnt);
			drawPaging(res.pb);
			
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}


//목록
function docList(list, cnt) {
	var html = "";
	
	if(cnt == 0) {
		html += "<tr>";
		html += "<td colspan=\"6\">데이터가 없습니다.</td>";
		html += "</tr>";
	} else {
		for(var i = 0; i < list.length; i++) {
			html += "<tr name=\"" + list[i].DNO + "\">";
			if(list[i].BKNO != null) {
				html += "<td id=\"img_y\" >";
				html += "<img src=\"resources/images/gw/yellow_star.png\" width=\"20px\" height=\"20px\"/>";
				html += "</td>";
			} else {
				html += "<td id=\"img_e\">";
				html += "<img src=\"resources/images/gw/star_empty.png\" width=\"20px\" height=\"20px\"/>";
				html += "</td>";
			}
			html += "<td>" + list[i].DNO +"</td>";
			html += "<td>" + list[i].DOCM_NM + "</td>";
			html += "<td>" + list[i].EMP_NM + " " + list[i].POSN_NM + "</br> (" + list[i].DEPT_NM + ") </td>";
			html += "<td>" + list[i].DOCM_REG_DATE + "</td>";
			html += "<td>" + list[i].DOCM_HIT + "</td>";
			html += "</tr>";
		}
	}
	$(".doclist tbody").html(html);
}

//즐겨찾기
function favList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "docFavAjax",
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

//즐겨찾기 목록
function favorite(list, cnt) {
	var html = "";
	
	if(cnt = 0) {
		html += "<tr>";
		html += "<td colspan=\"5\">데이터가 없습니다.</td>";
		html += "</tr>";
	} else {
		for(var i = 0; i < list.length; i++) {
			html += "<tr name=\"" + list[i].DOCM_NO + "\">";
			html += "<td id=\"img_f\">";
			html += "<img src=\"resources/images/gw/yellow_star.png\" width=\"20px\" height=\"20px\"/>";
			html += "</td>";
			html += "<td>" + list[i].DOCM_NO +"</td>";
			html += "<td>" + list[i].DOCM_NM + "</td>";
			html += "<td>" + list[i].DEPT_NM + "</br>" + list[i].EMP_NM + "</td>";
			html += "<td>" + list[i].DOCM_REG_DATE + "</td>";
			html += "<td>" + list[i].DOCM_HIT + "</td>";
			html += "</tr>";
		}
	}
	$(".doclist tbody").html(html);
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
		<div class="contents_header_txt">목록</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="empno" id="empno" value="${sEmpNo}" />
			<input type="hidden" name="docmno" id="docmno" />
			<input type="hidden" name="page" id="page" value="1" />
			<input type="hidden" name="favPage" id="favPage" value="1" />
			<div class="default_search_area">
				<input type="button" id="bokBtn" value="즐겨찾기" />
				<select name="searchGbn" id="searchGbn">
					<option value="0">제목</option>
					<option value="1">내용</option>
				</select>
				<input type="text" name="searchTxt" value="${param.searchTxt}" placeholder="검색어" />
				<input type="button" id="searchBtn" value="검색" />
				<div class="search_btn_area">
					<input type="button" id="addBtn" value="등록" />
				</div>
			</div>
		</form>
		<div class="default_board">
			<table class="doclist">
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