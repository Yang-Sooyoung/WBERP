<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 연차생성 조회</title>
<style type="text/css">
.default_search_area, .default_board, .page_wrap {
	width: 600px !important;
}
.info_txt, .menu1_txt, .gnb_txt, .contents_header {
	cursor: default;
}
.logo, select:hover, #updateBtn:hover, #cancelBtn:hover {
	cursor: pointer;
}
#searchGbn2 {
	float: right;
}
#ch2, #saveBtn, #cancelBtn, .cont2 {
	display: none;
}
#tx1, #tx2, #tx3, #tx4, #tx5, #tx6 {
	display: none;
	width: 75px;
	height: 31.5px;
}
#tx7 { /* cont1 크기 수정  */
	display: none;
	width: 75px !important;
	height: 31.5px; !important;
    padding: inherit;
}
.cont2 {
	max-width: 75px !important;
	max-height: 40px !important;
}
.anulprod {
	max-width: 600px;
	max-height: 245px;
	overflow-y: scroll;
}
.default_board table th {
    color: #3c3c3d;
    font-size: 11pt;
    cursor: default !important;
}
.default_board table tbody tr {
    height: 40px;
    border-top: 1px solid #c2c2c2;
    cursor: default !important;
    background-color: inherit !important;
	color: inherit !important;
}
</style>
</head>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
$(document).ready(function() {
	/* 검색 구분 */
	if('${param.searchGbn}' != '') {
		$("#searchGbn").val('${param.searchGbn}');
	}
	if('${param.searchGbn2}' != '') {
		$("#searchGbn2").val('${param.searchGbn2}');
	}
	reloadList();
	/* 필터링 체인지 */
	$("#searchGbn2").on("change", function() {
		$("#searchBtn").trigger('click');
	});
	/* 검색 페이징 유지 */
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		reloadList();
	});
	/* 페이징 */	
	$(".page_nation").on("click", "div", function() {
		$("#page").val($(this).attr("name"));
		reloadList();
	});
	/* 수정  */
	$(document).off("click.updateBtn").on("click.updateBtn", "#updateBtn", function() {
		$("#anul_prod_no").val($(this).parent().parent().attr("name")); /* 글번호 */
		var currentRow = $(this).closest("tr"); /* 클릭된 곳 가장 가까운 tr */
		$("#ocur_anul").val($(currentRow.find("td:eq(-2)").children('#tx7')).val()); /* 발생연차 */
		currentRow.find("td:eq(-1)").children('#updateBtn').css('display', 'none'); /* 수정버튼  */
		currentRow.find("td:eq(-1)").children('#cancelBtn').css('display', 'table-cell'); /* 취소버튼  */
		currentRow.find("td:eq(-2)").css('display', 'table-cell'); /* 입력창 */
		currentRow.find("td:eq(-2)").children('#tx7').css('display', 'table-cell'); /* 입력창 */
		currentRow.find("td:eq(-2)").children('#tx7').attr("name");
		currentRow.find("td:eq(-3)").css('display', 'none'); /* 정보 */
		currentRow.find("td:eq(-3)").children('#ap').css('display', 'none'); /* 정보 */
		$("#ch1").hide();
 		$("#ch2").css('display', 'table-cell');
		$("#saveBtn").show(); /* 저장버튼  */
	/* 저장  */
	$(document).off("click.saveBtn").on("click.saveBtn", "#saveBtn", function() {
		$("#ocur_anul").val($(currentRow.find("td:eq(-2)").children('#tx7')).val()); /* 발생연차 */
			if($("#tx7").val() == "") {
				alert("발생연차를 입력해주세요.");
				$("#tx7").focus();
			} else {
				makeBtn2Popup(1, "연차생성 수정", "수정하시겠습니까?", true, 400, 200, 
					      null, "저장", function() {
								var params = $("#actionForm").serialize();
								$.ajax({
									type : "post",
									url : "anulProdUpdateAjax",
									dataType : "json", // {키:값, 키:값}
									data : params, //보낼데이터
									success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
										if (res.res == "SUCCESS") {
											$("#anul_prod_no").val($(this).parent().parent().attr("name")).val(""); /* 글번호 */
											currentRow.find("td:eq(-1)").children('#updateBtn').css('display', 'table-cell'); /* 수정버튼  */
											currentRow.find("td:eq(-1)").children('#cancelBtn').css('display', 'none'); /* 취소버튼  */
											currentRow.find("td:eq(-2)").css('display', 'none'); /* 입력창 */
											currentRow.find("td:eq(-2)").children('#tx7').css('display', 'none'); /* 입력창 */
											currentRow.find("td:eq(-3)").css('display', 'table-cell'); /* 정보 */
											currentRow.find("td:eq(-3)").children('#ap').css('display', 'table-cell'); /* 정보 */
											$("#ch1").show();
									 		$("#ch2").hide();
											$("#saveBtn").hide(); /* 저장버튼  */
											reloadList();
										} else if(res.res == "FAILED") {
											alert("잘못된 데이터를 입력하셨습니다.");
											console.log(params);
										} else {
											alert("수정중 문제가 발생하였습니다.");
										}
									},
									error : function(req, status, error) {
										console.log("code : " + req.status);
										console.log("message : " + req.responseText);
									}
								});
						     closePopup(1);	
	      		 		  }, "취소", function() {
	 				         closePopup(1);			  
		  		 		  });
			}
		});
	});
	/* 취소  */
	$(document).off("click.cancelBtn").on("click.cancelBtn", "#cancelBtn", function() {
		$("#anul_prod_no").val($(this).parent().parent().attr("name")); /* 글번호 */
		var currentRow = $(this).closest("tr"); /* 클릭된 곳 가장 가까운 tr */
		currentRow.find("td:eq(-1)").children('#updateBtn').css('display', 'table-cell'); /* 수정버튼  */
		currentRow.find("td:eq(-1)").children('#cancelBtn').css('display', 'none'); /* 취소버튼  */
		currentRow.find("td:eq(-2)").css('display', 'none'); /* 입력창 */
		currentRow.find("td:eq(-2)").children('#tx7').css('display', 'none'); /* 입력창 */
		currentRow.find("td:eq(-3)").css('display', 'table-cell'); /* 정보 */
		currentRow.find("td:eq(-3)").children('#ap').css('display', 'table-cell'); /* 정보 */
		$("#ch1").show();
 		$("#ch2").hide();
		$("#saveBtn").hide(); /* 저장버튼  */
	});
});
/* 필터링 온클릭  */
function Select(obj){
    var Select = document.getElementById("searchGbn2");
    // select element에서 선택된 option의 text가 저장된다.
    var SelectText = Select.options[Select.selectedIndex].text;
    document.getElementById("searchGbn2").setAttribute("value", SelectText);
}
/* 조회  */
function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "anulProdMangAjax",
		dataType : "json", // {키:값, 키:값}
		data : params, // 보낼데이터
		success : function(res) { // 성공 시 해당 함수 실행, 결과는 result로 받겠다.
			drawList(res.list, res.cnt);
			drawPaging(res.pb);
		},
		error : function(req, status, error) { // 결과, 상태값, 에러
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}
/* 조회  */
function drawList(list, cnt) {
	var html = "";
	
	if(cnt == 0) {
		html += "<tr>";
		html += "<td colspan=\"7\">데이터가 없습니다.</td>";
		html += "</tr>";
	} else {
		for(var i = 0 ; i < list.length ; i++) {
			html += "<tr name=\"" + list[i].ANUL_PROD_NO + "\">";
			html += "<td class=\"cont1\" name=\"anul_prod_no\" id=\"anul_prod_no\">" + list[i].ANUL_PROD_NO + "</td>";
			html += "<td class=\"cont2\">" + "<input type=\"text\" id=\"tx1\" />" + "</td>";
			html += "<td class=\"cont1\">" + list[i].EMP_NO + "</td>";
			html += "<td class=\"cont2\">" + "<input type=\"text\" id=\"tx2\" />" + "</td>";
			html += "<td class=\"cont1\">" + list[i].EMP_NM + "</td>";
			html += "<td class=\"cont2\">" + "<input type=\"text\" id=\"tx3\" />" + "</td>";
			html += "<td class=\"cont1\">" + list[i].DEPT_NM + "</td>";
			html += "<td class=\"cont2\">" + "<input type=\"text\" id=\"tx4\" />" + "</td>";
			html += "<td class=\"cont1\">" + list[i].POSN_NM + "</td>";
			html += "<td class=\"cont2\">" + "<input type=\"text\" id=\"tx5\" />" + "</td>";
			html += "<td class=\"cont1\">" + list[i].STAD_YEAR_LIMT + "</td>";
			html += "<td class=\"cont2\">" + "<input type=\"text\" id=\"tx6\" />" + "</td>";
			html += "<td class=\"cont1\" id=\"ap\">" + list[i].OCUR_ANUL +"</td>";
			html += "<td class=\"cont2\">"+"<input type=\"text\" id=\"tx7\" name=\"ocur_anul\" value=\"" + list[i].OCUR_ANUL + "\" />"+"</td>";
			html += "<td>";
			html += "<input type=\"button\" value=\"수정\" name=\"updateBtn\" id=\"updateBtn\" />";
			html += "<input type=\"button\" value=\"취소\" name=\"cancelBtn\" id=\"cancelBtn\" />";
			html += "</td>";
			html += "</tr>";
		}  
	}
	$(".anulprod tbody").html(html);
}
/* 페이징 */
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
		html += "<div class =\"arrow next\"></div>";
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
		<div class="contents_header_txt" id="ch1">연차생성 조회</div>
		<div class="contents_header_txt" id="ch2">연차생성 수정</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="sEmpNo" value="${sEmpNo}" />
			<input type="hidden" name="sEmpNo" value="${sEmpNm}" />
			<input type="hidden" name="sEmpNo" value="${sDeptNm}" />
			<input type="hidden" name="sEmpNo" value="${sPosnNm}" />
			<input type="hidden" name="anul_prod_no" id="anul_prod_no" value="${param.anul_prod_no}" />
			<input type="hidden" name="ocur_anul" id="ocur_anul" value="${param.ocur_anul}" />
			<input type="hidden" name="page" id="page" value="1" />
		<div class="default_search_area">
			<select name="searchGbn" id="searchGbn">
				<option value="0">사원번호</option>
				<option value="1">부서</option>
				<option value="2">기준연도</option>
			</select>
			<input type="text" name="searchTxt" value="${param.searchTxt}" placeholder="검색어를 입력해주세요." />
			<div class="search_btn_area">
				<input type="button" id="searchBtn" name="searchBtn" value="검색" />
				<input type="button" id="saveBtn" name="saveBtn" value="저장" />
			</div>
			<select name="searchGbn2" id="searchGbn2" onchange="Select(this.value)">
				<option value="2021">2021</option>
				<option value="2020">2020</option>
				<option value="2019">2019</option>
				<option value="2018">2018</option>
				<option value="2017">2017</option>
				<option value="2016">2016</option>
				<option value="2015">2015</option>
				<option value="2014">2014</option>
				<option value="2013">2013</option>
				<option value="20">전체</option>
			</select>
		</div>
		<div class="default_board">
			<table class="anulprod">
				<colgroup>
					<col width="50px">
					<col width="75px">
					<col width="75px">
					<col width="75px">
					<col width="75px">
					<col width="75px">
					<col width="75px">
					<col width="100px">
				</colgroup>
			<thead>
				<tr class="top">
					<th>No</th>
					<th>사원번호</th>
					<th>성명</th>
					<th>부서</th>
					<th>직급</th>
					<th>기준연도</th>
					<th>발생연차</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<div class="page_wrap">
			<div class="page_nation"></div>
		</div>
		</div>
		</form>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>