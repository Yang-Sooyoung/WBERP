<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 템플릿 목록</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>

<!-- css -->
<style type = "text/css">
.paging-area {
	display : inline-block;
}

.default_board {
	width: 800px;
}

/* 개별 css는 여기에 */
html, body {
	font-size: 0pt;
	margin: 0px;
	position: relative;
	width: 100%;
	height: 100%;
	min-width: 1280px;
}

.channel {
	display : inline-block;
	height : 30px;
}

.txt_ch {
	font-size : 10pt;
	display : inline-block;
	height : 30px;
	width : 40px;
	text-align : left;
	margin-left : 10px;
}

.select_ch {
	display : inline-block;	
	height : 30px;
	width : 100px;
}

.category {
	display : inline-block;
	height : 30px;
	padding-right : 10px;
	text-align : right;
}

.txt_tem {
	font-size : 10pt;
	display : inline-block;
	height : 30px;
	width : 130px;
	text-align : right;
	padding-right : 10px;
}

.select_cate {
	display : inline-block;
	height : 30px;
	width : 100px;
}

.temname {
	display : inline-block;
}

.txt_temname {
	font-size : 10pt;
	display : inline-block;
	height : 30px;
	width : 60px;
	text-align : right;
	padding: 0px 10px;
}

.temname_tbox {
	width : 200px;
}

.add_btn_area {
	display : inline-block;
	margin-left : 50px;
	vertical-align : top;
	float : right;
}

.addBtn {
	width : 50px;
	height : 30px;
	background-color: #f7f7f7;
	font-size: 10pt;
	border-radius: 3px;
	margin: 0 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
	cursor: pointer;
}


