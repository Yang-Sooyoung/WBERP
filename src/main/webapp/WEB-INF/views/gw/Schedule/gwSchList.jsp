<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>일정조회</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<!-- Fullcalendar css -->
<link rel="stylesheet" type="text/css" href="resources/script/fullcalendar/fullcalendar.css" />

<style type="text/css">
/* 개별 css는 여기에 */
/* 기간 검색 */

.search_plan {
	/* 	display: inline-block;
		vertical-align: top; */
	text-align: left;
	padding-top: 5px;
	height: 49px;
	font-size: 15px;
	font-weight: 600;
	color: #022859;
	margin-left: 10px;
	width: 1254px;
	border-bottom: 1px solid #022859;
}

.text0 {
	font-size: 14pt;
	font-weight: blod;
	width: 40px;
	min-height: 43px;
	line-height: 43px;
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

.Detail_datebox {
	width: 160px;
	height: 43px;
	display: inline-block;
}

#weeklyDatePicker {
	height: 40px;
	font-size: 12pt;
	width: 157px;
}

.span0 {
	display: inline-block;
}

.main_date1 {
	height: 40px;
	font-size: 12pt;
}
.schedule_checkbox{
	width: 80px;
    height: 33px;
    font-size: 12pt;
    display: inline-block;
    background-color: #91B7D9;
    text-align: center;
    line-height: 20px;
    padding-top: 11px;

}
.check_box0{
	width: 280px;
	height: 32px;
	display: inline-block;
	margin-left:-6px;
	border: 1px solid ;
	padding-top:10px;

}
.check_box1{
	width: 230px;
	height: 32px;
	display: inline-block;
	margin-left:-6px;
	border: 1px solid ;
	padding-top:10px;

}
#sche_add{
	width: 130px;
	height: 43px;
	display: inline-block;
	vertical-align: top;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
	cursor: pointer;
	background-color: #f7f7f7;
	font-size: 12pt;
	border-radius: 3px;
}
.sche_insertBtn{
display: inline-block;
	vertical-align: top;
}
.calendar {
	display: inline-block;
	vertical-align: top;
	margin-top: 10px;
	width: 1255px;
	height: 600px;
	font-size: 10pt;
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
	height: 556px;
	font-size: 11pt;
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
    margin-top: -2px;
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
.line1{
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
.popup_underbox {
    width: 1100px;
    border-top: 2px solid #9aa9bd;
    border-bottom: 1px solid #9aa9bd;
    margin-bottom: 10px;
}
.fc-sun {color:#e31b23} 
.fc-sat {color:#007dc3}
.fc-time{
	color:#000000
}
.fc-title{
	color:#000000
}
</style>
<!-- Moment Script -->
<script type="text/javascript" src="resources/script/jquery/moment.js"></script>


<!-- Fullcalendar Script -->
<script type="text/javascript" src="resources/script/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript" src="resources/script/fullcalendar/locale-all.js"></script>

<script type="text/javascript">
	var data = [];
	var id =0;
	var empno=0;
	var deptno=0;
	var title ="";
	var start ="";
	var end ="";
	var del =0;
$(document).ready(function() {
	console.log($("#top").val());
	console.log($("#gwschesort").val());

	$(".calendar").fullCalendar({
	//	customButtons: {
	//	   myCustomButton: {
	  //   text: 'custom!',
		  //    click: function() {
		    //   alert('clicked the custom button!');
		     // }
		 //}
		  //},
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
	    	if($("#sEmpNo").val()==event.empno || event.deptno ==6){
	    		console.log($("sEmpNo").val());
	    		console.log(event.empno);
	    		console.log(event.deptno)
	    	
	    	
	    	  $("#gwshceno").val(event.id);
				var html = "";
				html += "	<div class=\"contents2\" name=\"\">";
				html += "	</div>";
				
				makeBtn3Popup(1, "일정조회", html, false, 1200, 680,
						gwSchDetail(), 
						"삭제", function() {
						makeBtn2Popup(2, "일정 삭제", "해당 일정을 삭제하시겠습니까?", true, 400, 200,
							null, "예", function() {
							DeleteList();
							closePopup(2);
							closePopup(1);
							}, "아니오", function() {
								closePopup(2);
							});
						$("#gwshceno").fullCalendar('removeEventSources', $(this).data('id'));
						  eventModal.modal('hide');
						
						}, "수정", function() {
							$("#actionForm").attr("action", "gwSchUpdate");
							$("#actionForm").submit();
						}, "취소", function() {
							closePopup(1);
						
						});
	      }else{
	    	  $("#gwshceno").val(event.id);
	    	  
				var html = "";
				html += "	<div class=\"contents2\" name=\"\">";
				html += "	</div>";
				
				makeBtn1Popup(1, "일정조회", html, false, 1200, 680,
					function(){
					gwSchDetail();
				},"확인",function(){
					closePopup(1);
				});
	      };
	      },
	      dayClick: function(date, js, view) { // 일자 클릭
	    	 // alert('Clicked on: ' + date.format());
	  		
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
	
	$(".sche_insertBtn").on("click","#sche_add",function(){
		$("#actionForm").attr("action","gwSchAdd");
		$("#actionForm").submit();
	});

	
});

</script>

<script type="text/javascript">
$(document).ready(function() {

$("#total_work").on("click",function(){
		if($("#total_work").is(":checked")==true){
			$("#company_work").val(0);
			$("#part_work").val(1);
			$("#my_work").val(2);
			$("#company_work").prop("checked", false);
			$("#part_work").prop("checked", false);
			$("#my_work").prop("checked", false);
		}else{
			$(this).val(-1);
		}
			
		calendarDraw();
	});
$("#company_work").on("click",function(){
	if($("#company_work").is(":checked")==true){
		$("#total_work").prop("checked", false);
		$(this).val(0);
	}else{
		$(this).val(-1);
	}
	calendarDraw();
});
$("#part_work").on("click",function(){
	if($("#part_work").is(":checked")==true){
		$("#total_work").prop("checked", false);
		$(this).val(1);
	}else{
		$(this).val(-1);
	}
	calendarDraw();
});
$("#my_work").on("click",function(){
	if($("#my_work").is(":checked")==true){
		$("#total_work").prop("checked", false);
		$(this).val(2);
	}else{
		$(this).val(-1);
	}
	calendarDraw();
});
});



function calendarDraw(){
	var params = $("#actionForm").serialize(); 
	console.log(params);
	
	$.ajax({ 
		type : "post", 
		url : "fullcalendarAjax1",
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

	//상세보기
	function gwSchDetail(){
		var params = $("#actionForm").serialize();
		$.ajax({ 
			type : "post", 
			url : "gwScheDetailAjax",
			listType : "json",
			data : params,
			success : function(res){		
				$(".contents2").html(drawgwScheDetail(res.list));

			}, 
			error : function(req, status, error){ 
				console.log("code : " + req.status); 
				console.log("message : " + req.responseText);
			}
		});
	}
	
	function drawgwScheDetail(list){
		var html = "";
		
	
	html += "	<div class=\"popup_underbox\">";
	html += "		<div class=\"underline\">";
	html += "				<div class=\"line1\">업무구분</div>";
	html += "				<div class=\"popup_con1\">";
	html += "					<select>";
	html += "						<option disabled=\"disabled\" selected=\"selected\">" + list.SCHE_SORT +"</option>";
	html += "					</select>";
						if(list.SCHE_WORK_TYPE =='내근'){
	html += "				<input type=\"radio\" value=\"0\"" + list.SCHE_WORK_TYPE +"\"disabled=\"disabled\"checked=\"checked\" >내근";			
						}else{
	html += "				<input type=\"radio\" value=\"1\"" + list.SCHE_WORK_TYPE +"\"disabled=\"disabled\"checked=\"checked\" >외근";	
						}
	html += "				</div>";
	html += "			</div>";
	html += "			<div class=\"underline\">";
	html += "				<div class=\"line1\">일정명</div>";
	html += "				<div class=\"popup_con1\">";
	html += "					<input type=\"text\" value=\"" + list.SCHE_NM + "\"disabled=\"disabled\"/>";
	html += "				</div>";
	html += "			</div>";
	html += "			<div class=\"underline\">";
	html += "				<div class=\"line1\">담당자</div>";
	html += "				<div class=\"popup_con1\">";
	html += "					<input type=\"text\"  value=\""+ list.EMP_NM + "\" disabled=\"disabled\" />";
	html += "				</div>";
	html += "				<div class=\"line1\">부서</div>";
	html += "				<div class=\"popup_con1\">";
	html += "					<input type=\"text\" value=\""+ list.DEPT_NM+"\" disabled=\"disabled\"/>";
	html += "				</div>";
	html += "			</div>";
	html += "			<div class=\"underline\">";
	html += "				<div class=\"line1\">이메일</div>";
	html += "				<div class=\"popup_con1\">";
	html += "					<input type=\"text\" value=\""+ list.EMAIL + "\" disabled=\"disabled\" />";
	html += "				</div>";
	html += "				<div class=\"line1\">핸드폰 번호</div>";
	html += "				<div class=\"popup_con1\">";
	html += "					<input type=\"text\" value=\""+ list.CELL_NO + "\" disabled=\"disabled\" />";
	html += "				</div>";
	html += "			</div>";
	html += "			<div class=\"underline\">";
	html += "				<div class=\"line1\">날짜</div>";
	html += "				<div class=\"popup_con1\">";
	html += "					<input type=\"date\" value=\""+ list.SCHE_START_DAY+"\" disabled=\"disabled\"  />~";
	html += "					<input type=\"date\" value=\""+ list.SCHE_END_DAY+"\" disabled=\"disabled\"  />";
	html += "				</div>";
	html += "				<div class=\"line1\">시간</div>";
	html += "				<div class=\"popup_con1\">";
	html += "					<select class=\"time_txt1\" >";
	html += "						<option value=\"0\"selected=\"selected\" disabled=\"disabled\">"+list.SCHE_START_DAY_TIME_H+"</option>";
	html += "					</select> :";
	html += "					<select class=\"time_txt2\" >";
	html += "						<option value=\"0\" disabled=\"disabled\" selected=\"selected\">"+list.SCHE_START_DAY_TIME_M+"</option>                                ";
	html += "					</select> ~";
	html += "					<select class=\"time_txt3\" >";
	html += "						<option value=\"0\" disabled=\"disabled\" selected=\"selected\">"+list.SCHE_END_DAY_TIME_H+"</option>                                                   ";
	html += "					</select> :";
	html += "					<select class=\"time_txt4\" >";
	html += "						<option value=\"0\" disabled=\"disabled\" selected=\"selected\">"+list.SCHE_END_DAY_TIME_M+"</option>                                ";
	html += "					</select>";
	html += "				</div>";
	html += "			</div>";
	html += "			<div class=\"underline\">";
	html += "				<div class=\"line1\">장소</div>";
	html += "				<div class=\"popup_con3\">";
	html += "					<input class=\"pl_txt\" type=\"text\"value=\""+list.SCHE_LOCT+"\" disabled=\"disabled\" />";
	html += "				</div>";
	html += "			</div>";
	html += "			<div class=\"underline\">";
	html += "				<div class=\"underline\">";
	html += "				<div class=\"line1\">세부사항</div>";
	if(list.SCHE_CONT != undefined){
	html += "				<div class=\"popup_con3\"><textarea rows=\"8\" cols=\"130\" disabled=\"disabled\">"+list.SCHE_CONT+"</textarea></div>";
	}else {
	html += "				<div class=\"popup_con3\"><textarea rows=\"8\" cols=\"130\" disabled=\"disabled\"></textarea></div>";
		
	}
	html += "			</div>";
	html += "			</div>";
	html += "			<div class=\"underline\">";
	html += "				<div class=\"line1\">첨부파일</div>";
	html += "				<div class=\"popup_con3\">";
	html += "					<div class=\"add_file_txt\">"
		console.log("list.SCHE_ATCH_FILE_NM : " + list.SCHE_ATCH_FILE_NM);
	if(list.SCHE_ATCH_FILE_NM ==""){
		html += "첨부파일이 존재하지 않습니다.";
	}else if(list.SCHE_ATCH_FILE_NM != undefined){
		html += "<a id=\"SCHE_ATCH_FILE_NM\"href=\"resources/upload/"+list.SCHE_ATCH_FILE_NM+"\" download>"+list.SCHE_ATCH_FILE_NM +"</a>";
	}
	html += "				</div>";
	html += "			</div>";
	html += "		</div>";
		
	return html;
	}
	

	
	
function DeleteList(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "gwSchDelAjax",
			dataType : "json", // {키:값, 키:값}
			data : params, //보낼데이터
			
			success : function(res) { // 성공 시 해당함수 실행. 결과는 result로 받음
				if(res.res == "SUCCESS"){
					//$("#actionForm").attr("action","gwSchDetail");
					//$("#actionForm").submit();
					calendarDraw();
				}else {
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
			error : function(req, status, error) {
				console.log("code : " + req.status);
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
		<div class="contents_header_txt">일정조회</div>
	</div>
	<div class="contents">
	<form action="#" id="actionForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="gwshceno" id="gwshceno" value="${param.gwscheno }"/>
			<input type="hidden" name="gwshceno" value="${param.gwshceno }" />
			<input type="hidden" name="gwscheAtchfilenm" id="gwscheAtchfilenm" value="${list.SCHE_ATCH_FILE_NM }"/>
			<input type="hidden" name="sEmpNo" id="sEmpNo" value="${sEmpNo}"/>
			<input type="hidden" name="gwscheatchfileno" id="gwscheatchfileno"/>
	
		<!-- 여기에 내용을 작성하시오. -->
		<div class="search_plan">
			<div  class="sche_insertBtn">
			<input type="button" id="sche_add" value="일정등록">
				</div>
			<div class="schedule_checkbox">일정선택</div>
			<div class="check_box0">
				<label><input type="checkbox" value="0" id="total_work" name="gwschesortt" checked >전체</label> 
				<label><input type="checkbox" value="-1" id="company_work" name="gwschesort">전사</label>
				<label><input type="checkbox" value="-1" id="part_work" name="gwschesort" />부서</label>
				<label><input type="checkbox" value="-1" id="my_work" name="gwschesort" />내 일정보기</label>
			</div>

		</div>
			</form>
			<div class="contents_wrap">
				<div class="calendar">
				</div>
			</div>
	</div>
	<!-- bottom --> 
	<c:import url="/bottom"></c:import>
</body>
</html>