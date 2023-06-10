<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP 공용 템플릿</title>
<style type="text/css">

/* 개별 css는 여기에 */
.cam_menu1 {
	height: 30px;
}

.cam_menu1_center {
	width: 1100px;
	height: 30px;
	margin: 0 auto;
}

.default_search_area {
	position: relative;
	width: calc(100% - 10px) !important;
	height: 30px;
}

.cam_menu1_date, .cam_menu1_state, .cam_menu1_custo, .cam_menu1_check, .cam_menu1_reset, .cam_menu1_newcam {
	display: inline-block;
	vertical-align: top;
	margin-left: 20px;
}

.cam_menu1_date {
	font-size: 10pt;
	margin-left: 50px;
}

.reset_img {
	width: 30px;
	height: 25px;
	cursor: pointer;
}

.cam_menu1_select {
	width: 100px;
	height: 25px;
	text-align-last: center;
	height: 25px;
}

.cam_main_list {
	font-size: 10pt;
	margin-top: 30px;
}

.cam_main_table {
	width: 100%;
	border-collapse: collapse;
}

.cam_main_table tbody tr:hover {
	background-color: #022859;
	color: #ffffff;
}

.cam_main_table th {
	border-top: 2px solid #000000;
	background-color: #e4eaf2;
}

.cam_main_table td, th {
	text-align: left;
	border-bottom: 1px solid #000000;
	padding: 10px;
}

.cam_menu1_search {
	display: inline-block;
	vertical-align: top;
}

.sear_img {
	width: 30px;
	height: 25px;
	cursor: pointer;
}
.cam_menu1_newcam {
	vertical-align: right;
}

.cam_menu1_check {
	display: inline-block;
	vertical-align: top;
	width: 120px;
	font-size: 10pt;
}

/* 팝업 크기변경 시 */
.pop_cus_field, .pop_cus_list1, .pop_cus_list2 {
	display: inline-block;
	vertical-align: top;
}

.pop_customer {
	width: 100%;
	height: 310px;
	border-bottom: 1px solid #9aa9bd;
}

.pop_cus_field {
	width: 400px;
	height: 100%;
}

.pop_cus_list2 {
	width: 300px;
	height: 100%;
}

.cus_list1 {
	border: 1px solid #9aa9bd;
	width: 300px;
	height: 288px;
	overflow-y: scroll;
}

.cus_field {
	font-size: 13px;
	margin-top: 15px;
}

.customer2 {
	margin-top: 3px;
	margin-left: 5px;
}

.customer2:hover {
	background-color: #4AA2D9;
}

.pop_cus_field>.underline>.con1 {
	width: 285px;
}

.pop_cus_field>.underline>.con2 {
	width: 100px;
}

.del_but_inline {
	display: inline-block;
	vertical-align: top;
}

.del_but {
	position: absolute;
	left: 765px;
	width: 30px;
	height: 30px;
	cursor: pointer;
	margin-top: 5px;
}

.ageTxt {
	width: 120px;
}
.a1 {
	color: blue;
}

.a2 {
	color: red;
}

.a3 {
	color: orange;
}

.a4 {
	color: yellow;
}

