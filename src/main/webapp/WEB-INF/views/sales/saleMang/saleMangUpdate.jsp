<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 영업 수정</title>
<style type="text/css">
/* 상세보기영역 가로변경 시 */
.underbox {
	width: 800px;
}

/* 버튼영역 가로변경 시 */
.add_detail_btn_area {
	width: 645px;
	text-align: right;
	margin-bottom: 10px;
}

.add_detail_btn_area input[type='button'] {
	min-width: 80px;
	height: 32px;
	background-color: #f7f7f7;
	font-size: 10pt;
	border-radius: 3px;
	margin: 0 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
	cursor: pointer;
}

.add_detail_btn_area input[type='button']:hover {
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}
/* 개별 css는 여기에 */
.contents{
	font-size: 10pt;
}
.default_search_area {
	width: 800px;
	min-height: 20px;
	color: red;
}
.sales_create_contents_essential {
	float: right;
	font-size: 10pt;
	margin-bottom: 10px;
	color: #DF0101;
}
.sales_create_contents_allCheckbox{
	display: inline-block;
}

.sales_create_upload{
	width: 800px;
}
.sales_create_upload1{
	display: inline-block;
}
.sales_create_upload2{
	display: inline-block;
	float: right;
	padding: 1px 2px 0px 0px;
}
.sales_create_uploadArea{
	height: 150px;
	width: 800px;
	text-align: center;
	padding-top: 100px;
}
.add_con1, .add_con2, .add_con3 {
	font-size: 10pt;
	min-height: 43px;
	line-height: 43px;
	display: inline-block;
	padding: 0px 5px;
}

.add_con1 {
	width: 400px;
}

.add_con2 {
	width: 400px;
}

.add_con3 {
	width: 950px;
}

.add_txt {
	text-align: center;
	color: #A4A4A4;
}

.pl_txt {
	width: 500px;
	height: 28px;
	font-size: 10pt;
	border-radius: 3px;
	margin: 0 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
}

.regi_right {
	display: inline-block;
	vertical-align: top;
	font-size: 10pt;
	color: red;
	margin: 10px 0px 0px 720px;
}

.upload {
	margin: 0px 0px 5px 769px;
}

.add_file_txt {
	width: 927px;
	height: 120px;
	border: 1px solid #585858;
	padding: 2px;
	margin-top: 5px;
	margin-bottom: 5px;
	border-radius: 2px;
}

.add_txt {
	text-align: center;
	margin-top: 55px;
	color: #A4A4A4;
}

.add_line1 {
	font-size: 10pt;
	font-weight: bold;
	background-color: #e4eaf2;
	width: 150px;
	min-height: 43px;
	line-height: 43px;
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}

.pl_popup {
	max-width: calc(100% - 12px);
	width: 330px;
	height: 28px;
	font-size: 10pt;
	border-radius: 3px;
	margin: 0px 3px 0px 0px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
}

.default_board1,.default_board2,.default_board3{
	width: 570px;
}

.default_board1 table,.default_board2 table,.default_board3 table  {
	border-collapse: collapse;
	text-align: center;
	border-color: #c2c2c2;
	margin-top: 10px;
	border-top: 2px solid #7f7f7f;
	border-bottom: 2px solid #7f7f7f;
	font-size: 10pt;
}

.default_board1 table th,.default_board2 table th,.default_board3 table th {
	color: #3c3c3d;
	font-size: 11pt;
}

.default_board1 table tbody tr,.default_board2 table tbody tr,.default_board3 table tbody tr {
	height: 40px;
	border-top: 1px solid #c2c2c2;
	cursor: pointer;
}

.default_board1 table tbody tr:hover ,.default_board2 table tbody tr:hover,.default_board3 table tbody tr:hover {
	background-color: #022859;
	color: #fff;
}

.default_board1 .top {
	height: 45px;
	padding: 10px 0px;
	color: #292d33;
	background-color: #E4EAF2;
}

.default_board2 .top {
	height: 45px;
	padding: 10px 0px;
	color: #292d33;
	background-color: #E4EAF2;
}
.default_board3 .top {
	height: 45px;
	padding: 10px 0px;
	color: #292d33;
	background-color: #E4EAF2;
}
.popup_contents1,.popup_contents2,.popup_contents3 {
	display: inline-block;
	margin: 0px 5px 0px 15px;
	padding: 10px;
	overflow-y: auto;
	font-size: 10pt;
}

