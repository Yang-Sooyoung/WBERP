<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 연차사용 조회</title>
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
select:hover, .logo, #tx5_1, #tx5_2, #tx5_3, #tx17_1, #tx17_2, #tx17_3,
input[type=date]::-webkit-calendar-picker-indicator:hover {
	cursor: pointer;
}
#searchGbn2 {
	float: right;
}
#tx6, #tx8, #tx11, #tx12, #tx18, #tx20, #tx23 {
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
.anul_list {
	margin-bottom: 10px;
}
.anul_detail, .anul_add {
	display: none;
	margin-bottom: 10px;
}
#ch2, #ch3, #ch4, #radio1, #radio2 {
	display: none;
}
#tx1, #tx2, #tx3, #tx4, #tx5, #tx6, #tx7, #tx8, #tx9, #tx10, #tx11, #tx12,
#tx13, #tx14, #tx15, #tx16, #tx17, #tx18, #tx19, #tx20, #tx21, #tx22, #tx23 {
	display: none;
	width: 292px;
	height: 31.5px;
}
.top2 {
	background-color: #E4EAF2;
}
.anul_detail tbody tr:hover {
	background-color: inherit !important;
	color: inherit !important;
}
.anul_add tbody tr:hover {
	background-color: inherit !important;
	color: inherit !important;
}
</style>
</head>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
$(document).ready(function() { /* 상세조회에서 허가인거 수정 삭제 버튼 없애기  */
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
	$("input:radio[name=vact_code_nm1]").click(function(){
        if($("input[name=vact_code_nm1]:checked").val() == "1"){
            $("#tx18").val("유급휴가");
            $("#vact_code_no").val("1");
        }else if($("input[name=vact_code_nm1]:checked").val() == "2"){
        	$("#tx18").val("반차휴가");
            $("#vact_code_no").val("2");
        }else if($("input[name=vact_code_nm1]:checked").val() == "3"){
        	$("#tx18").val("무급휴가");
            $("#vact_code_no").val("3");
        }
    });
	/* 상세조회 안에 라디오 클릭 시  */
	$(document).on("click", "input:radio[name=vact_code_nm2]", function() {
        if($("input[name=vact_code_nm2]:checked").val() == "1"){
            $("#tx6").val("유급휴가");
            $("#vact_code_no").val("1");
        }else if($("input[name=vact_code_nm2]:checked").val() == "2"){
        	$("#tx6").val("반차휴가");
            $("#vact_code_no").val("2");
        }else if($("input[name=vact_code_nm2]:checked").val() == "3"){
        	$("#tx6").val("무급휴가");
            $("#vact_code_no").val("3");
        }
    });
	/* 조회목록으로 돌아가기 */
	$(".detail_btn_area").on("click", "#listBtn", function() {
		$("#ch1").show(); /* 제목  */
 		$("#ch2").hide();
 		$("#ch3").hide();
 		$("#ch4").hide();
 		$(".anul_list").css('display', 'table'); /* 테이블  */
 		$(".anul_list tbody").css('display', '');
		$(".anul_detail").css('display', 'none');
 		$(".anul_add").css('display', 'none');
		$(".default_search_area").show(); /* 검색  */
		$(".detail_btn_area").hide(); /* 아래 버튼  */
		$(".page_wrap").show(); /* 페이징 */
		$("input[name=vact_code_nm1]").removeAttr("checked");
		$("input[name=vact_code_nm2]").removeAttr("checked");
		$("#tx6").val("");
		$("#tx7").val("");
		$("#tx8").val("");
		$("#tx9").val("");
		$("#tx10").val("");
		$("#tx11").val("");
		$("#tx12").val("");
		$("#tx17").val("");
		$("#tx18").val("");
		$("#tx19").val("");
		$("#tx20").val("");
		$("#tx21").val("");
		$("#tx22").val("");
		$("#tx23").val("");
	});
	/* 상세조회 */
	$(".anul_list").on("click", "tbody tr", function() {
		var currentRow = $(this).closest("tr"); /* 클릭된 곳 가장 가까운 tr */
  		$("#p").children(".cont1").css('display', 'none'); /* 라디오 숨김  */
		$("#anul_use_no").val($(this).attr("name")); /* 글번호 */
		if($(this).find("td:eq(5)").text() == "B01"){ /* 휴가코드번호 */
	            $("#tx6").val("유급휴가");
	            $("#vact_code_no").val("1");
	    } else if($(this).find("td:eq(5)").text() == "B02"){
		        $("#tx6").val("반차휴가");
		        $("#vact_code_no").val("2");
	    } else if($(this).find("td:eq(5)").text() == "B03"){
		        $("#tx6").val("무급휴가");
		        $("#vact_code_no").val("3");
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
 		$("#tx5_1").css('display', 'none');
 		$("#tx5_2").css('display', 'none');
 		$("#tx5_3").css('display', 'none');
 		$("#tx6").css('display', 'none');
 		$("#tx7").css('display', 'none');
 		$("#tx8").css('display', 'none');
 		$("#tx9").css('display', 'none');
 		$("#tx10").css('display', 'none');
 		$("#tx11").css('display', 'none');
 		$("#tx12").css('display', 'none');
		$(".anul_list").css('display', 'none'); /* 테이블  */
		$(".anul_detail").css('display', 'table');
 		$(".anul_add").css('display', 'none');
		$(".default_search_area").hide(); /* 검색  */
		$(".detail_btn_area").show(); /* 아래 버튼  */
		$(".page_wrap").hide(); /* 페이징 */
		$("#saveBtn").hide(); /* 버튼  */
		$("#listBtn").show();  
		if (currentRow.find("td:eq(-1)").text() == "승인") {
			$("#updateBtn").hide();
			$("#deleteBtn").hide();
		} else if (currentRow.find("td:eq(1)").text() == "${sEmpNo}") {
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
 		$("#tx13").css('display', 'none');
 		$("#tx14").css('display', 'none');
 		$("#tx15").css('display', 'none');
 		$("#tx16").css('display', 'none');
 		$("#tx17").css('display', 'block');
 		$("#tx18").css('display', 'block');
 		$("#tx19").css('display', 'block');
 		$("#tx20").css('display', 'block');
 		$("#tx21").css('display', 'block');
 		$("#tx22").css('display', 'block');
 		$("#tx23").css('display', 'block');
		$(".anul_list").css('display', 'none'); /* 테이블  */
		$(".anul_detail").css('display', 'none');
		$(".anul_add").css('display', 'table');
		$(".default_search_area").hide(); /* 검색  */
		$(".detail_btn_area").show(); /* 아래 버튼  */
		$(".page_wrap").hide(); /* 페이징 */
		$("#saveBtn").show(); /* 버튼  */
		$("#updateBtn").hide();
		$("#deleteBtn").hide();
		$("#listBtn").show();	
 		$("#tx24").css('display', 'block');
	/* 저장  */
	$(".detail_btn_area").off("click.saveBtn").on("click.saveBtn", "#saveBtn", function() {
 		if($("input[name=vact_code_nm1]:radio:checked").length == 0) {
 			alert("휴가코드명을 선택해주세요.");
			$("#radio2").focus();
		} else if ($.trim($("#tx19").val()) == "") {
			alert("내용을 입력해주세요.");
			$("#tx19").focus();
		} else if ($.trim($("#tx21").val()) == "") {
			alert("시작일을 선택해주세요.");
			$("#tx21").focus();
		} else if ($.trim($("#tx22").val()) == "") {
			alert("종료일을 선택해주세요.");
			$("#tx22").focus();
		} else {
			makeBtn2Popup(1, "연차사용 등록", "등록하시겠습니까?", true, 400, 200, 
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
 		$("#tx11").css('display', 'block');
 		$("#tx12").css('display', 'block');
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
 		if($("input[name=vact_code_nm2]:radio:checked").length == 0) {
 			alert("휴가코드명을 선택해주세요.");
			$("#radio1").focus();
		} else if ($.trim($("#tx7").val()) == "") {
			alert("내용을 입력해주세요.");
			$("#tx7").focus();
		} else if ($.trim($("#tx9").val()) == "") {
			alert("시작일을 선택해주세요.");
			$("#tx9").focus();
		} else if ($.trim($("#tx10").val()) == "") {
			alert("종료일을 선택해주세요.");
			$("#tx10").focus();
		} else {
			makeBtn2Popup(1, "연차사용 수정", "수정하시겠습니까?", true, 400, 200, 
				      null, "저장", function() {
					     saved2();
					     closePopup(1);	
 		 		 	  }, "취소", function() {
				         closePopup(1);			  
 		 		  	  });
			}
		});
	});
	/* 삭제 */ /* 안에 내용 지우기  */
	$(".detail_btn_area").on("click", "#deleteBtn", function() {
		if (confirm("삭제하시겠습니까?")) {
			$("#tx2").val($(this).parent().parent().attr("name"));
			var params = $("#actionForm").serialize();
	
			$.ajax({
				type : "post",
				url : "anulUseDeleteAjax",
				dataType : "json", // {키:값, 키:값}
				data : params, // 보낼데이터
				success : function(res) { // 성공 시 해당 함수 실행, 결과는 result로 받겠다.
					if (res.res == "SUCCESS") {
						$("#ch1").show();
				 		$("#ch2").hide();
				 		$("#ch3").hide();
				 		$("#ch4").hide();
						$(".anul_list").css('display', 'table');
						$(".anul_detail").css('display', 'none');
				 		$(".anul_add").css('display', 'none');
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

	$("#tx20").val(getToday);
}
/* 등록 일수  */
function call1() {
    var sdd = document.getElementById("tx21").value;
    var edd = document.getElementById("tx22").value;
    var ar1 = sdd.split('-');
    var ar2 = edd.split('-');
    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
    var da2 = new Date(ar2[0], ar2[1], ar2[2]);
    var dif = da2 - da1;
    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
/*  var cMonth = cDay * 30;// 월 만듬
    var cYear = cMonth * 12; // 년 만듬  */
    
    if(edd < sdd) {
    	alert("시작일보다 종료일이 더 늦어야합니다.");
    	$("#tx22").val("");
		$("#tx23").val("");
		$("#tx22").focus(); 
    } else {
	    if(sdd && edd){
	/*  document.getElementById('years').value = parseInt(dif/cYear)
	    document.getElementById('months').value = parseInt(dif/cMonth) */  
	    document.getElementById("tx23").value = parseInt(dif/cDay)
	 	}
    }
}
/* 수정 일수  */
function call2() {
    var sdd = document.getElementById("tx9").value;
    var edd = document.getElementById("tx10").value;
    var ar1 = sdd.split('-');
    var ar2 = edd.split('-');
    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
    var da2 = new Date(ar2[0], ar2[1], ar2[2]);
    var dif = da2 - da1;
    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
/*  var cMonth = cDay * 30;// 월 만듬
    var cYear = cMonth * 12; // 년 만듬  */

    if(edd < sdd) {
    	alert("시작일보다 종료일이 더 늦어야합니다.");
    	$("#tx10").val("");
		$("#tx11").val("");
		$("#tx10").focus(); 
    } else {
	    if(sdd && edd){
	/*  document.getElementById('years').value = parseInt(dif/cYear)
	    document.getElementById('months').value = parseInt(dif/cMonth) */  
	    document.getElementById("tx11").value = parseInt(dif/cDay)
	 	}
    }
}
/* 등록  */
function saved1 () {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "anulUseAddAjax",
		dataType : "json", // {키:값, 키:값}
		data : params, //보낼데이터
		success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
			if (res.res == "SUCCESS") {
				$("#ch1").show();
		 		$("#ch2").hide();
		 		$("#ch3").hide();
		 		$("#ch4").hide();
		 		$(".anul_list").css('display', 'table');
				$(".anul_detail").css('display', 'none');
		 		$(".anul_add").css('display', 'none');
				$(".default_search_area").css('display', 'block');
				$(".page_wrap").css('display', 'block');
				$("#saveBtn").css('display', 'none');
				$("#listBtn").css('display', 'none');
				$("#tx18").val("");
				$("#tx19").val("");
				$("#tx20").val("");
				$("#tx21").val("");
				$("#tx22").val("");
				$("#tx23").val("");
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
		url : "anulUseUpdateAjax",
		dataType : "json", // {키:값, 키:값}
		data : params, //보낼데이터
		success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
			if (res.res == "SUCCESS") {
				$("#ch1").show();
		 		$("#ch2").hide();
		 		$("#ch3").hide();
		 		$("#ch4").hide();
		 		$(".anul_list").css('display', 'table');
				$(".anul_detail").css('display', 'none');
				$(".anul_add").css('display', 'none');
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
		url : "anulUseMangAjax",
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
		html += "<td colspan=\"13\">데이터가 없습니다.</td>";
		html += "</tr>";
	} else {
			html += "<colgroup>";
			html += "<col width=\"50px\">";
			html += "<col width=\"70px\">";
			html += "<col width=\"70px\">";
			html += "<col width=\"70px\">";
			html += "<col width=\"50px\">";
			html += "<col width=\"100px\">";
			html += "<col width=\"100px\">";
			html += "<col width=\"70px\">";
			html += "<col width=\"100px\">";
			html += "<col width=\"100px\">";
			html += "<col width=\"100px\">";
			html += "<col width=\"50px\">";
			html += "<col width=\"70px\">";
			html += "</colgroup>";
			html += "<thead>";
			html += "<tr class=\"top\">";                  
			html += "<th>No</th>";
			html += "<th>사원번호</th>";
			html += "<th>성명</th>";
			html += "<th>부서</th>";
			html += "<th>직급</th>";
			html += "<th>휴가코드명</th>";
			html += "<th>휴가코드설명</th>";
			html += "<th>내용</th>";
			html += "<th>등록일</th>";
			html += "<th>시작일</th>";
			html += "<th>종료일</th>";
			html += "<th>일수</th>";
			html += "<th>결재상태</th>";
			html += "</tr>";
			html += "</thead>";
			html += "<tbody>";
		for(var i = 0 ; i < list.length ; i++) {
			html += "<tr name=\"" + list[i].ANUL_USE_NO + "\">";
			html += "<td>" + list[i].ANUL_USE_NO + "</td>";
			html += "<td>" + list[i].EMP_NO + "</td>";
			html += "<td>" + list[i].EMP_NM + "</td>";
			html += "<td>" + list[i].DEPT_NM + "</td>";
			html += "<td>" + list[i].POSN_NM + "</td>";
			html += "<td>" + list[i].VACT_CODE_NM + "</td>";
			html += "<td>" + list[i].VACT_CODE_EXPN + "</td>";
			html += "<td>" + list[i].CONT + "</td>";
			html += "<td>" + list[i].REG_DAY + "</td>";
			html += "<td>" + list[i].START_DAY + "</td>";
			html += "<td>" + list[i].END_DAY + "</td>";
			html += "<td>" + list[i].DAY_CNT + "</td>";
			html += "<td id=\"as\" name=\"as\">" + list[i].APRV_STAT_TXT + "</td>";
			html += "</tr>";
		} 
		html += "</tbody>";
	}
	$(".anul_list").html(html);
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
      url : "anulUseDetailContAjax",
      dataType : "json", // {키:값, 키:값}
      data : params, // 보낼데이터
      success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로 받겠다.
         drawDetail(res.anuluse);
      },
      error : function(req, status, error) {
         console.log("code : " + req.status);
         console.log("message : " + req.responseText);
      }
   });
}
/* 상세보기  */  /* 보이면 cont1, 안보이면 cont2  */   
function drawDetail(anuluse) {

	var html = "";
	html += "<colgroup>";
	html += "<col width=\"150px\">";
	html += "<col width=\"300px\">";
	html += "</colgroup>";
	html += "<tr name=\"" + anuluse.ANUL_USE_NO + "\">"
	html += "<th class=\"top2\">" + "사원번호" + "</th>";
	html += "<td class=\"cont1\">"
			+ anuluse.EMP_NO
			+ "</td>";
	html += "<td class=\"cont2\">"
			+ "<input type=\"text\" id=\"tx1\" name=\"emp_no2\" value=\"" + anuluse.EMP_NO + "\"  placeholder=\"내용을 입력해주세요.\" />"
	 		+ "</td>";		
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "성명" + "</th>";
	html += "<td class=\"cont1\">"
			+ anuluse.EMP_NM
			+ "</td>";
	html += "<td class=\"cont2\">"
	    	+ "<input type=\"text\" id=\"tx2\" name=\"emp_nm2\"  value=\"" + anuluse.EMP_NM + "\"  placeholder=\"내용을 입력해주세요.\" />"
 	    	+ "</td>";	
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "부서" + "</th>";
	html += "<td class=\"cont1\">"
			+ anuluse.DEPT_NM
			+ "</td>";
	html += "<td class=\"cont2\">"
	   		+ "<input type=\"text\" id=\"tx3\" name=\"dept_nm2\" value=\"" + anuluse.DEPT_NM + "\"  placeholder=\"내용을 입력해주세요.\" />"
 	    	+ "</td>";		
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "직급" + "</th>";
	html += "<td class=\"cont1\">"
			+ anuluse.POSN_NM
			+ "</td>";
	html += "<td class=\"cont2\">"
			+ "<input type=\"text\" id=\"tx4\" name=\"posn_nm2\" value=\"" + anuluse.POSN_NM + "\"  placeholder=\"내용을 입력해주세요.\" />"
		 	+ "</td>";	
	html += "</tr>";
	html += "<tr name=\"p\" id=\"p\">";
	html += "<th class=\"top2\">" + "휴가코드명" + "</th>";
	html += "<td class=\"cont2\">"
			+ anuluse.VACT_CODE_NM
			+ "</td>";
	html += "<td class=\"cont1\" id=\"radio1\">"
		switch(anuluse.VACT_CODE_NM) {
			case 'B01' : 
			html += "<input type=\"radio\" id=\"tx5_1\" name=\"vact_code_nm2\" value=\"1\" checked=\"checked\" />B01";
			html += "<input type=\"radio\" id=\"tx5_2\" name=\"vact_code_nm2\" value=\"2\" />B02";
			html += "<input type=\"radio\" id=\"tx5_3\" name=\"vact_code_nm2\" value=\"3\" />B03";
			break;
			case 'B02' :
			html += "<input type=\"radio\" id=\"tx5_1\" name=\"vact_code_nm2\" value=\"1\" />B01";
			html += "<input type=\"radio\" id=\"tx5_2\" name=\"vact_code_nm2\" value=\"2\" checked=\"checked\" />B02";
			html += "<input type=\"radio\" id=\"tx5_3\" name=\"vact_code_nm2\" value=\"3\" />B03";
			break;
			case 'B03' :
			html += "<input type=\"radio\" id=\"tx5_1\" name=\"vact_code_nm2\" value=\"1\" />B01";		
			html += "<input type=\"radio\" id=\"tx5_2\" name=\"vact_code_nm2\" value=\"2\" />B02";		
			html += "<input type=\"radio\" id=\"tx5_3\" name=\"vact_code_nm2\" value=\"3\" checked=\"checked\" />B03";
			break;
		}
 			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "휴가코드설명" + "</th>";
	html += "<td class=\"cont2\">"
			+ anuluse.VACT_CODE_EXPN
			+ "</td>";
	html += "<td class=\"cont1\">"
	html += "<input type=\"text\" id=\"tx6\" name=\"vact_code_expn2\" value=\"" + anuluse.VACT_CODE_EXPN + "\"  readonly=\"readonly\" />";
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "내용" + "</th>";
	html += "<td class=\"cont2\">"
			+ anuluse.CONT
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx7\" name=\"cont2\" value=\"" + anuluse.CONT + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "등록일" + "</th>";
	html += "<td class=\"cont2\">"
			+ anuluse.REG_DAY
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx8\" name=\"reg_day2\" value=\"" + anuluse.REG_DAY + "\" readonly=\"readonly\" />"
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "시작일" + "</th>";
	html += "<td class=\"cont2\">"
			+ anuluse.START_DAY
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"date\" id=\"tx9\" name=\"start_day2\" onchange=\"call2()\" value=\"" + anuluse.START_DAY + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "종료일" + "</th>";
	html += "<td class=\"cont2\">"
			+ anuluse.END_DAY
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"date\" id=\"tx10\" name=\"end_day2\" onchange=\"call2()\" value=\"" + anuluse.END_DAY + "\"  placeholder=\"내용을 입력해주세요.\" />"
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "일수" + "</th>";
	html += "<td class=\"cont2\">"
			+ anuluse.DAY_CNT
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx11\" name=\"day_cnt2\" value=\"" + anuluse.DAY_CNT + "\" placeholder=\"시작일과 종료일을 선택해주세요.\" readonly=\"readonly\" />"
			+ "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<th class=\"top2\">" + "결재상태" + "</th>";
	html += "<td class=\"cont2\" id=\"ap\" name=\"ap\" >"
			+ anuluse.APRV_STAT_TXT
			+ "</td>";
	html += "<td class=\"cont1\">"
			+ "<input type=\"text\" id=\"tx12\" name=\"aprv_stat\" value=\"" + anuluse.APRV_STAT_TXT + "\" readonly=\"readonly\" />"
			+ "</td>";
	html += "</tr>";

	$(".anul_detail tbody").html(html);
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
		<div class="contents_header_txt" id="ch1">연차사용 조회</div>
		<div class="contents_header_txt" id="ch2">연차사용 상세조회</div>
		<div class="contents_header_txt" id="ch3">연차사용 등록</div>
		<div class="contents_header_txt" id="ch4">연차사용 수정</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<input type="hidden" name="anul_use_no" id="anul_use_no" value="${param.anul_use_no}" /> <!-- 1.연차사용번호  -->
			<input type="hidden" name="sEmpNo" value="${sEmpNo}" /> <!-- 2.사원번호 -->
 			<input type="hidden" name="athrno" id="athrno" value="4" /> <!-- 3.결재권자 번호 --> <!-- 4.제목, 5.내용  -->
			<input type="hidden" name="type" id="type" value="연차사용결재" /> <!-- 6.결재유형  -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="sEmpNm" value="${sEmpNm}" />
			<input type="hidden" name="sDeptNm" value="${sDeptNm}" />
			<input type="hidden" name="sPosnNm" value="${sPosnNm}" />
			<input type="hidden" name="vact_code_no" id="vact_code_no" value="${param.vact_code_no}" />
			<input type="hidden" name="page" id="page" value="1" />
			<div class="default_search_area">
				<select name="searchGbn" id="searchGbn">
					<option value="0">사원번호</option>
					<option value="1">부서</option>
					<option value="2">휴가코드설명</option>
					<option value="3">등록일</option>
					<option value="4">결재상태</option>
				</select>
				<input type="text" name="searchTxt" value="${param.searchTxt}" placeholder="검색어를 입력해주세요." />
				<div class="search_btn_area">
					<input type="button" id="searchBtn" name="searchBtn" value="검색" />
					<input type="button" id="addBtn" name="addBtn" value="등록" />
				</div>
				<select name="searchGbn2" id="searchGbn2" onchange="Select(this.value)">
					<option value="B">전체</option>
					<option value="B01">B01</option>
					<option value="B02">B02</option>
					<option value="B03">B03</option>
				</select>
			</div>
			<div class="default_board">
				<table class="anul_list">
				</table>
				<table class="anul_detail">
					<tbody>
					</tbody>
				</table>
				<table class="anul_add">
					<tbody>
					<colgroup>			
						<col width="150px">
						<col width="300px">
					</colgroup>
					<tr>
						<th class="top2">사원번호</th> <!-- tx 갯수만큼 필요 -->
						<td class="cont2">${sEmpNo}
				 			<input type="text" id="tx13" name="emp_no1" placeholder="내용을 입력해주세요." />
				 		</td>
					</tr>
					<tr>
						<th class="top2">성명</th>
						<td class="cont2">${sEmpNm}
				 			<input type="text" id="tx14" name="emp_nm1"  placeholder="내용을 입력해주세요." />
				 		</td>
					</tr>
					<tr>
						<th class="top2">부서</th>
						<td class="cont2">${sDeptNm}
				 			<input type="text" id="tx15" name="dept_nm1"  placeholder="내용을 입력해주세요." />
				 		</td>
					</tr>
					<tr>
						<th class="top2">직급</th>
						<td class="cont2">${sPosnNm}
				 			<input type="text" id="tx16" name="posn_nm1"  placeholder="내용을 입력해주세요." />
				 		</td>
					</tr>
					<tr>
						<th class="top2">휴가코드명</th>
						<td class="cont2" id="radio2">
							<c:choose>
								<c:when test="${vact_code_nm eq 0}">
									<input type="radio" id="tx17_1" name="vact_code_nm1" value="1" checked="checked" />B01
								</c:when>
								<c:otherwise>
									<input type="radio" id="tx17_1" name="vact_code_nm1" value="1" />B01
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${vact_code_nm eq 1}">
									<input type="radio" id="tx17_2" name="vact_code_nm1" value="2" checked="checked" />B02
								</c:when>
								<c:otherwise>
									<input type="radio" id="tx17_2" name="vact_code_nm1" value="2" />B02
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${vact_code_nm eq 2}">
									<input type="radio" id="tx17_3" name="vact_code_nm1" value="3" checked="checked" />B03
								</c:when>
								<c:otherwise>
									<input type="radio" id="tx17_3" name="vact_code_nm1" value="3" />B03
								</c:otherwise>
							</c:choose>
				 		</td>
					</tr>
					<tr>
						<th class="top2">휴가코드설명</th>
						<td class="cont2">
			 				<input type="text" id="tx18" name="vact_code_expn1" placeholder="휴가코드명을 선택해주세요." readonly="readonly" />
				 		</td>
					</tr>
					<tr>
						<th class="top2">내용</th>
						<td class="cont2">
				 			<input type="text" id="tx19" name="cont1" placeholder="내용을 입력해주세요." />
				 		</td>
					</tr>
					<tr>
						<th class="top2">등록일</th>
						<td class="cont2">
				 			<input type="text" id="tx20" name="reg_day1" readonly="readonly" />
				 		</td>
					</tr>
					<tr>
						<th class="top2">시작일</th>
						<td class="cont2">
				 			<input type="date" id="tx21" name="start_day1" onchange="call1()" />
				 		</td>
					</tr>
					<tr>
						<th class="top2">종료일</th>
						<td class="cont2">
				 			<input type="date" id="tx22" name="end_day1" onchange="call1()"/>
				 		</td>
					</tr>
					<tr>
						<th class="top2">일수</th>
						<td class="cont2">
				 			<input type="text" id="tx23" name="day_cnt1"  placeholder="시작일과 종료일을 선택해주세요." readonly="readonly" />
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