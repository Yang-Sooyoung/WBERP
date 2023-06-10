<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - Sales Page</title>
<!-- Fullcalendar css -->
<link rel="stylesheet" type="text/css" href="resources/script/fullcalendar/fullcalendar.css" />
<style type="text/css">
/* 검색영역 가로변경 시 */
.default_search_area {
	display: inline-block;
	vertical-align: top;
	width: 700px;
}

/* 목록영역 가로변경 시 */
.default_board {
	display: inline-block;
	vertical-align: top;
	width: 800px;
}
/* 상세보기영역 가로변경 시 */
.popup_underbox {
    width: 1100px;
    border-top: 2px solid #9aa9bd;
    border-bottom: 1px solid #9aa9bd;
    margin-bottom: 10px;
}

/* 버튼영역 가로변경 시 */
.detail_btn_area {
	width: 645px;
}
/* 개별 css는 여기에 */
.calendar{
	display: inline-block;
	vertical-align: top;
	font-size: 11pt;
	width: 800px;
	height: 600px;
	margin-right: 10px;
}
.contents{
	display: inline-block;
	vertical-align: top;
}

.da{
	display: inline-block;
	font-size: 20pt;
	margin-right: 20px;
	color: #022859;
}
.schedule_place{
	display: inline-block;
}
.place_btn {
	
	min-width: 40px;
	height: 22px;
	font-size: 10pt;
	background-color: #022859;
	border-radius: 3px;
	margin-left: 3px;
	margin-right: 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
	cursor: pointer;
	color: #fff;
}
.main_right{
	display: inline-block;
	vertical-align: top;
	width: 850px;
	height: 600px;
}
.place_btn:hover {
	background-color: #f7f7f7;
	border: 1px solid #022859;
	color: #000000;
}
.popup_con1, .popup_con2, .popup_con3 {
	font-size: 10pt;
	min-height: 43px;
	line-height: 43px;
	display: inline-block;
	padding: 0px 5px;
}


.popup_con1 {
	width: 400px;
}

.popup_con2 {
	width: 400px;
}

.popup_con3 {
	width: 950px;
}
.add_txt{
	text-align:center;
	color: #A4A4A4;

}
.add_line1{
 	width : 140px;
}
.pl_txt{
	width: 500px;
	height: 28px;
	font-size: 10pt;
	border-radius: 3px;
	margin: 0 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
}

.regi_right{
	display: inline-block;
	vertical-align: top;
	font-size: 10pt;
	color:red;
	margin: 10px 0px 0px 720px;
}
.upload{
	margin: 0px 0px 5px 769px;
	
}
.popup_contents2{
	display: inline-block;
	vertical-align: top;
	padding: 0px 20px;
	width: 1170px;
	height: 600px;
	margin-left: 10px;
}
.contents2{
	display: inline-block;
	vertical-align: top;
	padding: 0px 20px;
	width: 1100px;
	height: 650px;
}
.add_file_txt{
	width: 927px;
	height: 120px;
	border: 1px solid #585858;
	padding: 2px;
	margin-top: 5px;
	margin-bottom: 5px;
	border-radius: 2px;
}
.popup_btn{

	margin-top : 90px;
}
.search_area{
display: inline-block;

}
.search_list {
	width: 760px;
	border-collapse: collapse;
	text-align: center;
	border-color: #c2c2c2;
	margin-top: 10px;
	border-top: 2px solid #7f7f7f;
	border-bottom: 2px solid #7f7f7f;
	font-size: 10pt;
	margin-left: 85px;
}

.search_list th {
	color: #3c3c3d;
	font-size: 11pt;
}

.search_list tr {
	height: 40px;
	border-top: 1px solid #c2c2c2;
}

.search_list .top {
	height: 45px;
	padding: 10px 0px;
	color: #292d33;
	background-color: #E4EAF2;
}
.map{
	margin-left: 85px;
	width:760px ;
	height:450px;
}
.map_box{
	display: inline-block;
	position: absolute;
	background-color: white;
	top: calc(80% - 40px);
	left: calc(50% - 300px);
	width: 600px;
	height: 70px;
	z-index: 200;
}
.map_box_txt{
	font-size: 11pt;
	text-align: center;
	margin-top : 25px;
}
.contents3{
	display: inline-block;
	vertical-align: top;
	height: 550px;
	margin-left: 20px;
}