.searchBtn1,.searchBtn2,.searchBtn3{
	min-width: 80px;
	height: 32px;
	background-color: #f7f7f7;
	font-size: 10pt;
	border-radius: 3px;
	margin-top: 9px;
	margin-left: 3px;
	margin-right: 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
	cursor: pointer;
}

.searchBtn1:hover,.searchBtn2:hover,.searchBtn3:hover {
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}

.filter{
	max-width: calc(100% - 12px);
	height: 32px;
	background-color: #f7f7f7;
	font-size: 10pt;
	border-radius: 3px;
	margin: 0 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
}
.page_nation1,.page_nation2,.page_nation3 {
	display: inline-block;
}

.page_nation1 .none {
	display: none;
}
.page_nation2 .none {
	display: none;
}
.page_nation3 .none {
	display: none;
}
.page_nation1 div,.page_nation2 div,.page_nation3 div{
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

.page_nation1 .arrow {
	border: 1px solid #c2c2c2;
}
.page_nation2 .arrow {
	border: 1px solid #c2c2c2;
}
.page_nation3 .arrow {
	border: 1px solid #c2c2c2;
}
.page_nation1 .prev {
	background: #f8f8f8 url('resources/images/common/left.png') no-repeat center center;
}
.page_nation2 .prev {
	background: #f8f8f8 url('resources/images/common/left.png') no-repeat center center;
}
.page_nation3 .prev {
	background: #f8f8f8 url('resources/images/common/left.png') no-repeat center center;
}
.page_nation1 .next {
	background: #f8f8f8 url('resources/images/common/right.png') no-repeat center center;
}
.page_nation2 .next {
	background: #f8f8f8 url('resources/images/common/right.png') no-repeat center center;
}
.page_nation3 .next {
	background: #f8f8f8 url('resources/images/common/right.png') no-repeat center center;
}
.page_nation1 div:hover, .page_nation1 .page_on	{
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}
.page_nation2 div:hover, .page_nation2 .page_on	{
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}
.page_nation3 div:hover, .page_nation3 .page_on	{
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
$(document).ready(function() {
	
	$("#listBtn").on("click", function() {
		$("#actionForm").attr("action", "saleMang");
		$("#actionForm").submit();
	});
	
	$("#updateBtn").on("click", function() {		
		if($.trim($("#empNm").val()) == "") {
			alert("담당자를 입력해 주세요.");
			$("#empNm").focus();
		} else if($.trim($("#deptNm").val()) == "") {
			alert("담당부서를 입력해 주세요.");
			$("#deptNm").focus();
		} else if($.trim($("#custNm").val()) == "") {
			alert("고객명을 입력해 주세요.");
			$("#custNm").focus();
		} else if($.trim($("#entpNm").val()) == "") {
			alert("고객사명을 입력해 주세요.");
			$("#entpNm").focus();
		} else if($.trim($("#saleNm").val()) == "") {
			alert("영업명을 입력해 주세요.");
			$("#saleNm").focus();
		} else if($.trim($("#startDay").val()) == "") {
			alert("시작일을 입력해 주세요.");
			$("#startDay").focus();
		} else if($.trim($("#deltCont").val()) == "") {
			alert("상세내용을 입력해 주세요.");
			$("#deltCont").focus();
		} else {
			var params = $("#actionForm").serialize();
			$.ajax({
				type : "post",
				url : "saleMangUpdateAjax",
				dataType : "json", 
				data : params, 
				success : function(res) {
					if(res.res == "SUCCESS"){
						$("#actionForm").attr("action", "saleMang");
						$("#actionForm").submit();
					} else {
						$("#alert").attr("title", "알림");
						$("#alert p").html("저장에 실패하였습니다.");
						$("#alert").dialog({
							buttons: {
								Ok: function() {
									$(this).dialog("close");
								}
							}
						});
					}
				},
				error: function(req, status, error){ 
					console.log("code : " + req.status);
					console.log("message : " + req.responseText);
				}
			});
		}
	});	
	
	//고객 검색버튼
	$("#custNmBtn").on("click", function() {
		
		var html = "";
		html += "	<div class=\"popup_contents2\">";
		html += "	</div>";
		
	
		makeBtn1Popup(1, "고객 검색", html, true, 650, 650,
				reloadSearchPopup2(), "닫기", function() {
						closePopup(1);
					});
		 
		$(document).on("click", ".page_nation2 div", function() {
			$("#search2Page").val($(this).attr("name"));
			 reloadSearchPopup2();
		});
		
		
		$(document).on("click","#searchBtn2", function() {
			if($("#searchGbn2").val() != '') {
				
				console.log($("#searchGbn2").val());
				$("#searchGbn2Hidden").val($("#searchGbn2").val());
				console.log($("#searchGbn2Hidden").val());
			}
			$("#searchTxt2Hidden").val($("#searchTxt2").val());
			console.log($("#searchTxt2Hidden").val());
			$("#search2Page").val("1");
			reloadSearchPopup2();
		});
		
		$(document).on("click","tr#searchList2", function() {
			$("#custNo").val($(this).attr("name"));
			$("#custNm").val($(this).children("input").attr("name"));
			$("#custcell").val($(this).children("input").attr("id"));
			closePopup(1);
		});
	});
	
	//고객사명 검색 버튼
	$("#entpNmBtn").on("click", function() {
		
		var html = "";
		html += "	<div class=\"popup_contents1\">";
		html += "	</div>";
		
	
		makeBtn1Popup(1, "고객사 명 검색", html, true, 650, 650,
				reloadSearchPopup1(), "닫기", function() {
						closePopup(1);
					});
		 
		$(document).on("click", ".page_nation1 div", function() {
			$("#searchPage").val($(this).attr("name"));
			 reloadSearchPopup1();
		});
		
		
		$(document).on("click","#searchBtn1", function() {
			if($("#searchGbn1").val() != '') {
				
				console.log($("#searchGbn1").val());
				$("#searchGbn1Hidden").val($("#searchGbn1").val());
				console.log($("#searchGbn1Hidden").val());
			}
			$("#searchTxt1Hidden").val($("#searchTxt1").val());
			console.log($("#searchTxt1Hidden").val());
			$("#searchPage").val("1");
			reloadSearchPopup1();
		});
		
		$(document).on("click", "tr#cList", function() {
			$("#entpNo").val($(this).attr("name"));
			$("#entpNm").val($(this).children("input").attr("id"));
			closePopup(1);
		});
	}); 
	
});

//함수

//고객사명 검색
function reloadSearchPopup1() {
	var params = $("#actionForm").serialize();

	$.ajax({
		type : "post",
		url : "saleMangUpdateSearchAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			$(".popup_contents1").html(drawSearchPopup1());
			cList(res.list1, res.cnt);
			drawPopupPaging1(res.pb);
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}


function cList(list1, cnt) {
	var html = "";
	if(cnt == 0){
		html += "<tr>";
		html += "<td colspan=\"2\">데이터가 없습니다.</td>"; 
		html += "</tr>";
	}else{
		for (var i = 0; i < list1.length; i++) {
			html += "<tr name=\"" + list1[i].ENTP_NO + "\" id =\"cList\">";
			html += "<input type=\"hidden\" id=\""+list1[i].ENTP_NM +"\"  />";
			html += "<td>" + list1[i].ENTP_NM + "</td>";
			html += "<td>" + list1[i].DELG_NM + "</td>";
			html += "</tr>";
		}
	}
	$(".default_board1 tbody").html(html);

}

function drawSearchPopup1() {
	var html = "";

	html +=	"<select class=\"filter\" name=\"searchGbn1\" id=\"searchGbn1\">";
	html +=	"<option value=\"0\">고객사 명</option>";
	html +=	"<option value=\"1\">대표자</option>";
	html += "</select>";
	html += "<input class=\"pl_popup\" type=\"text\"   name=\"searchTxt1\" id=\"searchTxt1\"/>";
	html += "<input type=\"button\" class=\"searchBtn1\" id=\"searchBtn1\" value=\"검색\" />";
	html += "<div class=\"default_board1\" >";
	html += "<table class=\"search_list\">";
	html += "<colgroup>";
	html += "<col width=\"285px\"/>";
	html += "<col width=\"285px\"/>";
	html += "</colgroup>";
	html += "<thead>";
	html += "<tr class=\"top\">";
	html += "<th>고객사 명</th>";
	html += "<th>대표자</th>";
	html += "</tr>";
	html += "</thead>";
	html += "<tbody>";
	html += "</tbody>";
	html += "</table>";
	html += "<div class=\"page_wrap\">";
	html += "<div class=\"page_nation1\">";
	html += "</div>";
	html += "</div>";

	return html;
}

//고객 검색
function reloadSearchPopup2() {
	var params = $("#actionForm").serialize();

	$.ajax({
		type : "post",
		url : "saleMangUpdateSearch2Ajax",
		dataType : "json",
		data : params,
		success : function(res) {
			$(".popup_contents2").html(drawSearchPopup2());
			searchList2(res.list2, res.cnt);
			drawPopupPaging2(res.pb);
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}

function searchList2(list2, cnt) {
	var html = "";
	if(cnt == 0){
		html += "<tr>";
		html += "<td colspan=\"3\">데이터가 없습니다.</td>"; 
		html += "</tr>";
	}else{
		for (var i = 0; i < list2.length; i++) {
			html += "<tr name=\"" + list2[i].CUST_NO + "\" id=\"searchList2\">";
			
			html += "<input type=\"hidden\" name =\"" +list2[i].CUST_NM +"\" id=\""+list2[i].CUST_CELL+"\"  />";
			html += "<td>" + list2[i].CUST_NM + "</td>";
			html += "<td>" + list2[i].ENTP_NM + "</td>";
			html += "<td >" + list2[i].CUST_CELL + "</td>";
			html += "</tr>";
		}
	}
	$(".default_board2 tbody").html(html);

}

function drawSearchPopup2() {
	var html = "";

	html +=	"<select class=\"filter\" name=\"searchGbn2\" id=\"searchGbn2\">";
	html +=	"<option value=\"0\">고객</option>";
	html +=	"<option value=\"1\">고객사 명</option>";
	html += "</select>";
	html += "<input class=\"pl_popup\" type=\"text\"   name=\"searchTxt2\" id=\"searchTxt2\"/>";
	html += "<input type=\"button\" class=\"searchBtn2\" id=\"searchBtn2\" value=\"검색\" />";
	html += "<div class=\"default_board2\" >";
	html += "<table class=\"search_list\">";
	html += "<colgroup>";
	html += "<col width=\"190px\"/>";
	html += "<col width=\"190px\"/>";
	html += "<col width=\"190px\"/>";
	html += "</colgroup>";
	html += "<thead>";
	html += "<tr class=\"top\">";
	html += "<th>고객명</th>";
	html += "<th>고객사 명</th>";
	html += "<th>전화번호</th>";
	html += "</tr>";
	html += "</thead>";
	html += "<tbody>";
	html += "</tbody>";
	html += "</table>";
	html += "<div class=\"page_wrap\">";
	html += "<div class=\"page_nation2\">";
	html += "</div>";
	html += "</div>";


	return html;
}

//팝업 페이징
function drawPopupPaging1(pb) {
	var html = "";

	if ($("#searchPage").val() == 1) {
		html += "<div class=\"arrow prev\" name=\"1\"></div>";
	} else {
		html += "<div class=\"arrow prev\" name =\"" + ($("#searchPage").val() - 1) + "\"></div> ";
	}

	for (var i = pb.startPcount; i <= pb.endPcount; i++) {
		if ($("#searchPage").val() == i) {
			html += "<div class=\"page_on\" name=\"" + i + "\">" + i + "</b></div> ";
		} else {
			html += "<div class=\"page\" name=\"" + i + "\">" + i + "</div> ";
		}
	}

	if ($("#searchPage").val() == pb.maxPcount) {
		html += "<div name =\"" +pb.maxPcount + "\"></div>";
	} else {
		html += "<div class=\"arrow next\" name =\"" + ($("#searchPage").val() * 1 + 1) + "\"></div> ";
	}

	$(".page_nation1").html(html);
}

function drawPopupPaging2(pb) {
	var html = "";

	if ($("#search2Page").val() == 1) {
		html += "<div class=\"arrow prev\" name=\"1\"></div>";
	} else {
		html += "<div class=\"arrow prev\" name =\"" + ($("#search2Page").val() - 1) + "\"></div> ";
	}

	for (var i = pb.startPcount; i <= pb.endPcount; i++) {
		if ($("#search2Page").val() == i) {
			html += "<div class=\"page_on\" name=\"" + i + "\">" + i + "</b></div> ";
		} else {
			html += "<div class=\"page\" name=\"" + i + "\">" + i + "</div> ";
		}
	}

	if ($("#search2Page").val() == pb.maxPcount) {
		html += "<div name =\"" +pb.maxPcount + "\"></div>";
	} else {
		html += "<div class=\"arrow next\" name =\"" + ($("#search2Page").val() * 1 + 1) + "\"></div> ";
	}

	$(".page_nation2").html(html);
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
		<div class="contents_header_txt">영업 수정</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
		<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="empno" id="empno" value="${param.empno}" />
			<input type="hidden" name="page" id="page" value="${param.page}" />
			<input type="hidden" name="saleNo" value="${param.saleNo}"/>
			<input type="hidden" name="searchPage" id="searchPage" value="${searchPage}" />
			<input type="hidden" name="search2Page" id="search2Page" value="${search2Page}" />
			<input type="hidden" name="searchGbn1Hidden" id="searchGbn1Hidden"  value="${param.searchGbn1Hidden}"/>
			<input type="hidden" name="searchTxt1Hidden" id="searchTxt1Hidden" value="${param.searchTxt1Hidden}" />
			<input type="hidden" name="searchGbn2Hidden" id="searchGbn2Hidden"  value="${param.searchGbn2Hidden}"/>
			<input type="hidden" name="searchTxt2Hidden" id="searchTxt2Hidden" value="${param.searchTxt2Hidden}" />
			<input type="hidden" name="empNo" value="${sEmpNo}" />
			<input type="hidden" name="entpNo" id="entpNo" />
			<input type="hidden" name="custNo" id="custNo" value="${param.custNo}"/>
		<div class="default_search_area">
			<div class="search_btn_area">
				*는 필수항목
			</div>
		</div>
		<div class="underbox">
			<div class="underline">
				<div class="line1">담당자 *</div>
				<div class="con1">
					<input type="text" name="empNm" id="empNm" disabled="disabled" value="${sEmpNm}"/>
				</div>
				<div class="line1">담당부서 *</div>
				<div class="con1">
					<input type="text" name="deptNm" id="deptNm" disabled="disabled" value="${sDeptNm}"/>
				</div>
			</div>
			<div class="underline">
				<div class="line1">고객명 *</div>
				<div class="con1">
					<input type="text" name="custNm" id="custNm" disabled="disabled" value="${sale.CUST_NM}"/>
					<input type="button" id="custNmBtn" value="검색" />
				</div>
				<div class="line1">고객사명 *</div>
				<div class="con1">
					<input type="text" name="entpNm" id="entpNm" disabled="disabled" value="${sale.ENTP_NM}"/>
					<input type="button" id="entpNmBtn" value="검색" />
				</div>
			</div>
			<div class="underline">
				<div class="line1">영업명 *</div>
				<div class="con1">
					<input type="text" name="saleNm" id="saleNm" value="${sale.SALE_NM}" />
				</div>
				<div class="line1">진행현황 *</div>
				<div class="con1">
					<select class="sales_create_contents_tableContentsBox" name="progCond" id="progCond">
						<option value=0>제안</option>
						<option value=1>협상</option>
						<option value=2>계약</option>
						<option value=3>실패</option>
					</select>
				</div>
			</div>
			<div class="underline">
				<div class="line1">시작일 *</div>
				<div class="con1">
					<input type="date" name="startDay" id="startDay" value="${sale.START_DAY}"/>
				</div>
				<div class="line1">종료일</div>
				<div class="con1">
					<input type="date" name="endDay" id="endDay" value="${sale.END_DAY}"/>
				</div>
			</div>
			<div class="underline">
				<div class="line1">상세내용*</div>
				<div class="con3">
					<textarea rows="20" cols="80" name="deltCont" id="deltCont">${sale.DETL_CONT}</textarea>
				</div>
			</div>
			<div class="underline">
				<div class="line1">비고</div>
				<div class="con3">
				<textarea rows="10" cols="80" name="remk" id="remk">${sale.REMK}</textarea>
				</div>
			</div>
		</div>
		</form>
	</div>
		<div class="detail_btn_area">
			<input type="button" value="수정" id="updateBtn" />
			<input type="button" value="목록" id="listBtn" />
		</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>