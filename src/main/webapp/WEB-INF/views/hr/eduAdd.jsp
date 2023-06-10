<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 교육 등록</title>
<link rel = "stylesheet" href="resources/css/jquery/jquery-ui.css" />
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
		src="resources/script/jquery/jquery-ui.js"></script>
<style type="text/css">
/* 상세보기영역 가로변경 시 */
.underbox {
	width: 800px;
}

/* 버튼영역 가로변경 시 */
.detail_btn_area {
	width: 800px;
}
.popup_contents1,.popup_contents2,.popup_contents3 {
	display: inline-block;
	margin: 0px 5px 0px 15px;
	padding: 10px;
	overflow-y: auto;
	font-size: 10pt;
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
/* 개별 css는 여기에 */
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

.edu_center,.edu_pers,.default_board3{
	width: 570px;
}

.edu_center table,.edu_pers table,.default_board3 table  {
	border-collapse: collapse;
	text-align: center;
	border-color: #c2c2c2;
	margin-top: 10px;
	border-top: 2px solid #7f7f7f;
	border-bottom: 2px solid #7f7f7f;
	font-size: 10pt;
}

.edu_center table th,.edu_pers table th,.default_board3 table th {
	color: #3c3c3d;
	font-size: 11pt;
}

.edu_center table tbody tr,.edu_pers table tbody tr,.default_board3 table tbody tr {
	height: 40px;
	border-top: 1px solid #c2c2c2;
	cursor: pointer;
}

.edu_center table tbody tr:hover ,.edu_pers table tbody tr:hover,.default_board3 table tbody tr:hover {
	background-color: #022859;
	color: #fff;
}

.edu_center .top .edu_pers{
	height: 45px;
	padding: 10px 0px;
	color: #292d33;
	background-color: #E4EAF2;
}


</style>
<script type="text/javascript"
		src="resources/script/jquery/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	
	$("#listBtn").on("click", function() {
		history.back();
	});

	$("#addBtn").on("click", function() {
		            
		if($.trim($("#edu_nm").val()) ==""){
			alert("교육이름을 입력하세요");
			$("#edu_nm").focus();
		} else if($.trim($("#edu_fild").val()) ==""){
			alert("교육분야를 입력하세요");
			$("#edu_fild").focus();
		} else if($.trim($("#edu_time").val()) ==""){
			alert("교육시간을 입력하세요");
			$("#edu_time").focus();
		} else if($.trim($("#edu_date").val()) ==""){
			alert("교육날짜를 입력하세요");
			$("#edu_date").focus();	
		} else if($.trim($("#sign_pers").val()) ==""){
			alert("수강인원을 입력하세요");
			$("#sign_pers").focus();
		} else { 
			var params = $("#actionForm").serialize();
			$.ajax({
				type : "post",
				url : "eduAddAjax",
				dataType : "json", 
				data : params, 
				success : function(res) {
					if(res.res == "SUCCESS") {
						$("#actionForm").attr("action", "eduList");
						$("#actionForm").submit();
					} else {
						$("#alert").attr("title", "알림");
						$("#alert p").html("저장에 실패했다"); 
						$("#alert").dialog({
							buttons: {
								Ok: function(){
									$(this).dialog("close");
								}	
							 }
						});
					}	
				},
				error : function(req,status,error) {
					console.log("code : " + req.status);
					console.log("message : " + req.responseText );
				}
			});
		}
	});
	
	//교육장명 검색 버튼
	$("#educenterBtn").on("click", function() {
		
		makeBtn1Popup(1, "교육장 검색", drawSearchPopup1(), true, 600, 600,
		function() {
			reloadSearchPopup1()
		}, "닫기", function() {
						closePopup(1);
					});
		 
		$(document).on("click", ".page_nation1 div", function() {
			$("#Page").val($(this).attr("name"));
			 reloadSearchPopup1();
		}); 
		
		
		$(document).on("click","#searchBtn", function() {
			if($("#searchGbn").val() != '') {
				
				console.log($("#searchGbn").val());
				$("#searchGbn").val($("#searchGbn").val());
				console.log($("#searchGbn").val());
			}
			$("#searchTxt").val($("#searchTxt").val());
			console.log($("#searchTxt").val());
			$("#Page").val("1");
			reloadSearchPopup1(); 
		});
		
		$(document).on("click", "tr#drawList1", function() {
			$("#edu_center_no").val($(this).attr("name"));
			$("#edu_center_nm").val($(this).children("td").html());
			console.log($("#edu_center_no").val());
			console.log($("#edu_center_nm").val());
			closePopup(1);
		});
	}); 
	
	//교육자명 검색 버튼
	$("#edupersBtn").on("click", function() {
		
		makeBtn1Popup(1, "교육자 검색", drawSearchPopup2(), true, 600, 600,
		function() {
			reloadSearchPopup2()
		}, "닫기", function() {
						closePopup(1);
					});
		 
		$(document).on("click", ".page_nation2 div", function() {
			$("#Page").val($(this).attr("name"));
			 reloadSearchPopup2();
		}); 
		
		
		$(document).on("click","#searchBtn", function() {
			if($("#searchGbn").val() != '') {
				
				console.log($("#searchGbn").val());
				$("#searchGbn").val($("#searchGbn").val());
				console.log($("#searchGbn").val());
			}
			$("#searchTxt").val($("#searchTxt").val());
			console.log($("#searchTxt").val());
			$("#Page").val("1");
			reloadSearchPopup2(); 
		});
		
		$(document).on("click", "tr#drawList2", function() {
			$("#edu_pers_no").val($(this).attr("name"));
			$("#nm").val($(this).children("td").html());
			console.log($("#edu_pers_no").val());
			console.log($("#nm").val());
			closePopup(1);
		});
	}); 
	
	$("#actionForm").on("keypress", "input", function(e) {
		if(e.keyCode == 13) {
			return false;
		}
	});
});
	
	//교육장명 검색
	function reloadSearchPopup1() {
		var params = $("#popupForm").serialize();
		console.log(params);
		$.ajax({
			type : "post",
			url : "educenterListAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				console.log(res);
				drawList1(res.list, res.cnt);
				drawPaging(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	
	function drawList1(list, cnt) {
		var html = "";
		
		if(cnt == 0) {
			html += "<tr>";
			html += "<td colspan=\"4\">데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
			for(var i = 0 ; i < list.length ; i++) {
				html += "<tr name=\"" + list[i].EDU_CENTER_NO + "\" id =\"drawList1\">";
				html += "<td>" + list[i].EDU_CENTER_NM + "</td>";
				html += "<td>" + list[i].ADDR + "</td>";
				html += "<td>" + list[i].PHONE_NUM + "</td>";
				html += "<td>" + list[i].ACPT_PSBL_PERS + "</td>";
				html += "</tr>";
			}  
		}
		$(".edu_center tbody").html(html);

	}

	function drawSearchPopup1() {
		var html = "";

		html +=	"<form id=\"popupForm\">";
		html +=	"<select class=\"filter\" name=\"searchGbn\" id=\"searchGbn\">  ";
		html +=	"<option value=\"0\">교육장명</option>                     ";
		html +=	"<option value=\"1\">주소</option>                        ";
		html += "</select>                                                 ";
		html += "	<input class=\"pl_popup\" type=\"text\"   name=\"searchTxt\" id=\"searchTxt\"/>";
		html += "	<input type=\"hidden\"   name=\"page\" id=\"page\" value=\"1\"/>";
		html += "<input type=\"button\" class=\"searchBtn\" id=\"searchBtn\" value=\"검색\" />                                  ";
		html +=	"</form>";
		html += "	<div class=\"edu_center\" >                                      ";
		html += "		<table class=\"search_list\">                                   ";
		html += "			<colgroup>                                                ";
		html += "				<col width=\"240px\"/>                                  ";
		html += "				<col width=\"240px\"/>                                  ";
		html += "				<col width=\"240px\"/>                                  ";
		html += "				<col width=\"240px\"/>                                  ";
		html += "</colgroup>                                                           ";
		html += "<thead>                                                               ";
		html += "			<tr class=\"top\">                                          ";
		html += "				<th>교육장명</th>                                   ";
		html += "				<th>주소</th>                                      ";
		html += "				<th>연락처</th>                                      ";
		html += "				<th>수용가능인원</th>                                      ";
		html += "	</tr>                                                             ";
		html += "			</thead>                                                  ";
		html += "			<tbody>                                                   ";
		html += "			</tbody>                                                  ";
		html += "		</table>                                                      ";
		html += "		<div class=\"page_wrap\">                                       ";
		html += "			<div class=\"page_nation1\">                                 ";
		html += "		</div>                                                        ";
		html += "		</div>                                                        ";

		return html;
	}
	
	function drawPaging(pb) {
		var html = "";

		if ($("#popupForm #page").val() == 1) {
			html += "<div class=\"arrow prev\"></div>";
		} else {
			html += "<div class=\"arrow prev\" name =\""
					+ ($("#Page").val() - 1) + "\"></div> ";
		}

		for (var i = pb.startPcount; i <= pb.endPcount; i++) {
			if ($("#popupForm #page").val() == i) {
				html += "<div class=\"page_on\" name=\"" + i + "\">" + i
						+ "</b></div> ";
			} else {
				html += "<div class=\"page\" name=\"" + i + "\">" + i
						+ "</div> ";
			}
		}

		if ($("#popupForm #page").val() == pb.maxPcount) {
			html += "<div class =\"arrow next\"></div>";
		} else {
			html += "<div class=\"arrow next\" name =\""
					+ ($("#Page").val() * 1 + 1) + "\"></div> ";
		}

		$(".page_nation1").html(html);
	}
	
	
	//교육자명 검색
	function reloadSearchPopup2() {
		var params = $("#popupForm2").serialize();
		console.log(params);
		$.ajax({
			type : "post",
			url : "edupersListAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				console.log(res);
				drawList2(res.list, res.cnt);
				drawPaging2(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	
	function drawList2(list, cnt) {
		var html = "";
		
		if(cnt == 0) {
			html += "<tr>";
			html += "<td colspan=\"4\">데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
			for(var i = 0 ; i < list.length ; i++) {
				html += "<tr name=\"" + list[i].EDU_PERS_NO + "\" id =\"drawList2\">";
				html += "<td>" + list[i].NM + "</td>";
				html += "<td>" + list[i].CELL_NUM + "</td>";
				html += "<td>" + list[i].CHARGE_EDU + "</td>";
				html += "</tr>";
			}  
		}
		$(".edu_pers tbody").html(html);

	}

	function drawSearchPopup2() {
		var html = "";

		html +=	"<form id=\"popupForm2\">";
		html +=	"<select class=\"filter\" name=\"searchGbn\" id=\"searchGbn\">  ";
		html +=	"<option value=\"0\">교육자명</option>                     ";
		html +=	"<option value=\"1\">담당교육</option>                        ";
		html += "</select>                                                 ";
		html += "	<input class=\"pl_popup2\" type=\"text\"   name=\"searchTxt\" id=\"searchTxt\"/>";
		html += "	<input type=\"hidden\"   name=\"page\" id=\"page\" value=\"1\"/>";
		html += "<input type=\"button\" class=\"searchBtn\" id=\"searchBtn\" value=\"검색\" />                                  ";
		html +=	"</form>";
		html += "	<div class=\"edu_pers\" >                                      ";
		html += "		<table class=\"search_list\">                                   ";
		html += "			<colgroup>                                                ";
		html += "				<col width=\"240px\"/>                                  ";
		html += "				<col width=\"240px\"/>                                  ";
		html += "				<col width=\"240px\"/>                                  ";
		html += "</colgroup>                                                           ";
		html += "<thead>                                                               ";
		html += "			<tr class=\"top\">                                          ";
		html += "				<th>교육자명</th>                                      ";
		html += "				<th>연락처</th>                                      ";
		html += "				<th>담당교육</th>                                      ";
		html += "	</tr>                                                             ";
		html += "			</thead>                                                  ";
		html += "			<tbody>                                                   ";
		html += "			</tbody>                                                  ";
		html += "		</table>                                                      ";
		html += "		<div class=\"page_wrap\">                                       ";
		html += "			<div class=\"page_nation2\">                                 ";
		html += "		</div>                                                        ";
		html += "		</div>                                                        ";

		return html;
	}
	
	function drawPaging2(pb) {
		var html = "";

		if ($("#popupForm2 #page").val() == 1) {
			html += "<div class=\"arrow prev\"></div>";
		} else {
			html += "<div class=\"arrow prev\" name =\""
					+ ($("#Page").val() - 1) + "\"></div> ";
		}

		for (var i = pb.startPcount; i <= pb.endPcount; i++) {
			if ($("#popupForm2 #page").val() == i) {
				html += "<div class=\"page_on\" name=\"" + i + "\">" + i
						+ "</b></div> ";
			} else {
				html += "<div class=\"page\" name=\"" + i + "\">" + i
						+ "</div> ";
			}
		}

		if ($("#popupForm2 #page").val() == pb.maxPcount) {
			html += "<div class =\"arrow next\"></div>";
		} else {
			html += "<div class=\"arrow next\" name =\""
					+ ($("#Page").val() * 1 + 1) + "\"></div> ";
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
	<div class="contents_header">
		<div class="contents_header_txt">교육 등록</div>
	</div>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
		<div class="contents">
			<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<!-- -->
			<input type="hidden" name="sEmpNo" value="${sEmpNo}" />
			<input type="hidden" name="sEmpNm" value="${sEmpNm}" />
			<input type="hidden" name="edu_no" id="edu_no" />
			<input type="hidden" name="emp_no" id="emp_no" />
			<input type="hidden" name="edu_center_no" id="edu_center_no"  />
			<input type="hidden" name="edu_pers_no" id="edu_pers_no" />
			<input type="hidden" name="page" id="page" value="${param.page}" />
		
			<div class="underbox">
				<div class="underline">
					<div class="line1">교육명 *</div>
					<div class="con1">
						<input type ="text" name= "edu_nm" id="edu_nm" />
					</div>
					<div class="line1">교육분야 *</div>
					<div class="con1">
						<input type ="text" name= "edu_fild" id="edu_fild" />
					</div>
				</div>
				<div class="underline">
					<div class="line1">교육시간 *</div>
					<div class="con1">
						<input type ="time" name= "edu_time" id="edu_time" />
					</div>
					<div class="line1">교육날짜 *</div>
					<div class="con1">
						<input type ="text" placeholder='YYYY-MM-DD(연-월-일)' name= "edu_date" id="edu_date" />
					</div>
				</div>
					<div class="underline">
					<div class="line1">수강인원 *</div>
					<div class="con1">
						<input type ="text" name= "sign_pers" id="sign_pers" />
					</div>
					<div class="line1">교육장 *</div>
					<div class="con1">
						<input type="text" readonly="readonly" id="edu_center_nm" name="edu_center_nm"/>
						<input type ="button" id="educenterBtn" value="선택"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">교육자 *</div>
					<div class="con1">
						<input type="text" readonly="readonly" id="nm" name="nm"/>
						<input type ="button" id="edupersBtn" value="선택"/>
					</div>
						<div class="line1">등록자*</div>
					<div class="con1">
						<input type ="text" name="sEmpNo" value="${sEmpNm}" readonly="readonly"  />
					</div> 
				</div>
		</div>
		</form>
		<div class="detail_btn_area">
				<input type="button" value="저장" id="addBtn" />
				<input type="button" value="취소" id="listBtn"/>
			</div>
	</div>
</body>
</html>
