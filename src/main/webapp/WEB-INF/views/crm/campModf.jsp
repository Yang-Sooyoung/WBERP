<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - campaign Enroll Page</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>

<style type="text/css">
/* 상세보기영역 가로변경 시 */
.underbox {
	width: 800px;
}

/* 버튼영역 가로변경 시 */
.detail_btn_area {
	width: 800px;
}
/* 개별 css는 여기에 */
ul.tabs {
	margin: 0px 0px 0px 12px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	display: inline-block;
	background: #5b7391;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
	font-size: 13px;
}

ul.tabs li.current {
	background: #9dafc6;
	color: #222;
	font-size: 13px;
}

.tab-content {
	display: none;
	background: #ffffff;
	padding: 12px;
}

.tab-content.current {
	display: inherit;
}

.cg_list_left, .customer_group_filter {
	display: inline-block;
	vertical-align: top;
	width: 300px;
	height: 550px;
	font-size: 10pt;
	color: #000000;
	margin: 0px 0px 5px 10px;
}

.customer_group_filter_box {
	display: inline-block;
	vertical-align: top;
	width: 300px;
	height: 470px;
	border: 1px solid #bbbbbb;
	border-radius: 3px;
	margin: 5px 0px 10px 10px;
	padding: 10px 5px;
}

.simulChan {
	display: inline-block;
	vertical-align: top;
	width: auto;
	height: 20px;
	font-size: 10pt;
	color: #000000;
	margin: 10px 0px 5px 10px;
}
.customer_group_filter_con {
	display: inline-block;
	vertical-align: top;
	width: 300px;
	height: 350px;
}

.customer_group_list_name, .cust_list_name, .customer_group_filter_name {
	display: block;
	font-size: 10pt;
	color: #000000;
	margin: 20px 0px 5px 10px;
}

.customer_group_list, .cust_list {
	display: inline-block;
	vertical-align: top;
	width: 270px;
	height: 220px;
	border: 1px solid #bbbbbb;
	border-radius: 3px;
	margin: 5px 0px 0px 10px;
	overflow-y: scroll;
}

.name, .join_date, .local, .age, .sex, .level, .cust_channel, label {
	display: inline-block;
	vertical-align: top;
	width: 80px;
	height: 20px;
	font-size: 10pt;
	color: #000000;
	margin: 10px 0px 5px 10px;
}

.local, .cust_channel {
	display: inline-block;
	vertical-align: top;
	width: 200px;
	height: 20px;
	font-size: 10pt;
	color: #000000;
	margin: 15px 0px 20px 10px;
}

.bin {
	display: inline-block;
	width: 45px;
	height: 20px;
}

.sex_radio {
	font-size: 10pt;
	color: #000000;
	margin: 10px 0px 5px 0px;
}

#cg_add {
	margin: 150px 5px 50px 150px;
}

.cg_list, .t_list {
	display: block;
	font-size: 10pt;
	color: #000000;
	margin: 5px 0px 0px 5px;
}

.cg_list:hover, .t_list:hover {
	background-color: #dddddd;
	cursor: pointer;
}

.tbox_left {
	display: inline-block;
	vertical-align: top;
	width: 350px;
	height: 490px;
	margin: 20px 0px 5px 10px;
}

.tbox_right {
	display: inline-block;
	vertical-align: top;
	width: 290px;
	height: 490px;
	margin: 20px 0px 5px 0px;
}

.temp_chan1, .temp_chan2, .temp_chan3, .template_list_name, .template_empty_space {
	display: inline-block;
	vertical-align: top;
	width: 290px;
	height: 20px;
	font-size: 10pt;
	color: #000000;
	margin: 0px 0px 10px 0px;
}

.template_list_name {
	margin: 10px 0px 10px 0px;
}

.template_see_name {
	display: inline-block;
	vertical-align: top;
	width: 200px;
	height: 20px;
	font-size: 10pt;
	color: #000000;
	margin: 10px 0px 10px 0px;
}

.template_list {
	display: inline-block;
	vertical-align: top;
	width: 342px;
	height: 370px;
	border: 1px solid #bbbbbb;
	border-radius: 3px;
	overflow-y: scroll;
}

.template_see_con {
	font-size: 10pt;
	color: #000000;
	margin: 5px 0px;
}

.template_see {
	display: inline-block;
	vertical-align: top;
	width: 280px;
	height: 370px;
	border: 1px solid #bbbbbb;
	border-radius: 3px;
	margin: 0px 5px;
	font-size: 10pt;
	color: #000000;
}

.campCont {
	display: inline-block;
	width: 400px;
	height: auto;
	font-size: 10pt;
	color: #000000;
	padding: 10px 5px;
}

.cam_menu1_check {
	display: inline-block;
	vertical-align: top;
	margin-left: 20px;
	width: 240px;
	font-size: 18px;
}

.reset_img {
	margin-bottom: -7px;
	width: 30px;
	height: 25px;
	cursor: pointer;
}
#simulContainer {
    height: 400px;
}

.highcharts-figure, .highcharts-data-table table {
    min-width: 310px;
    max-width: 800px;
    margin: 1em auto;
}

#datatable {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #EBEBEB;
    margin: 10px auto;
    text-align: center;
    width: 100%;
    max-width: 500px;
}
#datatable caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
#datatable th {
	font-weight: 600;
    padding: 0.5em;
}
#datatable td, #datatable th, #datatable caption {
    padding: 0.5em;
}
#datatable thead tr, #datatable tr:nth-child(even) {
    background: #f8f8f8;
}
#datatable tr:hover {
    background: #f1f7ff;