.a5 {
	color: green;
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<script type="text/javascript">
	var cdFlag1 = false;
	var cdFlag2 = false;
	
	$(document).ready(function() {
		comnCode(6);
		comnCode(7);
		
		//캠페인수정		
		$("tbody").on("click", "tr", function() {
			$("#campno").val($(this).attr("name"));
			$("#actionForm").attr("action", "campModf");
			$("#actionForm").submit();
		});
		
		//캠페인 등록페이지로 이동
		$("#campBtn").on("click", function() {
			$("#actionForm").attr("action", "campEnroll");
			$("#actionForm").submit();
		});

		//검색버튼
		$("#searchBtn").on("click", function() {
			$("#page").val("1");
			reloadList();
		});

		//체크박스
		$("#checkbox").on("click", function() {
			if ($("#checkbox").is(":checked")) {
				$("#checkbox").val("1");
				console.log($("#checkbox").val());
				reloadList();
			} else {
				$("#checkbox").val("");
				console.log($("#checkbox").val());
				reloadList();
			}
		});

		//리셋버튼
		$("#resetBtn").on("click", function() {
			$("#serachstat").val("-1");
			$("#serachregl").val("-1");
			$("#startdate").val("");
			$("#enddate").val("");
			$("#checkbox").removeAttr("checked");
			reloadList();
		});

		//페이징
		$(".page_nation").on("click", "div", function() {
			$("#page").val($(this).attr("name"));
			reloadList();
		});

	});

	//공통코드
	function comnCode(bigFrac) {
		$.ajax({
			type : "post",
			url : "getComnCodeAjax",
			dataType : "json",
			data : "bigFrac=" + bigFrac,
			success : function(res) {
				comnType(res.comnCode, bigFrac);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	//공통코드
	function comnType(comnCode, bigFrac) {
		var html = "";
		console.log(bigFrac);
		if (bigFrac == 6) {
			html += "<option value=\"-1\">--유형--</option>";
			for (var i = 0; i < comnCode.length; i++) {
				html += "<option value="+comnCode[i].SMAL_FRAC+">"
						+ comnCode[i].CODE_NM + "</option> ";
			}
			$("#serachregl").html(html);
			cdFlag1 = true;
		}

		if (bigFrac == 7) {
			html += "<option value=\"-1\">--진행 상태--</option>";
			for (var i = 0; i < comnCode.length; i++) {
				html += "<option value="+comnCode[i].SMAL_FRAC+">"
						+ comnCode[i].CODE_NM + "</option> ";
			}

			$("#serachstat").html(html);
			cdFlag2 = true;
		}

		if (cdFlag1 && cdFlag2) {
			reloadList();
			cdFlag1 = false;
			cdFlag2 = false;
		}
	}

	//목록아작스
	function reloadList() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "campListAjax",
			dataType : "json", // {키:값, 키:값}
			data : params, //보낼데이터
			success : function(res) { //성공 시 해당 함수 실행. 결과는 res로 받겠다.
				drawList(res.list, res.cnt);
				drawPaging(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	//목록
	function drawList(list, cnt) {
		var html = "";
		if (cnt == 0) {
			html += "<tr>";
			html += "<td colspan=\"5\">데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
			for (var i = 0; i < list.length; i++) {
				html += "<tr name=\"" + list[i].CAMP_NO + "\">";
				html += "<td>" + list[i].CAMP_NO + "</td>";
				html += "<td>" + list[i].CAMP_NM + "</td>";
				html += "<td>" + list[i].START_PERD + " ~ " + list[i].END_PERD
						+ "</td>";
				html += "<td class=\"a"+list[i].REGL_SORT_CODE+"\">"
				html += list[i].REGL_SORT_CODE_NM + "</td>";
				html += "<td class=\"a"+list[i].STAT_CODE+"\">"
				html += list[i].STAT_CODE_NM + "</td>";
				html += "</tr>";
			}
		}

		$(".cam_main_table tbody").html(html);
	}

	//페이징
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
		<div class="contents_header_txt">캠페인 목록</div>
	</div>
	<!-- Contents -->
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 메뉴 시작 -->
		<form action="#" method="post" id="actionForm">
			<input type="hidden" name="sEmpNo" id="sEmpNo" value="${sEmpNo }" />
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" id="campno" name="campno" value="${param.campno}" />
			<input type="hidden" name="page" id="page" value="${page }" />
			<div class="cam_menu1">
				<div class="cam_menu1_center">
				<div class="default_search_area">
					<div class="cam_menu1_date">
						캠페인 기간
						<input id="startdate" name="startdate" type="date" min="2015-01-01" max="2021-12-31" />
						~
						<input id="enddate" name="enddate" type="date" min="2015-01-01" max="2021-12-31" />
					</div>
					<div class="cam_menu1_custo">
						<!-- 유형 -->
						<select class="cam_menu1_select" name="serachregl" id="serachregl">

						</select>
					</div>
					<div class="cam_menu1_state">
						<!-- 진행상태 -->
						<select class="cam_menu1_select" name="serachstat" id="serachstat">

						</select>
					</div>
					<div class="cam_menu1_check">
						<input type="checkbox" value="" id="checkbox" name="checkbox">
						나의 결제사항
					</div>
					<div class="cam_menu1_search">
						<img id="searchBtn" class="sear_img" src="resources/images/crm/campaign/search.png">
					</div>
					<div class="cam_menu1_reset">
						<img id="resetBtn" class="reset_img" src="resources/images/crm/campaign/reset.png">
					</div>
					<div class="cam_menu1_newcam">
						<input id="campBtn" type="button" value="캠페인 등록" class="newcam" />
					</div>
				</div>
				</div>
			</div>
		</form>
		<!-- 메뉴 끝 -->
		<!-- 캠페인 목록 시작 -->
		<div class="cam_main_list">
			<table class="cam_main_table">
				<thead>
					<tr>
						<th>캠페인 번호</th>
						<th>캠페인 명</th>
						<th>캠페인 기간</th>
						<th>유형</th>
						<th>진행 상태</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<!-- 캠페인 목록 끝 -->
		<div class="page_wrap">
			<div class="page_nation"></div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>

</body>
</html>