.default_board table tbody .place{
  display:block;
  overflow: hidden; 
  text-overflow: ellipsis;
  white-space: nowrap; 
  width: 250px;
}
.default_board table tbody .place :not(.place_btn){
 display:block;
  overflow: hidden; 
  text-overflow: ellipsis;
  white-space: nowrap; 
   width: 250px;
}
.fc-sun {color:#e31b23}
.fc-sat {color:#007dc3}
#moveentpinfo, #movecustinfo, #movegodsinfo{
cursor: pointer;
}
#moveentpinfo input[type='text']:hover,#movecustinfo input[type='text']:hover,#movegodsinfo input[type='text']:hover {
	background-color: #f7f7f7;
	border: 1px solid #022859;
	color: #000000;
	cursor: pointer;
	
}
</style>



<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- Moment Script -->
<script type="text/javascript" src="resources/script/jquery/moment.js"></script>


<!-- Fullcalendar Script -->
<script type="text/javascript" src="resources/script/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript" src="resources/script/fullcalendar/locale-all.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3bd9469582b1999451af9d84d4742ea3&libraries=services"></script>
<script type="text/javascript"></script>
<!-- 추가스크립트 작업 -->

<script type="text/javascript">
 
	var data =  [];
	var id=0;
	var empno=0;
	var deptno=0;
	var title="";
	var start = "";
	var end="";
	