</style>
<!-- highcharts Script -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		comnCode(6);
		cgreset();
		//고객군 목록
		cgList();
		$('ul.tabs li').click(function() {
			$('ul.tabs li').click(function(){
				var tab_id = $(this).attr('data-tab');
				console.log(tab_id);
				console.log($("#tab-link current").attr('data-tab'));
				
				if($(".tab-link.current").attr('data-tab')=="tab-1"){
					
					if($.trim($("#campNm").val())==""||$.trim($("#campCont").val())==""||
							$.trim($("#startPerd").val())==""||$.trim($("#EndPerd").val())=="") {
						alert("기본정보 등록을 완료해 주세요.");
						$("#campNm").focus();
					}else{
								
						$('ul.tabs li').removeClass('current');
						$('.tab-content').removeClass('current');
				
						$(this).addClass('current');
						$("#"+tab_id).addClass('current');
					}
				}else if($(".tab-link.current").attr('data-tab')=="tab-2"&&(tab_id=="tab-3"||tab_id=="tab-4")){
					if($("#local").val()=="0"||$("#channellist1").val()=="none" || $("#channellist2").val()=="none" || $("#channellist3").val()=="none") {
						alert("고객군 등록을 완료해 주세요.");
						$("#channel").focus();
					}else{
								
						$('ul.tabs li').removeClass('current');
						$('.tab-content').removeClass('current');
				
						$(this).addClass('current');
						$("#"+tab_id).addClass('current');
					}
				}else if($(".tab-link.current").attr('data-tab')=="tab-3"&&(tab_id=="tab-4")){
					if($("#tempNo").val()=="") {
						alert("템플릿 등록을 완료해 주세요.");
						$(".template_list").focus();
					}else{
								
						$('ul.tabs li').removeClass('current');
						$('.tab-content').removeClass('current');
				
						$(this).addClass('current');
						$("#"+tab_id).addClass('current');
					}
				}else{
						$('ul.tabs li').removeClass('current');
						$('.tab-content').removeClass('current');
				
						$(this).addClass('current');
						$("#"+tab_id).addClass('current');
					
				}
			});
		});

		//기본정보 저장 클릭시
		$("#update1Btn").on("click", function() {
			if ($.trim($("#campNm").val()) == "") {
				alert("캠페인명을 입력해 주세요.");
				$("#campNm").focus();
			} else if ($.trim($("#campCont").val()) == "") {
				alert("캠페인 내용을 입력해 주세요.");
				$("#campCont").focus();
			} else if ($.trim($("#startPerd").val()) == "") {
				alert("캠페인 시작기간을 입력해 주세요.");
				$("#startPerd").focus();
			} else if ($.trim($("#EndPerd").val()) == "") {
				alert("캠페인 종료기간을 입력해 주세요.");
				$("#EndPerd").focus();
			} else {
				var tab_id = $(this).attr('data-tab');
				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$('ul.tabs li[data-tab=' + tab_id + ']').addClass('current');
				$("#" + tab_id).addClass('current');
				//캠페인 수정
				campUpdate();
				$("#campNo2").val($("#campno").val());
				getTempData();
				///////
			}
		});

		//취소버튼
		$("#cancel1Btn").on("click", function() {
			$("#actionForm").attr("action", "campList");
			$("#actionForm").submit();
		});

		//고객군 리셋버튼
		$("#resetBtn").on("click", function() {
			cgreset();
			chanDetail();
		});

		//고객군 리셋
		function cgreset(){
			$("#cust_join_start_rang").val("${data.CUST_JOIN_START_RANG }");
			$("#cust_join_end_rang").val("${data.CUST_JOIN_END_RANG }");
			$("#age_min").val("${data.AGE_MIN }");
			$("#age_max").val("${data.AGE_MAX }");
			$("#local").val("${data.AREA_NO}");
			//console.log($("#local").val());
			if ("${data.SEX}" == 0) {
				$("#man").prop("checked", true);
			} else {
				$("#woman").prop("checked", true);
			}
			reset();
			
		}
		
		
		$("#sms").on("click", function() {
			if ($("#sms").is(":checked") == true) {
				$(this).val(1);
			} else {
				$(this).val(0);
			}
			chanSelectList2();
		});
		$("#kakao").on("click", function() {
			if ($("#kakao").is(":checked") == true) {
				$(this).val(2);
			} else {
				$(this).val(0);
			}
			chanSelectList2();
		});
		$("#email").on("click", function() {
			if ($("#email").is(":checked") == true) {
				$(this).val(4);
			} else {
				$(this).val(0);
			}
			chanSelectList2();
		});

		//고객군 목록 클릭시 (채연 수정)
		$(".customer_group_list").on("click", "div", function() {
			$("#custGroupFiltNo").val($(this).attr("name"));
			cgFilter();
		});
		
		//고객목록 버튼 : 고객 목록 띄울 때
		$("#okBtn").on("click",function(){
			var areaName = $("select[name='local'] option:checked").text();
			$("#areaNm").val(areaName);
			campCustList();
		});
		
		//고객군 수정
		$("#update2Btn").on("click",function(){
			
			if($("#channellist1").val()=="none" || $("#channellist2").val()=="none" || $("#channellist3").val()=="none") {
				alert("채널을 선택해 주세요.");
				$("#channel").focus();
			}else {
				var tab_id = $(this).attr('data-tab');
				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$('ul.tabs li[data-tab=' + tab_id + ']').addClass('current');
				$("#" + tab_id).addClass('current');
				if($("#custgroupno").val() == ""){
					campCgAdd();
				}else{
					$("#custGroupNo").val($("#custgroupno").val());
					
					groupUpdate();	
					campCustDelete();
					console.log(custArray.length);
					for(var i=0; i<custArray.length; i++){
						//console.log(custArray[i]);
						$("#campCustNo").val(custArray[i]);
						$("#campChanTypeNo").val(chanArray[i]);
						custListSave();				
					}
					//tempConDraw(1);
					//tempConDraw(2);
					//tempConDraw(4);
				}
			}
			
			var html1 = "";
			if($("#kakao").val()!=0){
				$(".campaign_template_box1").show();
				html1 += "<div class=\"template_channel\">채널 : 카카오</div>";
				$(".temp_chan1").html(html1);
				$("#campChanTypeNo").val($("#kakao").val());
				campTempList(2);	
			}else{
				$(".campaign_template_box1").hide();
			}
			var html2 = "";
			if($("#sms").val()!=0){
				$(".campaign_template_box2").show();
				html2 += "<div class=\"template_channel\">채널 : sms</div>";
				$(".temp_chan2").html(html2);
				$("#campChanTypeNo").val($("#sms").val());
				campTempList(1);							
			}else{
				$(".campaign_template_box2").hide();
			}
			var html3 = "";
			if($("#email").val()!=0){
				$(".campaign_template_box3").show();
				html3 += "<div class=\"template_channel\">채널 : email</div>";
				$(".temp_chan3").html(html3);
				$("#campChanTypeNo").val($("#email").val());
				campTempList(4);														
			}else{
				$(".campaign_template_box3").hide();
			}
			
			
		});
		
		//템플릿 목록 클릭시 
		$(".campaign_template_box1").on("click",".t_list", function(){
			$("#tempNo").val($(this).attr("name"));
			tempConDraw(2);
		});
		$(".campaign_template_box2").on("click",".t_list", function(){
			$("#tempNo").val($(this).attr("name"));
			tempConDraw(1);
		});
		$(".campaign_template_box3").on("click",".t_list", function(){
			$("#tempNo").val($(this).attr("name"));
			tempConDraw(4);
		});
		
		//템플릿 설정 저장 클릭시
		$("#update3Btn").on("click",function(){
			if($("#kakao").val()==2) {
				$("#tempNo").val($(".campaign_template_box1 .template_see_con").attr("name"));
				console.log($(".campaign_template_box1 .template_see_con").attr("name"));
				$("#campChanTypeNo").val($("#kakao").val());
				CampTempAddAjax();
			}
			if($("#sms").val()==1) {
				$("#tempNo").val($(".campaign_template_box2 .template_see_con").attr("name"));
				$("#campChanTypeNo").val($("#sms").val());
				CampTempAddAjax();			
			}
			if($("#email").val()==4) {
				$("#tempNo").val($(".campaign_template_box3 .template_see_con").attr("name"));
				$("#campChanTypeNo").val($("#email").val());
				CampTempAddAjax();
			}
			
			if($("#chanNo").val()=="none" ||$("#chanNo").val()=="" ) {
				alert("채널을 선택해 주세요.");
				$("#channel").focus();
			}else if($("#tempNo").val()=="") {
				alert("템플릿을 선택해 주세요.");
				$(".template_see_con").focus();						
			}else {
				var tab_id = $(this).attr('data-tab');
			
				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');
							
				$('ul.tabs li[data-tab='+tab_id+']').addClass('current');
				$("#"+tab_id).addClass('current');	
				getSimulData();
				
			}
		});
		//시뮬레이션 버튼 클릭시
		$("body").on("click","#simulBtn",function(){
			var tab_id = $(this).attr('data-tab');
			
			$('.tab-content').removeClass('current');		
			$("#"+tab_id).addClass('current');
			
			for(var i=0; i<custArray.length; i++){			
				$("#campCustNo").val(custArray[i]);
				updateCampCust();	
			}
					
			drawSimulationAjax();
					
		});
		
		//시뮬레이션 저장버튼 클릭시
		$("body").on("click","#save4Btn",function(){
			
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "campFinishAjax",
				dataType : "json",
				data : params,
				success : function(res) {
					$("#actionForm").attr("action", "campList");
					$("#actionForm").submit();
				},
				error : function(req, status, error) {
					console.log("code : " + req.status);
					console.log("message : " + req.responseText);
				}
			});
			
		});
		
	});
	
	//시뮬레이션-(실행 전 데이터 가져오기)
	function getSimulData() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "getSimulDataAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				drawSimulData(res.data);
				drawSimulData2(res.data);
				
				drawCustCnt(res.custcnt);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	//템플릿 정보 가져오기
	function getTempData() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "getSimulDataAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				//console.log(res.data);
				tempData(res.data);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	function tempData(data){
		
		console.log(data);
		
		for (var i = 0; i < data.length; i++) {
			var html = "";
			html += "<div class=\"template_see_con\" name="+data[i].TEMP_NO+">"
					+ data[i].TEMP_CONT + "</div>";
					
			console.log(data[i].TEMP_NO);
			
			if(data[i].CHAN_TYPE_NO==2){
				$("#tempNo").val(data[i].TEMP_NO);
				$(".campaign_template_box1 .template_see").html(html);		
			}else if(data[i].CHAN_TYPE_NO==1){
				$("#tempNo").val(data[i].TEMP_NO);
				$(".campaign_template_box2 .template_see").html(html);					
			}else{
				$("#tempNo").val(data[i].TEMP_NO);
				$(".campaign_template_box3 .template_see").html(html);								
			}
		}

	}
	
	
	function drawSimulData(data) {
		var html = "";

		html += "	<div class=\"underline\">";
		html += "<div class=\"line1\">캠페인명</div>";
		html += "	<div class=\"campCont\" name="+data[0].CAMP_NO+">"
				+ data[0].CAMP_NM + "</div>";
		html += "</div>";
		html += "<div class=\"underline\">";
		html += "	<div class=\"line1\">캠페인 내용</div>";
		html += "	<div class=\"campCont\">" + data[0].CAMP_CONT + "</div>";
		html += "</div>";
		html += "<div class=\"underline\">";
		html += "	<div class=\"line1\">캠페인 정기여부</div>";
		html += "	<div class=\"con1\">" + data[0].REGL_SORT_CODE + "</div>";
		html += "</div>";
		html += "<div class=\"underline\">";
		html += "	<div class=\"line1\">캠페인 시작기간</div>";
		html += "	<div class=\"con1\">" + data[0].START_PERD + "</div>";
		html += "<div class=\"line1\">캠페인 종료기간</div>";
		html += "	<div class=\"con1\">" + data[0].END_PERD + "</div>";
		html += "</div>";
		html += "<div class=\"underline\">";
		html += "<div class=\"line1\">고객군</div>";
		html += "<div class=\"con1\">";
		if(data[0].CUST_JOIN_START_RANG != null){
			html += "가입시작일 : " + data[0].CUST_JOIN_START_RANG + "<br/>";			
		}
		if(data[0].CUST_JOIN_END_RANG != null){
			html += "가입종료일 : " + data[0].CUST_JOIN_END_RANG + "<br/>";
		}
		if(data[0].AGE_MIN != null){			
			html += "나이최소 : " + data[0].AGE_MIN;
		}
		if(data[0].AGE_MAX != null){			
			html += " 나이최대 : " + data[0].AGE_MAX + "<br/>";
		}
		html += "성별 : " + data[0].SEX + "<br/>";
		html += "지역 : " + data[0].AREA_NM + "</div><br/>";
		html += "<div class=\"con1\" id=\"custCount\"></div><br/>";
		html += "</div><br/>";
		html += "<div class=\"underline\">";
		html += "<div class=\"line1\">템플릿</div>";
		html += "<div class=\"campaign_template_box\">";
		
		for(var i=0; i<data.length; i++){
			html += "<div class=\"tbox_left\">";
			html += "<div class=\"con1\">채널 : " + data[i].CHAN_TYPE + "</div><br/>";
			html += "<div class=\"con1\">템플릿명 : " + data[i].TEMP_NM + "</div><br/>";
			html += "<div class=\"template_content_name\">템플릿 미리보기</div><br/>";
			html += "<div class=\"template_see\">" + data[i].TEMP_CONT + "</div>";	
			html += "</div>";
		}
		html += "</div>";
		html += "</div>";
		html += "<div class=\"underline\">";
		html += "<div class=\"line1\">채널</div>";
		for(var i=0; i<data.length; i++){
			html += "<div class=\"simulChan\">" + data[i].CHAN_NM +", "+ "</div>";			
		}
		html += "</div>";
		html += "<div class=\"underline\">";
		html += "<div class=\"line1\">담당자</div>";
		html += "<div class=\"con3\">";
		html += "<input type=\"text\" value=\"${sEmpNm}\" id=\"campaign_person\" readonly=\"readonly\" /><br />";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"underline\">";
		html += "<div class=\"line1\">부서</div>";
		html += "<div class=\"con3\">";
		html += "<input type=\"text\" value=\"${sDeptNm}\" id=\"campaign_part\" readonly=\"readonly\" />";
		html += "</div>";
		html += "</div>";

		html += "<div class=\"detail_btn_area\">";
		html += "<input type=\"button\" id=\"simulBtn\" value=\"시뮬레이션\" data-tab=\"tab-4-1\"/> <input type=\"button\" id=\"cancelBtn\" value=\"취소\" />";
		html += "</div>";

		$("#simulData").html(html);
	}

	function drawCustCnt(data) {
		var html = "";

		html += "전송 예정 : 총" + custArray.length + "명";

		$("#custCount").html(html);
	}
	
	//채널타입
	function chanDetail() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post",
			url : "chanDetailAjax",
			dataType : "json", // {키:값, 키:값}
			data : params, //보낼데이터
			success : function(res) { //성공 시 해당 함수 실행. 결과는 res로 받겠다.
				chanTypeNo(res.data2);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	//채널타입
	function chanTypeNo(data2){
		$("#kakao").prop("checked", false);
		$("#sms").prop("checked", false);
		$("#email").prop("checked", false);
		$("#channel1").val("none");
		$("#channel2").val("none");
		$("#channel3").val("none");
		//채널유형번호
		var chantypeno =[];
		//채널번호
		var channo =[];
		
		for(var i=0 ; i <data2.length ; i++){
			chantypeno[i]=data2[i].CHAN_TYPE_NO;
			channo[i]=data2[i].CHAN_NO;
		}
		
		for(var i=0; i<chantypeno.length; i++){
			if (chantypeno[i] == 2) {
				$("#kakao").prop("checked", true);
				$("#kakao").val(chantypeno[i]);
				$("#channel2").val(channo[i]);
			} else if (chantypeno[i] == 1) {
				$("#sms").prop("checked", true);
				$("#sms").val(chantypeno[i]);
				$("#channel1").val(channo[i]);
				
			} else if (chantypeno[i] == 4) {
				$("#email").prop("checked", true);
				$("#email").val(chantypeno[i]);
				$("#channel3").val(channo[i]);
			}
		}
		
	}
	
	
	//캠페인 기본정보 수정
	function campUpdate() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "campUpdateAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				if (res.res == "SUCCESS") {
					areaSelectList();
					chanSelectList();
				} else {
					$("#alert").attr("title", "알림");
					$("#alert p").html("저장에 실패하였습니다.");
					$("#alert").dialog({
						buttons : {
							Ok : function() {
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
	
	//고객군 수정
	function groupUpdate() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "GroupUpdateAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				if (res.res == "SUCCESS") {
					if($("#kakao").val()==2){
						$("#chanNo").val($("#channel2").val());
						campCgChanAdd();
					}
					if($("#sms").val()==1){
						$("#chanNo").val($("#channel1").val());
						campCgChanAdd();				
					}
					if($("#email").val()==4){
						$("#chanNo").val($("#channel3").val());
						campCgChanAdd();				
					}
				} else {
					$("#alert").attr("title", "알림");
					$("#alert p").html("저장에 실패하였습니다.");
					$("#alert").dialog({
						buttons : {
							Ok : function() {
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

	//지역아작스
	function areaSelectList() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post",
			url : "popSelectListAjax",
			dataType : "json", // {키:값, 키:값}
			data : params, //보낼데이터
			success : function(res) { //성공 시 해당 함수 실행. 결과는 res로 받겠다.
				areaList(res.area);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	//채널아작스
	function chanSelectList() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post",
			url : "campChanListAjax",
			dataType : "json", // {키:값, 키:값}
			data : params, //보낼데이터
			success : function(res) { //성공 시 해당 함수 실행. 결과는 res로 받겠다.
				chanList(res.list2,res.data2);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	//채널아작스
	function chanSelectList2() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post",
			url : "campChanListAjax",
			dataType : "json", // {키:값, 키:값}
			data : params, //보낼데이터
			success : function(res) { //성공 시 해당 함수 실행. 결과는 res로 받겠다.
				chanList2(res.list2);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	//지역 목록
	function areaList(area) {
		var html = "";

		for (var i = 0; i < area.length; i++) {
			html += "<option  value=\"" + area[i].AREA_NO + "\">"
			html += area[i].AREA_NM + "</option>";
		}

		$("#local").html(html);
		//console.log("${data.AREA_NO}");
		$("#local").val("${data.AREA_NO}");
		

	}
	//채널 목록
	function chanList2(list2) {
		var kakao = "";
		var sms = "";
		var email = "";

		sms += " <select name=\"channel1\" id=\"channel1\">";
		sms += "<option value=\"none\">===SMS===</option>";
		kakao += " <select name=\"channel2\" id=\"channel2\">";
		kakao += "<option value=\"none\">===KAKAO===</option>";
		email += " <select name=\"channel3\" id=\"channel3\">";
		email += "<option value=\"none\">===EMAIL===</option>";

		for (var i = 0; i < list2.length; i++) {
			if (list2[i].CHAN_TYPE_NO == 1) {
				sms += "<option value="+list2[i].CHAN_NO+">" + list2[i].CHAN_NM
						+ "</option>";
				
			}else if(list2[i].CHAN_TYPE_NO == 2){
				kakao += "<option value="+list2[i].CHAN_NO+">" + list2[i].CHAN_NM
				+ "</option>";
				
			}else if(list2[i].CHAN_TYPE_NO == 4){
				email += "<option value="+list2[i].CHAN_NO+">" + list2[i].CHAN_NM
				+ "</option>";
				
			}
		}

		$("#channellist").html(kakao);
		$("#channellist2").html(sms);
		$("#channellist3").html(email);
	}
	
	//채널 목록
	function chanList(list2,data2) {
		var kakao = "";
		var sms = "";
		var email = "";

		sms += " <select name=\"channel\" id=\"channel1\">";
		sms += "<option value=\"none\">===SMS===</option>";
		kakao += " <select name=\"channel\" id=\"channel2\">";
		kakao += "<option value=\"none\">===KAKAO===</option>";
		email += " <select name=\"channel\" id=\"channel3\">";
		email += "<option value=\"none\">===EMAIL===</option>";

		for (var i = 0; i < list2.length; i++) {
			if (list2[i].CHAN_TYPE_NO == 1) {
				sms += "<option value="+list2[i].CHAN_NO+">" + list2[i].CHAN_NM
						+ "</option>";
				
			}else if(list2[i].CHAN_TYPE_NO == 2){
				kakao += "<option value="+list2[i].CHAN_NO+">" + list2[i].CHAN_NM
				+ "</option>";
				
			}else if(list2[i].CHAN_TYPE_NO == 4){
				email += "<option value="+list2[i].CHAN_NO+">" + list2[i].CHAN_NM
				+ "</option>";
				
			}
		}

		$("#channellist").html(kakao);
		$("#channellist2").html(sms);
		$("#channellist3").html(email);
		
		for(var i=0; i<data2.length; i++){
			if (data2[i].CHAN_TYPE_NO == 2) {
				$("#kakao").prop("checked", true);
				$("#kakao").val(data2[i].CHAN_TYPE_NO);
				$("#channel2").val(data2[i].CHAN_NO);
			} else if (data2[i].CHAN_TYPE_NO == 1) {
				$("#sms").prop("checked", true);
				$("#sms").val(data2[i].CHAN_TYPE_NO);
				$("#channel1").val(data2[i].CHAN_NO);
			} else if (data2[i].CHAN_TYPE_NO == 4) {
				$("#email").prop("checked", true);
				$("#email").val(data2[i].CHAN_TYPE_NO);
				$("#channel3").val(data2[i].CHAN_NO);
			}
		}
	}
	
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
		if (bigFrac == 6) {
			html += "<option value=\"-1\">--유형--</option>";
			for (var i = 0; i < comnCode.length; i++) {
				html += "<option value="+comnCode[i].SMAL_FRAC+">"
						+ comnCode[i].CODE_NM + "</option> ";
			}
			$("#reglSortCode").html(html);
			$("#reglSortCode").val("${camp.REGL_SORT_CODE}");
		}
	}

	//고객군목록 리스트
	function cgList() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "cgListAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				drawCgList(res.data);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	function drawCgList(data) {
		var html = "";

		for (var i = 0; i < data.length; i++) {
			html += "<div class=\"cg_list\" name="+data[i].CUST_GROUP_FILT_NO+">"
					+ data[i].CUST_GROUP_FILT_NM + "</div>";
		}

		$(".customer_group_list").html(html);
	}

	//고객군 클릭시 필터 채움
	function cgFilter() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "cgFilterAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				reset();
				$("#cust_join_start_rang").val(res.data.CUST_JOIN_START_RANG);
				$("#cust_join_end_rang").val(res.data.CUST_JOIN_END_RANG);
				$("#age_min").val(res.data.AGE_MIN);
				$("#age_max").val(res.data.AGE_MAX);
				$("#local").val(res.data.AREA_NO);
				if (res.data.SEX == 0) {
					$("#man").prop("checked", true);
				} else {
					$("#woman").prop("checked", true);
				}
				if (res.data.CHAN_TYPE_NO == 2) {
					$("#kakao").prop("checked", true);
					$("#kakao").val(res.data.CHAN_TYPE_NO);
				} else if (res.data2.CHAN_TYPE_NO == 1) {
					$("#sms").prop("checked", true);
					$("#sms").val(res.data.CHAN_TYPE_NO);
				} else if (res.data.CHAN_TYPE_NO == 4) {
					$("#email").prop("checked", true);
					$("#email").val(res.data2.CHAN_TYPE_NO);
				}
				chanSelectList();
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	//체크박스리셋
	function reset() {
		$("#kakao").val(0);
		$("#kakao").prop("checked", false);
		$("#sms").val(0);
		$("#sms").prop("checked", false);
		$("#email").val(0);
		$("#email").prop("checked", false);
	}
	
	//고객 목록
	function campCustList() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "campCustListAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				drawCustList(res.data);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	//고객 목록 저장
	var custArray = [];

	//고객 채널유형 목록 저장
	var chanArray = [];

	//고객 목록 그리기
	function drawCustList(data) {
		var html = "";
		custArray = [];
		chanArray = [];

		for (var i = 0; i < data.length; i++) {
			html += "<div class=\"cg_list\" value="+data[i].CUST_NO+">"
					+ data[i].NM + "</div>";
			custArray[i] = data[i].CUST_NO;
			chanArray[i] = data[i].CHAN_TYPE_NO;
		}

		$(".cust_list").html(html);

	}
	//고객군 저장(채연추가)
	function campCgAdd() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "CampCgAddAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				//console.log("고객군 저장완료");
				$("#custGroupNo").val(res.cgNo.CUST_GROUP_NO);
				
				if($("#kakao").val()==2){
					$("#chanNo").val($("#channel2").val());
					campCgChanAdd();
				}
				if($("#sms").val()==1){
					$("#chanNo").val($("#channel1").val());
					campCgChanAdd();				
				}
				if($("#email").val()==4){
					$("#chanNo").val($("#channel3").val());
					campCgChanAdd();				
				}
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	//고객군채널 저장(채연추가)
	function campCgChanAdd() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "campCgChanAddAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				//console.log("고객군채널 저장완료");
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	//고객 목록 캠페인고객 테이블에 저장
	function custListSave() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "custListSaveAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				//console.log("저장완료");
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	//템플릿 설정-템플릿목록 리스트
	function campTempList(type) {
		var params = $("#actionForm").serialize();
		
		params += "&type=" + type;
		
		$.ajax({
			type : "post",
			url : "campTempListAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				drawTempList(res.data, type);
				$("#custGroupNo").val($("#custGroupNo").val());
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	//템플릿 목록 그리기(채연 수정했음)
	function drawTempList(data, type) {
		var html = "";

		for (var i = 0; i < data.length; i++) {
			html += "<div class=\"t_list\" name="+data[i].TEMP_NO+">"
					+ data[i].TEMP_NM + "</div>";
		}
			if(type==2){
				$(".campaign_template_box1 .template_list").html(html);		
			}else if(type==1){
				$(".campaign_template_box2 .template_list").html(html);					
			}else{
				$(".campaign_template_box3 .template_list").html(html);								
			}
	}
	
	//캠페인고객 지우기
	function campCustDelete(type) {
		var params = $("#actionForm").serialize();
	
		$.ajax({
			type : "post",
			url : "campCustDeleteAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	//템플릿 등록-템플릿선택(템플릿내용 가져오기)
	function tempConDraw(type) {
		var params = $("#actionForm").serialize();
	
		params += "&type=" + type;
		
		$.ajax({
			type : "post",
			url : "tempConAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				drawCampTempCon(res.data, type);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	//템플릿 미리보기
	function drawCampTempCon(data, type) {
		var html = "";

		//console.log(data);
		html += "<div class=\"template_see_con\" name="+data.TEMP_NO+">"
				+ data.TEMP_CONT + "</div>";
	
		if(type==2){
			$(".campaign_template_box1 .template_see").html(html);		
		}else if(type==1){
			$(".campaign_template_box2 .template_see").html(html);					
		}else{
			$(".campaign_template_box3 .template_see").html(html);								
		}
	}
	
	//고객군채널 템플릿저장(채연추가)
	function CampTempAddAjax() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "CampTempAddAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				//console.log("고객군채널 저장완료");
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	function updateCampCust() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post",
			url : "updateCampCustAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				console.log("업데이트 완료");
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	function drawSimulationAjax() {
		var params = $("#actionForm").serialize();
		
		console.log($("#startPerd").val());
		console.log($("#campNo2").val());
		$.ajax({
			type : "post",
			url : "drawSimulationAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				drawSimulation(res.list1, res.list2);
				makeChart(res.list);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	function drawSimulation(list1,list2) {
		var html = ""; 

		console.log(list1);
		console.log(list2);
		for(var i=0; i<list1.length; i++){

			html += "<tr>";
			html += "<th>" + list1[i].CHAN_TYPE + "</th>";
			html += "<td>" + list2[i].RECT_WHET + "</td>";
			html += "<td>" + list2[i].REAL_RECT_WHET + "</td>";
			html += "</tr>";
		
		}
		
		$("#datatable tbody").html(html);
	}
	
	function makeChart() {
		$('#simulContainer').highcharts({
		
		    data: {
		        table: 'datatable'
		    },
		    chart: {
		        type: 'column'
		    },
		    title: {
		        text: '채널별 예상 반응값 & 예상 실반응값'
		    },
		    yAxis: {
		        allowDecimals: false,
		        title: {
		            text: '반응값'
		        },
		        max: 1
		    },
		    tooltip: {
		        formatter: function () {
		            return '<b>' + this.series.name + '</b><br/>' +
		                this.point.y + ' ' + this.point.name.toLowerCase();
		        }
		    }
		});
	}
	//수신함 내용으로 던질 때 사용 될 드로우
	function drawSimulData2(data){
		var html = "";
		
		html += "<div class=\"underline\">";
		html += "	<div class=\"line1\">캠페인 정기여부</div>";
		html += "	<div class=\"con1\">" + data[0].REGL_SORT_CODE + "</div>";
		html += "</div>";
		html += "<div class=\"underline\">";
		html += "	<div class=\"line1\">캠페인 시작기간</div>";
		html += "	<div class=\"con1\">" + data[0].START_PERD + "</div>";
		html += "</div>";
		html += "<div class=\"underline\">";
		html += "<div class=\"line1\">캠페인 종료기간</div>";
		html += "	<div class=\"con1\">" + data[0].END_PERD + "</div>";
		html += "</div>";
		html += "<div class=\"underline\">";
		html += "<div class=\"line1\">고객군</div>";
		html += "<div class=\"con1\">가입시작일 : " + data[0].CUST_JOIN_START_RANG
				+ "<br/>";
		html += "가입종료일 : " + data[0].CUST_JOIN_END_RANG + "<br/>";
		html += "나이최소 : " + data[0].AGE_MIN + " 나이최대 : " + data[0].AGE_MAX + "<br/>";
		html += "성별 : " + data[0].SEX + "<br/>";
		html += "지역 : " + data[0].AREA_NM + "</div><br/>";
		html += "<div class=\"con1\" id=\"custCount\"></div><br/>";
		html += "</div><br/>";
		html += "<div class=\"underline\">";
		html += "<div class=\"line1\">템플릿</div>";
		html += "<div class=\"campaign_template_box\">";
		
		for(var i=0; i<data.length; i++){
			html += "<div class=\"tbox_left\">";
			html += "<div class=\"con1\">채널 : " + data[i].CHAN_TYPE + "</div><br/>";
			html += "<div class=\"con1\">템플릿명 : " + data[i].TEMP_NM + "</div><br/>";
			html += "<div class=\"template_content_name\">템플릿 미리보기</div><br/>";
			html += "<div class=\"template_see\">" + data[i].TEMP_CONT + "</div>";	
			html += "</div>";
		}
		html += "</div>";
		html += "</div>";
		html += "<div class=\"underline\">";
		html += "<div class=\"line1\">채널</div>";
		for(var i=0; i<data.length; i++){
			html += "<div class=\"simulChan\">" + data[i].CHAN_NM +", "+ "</div>";			
		}
		html += "</div>";
		html += "<div class=\"underline\">";
		html += "<div class=\"line1\">담당자</div>";
		html += "<div class=\"con1\"> ${sEmpNm} </div>";
		html += "</div><br/>";
		html += "<div class=\"underline\">";
		html += "<div class=\"line1\">부서</div>";
		html += "<div class=\"con1\"> ${sDeptNm} </div>";
		html += "</div><br/>";
		$("#cont").val(html);
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

	<div class="contents_area">
		<div class="contents_header">
			<div class="contents_header_txt">캠페인 수정</div>
		</div>

		<div class="contents">
			<!-- 여기에 내용을 작성하시오. -->
			<form action="#" id="actionForm" method="post">
				<!-- 아래 두개 필수 -->
				<input type="hidden" id="top" name="top" value="${param.top}" />
				<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
				<input type="hidden" id="sEmpNo" name="sEmpNo" value="${sEmpNo}" />
				<input type="hidden" id="campno" name="campno" value="${param.campno}" />
				<input type="hidden" id="campNo2" name="campNo2" value="${param.campNo}" />
				<input type="hidden" id="areano" name="areano" value="${data.AREA_NO}" />
				<input type="hidden" id="areaNm" name="areaNm"  />
				<input type="hidden" id="chanNo" name="chanNo" value="${param.chanNo}" />
				<input type="hidden" id="custgroupno" name="custgroupno" value="${data.CUST_GROUP_NO }" />
				<input type="hidden" id="custGroupNo" name="custGroupNo" />
				<input type="hidden" id="custGroupFiltNo" name="custGroupFiltNo" />
				<input type="hidden" id="campChanTypeNo" name="campChanTypeNo" value="${param.campChanTypeNo}" />
				<input type="hidden" id="tempNo" name="tempNo" value="${param.tempNo}" />
				<input type="hidden" id="campCustNo" name="campCustNo" value="${param.campCustNo}" />
				<input type="hidden" id="cont" name="cont" />
				
				<!-- 탭 구성 -->
				<div class="container">
					<!-- 탭 메뉴 상단 시작 -->
					<ul class="tabs">
						<li class="tab-link current" data-tab="tab-1">기본정보 등록</li>
						<li class="tab-link" data-tab="tab-2">고객군 등록</li>
						<li class="tab-link" data-tab="tab-3">텝플릿 등록</li>
						<li class="tab-link" data-tab="tab-4">시뮬레이션</li>
					</ul>
					<!-- 탭 메뉴 상단 끝 -->
					<!-- 탭 메뉴 내용 시작 -->
					<div id="tab-1" class="tab-content current">
						<div class="underbox">
							<div class="underline">
								<div class="line1">캠페인명 *</div>
								<div class="con1">
									<input type="text" id="campNm" name="campNm" value="${camp.CAMP_NM }" />
								</div>
							</div>
							<div class="underline">
								<div class="line1">캠페인 내용 *</div>
								<div class="con1">
									<div class="con3">
										<textarea rows="20" cols="50" id="campCont" name="campCont">${camp.CAMP_CONT }</textarea>
									</div>
								</div>
							</div>
							<div class="underline">
								<div class="line1">캠페인 정기여부 *</div>
								<div class="con1">
									<!-- 유형 -->
									<select class="cam_menu1_select" name="reglSortCode" id="reglSortCode">

									</select>
								</div>
							</div>
							<div class="underline">
								<div class="line1">캠페인 시작기간 *</div>
								<div class="con1">
									<input type="date" id="startPerd" name="startPerd" value="${camp.START_PERD }" />
								</div>
								<div class="line1">캠페인 종료기간 *</div>
								<div class="con1">
									<input type="date" id="EndPerd" name="EndPerd" value="${camp.END_PERD }" />
								</div>
							</div>
							<div class="underline">
								<div class="line1">담당자</div>
								<div class="con3">
									<input type="text" value="${camp.EMP_NM}" id="campaign_person" readonly="readonly" />
									<br />
								</div>
							</div>
							<div class="underline">
								<div class="line1">부서</div>
								<div class="con3">
									<input type="text" value="${camp.DEPT_NM}" id="campaign_part" readonly="readonly" />
								</div>
							</div>
							<div class="detail_btn_area">
								<input type="button" value="캠페인 수정" id="update1Btn" data-tab="tab-2" />
								<input type="button" value="취소" id="cancel1Btn" />
							</div>
						</div>
					</div>
					<div id="tab-2" class="tab-content">
						<div class="underbox">
							<div class="underline">
								<div class="line1">고객군 설정 *</div>
								<div class="cg_list_left">
									<div class="customer_group_list_name">고객군 목록</div>
									<div class="customer_group_list"></div>
									<div class="cust_list_name">고객 목록</div>
									<div class="cust_list"></div>
								</div>
								<div class="customer_group_filter">
									<div class="customer_group_filter_name">
										고객군 필터 <img id="resetBtn" class="reset_img" src="resources/images/crm/campaign/reset.png">
									</div>
									<div class="customer_group_filter_box">
										<div class="customer_group_filter_con">
											<div class="join_date">가입시작일</div>
											<input type="date" id="cust_join_start_rang" name="cust_join_start_rang" value="${data.CUST_JOIN_START_RANG }">
											<br />

											<div class="join_date">가입종료일</div>
											<input type="date" id="cust_join_end_rang" name="cust_join_end_rang" value="${data.CUST_JOIN_END_RANG }">
											<br />

											<div class="local">
												지역 <select name="local" id="local">
												</select>
											</div>
											<br />
											<div class="age">나이최소</div>
											<input type="text" id="age_min" name="age_min" value="${data.AGE_MIN}">
											<br />
											<div class="age">나이최대</div>
											<input type="text" id="age_max" name="age_max" value="${data.AGE_MAX}">
											<br />
											<div class="sex_radio">
												<div class="sex">성별</div>
												<c:choose>
													<c:when test="${data.SEX eq 0}">
														<input type="radio" value="0" name="sex" id="man" checked="checked" />
														남자
														<input type="radio" value="1" name="sex" id="woman" />
														여자
													</c:when>
													<c:otherwise>
														<input type="radio" value="0" name="sex" id="man" />
														남자
														<input type="radio" value="1" name="sex" id="woman" checked="checked" />
														여자
													</c:otherwise>
												</c:choose>
											</div>
											<div class="cam_menu1_check">
												<input type="checkbox" value="0" id="kakao" name="chanCheck">
												카카오톡
												<input type="checkbox" value="0" id="sms" name="chanCheck">
												sms
												<input type="checkbox" value="0" id="email" name="chanCheck">
												email
											</div>
											
												<div class="cust_channel" id="channellist"></div>
												<div class="cust_channel" id="channellist2"></div>
												<div class="cust_channel" id="channellist3"></div>
												<input type="button" id="okBtn" value="고객목록" style="float: right;" />
										</div>
									</div>
								</div>

							</div>
							<div class="detail_btn_area">
								<input type="button" value="고객군 수정" id="update2Btn" data-tab="tab-3" />
								<input type="button" value="취소" />
							</div>
						</div>
					</div>
					<div id="tab-3" class="tab-content">
						<div class="underbox">
							<div class="underline">
								<div class="line1">템플릿 설정 *</div>
								<div class="campaign_template_box1">
									<div class="tbox_left">
										<div class="temp_chan1"></div>
										<div class="template_list_name">템플릿 목록</div>
										<div class="template_list"></div>
									</div>
									<div class="tbox_right">
										<div class="template_empty_space"></div>
										<br />
										<div class="template_see_name">템플릿 미리보기</div>
										<div class="template_see"></div>
									</div>
								</div>
								<div class="campaign_template_box2">
									<div class="tbox_left">
										<div class="temp_chan2"></div>
										<div class="template_list_name">템플릿 목록</div>
										<div class="template_list"></div>
									</div>
									<div class="tbox_right">
										<div class="template_empty_space"></div>
										<br />
										<div class="template_see_name">템플릿 미리보기</div>
										<div class="template_see"></div>
									</div>
								</div>
								<div class="campaign_template_box3">
									<div class="tbox_left">
										<div class="temp_chan3"></div>
										<div class="template_list_name">템플릿 목록</div>
										<div class="template_list"></div>
									</div>
									<div class="tbox_right">
										<div class="template_empty_space"></div>
										<br />
										<div class="template_see_name">템플릿 미리보기</div>
										<div class="template_see"></div>
									</div>
								</div>
							</div>
							<div class="detail_btn_area">
								<input type="button" id="update3Btn" value="템플릿 수정" data-tab="tab-4" />
								<input type="button" value="취소" />
							</div>
						</div>
					</div>
					<div id="tab-4" class="tab-content">
						<div class="underbox" id="simulData"></div>
					</div>
					<div id="tab-4-1" class="tab-content">
						<div class="underbox" id="simulation">
						<figure class="highcharts-figure">
						    <div id="simulContainer"></div>
						    <p class="highcharts-description">					       
						    </p>					
						    <table id="datatable">
						        <thead>
						            <tr>
						           		<th></th>
						                <th>예상반응값</th>
						                <th>예상실반응값</th>
						            </tr>
						        </thead>
						        <tbody>     
						        </tbody>
						    </table>
						</figure>
						<div class="detail_btn_area">
						<input type="button" id="save4Btn" value="결재요청" /> <input type="button" id="cancelBtn" value="취소" />
						</div>
						</div>
					</div>
					<!-- 탭 메뉴 내용 끝 -->
				</div>
				<!-- container 끝 -->

			</form>
		</div>
		<!-- contents 끝 -->
	</div>
	<!-- contents_area 끝 -->
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>