<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 추가근무 조회</title>
<style type="text/css">
.default_search_area, .default_board, .page_wrap {
	width: 1000px !important;
}
.info_txt, .menu1_txt, .gnb_txt, .contents_header {
	cursor: default;
}
.cont1, .cont2 {
    cursor: default !important;
}
select:hover, .logo, #tx5_1, #tx5_2, #tx5_3, #tx15_1, #tx15_2, #tx15_3,
input[type=time]::-webkit-calendar-picker-indicator:hover {
	cursor: pointer;
}
#searchGbn2 {
	float: right;
}
#tx6, #tx8, #tx16, #tx18 {
	cursor: inherit;
}
.detail_btn_area {
	display: none;
	width: 450px !important;
}
.default_board table th {
    color: #3c3c3d;
    font-size: 11pt;
    cursor: default !important;
} 
.default_board table tbody tr {
    height: 40px;
    border-top: 1px solid #c2c2c2;
}
.add_list {
	margin-bottom: 10px;
}
.add_detail, .add_add {
	display: none;
	margin-bottom: 10px;
}
#ch2, #ch3, #ch4, #radio1, #radio2 {
	display: none;
}
#tx1, #tx2, #tx3, #tx4, #tx5, #tx6, #tx7, #tx8, #tx9, #tx10,
#tx11, #tx12, #tx13, #tx14, #tx15, #tx16, #tx17, #tx18, #tx19, #tx20 {
	display: none;
	width: 292px;
	height: 31.5px;
}
.top2 {
	background-color: #E4EAF2;
}
.add_detail tbody tr:hover {
	background-color: inherit !important;
	color: inherit !important;
}
.add_add tbody tr:hover {
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
	/* 라디오 클릭 시  */
	$("input:radio[name=ated_code_nm]").click(function(){
        if($("input[name=ated_code_nm1]:checked").val() == "1"){
            $("#tx16").val("주간근무");
            $("#ated_code_no").val("1");
        }else if($("input[name=ated_code_nm1]:checked").val() == "2"){
        	$("#tx16").val("연장근무");
            $("#ated_code_no").val("2");
        }else if($("input[name=ated_code_nm1]:checked").val() == "3"){
        	$("#tx16").val("야간근무");
            $("#ated_code_no").val("3");
        }
    });
	/* 상세조회 안에 라디오 클릭 시  */
	$(document).on("click", "input:radio[name=ated_code_nm]", function() {
        if($("input[name=ated_code_nm2]:checked").val() == "1"){
            $("#tx6").val("주간근무");
            $("#ated_code_no").val("1");
        }else if($("input[name=ated_code_nm2]:checked").val() == "2"){
        	$("#tx6").val("연장근무");
            $("#ated_code_no").val("2");
        }else if($("input[name=ated_code_nm2]:checked").val() == "3"){
        	$("#tx6").val("야간근무");
            $("#ated_code_no").val("3");
        }
    });
	/* 조회목록으로 돌아가기 */
	$(".detail_btn_area").on("click", "#listBtn", function() {
		$("#ch1").show(); /* 제목  */
 		$("#ch2").hide();
 		$("#ch3").hide();
 		$("#ch4").hide();
 		$(".add_list").css('display', 'table'); /* 테이블  */
 		$(".add_list tbody").css('display', '');
		$(".add_detail").css('display', 'none');
 		$(".add_add").css('display', 'none');
		$(".default_search_area").show(); /* 검색  */
		$(".detail_btn_area").hide(); /* 아래 버튼  */
		$(".page_wrap").show(); /* 페이징 */
		$("input:radio[name=ated_code_nm1]").removeAttr("checked");
		$("input:radio[name=ated_code_nm2]").removeAttr("checked");
		$("#tx6").val("");
		$("#tx7").val("");
		$("#tx8").val("");
		$("#tx9").val("");
		$("#tx10").val("");
		$("#tx16").val("");
		$("#tx17").val("");
		$("#tx18").val("");
		$("#tx19").val("");
		$("#tx20").val("");
	});
	/* 상세조회 */
	$(".add_list").on("click", "tbody tr", function() {
		var currentRow = $(this).closest("tr"); /* 클릭된 곳 가장 가까운 tr */
		$("#p").children(".cont1").css('display', 'none'); /* 라디오 숨김  */
		$("#add_work_no").val($(this).attr("name")); /* 글번호 */
		if($(this).find("td:eq(5)").text() == "A01"){ /* 근태코드번호 */
	            $("#tx6").val("주간근무");
	            $("#ated_code_no").val("1");
        } else if($(this).find("td:eq(5)").text() == "A02"){
	        	$("#tx6").val("연장근무");
	            $("#ated_code_no").val("2");
        } else if($(this).find("td:eq(5)").text() == "A03"){
	        	$("#tx6").val("야간근무");
	            $("#ated_code_no").val("3");
        }
 		$("#ch1").hide(); /* 제목  */
 		$("#ch2").css('display', 'table-cell');
 		$("#ch3").hide();
 		$("#ch4").hide();
 		$(".top2").css('padding', '0px'); /* 패딩  */
 		$(".cont2").css('display', 'none'); /* 내용  */
 		$("#tx1").css('display', 'none'); 
 		$("#tx2").css('display', 'none');
 		$("#tx3").css('display', 'none');
 		$("#tx4").css('display', 'none');
 		$("#tx5").css('display', 'none');
 		$("#tx6").css('display', 'none');
 		$("#tx7").css('display', 'none');
 		$("#tx8").css('display', 'none');
 		$("#tx9").css('display', 'none');
 		$("#tx10").css('display', 'none');
		$(".add_list").css('display', 'none'); /* 테이블  */
		$(".add_detail").css('display', 'table');
 		$(".add_add").css('display', 'none');
		$(".default_search_area").hide(); /* 검색  */
		$(".detail_btn_area").show(); /* 아래 버튼  */
		$(".page_wrap").hide(); /* 페이징 */
		$("#saveBtn").hide(); /* 버튼  */
		$("#listBtn").show();
		if (currentRow.find("td:eq(1)").text() == "${sEmpNo}") {
			$("#updateBtn").show();
			$("#deleteBtn").show();
		} else if ("${sEmpNo}" == 1) {
			$("#updateBtn").show();
			$("#deleteBtn").show();
		} else {
			$("#updateBtn").hide();
			$("#deleteBtn").hide();
		}
 		reloadDetail();
	});
	/* 등록  */
	$(".search_btn_area").on("click", "#addBtn", function() {
		 getTimeStamp();  /* 등록일  */
		$("#ch1").hide(); /* 제목  */
 		$("#ch2").hide();
 		$("#ch3").css('display', 'table-cell');
 		$("#ch4").hide();
		$(".top2").css('padding', '0px'); /* 패딩  */
		$(".cont2").css('display', 'table-cell'); /* 내용  */
		$("#radio2").css('display', 'table-cell'); /* 등록 라디오  */
		$("#tx11").css('display', 'none'); 
 		$("#tx12").css('display', 'none');
 		$("#tx13").css('display', 'none');
 		$("#tx14").css('display', 'none');
 		$("#tx15").css('display', 'block');
 		$("#tx16").css('display', 'block');
 		$("#tx17").css('display', 'block');
 		$("#tx18").css('display', 'block');
 		$("#tx19").css('display', 'block');
 		$("#tx20").css('display', 'block');
		$(".add_list").css('display', 'none'); /* 테이블  */
		$(".add_detail").css('display', 'none');
		$(".add_add").css('display', 'table');
		$(".default_search_area").hide(); /* 검색  */
		$(".detail_btn_area").show(); /* 아래 버튼  */
		$(".page_wrap").hide(); /* 페이징 */
		$("#saveBtn").show(); /* 버튼  */
		$("#updateBtn").hide();
		$("#deleteBtn").hide();
		$("#listBtn").show();	
	/* 저장  */
	$(".detail_btn_area").off("click.saveBtn").on("click.saveBtn", "#saveBtn", function() {
 		if($("input[name=ated_code_nm1]:radio:checked").length == 0) {
 			alert("근태코드명을 선택해주세요.");
			$("#radio2").focus();
		} else if ($.trim($("#tx17").val()) == "") {
			alert("내용을 입력해주세요.");
			$("#tx17").focus();
		} else if ($.trim($("#tx19").val()) == "") {
			alert("시작시간을 선택해주세요.");
			$("#tx19").focus();
		} else if ($.trim($("#tx20").val()) == "") {
			alert("종료시간을 선택해주세요.");
			$("#tx20").focus();
		} else {
			makeBtn2Popup(1, "추가근무 등록", "등록하시겠습니까?", true, 400, 200, 
				      null, "저장", function() {
					     saved1();
					     closePopup(1);		
		 		      }, "취소", function() {
				         closePopup(1);			  
		 		      });
			}
		});
	});
 	/* 수정  */
	$(".detail_btn_area").on("click", "#updateBtn", function(){
 		$("#ch1").hide();
 		$("#ch2").hide();
 		$("#ch3").hide();
 		$("#ch4").css('display', 'table-cell');
		$(".top2").css('padding', '0px'); /* 패딩  */
		$(".cont1").css('display', 'table-cell'); /* 내용  */
		$(".cont2").css('display', 'none'); /* 내용  */
		$("#radio1").css('display', 'table-cell'); /* 상세 라디오  */
		$("#tx1").css('display', 'none'); 
 		$("#tx2").css('display', 'none');
 		$("#tx3").css('display', 'none');
 		$("#tx4").css('display', 'none');
 		$("#tx5").css('display', 'block');
 		$("#tx6").css('display', 'block');
 		$("#tx7").css('display', 'block');
 		$("#tx8").css('display', 'block');
 		$("#tx9").css('display', 'block');
 		$("#tx10").css('display', 'block');
		$(".default_search_area").hide();
		$(".add_list tbody").hide();
		$(".add_detail tbody").show();
		$(".detail_btn_area").show();
		$(".page_wrap").hide();
		$("#saveBtn").show();
		$("#updateBtn").hide();
		$("#deleteBtn").hide();
		$("#listBtn").show();	
	/* 저장  */
	$(".detail_btn_area").off("click.saveBtn").on("click.saveBtn", "#saveBtn", function() {
 		if($("input[name=ated_code_nm2]:radio:checked").length == 0) {
 			alert("근태코드명을 선택해주세요.");
			$("#radio1").focus();
		} else if ($.trim($("#tx7").val()) == "") {
			alert("내용을 입력해주세요.");
			$("#tx7").focus();
		} else if ($.trim($("#tx9").val()) == "") {
			alert("시작시간을 선택해주세요.");
			$("#tx9").focus();
		} else if ($.trim($("#tx10").val()) == "") {
			alert("종료시간을 선택해주세요.");
			$("#tx10").focus();
		} else {
			makeBtn2Popup(1, "추가근무 수정", "수정하시겠습니까?", true, 400, 200, 
				      null, "저장", function() {
					     saved2();
					     closePopup(1);	
  		 		      }, "취소", function() {
				         closePopup(1);			  
	  		 		  });
			}
		});
	});
	/* 삭제 */
	$(".detail_btn_area").on("click", "#deleteBtn", function() {
		if (confirm("삭제하시겠습니까?")) {
			$("#tx2").val($(this).parent().parent().attr("name"));
			var params = $("#actionForm").serialize();

			$.ajax({
				type : "post",
				url : "addWorkDeleteAjax",
				dataType : "json", // {키:값, 키:값}
				data : params, // 보낼데이터
				success : function(res) { // 성공 시 해당 함수 실행, 결과는 result로 받겠다.
					if (res.res == "SUCCESS") {
						$("#ch1").show();
				 		$("#ch2").hide();
				 		$("#ch3").hide();
				 		$("#ch4").hide();
						$(".add_list").css('display', 'table');
						$(".add_detail").css('display', 'none');
				 		$(".add_add").css('display', 'none');
						$(".default_search_area").css('display', 'block');
						$(".page_wrap").css('display', 'block');
						$("#listBtn").css('display', 'none');
						$("#updateBtn").css('display', 'none');
						$("#deleteBtn").css('display', 'none');
						$(".detail_btn_area").css('display', 'none');
						$("#tx1").val("");
						$("#tx2").val("");
						reloadList();
					} else {
						$("#alert").attr("title", "알림");
						$("#alert p").html("삭제에 실패하였습니다.");
						$("#alert").dialog({
							buttons : {
								Ok : function() {
									$(this).dialog("close");
								}
							}
						});
					}
				},
				error : function(req, status, error) { // 결과, 상태값, 에러
					console.log("code : " + req.status);
					console.log("message : " + req.responseText);
				}
			});
		}
	});
});
/* 필터링 온클릭  */
function Select(obj){
    var Select = document.getElementById("searchGbn2");
    // select element에서 선택된 option의 text가 저장된다.
    var SelectText = Select.options[Select.selectedIndex].text;
    document.getElementById("searchGbn2").setAttribute("value", SelectText);
}
/* 등록일  */
function getTimeStamp() {
	var date = new Date();
	 
    var year = date.getFullYear(); //년도
    var month = date.getMonth()+1; //월
    var day = date.getDate(); //일
 
    if ((month+"").length < 2) {       // 월이 한자리 수인 경우 앞에 0을 붙여주기 위해
        month = "0" + month;
    }

    if ((day+"").length < 2) {       // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
        day = "0" + day;
    }
 
    var getToday = year+"-"+month+"-"+day; // 오늘 날짜 

	$("#tx18").val(getToday);
}
/* 등록  */
function saved1 () {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "addWorkAddAjax",
		dataType : "json", // {키:값, 키:값}
		data : params, //보낼데이터
		success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
			if (res.res == "SUCCESS") {
				$("#ch1").show();
		 		$("#ch2").hide();
		 		$("#ch3").hide();
		 		$("#ch4").hide();
		 		$(".add_list").css('display', 'table');
				$(".add_detail").css('display', 'none');
		 		$(".add_add").css('display', 'none');
				$(".default_search_area").css('display', 'block');
				$(".page_wrap").css('display', 'block');
				$("#saveBtn").css('display', 'none');
				$("#listBtn").css('display', 'none');
				$("input[name=ated_code_nm]:checked").val("");
				$("#tx16").val("");
				$("#tx17").val("");
				$("#tx18").val("");
				$("#tx19").val("");
				$("#tx20").val("");
				reloadList();
			} else if(res.res == "FAILED") {
				alert("잘못된 데이터를 입력하셨습니다.");
			} else {
				alert("등록중 문제가 발생하였습니다.");
			}
		},
		error : function(req, status, error) {
			
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}	
/* 수정  */
function saved2 () {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "addWorkUpdateAjax",
		dataType : "json", // {키:값, 키:값}
		data : params, //보낼데이터
		success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
			if (res.res == "SUCCESS") {
				$("#ch1").show();
		 		$("#ch2").hide();
		 		$("#ch3").hide();
		 		$("#ch4").hide();
		 		$(".add_list").css('display', 'table');
				$(".add_detail").css('display', 'none');
				$(".add_add").css('display', 'none');
				$(".default_search_area").css('display', 'block');
				$(".page_wrap").css('display', 'block');
				$("#saveBtn").css('display', 'none');
				$("#listBtn").css('display', 'none');
				reloadList();
			} else if(res.res == "FAILED") {
				alert("잘못된 데이터를 입력하셨습니다.");
			} else {
				alert("수정중 문제가 발생하였습니다.");
			}
		},
		error : function(req, status, error) {
			
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}
/* 조회  */
function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "addWorkMangAjax",
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
		html += "<td colspan=\"11\">데이터가 없습니다.</td>";
		html += "</tr>";
	} else {
		html += "<colgroup>";
		html += "<col width=\"50px\">";
		html += "<col width=\"80px\">";
		html += "<col width=\"70px\">";
		html += "<col width=\"70px\">";
		html += "<col width=\"70px\">";
		html += "<col width=\"120px\">";
		html += "<col width=\"120px\">";
		html += "<col width=\"120px\">";
		html += "<col width=\"140px\">";
		html += "<col width=\"80px\">";
		html += "<col width=\"80px\">";
		html += "</colgroup>";
		html += "<thead>";
		html += "<tr class=\"top\">";
		html += "<th>No</th>";
		html += "<th>사원번호</th>";
		html += "<th>성명</th>";
		html += "<th>부서</th>";
		html += "<th>직급</th>";
		html += "<th>근태코드명</th>";
		html += "<th>근태코드설명</th>";
		html += "<th>내용</th>";
		html += "<th>등록일</th>";
		html += "<th>시작시간</th>";
		html += "<th>종료시간</th>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody>";
		for(var i = 0 ; i < list.length ; i++) {
			html += "<tr name=\"" + list[i].ADD_WORK_NO + "\">";
			html += "<td>" + list[i].ADD_WORK_NO + "</td>";
			html += "<td>" + list[i].EMP_NO + "</td>";
			html += "<td>" + list[i].EMP_NM + "</td>";
			html += "<td>" + list[i].DEPT_NM + "</td>";
			html += "<td>" + list[i].POSN_NM + "</td>";
			html += "<td>" + list[i].ATED_CODE_NM + "</td>";
			html += "<td>" + list[i].ATED_CODE_EXPN + "</td>";
			html += "<td>" + list[i].CONT + "</td>";
			html += "<td>" + list[i].REG_DAY + "</td>";
			html += "<td>" + list[i].START_TIME + "</td>";
			html += "<td>" + list[i].END_TIME + "</td>";
			html += "</tr>";
		}
		html += "</tbody>";
	}  
	$(".add_list").html(html);
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
/* 상세보기  */
function reloadDetail() {
   var params = $("#actionForm").serialize();
   
   $.ajax({
      type : "post",
      url : "addWorkDetailContAjax",
      dataType : "json", // {키:값, 키:값}
      data : params, // 보낼데이터
      success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로 받겠다.
         drawDetail(res.addwork);
      },
      error : function(req, status, error) {
         console.log("code : " + req.status);
         console.log("message : " + req.responseText);
         
      }
   });
}
/* 상세보기  */  /* 보이면 cont1, 안보이면 cont2  */
function drawDetail(addwork) {
	
	var html = "";
	html += "<colgroup>";
	html += "<col width=\"150px\">";
	html += "<col width=\"300px\">";
	html += "</colgroup>";
	html += "<tr name=\"" + addwork.ADD_WORK_NO + "\">"
	html += "<th class=\"top2\">" + "사원번호" + "</th>";
	html += "<td class=\"cont1\">"
			+ addwork.EMP_NO
			+ "</td>";
	html += "<td class=\"cont2\">"
			+ "<input type=\"text\" id=\"tx1\" name=\"emp_no2\" value=\"" + addwork.EMP_NO + "\"  placeholder=\"내용을 입력해주세요.\" />"
		 	+ "</td>";		
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "성명" + "</th>";
	html += "<td class=\"cont1\">"
			+ addwork.EMP_NM
			+ "</td>";
	html += "<td class=\"cont2\">"
		    + "<input type=\"text\" id=\"tx2\" name=\"emp_nm2\"  value=\"" + addwork.EMP_NM + "\"  placeholder=\"내용을 입력해주세요.\" />"
	 	    + "</td>";		
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "부서" + "</th>";
	html += "<td class=\"cont1\">"
			+ addwork.DEPT_NM
			+ "</td>";
	html += "<td class=\"cont2\">"
		    + "<input type=\"text\" id=\"tx3\" name=\"dept_nm2\" value=\"" + addwork.DEPT_NM + "\"  placeholder=\"내용을 입력해주세요.\" />"
	 	    + "</td>";		
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "직급" + "</th>";
	html += "<td class=\"cont1\">"
			+ addwork.POSN_NM
			+ "</td>";
	html += "<td class=\"cont2\">"
			+ "<input type=\"text\" id=\"tx4\" name=\"posn_nm2\" value=\"" + addwork.POSN_NM + "\"  placeholder=\"내용을 입력해주세요.\" />"
		 	+ "</td>";		
	html += "</tr>";
	html += "<tr name=\"p\" id=\"p\">";
	html += "<th class=\"top2\">" + "근태코드명" + "</th>";
	html += "<td class=\"cont2\">"
			+ addwork.ATED_CODE_NM
			+ "</td>";
	html += "<td class=\"cont1\" id=\"radio1\">"
		switch(addwork.ATED_CODE_NM) {
			case 'A01' : 
			html += "<input type=\"radio\" id=\"tx5_1\" name=\"ated_code_nm2\" value=\"1\" checked=\"checked\" />A01";
			html += "<input type=\"radio\" id=\"tx5_2\" name=\"ated_code_nm2\" value=\"2\" />A02";
			html += "<input type=\"radio\" id=\"tx5_3\" name=\"ated_code_nm2\" value=\"3\" />A03";
			break;
			case 'A02' :
			html += "<input type=\"radio\" id=\"tx5_1\" name=\"ated_code_nm2\" value=\"1\" />A01";
			html += "<input type=\"radio\" id=\"tx5_2\" name=\"ated_code_nm2\" value=\"2\" checked=\"checked\" />A02";
			html += "<input type=\"radio\" id=\"tx5_3\" name=\"ated_code_nm2\" value=\"3\" />A03";
			break;
			case 'A03' :
			html += "<input type=\"radio\" id=\"tx5_1\" name=\"ated_code_nm2\" value=\"1\" />A01";		
			html += "<input type=\"radio\" id=\"tx5_2\" name=\"ated_code_nm2\" value=\"2\" />A02";		
			html += "<input type=\"radio\" id=\"tx5_3\" name=\"ated_code_nm2\" value=\"3\" checked=\"checked\" />A03";
			break;
		}
 			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "근태코드설명" + "</th>";
	html += "<td class=\"cont2\">"
			+ addwork.ATED_CODE_EXPN
			+ "</td>";
	html += "<td class=\"cont1\">"
	html += "<input type=\"text\" id=\"tx6\" name=\"ated_code_expn2\" value=\"" + addwork.ATED_CODE_EXPN + "\"  readonly=\"readonly\" />";
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "내용" + "</th>";
	html += "<td class=\"cont2\">"
			+ addwork.CONT
			+ "</td>";
	html += "<td class=\"cont1\">"
	html += "<input type=\"text\" id=\"tx7\" name=\"cont2\" value=\"" + addwork.CONT + "\"  placeholder=\"내용을 입력해주세요.\" />";
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "등록일" + "</th>";
	html += "<td class=\"cont2\">"
			+ addwork.REG_DAY
			+ "</td>";
	html += "<td class=\"cont1\">"
	html += "<input type=\"text\" id=\"tx8\" name=\"reg_day2\" value=\"" + addwork.REG_DAY + "\" readonly=\"readonly\"/>";
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "시작시간" + "</th>";
	html += "<td class=\"cont2\">"
			+ addwork.START_TIME
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"time\" id=\"tx9\" name=\"start_time2\" value=\"" + addwork.START_TIME + "\" />"
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "종료시간" + "</th>";
	html += "<td class=\"cont2\">"
			+ addwork.END_TIME
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"time\" id=\"tx10\" name=\"end_time2\" value=\"" + addwork.END_TIME + "\" />"
			+ "</td>";
	html += "</tr>";

	$(".add_detail tbody").html(html);
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
		<div class="contents_header_txt" id="ch1">추가근무 조회</div>
		<div class="contents_header_txt" id="ch2">추가근무 상세조회</div>
		<div class="contents_header_txt" id="ch3">추가근무 등록</div>
		<div class="contents_header_txt" id="ch4">추가근무 수정</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="sEmpNo" value="${sEmpNo}" />
			<input type="hidden" name="sEmpNm" value="${sEmpNm}" />
			<input type="hidden" name="sDeptNm" value="${sDeptNm}" />
			<input type="hidden" name="sPosnNm" value="${sPosnNm}" />
			<input type="hidden" name="add_work_no" id="add_work_no" value="${param.add_work_no}" />
			<input type="hidden" name="ated_code_no" id="ated_code_no" value="${param.ated_code_no}" />
			<input type="hidden" name="page" id="page" value="1" />
			<div class="default_search_area">
				<select name="searchGbn" id="searchGbn">
					<option value="0">사원번호</option>
					<option value="1">부서</option>
					<option value="2">근태코드설명</option>
					<option value="3">등록일</option>
				</select>
				<input type="text" name="searchTxt" value="${param.searchTxt}" placeholder="검색어를 입력해주세요." />
				<div class="search_btn_area">
					<input type="button" id="searchBtn" name="searchBtn" value="검색" />
					<input type="button" id="addBtn" name="addBtn" value="등록" />
				</div>
				<select name="searchGbn2" id="searchGbn2" onchange="Select(this.value)">
					<option value="A">전체</option>
					<option value="A01">A01</option>
					<option value="A02">A02</option>
					<option value="A03">A03</option>
				</select>
			</div>
			<div class="default_board">
				<table class="add_list">
				</table>
				<table class="add_detail">
					<tbody>
					</tbody>
				</table>
				<table class="add_add">
					<tbody>
					<colgroup>			
						<col width="150px">
						<col width="300px">
					</colgroup>
					<tr>
						<th class="top2">사원번호</th> <!-- tx 갯수만큼 필요 -->
						<td class="cont2">${sEmpNo}
				 			<input type="text" id="tx11" name="emp_no1" placeholder="내용을 입력해주세요." />
				 		</td>
					</tr>
					<tr>
						<th class="top2">성명</th>
						<td class="cont2">${sEmpNm}
				 			<input type="text" id="tx12" name="emp_nm1"  placeholder="내용을 입력해주세요." />
				 		</td>
					</tr>
					<tr>
						<th class="top2">부서</th>
						<td class="cont2">${sDeptNm}
				 			<input type="text" id="tx13" name="dept_nm1"  placeholder="내용을 입력해주세요." />
				 		</td>
					</tr>
					<tr>
						<th class="top2">직급</th>
						<td class="cont2">${sPosnNm}
				 			<input type="text" id="tx14" name="posn_nm1"  placeholder="내용을 입력해주세요." />
				 		</td>
					</tr>
					<tr>
						<th class="top2">근태코드명</th>
						<td class="cont2" id="radio2">
							<c:choose>
								<c:when test="${ated_code_nm eq 0}">
									<input type="radio" id="tx15_1" name="ated_code_nm1" value="1" checked="checked" />A01
								</c:when>
								<c:otherwise>
									<input type="radio" id="tx15_1" name="ated_code_nm1" value="1" />A01
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${ated_code_nm eq 1}">
									<input type="radio" id="tx15_2" name="ated_code_nm1" value="2" checked="checked" />A02
								</c:when>
								<c:otherwise>
									<input type="radio" id="tx15_2" name="ated_code_nm1" value="2" />A02
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${ated_code_nm eq 2}">
									<input type="radio" id="tx15_3" name="ated_code_nm1" value="3" checked="checked" />A03
								</c:when>
								<c:otherwise>
									<input type="radio" id="tx15_3" name="ated_code_nm1" value="3" />A03
								</c:otherwise>
							</c:choose>
				 		</td>
					</tr>
					<tr>
						<th class="top2">근태코드설명</th>
						<td class="cont2">
			 				<input type="text" id="tx16" name="ated_code_expn1" placeholder="근태코드명을 선택해주세요." readonly="readonly" />
				 		</td>
					</tr>
					<tr>
						<th class="top2">내용</th>
						<td class="cont2">
				 			<input type="text" id="tx17" name="cont1" placeholder="내용을 입력해주세요." />
				 		</td>
					</tr>
					<tr>
						<th class="top2">등록일</th>
						<td class="cont2">
				 			<input type="text" id="tx18" name="reg_day1" readonly="readonly" />
				 		</td>
					</tr>
					<tr>
						<th class="top2">시작시간</th>
						<td class="cont2">
				 			<input type="time" id="tx19" name="start_time1" />
				 		</td>
					</tr>
					<tr>
						<th class="top2">종료시간</th>
						<td class="cont2">
				 			<input type="time" id="tx20" name="end_time1"/>
				 		</td>
					</tr>
					</tbody>
				</table>
				<div class="detail_btn_area">
					<input type="button" id="saveBtn" name="saveBtn" value="저장" />
					<input type="button" id="updateBtn" name="updateBtn" value="수정" />
					<input type="button" id="deleteBtn" name="deleteBtn" value="삭제" />
					<input type="button" id="listBtn" name="listBtn" value="목록"/>
				</div>
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