$(document).ready(function() {
	sysDate();
	$(".calendar").fullCalendar({
		header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'month,agendaWeek,agendaDay,listMonth'
	      },
	      defaultDate: new Date(),
	      locale: "ko",
	      editable: false,
	      height: 600,
	      events: data,
	      eventLimit:true,
	      eventClick: function(event) { // 이벤트 클릭
	    	  if($("#sEmpNo").val()==event.empno||event.deptno==6){
		      console.log($("#sEmpNo").val());
		      console.log(event.empno);
		      console.log(event.deptno);
		      
	    		  
	    	  $("#salescheno").val(event.id);
		      console.log($("#salescheno").val());
		    	  var html = "";
					html += "	<div class=\"contents2\">";
					html += "	</div>";
					
					makeBtn3Popup(1, "상세 팝업", html, false, 1200, 780,
							function(){					
						saleScheDetail();
						$(document).on("click", "#moveentpinfo",function(){
							$("#entpNo").val($("#moveentpinfoHidden").attr("name"));
							$("#actionForm").attr("action", "CustComDetail");
							$("#actionForm").submit();
							
						});
						 
						$(document).on("click", "#movecustinfo",function(){
							$("#custNo").val($("#movecustinfoHidden").attr("name"));
							$("#actionForm").attr("action", "CustDetail");
							$("#actionForm").submit();
							
						});
						$(document).on("click", "#movegodsinfo",function(){
							$("#gods_no").val($("#movegodsinfoHidden").attr("name"));
							$("#actionForm").attr("action", "godsDetail");
							$("#actionForm").submit();
							
						});
						$(document).on("click","#placeBtn2",function() {
							
							var html = "";
							html += "	<div class=\"contents3\">";
							html += "	</div>";
							
							makeBtn1Popup(2, "지도보기", html, true,1000, 700,
									saleScheMap(), "확인", function() {
											closePopup(2);
										});
						});
						
					}, "확인", function() {
							closePopup(1);
					}, "수정", function() {
							$("#actionForm").attr("action", "saleScheMangUpdate");
							$("#actionForm").submit();
					}, "삭제", function() {
							makeBtn2Popup(2, "삭제 경고", "삭제하시겠습니까?", true, 400, 200,
									null, "예", function() {
										deleteSaleSche();
										closePopup(2);
										closePopup(1);
									}, "아니오", function() {
										closePopup(2);
									});
					});
				}else{
					 $("#salescheno").val(event.id);
					
					var html = "";
					html += "	<div class=\"contents2\">";
					html += "	</div>";
					
					makeBtn1Popup(1, "상세 팝업", html, false, 1200, 780,
							function(){					
						saleScheDetail();
						$(document).on("click", "#moveentpinfo",function(){
							$("#entpNo").val($("#moveentpinfoHidden").attr("name"));
							$("#actionForm").attr("action", "CustComDetail");
							$("#actionForm").submit();
							
						});
						 
						$(document).on("click", "#movecustinfo",function(){
							$("#custNo").val($("#movecustinfoHidden").attr("name"));
							$("#actionForm").attr("action", "CustDetail");
							$("#actionForm").submit();
							
						});
						
						$(document).on("click", "#movegodsinfo",function(){
							$("#gods_no").val($("#movegodsinfoHidden").attr("name"));
							$("#actionForm").attr("action", "godsDetail");
							$("#actionForm").submit();
							
						});
						$(document).on("click","#placeBtn2",function() {
							
							var html = "";
							html += "	<div class=\"contents3\">";
							html += "	</div>";
							
							makeBtn1Popup(2, "지도보기", html, true,1000, 700,
									saleScheMap(), "확인", function() {
											closePopup(2);
										});
						});
						
					}, "확인", function() {
						closePopup(1);
					});
				};
					
				
	    	  
					
	      },
	      dayClick: function(date, js, view) { // 일자 클릭
			$("#page").val(1);
	    	$("#sysdate").val(date.format());
	    	$("#sysdate2").text($("#sysdate").val());
	    	console.log($("#sysdate").val());
	    	reloadList();
			
	    	  //alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

	    	  //alert('Current view: ' + view.name);
	      }
	});
	calendarDraw();
	
	$("#eventChangeBtn").on("click", function() {
		var newEvents = [ {
			title : "계획1",
			start : "2019-01-02",
			end : "2019-01-08",
			color : 'yellow', // 기타 옵션들
			textColor : 'black',

		}, {
			title : "계획2",
			start : "2019-01-02",
			end : "2019-01-08",
			color : 'green', // 기타 옵션들
			textColor : 'black',
		} ];
		
		var oldEvents = $("#fullCalendarArea").fullCalendar("getEventSources");
		//기존 이벤트 제거
		$("#fullCalendarArea").fullCalendar("removeEventSources", oldEvents);
		$("#fullCalendarArea").fullCalendar("refetchEvents");
		//신규이벤트 추가
		$("#fullCalendarArea").fullCalendar("addEventSource", newEvents);
		$("#fullCalendarArea").fullCalendar("refetchEvents");
	});
});

 
	$(document).ready(function() {
		reloadList();
		
		
		$(".page_nation").on("click", "div", function() {
			$("#page").val($(this).attr("name"));
			reloadList();
		});
		
		if('${param.searchGbn}' != '') {
			$("#searchGbn").val('${param.searchGbn}');
		}
		
		$("#searchBtn").on("click", function() {
			$("#page").val("1");
			reloadList();
		});
		
		$("#addBtn").on("click", function(){
			$("#actionForm").attr("action", "saleScheMangAdd");
			$("#actionForm").submit();
		});
	
		
		
		$(".default_board tbody").on("click", "tr", function() {
			if($(this).attr("id")==$("#sEmpNo").val() || $(this).children("input").val()=="시스템관리부"){
				
			$("#salescheno").val($(this).attr("name"));
			
			var html = "";
			html += "	<div class=\"contents2\">";
			html += "	</div>";
			
			makeBtn3Popup(1, "상세 팝업", html, false, 1200, 780,
					function(){					
						saleScheDetail();
						$(document).on("click", "#moveentpinfo",function(){
							$("#entpNo").val($("#moveentpinfoHidden").attr("name"));
							$("#actionForm").attr("action", "CustComDetail");
							$("#actionForm").submit();
							
						});
						 
						$(document).on("click", "#movecustinfo",function(){
							$("#custNo").val($("#movecustinfoHidden").attr("name"));
							$("#actionForm").attr("action", "CustDetail");
							$("#actionForm").submit();
							
						});
						
						$(document).on("click", "#movegodsinfo",function(){
							$("#gods_no").val($("#movegodsinfoHidden").attr("name"));
							$("#actionForm").attr("action", "godsDetail");
							$("#actionForm").submit();
							
						});
						
						$(document).on("click","#placeBtn2",function() {
							
							var html = "";
							html += "	<div class=\"contents3\">";
							html += "	</div>";
							
							makeBtn1Popup(2, "지도보기", html, true,1000, 700,
									saleScheMap(), "확인", function() {
											closePopup(2);
										});
							});
						
					}, "확인", function() {
						closePopup(1);
					}, "수정", function() {
						$("#actionForm").attr("action", "saleScheMangUpdate");
						$("#actionForm").submit();
					}, "삭제", function() {
						makeBtn2Popup(2, "삭제 경고", "삭제하시겠습니까?", true, 400, 200,
								null, "예", function() {
									deleteSaleSche();
									closePopup(2);
									closePopup(1);
								}, "아니오", function() {
									closePopup(2);
								});
					});
			}else{
				$("#salescheno").val($(this).attr("name"));
				
				var html = "";
				html += "	<div class=\"contents2\">";
				html += "	</div>";
				
				makeBtn1Popup(1, "상세 팝업", html, false, 1200, 780,
						function(){					
					saleScheDetail();
					$(document).on("click", "#moveentpinfo",function(){
						$("#entpNo").val($("#moveentpinfoHidden").attr("name"));
						$("#actionForm").attr("action", "CustComDetail");
						$("#actionForm").submit();
						
					});
					 
					$(document).on("click", "#movecustinfo",function(){
						$("#custNo").val($("#movecustinfoHidden").attr("name"));
						$("#actionForm").attr("action", "CustDetail");
						$("#actionForm").submit();
						
					});
					
					$(document).on("click", "#movegodsinfo",function(){
						$("#gods_no").val($("#movegodsinfoHidden").attr("name"));
						$("#actionForm").attr("action", "godsDetail");
						$("#actionForm").submit();
						
					});
					$(document).on("click","#placeBtn2",function() {
						
						var html = "";
						html += "	<div class=\"contents3\">";
						html += "	</div>";
						
						makeBtn1Popup(2, "지도보기", html, true,1000, 700,
								saleScheMap(), "확인", function() {
										closePopup(2);
									});
						});
					
				}, "확인", function() {
					closePopup(1);
						});
			}
			
		});
		
		$(".default_board tbody").on("click", "#placeBtn",function() {
			console.log("name : " + $(this).attr("name"));
			
			$("#salescheno").val($(this).attr("name"));
			
			
			var html = "";
			html += "	<div class=\"contents3\">";
			html += "	</div>";
			
			makeBtn1Popup(1, "지도보기", html, true,1000, 700,
					saleScheMap(), "확인", function() {
							closePopup(1);
						});
			}); 
			
		   		
	
	
	});   		
	
	
	
	function calendarDraw(){
		var params = $("#actionForm").serialize(); 
		
		$.ajax({ 
			type : "post", 
			url : "fullcalendarAjax",
			dataType : "json",
			data : params,
			success : function(res){		
			
				var oldEvents = $(".calendar").fullCalendar("getEventSources");
				//기존 이벤트 제거
				$(".calendar").fullCalendar("removeEventSources", oldEvents);
				$(".calendar").fullCalendar("refetchEvents");
				//신규이벤트 추가
				$(".calendar").fullCalendar("addEventSource", res.calendar);
				$(".calendar").fullCalendar("refetchEvents");
			}, 
			error : function(req, status, error){ 
				console.log("code : " + req.status); 
				console.log("message : " + req.responseText);
			}
		});
	}
	
	
	
	function reloadList(){
		var params = $("#actionForm").serialize(); 
		
		$.ajax({ 
			type : "post", 
			url : "saleScheMangAjax",
			dataType : "json",
			data : params,
			success : function(res){		
				drawList(res.list, res.cnt);
				drawPaging(res.pb);
			}, 
			error : function(req, status, error){ 
				console.log("code : " + req.status); 
				console.log("message : " + req.responseText);
			}
		});
	}

	function drawList(list, cnt){ 
		var html = "";
		
		
		if(cnt == 0){
			html += "<tr>";
			html += "<td colspan=\"6\">데이터가 없습니다.</td>"; 
			html += "</tr>";
		}else{
			for(var i = 0 ; i < list.length ; i++){
				html += "<tr id=\""+list[i].EMP_NO+"\" name=\"" + list[i].SALE_SCHE_NO + "\">";
				html += "<input type=\"hidden\" value=\"${sDeptNm}\"  />";
				console.log(list[i].SALE_SCHE_NO);
				html += "<td>" + list[i].SALE_SCHE_NO + "</td>";
				html += "<td>" + list[i].ENTP_NM + "</td>";
				html += "<td>" + list[i].CUST_NM + "</td>";
				html += "<td>" + list[i].EMP_NM + "</td>";
				html += "<td>" + list[i].SCHE_START_DAY_TIME + " ~ " + list[i].SCHE_END_DAY_TIME + "</td>";
				html += "<td class=\"place\">" + list[i].SCHE_LOCT + "<div class=\"schedule_place\"><input class=\"place_btn\" id=\"placeBtn\" name=\"" + list[i].SALE_SCHE_NO + "\"type=\"button\" value=\"지도\"/></div>	</td>";
				html += "</tr>"
				};
		}
		$(".sale_sche_mang_list tbody").html(html);
	}

	function drawPaging(pb) {
		var html = "";

		if ($("#page").val() == 1) {
			html += "<div class=\"arrow prev\" name=\"1\"></div>";
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
			html += "<div name =\"" +pb.maxPcount + "\"></div>";
		} else {
			html += "<div class=\"arrow next\" name =\"" + ($("#page").val() * 1 + 1) + "\"></div> ";
		}

		$(".page_nation").html(html);
	}
	
	function sysDate(){
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		
		if(month < 10){
			month = "0" + month;
		}
		if(day < 10){
			day = "0" + day;
		}
		 $("#sysdate2").text(year + "-" + month + "-" + day);
		 $("#sysdate").val(year + "-" + month + "-" + day);
	}
	
	//디테일
	function saleScheDetail(){
		var params = $("#actionForm").serialize(); 
		
		$.ajax({ 
			type : "post", 
			url : "saleScheDetailAjax",
			dataType : "json",
			data : params,
			success : function(res){	
				$(".contents2").html(drawSaleScheDetail(res.data));
				
			
			}, 
			error : function(req, status, error){ 
				console.log("code : " + req.status); 
				console.log("message : " + req.responseText);
			}
		});
	}
	//디테일 그리기
	function drawSaleScheDetail(data){
		var html = "";
		
	
	html += "	<div class=\"popup_underbox\">                                                                                                   ";
	html += "		<div class=\"underline\">                                                                                              ";
	html += "				<div class=\"line1\">담당자</div>                                                                              ";
	html += "				<div class=\"popup_con1\">                                                                                           ";
	html += "					<input type=\"text\" value=\"" + data.EMP_NM + "\"disabled=\"disabled\"/>                                                  ";
	html += "					<input type=\"hidden\" id=\"inputempno\" value=\"" + data.EMP_NO + "\"/>                                                  ";
	html += "				</div>                                                                                                       ";
	html += "				<div class=\"line1\">부서</div>                                                                                ";
	html += "				<div class=\"popup_con1\">                                                                                           ";
	html += "					<select>                                                                                                 ";
	html += "						<option disabled=\"disabled\" selected=\"selected\">" + data.DEPT_NM +"</option>                                    ";
	html += "					<input type=\"hidden\" id=\"inputdeptno\" value=\"" + data.DEPT_NO + "\"/>                                                  ";
	html += "					</select>                                                                                                ";
	html += "				</div>                                                                                                       ";
	html += "			</div>                                                                                                           ";
	html += "			<div class=\"underline\">                                                                                          ";
	html += "				<div class=\"line1\">이메일</div>                                                                              ";
	html += "				<div class=\"popup_con1\">                                                                                           ";
	html += "					<input type=\"text\" value=\"" + data.EMAIL + "\"disabled=\"disabled\"/>                                           ";
	html += "				</div>                                                                                                       ";
	html += "				<div class=\"line1\">핸드폰 번호</div>                                                                         ";
	html += "				<div class=\"popup_con1\">                                                                                           ";
	html += "					<input type=\"text\" value=\"" + data.CELL_NO + "\"disabled=\"disabled\"/>                                           ";
	html += "				</div>                                                                                                       ";
	html += "			</div>                                                                                                           ";
	html += "			<div class=\"underline\">                                                                                          ";
	html += "				<div class=\"line1\">활동명</div>                                                                              ";
	html += "				<div class=\"popup_con1\">                                                                                           ";
	html += "					<input type=\"text\"  value=\""+ data.SCHE_NM + "\" disabled=\"disabled\" />                                      ";
	html += "				</div>                                                                                                       ";
	html += "				<div class=\"line1\">날짜</div>                                                                                ";
	html += "				<div class=\"popup_con1\">                                                                                           ";
	html += "					<input type=\"date\" value=\""+ data.SCHE_START_DAY+"\" disabled=\"disabled\"  />                                            ";
	html += "				</div>                                                                                                       ";
	html += "			</div>                                                                                                           ";
	html += "			<div class=\"underline\">                                                                                          ";
	html += "				<div class=\"line1\">고객사 명</div>                                                                           ";
	html += "				<div class=\"popup_con1\">                                                                                           ";
	html += "					<input type=\"text\" id=\"moveentpinfo\" value=\""+ data.ENTP_NM + "\" readonly/>                                            ";
	html += "					<input type=\"hidden\" id=\"moveentpinfoHidden\" name=\""+ data.ENTP_NO + "\" />                                            ";
	html += "				</div>                                                                                                       ";
	html += "				<div class=\"line1\">시간</div>                                                                                ";
	html += "				<div class=\"popup_con1\">                                                                                           ";
	html += "					<select class=\"time_txt1\" >                                                                              ";
	html += "						<option value=\"0\"selected=\"selected\" disabled=\"disabled\">"+data.SCHE_START_DAY_TIME_H+"</option>                                                    ";
	html += "					</select> :                                                                                              ";
	html += "					<select class=\"time_txt2\" >                                                                              ";
	html += "						<option value=\"0\" disabled=\"disabled\" selected=\"selected\">"+data.SCHE_START_DAY_TIME_M+"</option>                                ";
	html += "					</select> ~                                                                                              ";
	html += "					<select class=\"time_txt3\" >                                                                              ";
	html += "						<option value=\"0\" disabled=\"disabled\" selected=\"selected\">"+data.SCHE_END_DAY_TIME_H+"</option>                                                   ";
	html += "					</select> :                                                                                              ";
	html += "					<select class=\"time_txt4\" >                                                                              ";
	html += "						<option value=\"0\" disabled=\"disabled\" selected=\"selected\">"+data.SCHE_END_DAY_TIME_M+"</option>                                ";
	html += "					</select>                                                                                                ";
	html += "				</div>                                                                                                       ";
	html += "			</div>                                                                                                           ";
	html += "			<div class=\"underline\">                                                                                          ";
	html += "				<div class=\"line1\">고객</div>                                                                                ";
	html += "				<div class=\"popup_con1\">                                                                                           ";
	html += "					<input type=\"text\" id=\"movecustinfo\" value=\""+data.CUST_NM+"\" readonly />                                                 ";
	html += "					<input type=\"hidden\" id=\"movecustinfoHidden\" name=\""+ data.CUST_NO + "\" />                                            ";
	html += "				</div>                                                                                                       ";
	html += "				<div class=\"line1\">전화번호</div>                                                                            ";
	html += "				<div class=\"popup_con1\">                                                                                           ";
	html += "					<input type=\"text\" value=\""+data.CELL_NO+"\" disabled=\"disabled\"/>                                       ";
	html += "				</div>                                                                                                       ";
	html += "			</div>                                                                                                           ";
	html += "			<div class=\"underline\">                                                                                          ";
	html += "				<div class=\"line1\">장소</div>                                                                                ";
	html += "				<div class=\"popup_con3\" id =\"popup_con3\">                                                                                           ";
	html += "					<input class=\"pl_txt\" type=\"text\"  value=\""+data.SCHE_LOCT+"\" disabled=\"disabled\"/>";
	html += "					<input type=\"button\" value=\"지도\" id=\"placeBtn2\" name=\"placeBtn2\" />                                                                     ";
	html += "				</div>                                                                                                       ";
	html += "			</div>                                                                                                           ";
	html += "			<div class=\"underline\">                                                                                          ";
	html += "				<div class=\"line1\">영업 상품</div>                                                                           ";
	html += "				<div class=\"popup_con1\">";
	console.log("data.GODS_NM : " + data.GODS_NM);
	if(data.GODS_NM != undefined){
		html += "					<input type=\"text\"  id =\"movegodsinfo\"value=\""+data.GODS_NM+"\" readonly/>                                      ";	
		html += "					<input type=\"hidden\" id=\"movegodsinfoHidden\" name=\""+ data.GODS_NO + "\" />                                            ";
	}else{
		html += "					<input type=\"text\" value=\"\" disabled=\"disabled\"/>                                      ";				
	}
	html += "				</div>                                                                                                       ";
	html += "				<div class=\"line1\">영업 목적</div>                                                                           ";
	html += "				<div class=\"popup_con1\">   ";
	if(data.SALE_PURP != undefined){
	html += "					<input type=\"text\"  value=\""+data.SALE_PURP+"\" disabled=\"disabled\" />                                              ";
	}else{
		html += "					<input type=\"text\" value=\"\" disabled=\"disabled\"/>                                      ";				
	}
	html += "				</div>                                                                                                       ";
	html += "			</div>                                                                                                           ";
	html += "			<div class=\"underline\">                                                                                          ";
	html += "				<div class=\"underline\">                                                                                      ";
	html += "				<div class=\"line1\">활동 내용</div>                                                                           ";
	if(data.ACTV_CONT != undefined){
		html += "				<div class=\"popup_con3\"><textarea rows=\"8\" cols=\"130\" disabled=\"disabled\">"+data.ACTV_CONT+"</textarea></div>                                            ";
	}else{
		html += "				<div class=\"popup_con3\"><textarea rows=\"8\" cols=\"130\" disabled=\"disabled\"></textarea></div>                                            ";
	}
	html += "			</div>                                                                                                           ";
	html += "			</div>                                                                                                           ";
	html += "			<div class=\"underline\">                                                                                          ";
	html += "				<div class=\"line1\">첨부파일</div>                                                                            ";
	html += "				<div class=\"popup_con3\">                                                                                           ";
	html += "					<div class=\"add_file_txt\">                                                                               ";
	console.log("data.ATCH_FILE_NM : " + data.ATCH_FILE_NM);
	if(data.ATCH_FILE_NM == undefined){
		html += "첨부파일이 존재하지 않습니다.";
	}else if(data.ATCH_FILE_NM != undefined){
		html += "<a id=\"ATCH_FILE_NM\"href=\"resources/upload/"+data.ATCH_FILE_NM+"\" download>"+data.ATCH_FILE_NM +"</a>";
	}
	html += "</div>                                                ";
	html += "				</div>                                                                                                       ";
	html += "			</div>                                                                                                           ";
	html += "		</div>                                                                                                               ";
	
	                                                                                              
		
		return html;
	}
	
	function saleScheMap(){
		var params = $("#actionForm").serialize(); 
		
		$.ajax({ 
			type : "post", 
			url : "saleScheMapAjax",
			dataType : "json",
			data : params,
			success : function(res){	
				$(".contents3").html(drawSaleScheMap(res.data));
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
				    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				    level: 3 // 지도의 확대 레벨
				};  

				//지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 

				//주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				//주소로 좌표를 검색합니다
				geocoder.addressSearch(res.data.SCHE_LOCT, function(result, status) {

				// 정상적으로 검색이 완료됐으면 
				 if (status === kakao.maps.services.Status.OK) {

				    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				    // 결과값으로 받은 위치를 마커로 표시합니다
				    var marker = new kakao.maps.Marker({
				        map: map,
				        position: coords
				    });

				    // 인포윈도우로 장소에 대한 설명을 표시합니다
				    var infowindow = new kakao.maps.InfoWindow({
				        content: '<div style="width:150px;text-align:center;padding:6px 0;">'+res.data.SCHE_LOCT+'</div>'
				    });
				    infowindow.open(map, marker);

				    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				    map.setCenter(coords);
				} 
				});
			}, 
			error : function(req, status, error){ 
				console.log("code : " + req.status); 
				console.log("message : " + req.responseText);
			}
		});
	}
	
	
	function drawSaleScheMap(data){
		var html = "";
		
	
	html += "	<table class=\"search_list\">                    ";
	html += "   					<colgroup>           ";
	html += "   						<col width=\"190px\"/>           ";
	html += "   						<col width=\"190px\"/>                 ";
	html += "   						<col width=\"190px\"/>                           ";
	html += "   						<col width=\"190px\"/>         ";
	html += "   					</colgroup>           ";
	html += "   					<thead>                 ";
	html += "   					<tr class=\"top\">         ";
	html += "   						<th>고객사 명</th>                        ";
	html += "   						<th>날짜</th>         ";
	html += "   						<th>시간</th>         ";
	html += "   						<th>전화번호</th>         ";
	html += "   					</tr>           ";
	html += "   					</thead>           ";
	html += "   					<tbody>                 ";
	html += "   					<tr>                   ";
	html += "   						<td>"+data.ENTP_NM+"</td>         ";
	html += "   						<td>"+data.SCHE_START_DAY+"</td>           ";
	html += "   						<td>" + data.SCHE_START_DAY_TIME_H +" : " +data.SCHE_START_DAY_TIME_M+ " ~ " + data.SCHE_END_DAY_TIME_H + " : "+ data.SCHE_END_DAY_TIME_M +"</td>                 ";
	html += "   						<td>"+data.CELL_NO +"</td>                     ";
	html += "   					</tr>         ";
	html += "   					</tbody>         ";
	html += "   				</table>           ";
	html += "   				<div class=\"map\" id=\"map\">           ";
	html += "   				</div>                 ";
	
	                                                                                              
		
		return html;
	}
	
	//삭제
	function deleteSaleSche(){
		var params = $("#actionForm").serialize();
		
		$.ajax({ 
			type : "post", 
			url : "saleScheDeleteAjax",
			dataType : "json",
			data : params,
			success : function(res){		
				if(res.res == "SUCCESS"){
					calendarDraw();
					reloadList();
				}else{
					$("#alert").attr("title", "알림");
					$("#alert p").html("삭제에 실패하였습니다.");
					$("#alert").dialog({
						buttons: {
							Ok: function(){
								$(this).dialog("close");
							}
						}
					});
				}
			}, 
			error : function(req, status, error){ //상태 코드 값(status, 볼필요는 없음)
				console.log("code : " + req.status); //기본 값
				console.log("message : " + req.responseText);
			}
		});
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
		<div class="contents_header_txt">영업 일정 관리</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="page" id="page" value="${page}" />
			<input type="hidden" name="sysdate" id="sysdate" >
		<input type="hidden" name="salescheatchfileno" id="salescheatchfileno" />
		<input type="hidden" name="entpno" id="entpno"/>
		<input type="hidden" name="custno" id="custno"  value="${param.custno }" />
		<input type="hidden" name="godsno" id="godsno"  />
			<input type="hidden" name="salescheno" id="salescheno" value="${param.salescheno }" />
			<input type="hidden" name="scheno" id="scheno" value="${param.scheno }" />
			<input type="hidden" name="atchfilenm" id="atchfilenm" value="${data.ATCH_FILE_NM }"/>
			<input type="hidden" name="empno" id="empno" value="${param.empno}"/>
			<input type="hidden" name="sEmpNo" id="sEmpNo" value="${sEmpNo}" />
			<input type="hidden" name="sEmpNm" id="sEmpNm" value="${sEmpNm}" />
			<input type="hidden" name="sDeptNm" id="sDeptNm" value="${sDeptNm}" />
			<input type="hidden" name="entpNo" id="entpNo"  />
			<input type="hidden" name="custNo" id="custNo"  />
			<input type="hidden" name="gods_no" id="gods_no"  />
			
		<div class="calendar">
		</div>
			<div class="main_right">
			<div class="default_search_area">
				<div class="da" id="sysdate2">
				</div>
				<div class="search_area">
					<select class="filter" name="searchGbn" id="searchGbn">
						<option value="0">고객사 명</option>
						<option value="1">담당자</option>
					</select>
					<input type="text" name="searchTxt" value="${param.searchTxt}"/>
					<input type="button" value="검색" id="searchBtn"/>	
				</div>
				<div class="search_btn_area">
				<c:if test="${sDeptNm=='시스템관리부'||sDeptNm=='영업' }">
					<input type="button" value="등록" id="addBtn"/>
				</c:if>
				</div>
			</div>
			<div class="default_board">
				<table class="sale_sche_mang_list">
					<colgroup>
						<col width="50px"/>
						<col width="190px"/>
						<col width="90px"/>
						<col width="90px"/>
						<col width="150px"/>
						<col width="250px"/>
					</colgroup>
					<thead>
						<tr class="top">
							<th>No.</th>
							<th>고객사명</th>
							<th>고객</th>
							<th>담당자</th>
							<th>시간</th>
							<th>장소</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>

		<div class="page_wrap">
			<div class="page_nation"></div>
		</div>
		</div>
		</div>
		<!-- 버튼샘플 -->
	</form>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
	
<script>

</script>
</body>
</html>