</style>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
	$(document).ready(function() {
	reloadList();	
	//채널, 카테고리 옵션 불러오기
	tempChanOptionAjax();
	tempCateOptionAjax();

	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		reloadList();
	});	
	
	$("#page_nation").on("click", "div", function() {
		$("#page").val($(this).attr("name"));
		console.log(("#page").val);
		reloadList();
	});
	
	$(".templist_table tbody").on("click", "tr", function() {
		$("#tempNo").val($(this).attr("name"));
		$("#actionForm").attr("action", "tempBoardDetail");
		$("#actionForm").submit();
	});
	
	$("#addBtn").on("click", function() {
		$("#actionForm").attr("action", "createTemp");
		$("#actionForm").submit();
	});

});
	function reloadList() {
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "tempListAjax",
			dataType : "json", 
			data : params, 
			success : function(res) {
				drawList(res.list, res.cnt);
				drawPaging(res.pb);
				console.log($("#page").val);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	function tempBoardDetail() {
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "tempDetailAjax",
			dataType : "json", 
			data : params,
			success : function(res) {
				drawDetail(res.board);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
		
	//목록 그리기
	function drawList(list, cnt) {
		var html = "";
		
			if(cnt == 0) {
				html += "<tr>";
				html += "<td colspn = \"5\">데이터가 없습니다.</td>";
				html += "<tr>";
			} else {
				for(var i = 0; i< list.length; i++) {
				html += "<tr name=\"" + list[i].TEMP_NO + "\">";
				html += "<td>" + list[i].TEMP_NO +"</td>";
				html += "<td>" + list[i].CHAN_TYPE +"</td>";
				html += "<td>" + list[i].CATG_NM +"</td>";
				html += "<td>" + list[i].TEMP_NM +"</td>";
				html += "<td>" + list[i].REG_DT +"</td>";
				html += "</tr>";
				}
			}
		$(".templist_table tbody").html(html);
	}
		
	//페이징 그리기
		function drawPaging(pb) {
			var html = "";
			
			if($("#page").val() == 1) {
				html += "<div class=\"arrow prev\" name =\"1\"></div> ";
			} else {
				html += "<div class=\"arrow prev\" name=\"" + ($("#page").val() - 1) + "\"> </div> ";
			}
			
			for(var i = pb.startPcount ; i <= pb.endPcount; i++) {
				if($("#page").val() == 1){
					html += "<div class=\"page\" name=\"" + i + "\"><b>" + i + "</b></div>";
				}
				else if($("#page").val() == i && $("#page").val() != 1){
					html += "<div class=\"page\" name=\"" + i + "\"><b>" + i + "</b></div>";
				}
				else {
					html += "<div name=\"" + i + "\">" + i + "</div> ";	
				}
			}
			
			if($("#page").val() == pb.maxPcount) {
				html += "<div class=\"arrow next\" name=\"" + pb.maxPcount + "\"></div>";
			} else {
				html += "<div class=\"arrow next\" name=\"" + ($("#page").val() * 1 + 1) + "\"></div> ";
			}
			
			$(".page_nation").html(html);
		}
	
		//채널 테이블 정보를 가져와 셀렉트박스 옵션에 그리기
		function tempChanOptionAjax(){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "tempChanOptionAjax",
				dataType : "json",
				data : params,
				success : function(res) {
					drawChanOption(res.chanList);
				},
				error : function(req, status, error) {
					console.log("code : " + req.status);
					console.log("message : " + req.responseText);
				}
			});		
		}
		
		function drawChanOption (chanList) {
			var html = "";
			html += "<option value = \"\">전체</option>";
			
					for(var i = 0; i< chanList.length; i++) {
					html += "<option value = \"" + chanList[i].CHAN_TYPE_NO + "\">" + chanList[i].CHAN_TYPE + "</option>";
					html += "</tr>";
				}
			$(".select_ch").html(html);
		}
		
		//카테고리 테이블 정보를 가져와 셀렉트박스 옵션에 그리기
		function tempCateOptionAjax(){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "tempCateOptionAjax",
				dataType : "json",
				data : params,
				success : function(res) {
					drawCateOption(res.cateList, res.cnt);
				},
				error : function(req, status, error) {
					console.log("code : " + req.status);
					console.log("message : " + req.responseText);
				}
			});		
		}
		
			function drawCateOption(cateList, cnt) {
				var html = "";
				html +=	"<option value = \"\">전체</option>"
					if(cnt == 0) {
						html += "<tr>";
						html += "<td colspn = \"5\">데이터가 없습니다.</td>";
						html += "<tr>";
					} else {
						for(var i = 0; i< cateList.length; i++) {
						html += "<option value = \"" + cateList[i].CATG_NO + "\">" + cateList[i].CATG_NM + "</option>";
						html += "</tr>";
						}
					}
				$(".select_cate").html(html);
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
		<div class="contents_header_txt">템플릿목록</div>
	</div>
	<div class="contents">
	<div class="contents_area">
		<div class="contents">
			<!-- 여기에 내용을 작성하시오. -->
			<form action="#" id = "actionForm" method = "post">
				<input type="hidden" name="tempNo" id="tempNo"/>
				<input type="hidden" id="top" name="top" value="${param.top}"/>
				<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}"/>
				<input type="hidden" name="page" id="page" value="${page}" />
			<div class="default_search_area">
				<div class="channel">
					<div class="txt_ch">채널</div>
						<select class="select_ch" name="select_ch" id="select_ch">
				
						</select>
				</div>
				<div class="category">
					<div class="txt_tem">템플릿 카테고리</div>
						<select class="select_cate" name="select_cate" id="select_cate">
						</select>
				</div>
				<div class="temname">
					<div class="txt_temname">템플릿명</div>
					<input class="temname_tbox" type="text" name = "searchTxt" value="${param.searchTxt}"/>
				</div>
				<div class="search_btn_area">
					<input type="button" name="searchBtn" id = "searchBtn" value="검색" />
				</div>
			</div>
			</form>
			<div class="default_board">
				<table class="templist_table">
					<colgroup>
						<col width="160px">
						<col width="180px">
						<col width="170px">
						<col width="170px">
						<col width="260px">
					</colgroup>
					<thead>
						<tr class="top">
							<th>번호</th>
							<th>채널</th>
							<th>카테고리</th>
							<th>템플릿명</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
				<div class="page_wrap">
					<div class="page_nation" name="page_nation" id = "page_nation">

					</div>
					<div class ="add_btn_area">
						<input type="button" class= "addBtn" name="addBtn" id="addBtn" value="추가" />
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>