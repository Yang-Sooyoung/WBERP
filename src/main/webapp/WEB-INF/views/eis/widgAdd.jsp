<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>대시보드관리</title>
<style type="text/css">
/* 개별 css는 여기에 */

.attch_query {
	resize: none;
	margin-top: 5px;
	margin-bottom: -10px;
	resize: none;
	width: 470px;
	height: 145px;
	border: 1px solid #c2c2c2;
}
#container {
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
}
.search_area{
	display: inline-block;
	width: 1100px;
	height: 32px;
} 
.search{
	width: 200px;
	height: 28px;
	font-size: 14px;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	margin: 0 3px;
	padding: 1px 2px;
	outline: none;
	vertical-align: top;
}
.search_button{
	width: 32px;
	height: 32px;
	border: 0px;
	border-radius: 3px;
	vertical-align: top;
	outline: none;
	cursor: pointer;
}
.filter{
	background-color: #f7f7f7;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	font-size: 14px;
	width: 70px;
	height: 32px;
	margin: 0 3px;
	padding: 1px 2px;
	outline: none;
	vertical-align: top;
}

tr td{
	border-bottom: 1px solid #c2c2c2;
}

.button_area{
	display: inline-block;
	width: 300px;
	height: 32px;
	float: right;
}

.page_button_area{
	display: inline-block;
	width: 1100px;
	height: 30px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
}


.dasb_area{
	display: inline-block;
	width: 100%;
	height: 700px;
	background-color: #eaeaea;
}

.dasb_set_area, .widg_set_area{
	display: inline-block;
	width: calc(100% - 40px);
	height: 40px;
	margin-top: 20px;
	margin-left: 20px;
	/* background-color: white; */
}

.dasb_selc{
	display: inline-block;
	margin-top: 5px;
	margin-left: 5px;
	border: 0px;
	background-color: #eaeaea;
	font-size: 20px;
	font-weight: bold;
}

.dasb_set_name, .widg_set_name{
	display:inline-block;
	font-size: 15px;
	border: 1px solid ;
	margin-left: 5px;
}

.dasb_set_btn_area, .widg_set_btn_area{
	display: inline-block;
	margin-left: 5px;
}

.dash_add_btn{
	display: inline-block;
	margin-left: 5px;
}

.widg_state{
	display: inline-block;
	font-size: 15px;
	
}

.dasbadd{
	font-size: 15px;
	
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<script src="https://code.highcharts.com/modules/data.js"></script>

<link rel="stylesheet" href="/wberp/resources/css/highcharts.css">
<script type="text/javascript">
function makeHighchartTable() {
	Highcharts.chart('container', {
		  data: {
		    table: 'datatable'
		  },
		  chart: {
		    type: $("#CTYPE_VAL").val()
		  },
		  title: {
		    text: 'Data extracted from a HTML table in the page'
		  },
		  yAxis: {
		    allowDecimals: false,
		    title: {
		      text: 'Units'
		    }
		  },
		  tooltip: {
		    /* formatter: function () {
		      return '<b>' + this.series.name + '</b><br/>' +
		        this.point.y + ' ' + this.point.name.toLowerCase();
		    } */
		  }
		});
}

$(document).ready(function(){
	$("#cc_Btn").on("click", function(){
		$("#actionForm").attr("action", "dasbMang");
		$("#actionForm").submit();
	});
	
	$("#seltest").change(function(e) {
		
		$("#TITLE").val($("#seltest option:selected").text());
		testdetail();
		
		
		console.log("셀렉트값 변경후 추가됨");
		
	});
	
	
	reloadList();
	checkList();
	
	// 검증버튼
	/* $("#CHECK_BTN").on("click", function () {
		if( $("#WIDG_ORDER").val() == ) {
			
			
		} 
		console.log(toString.loadOrder);
		$("#RESULT").val(loadOrder);
	}); */
	
	
	
	
	$("#add_Btn").on("click", function(){
		
		if($.trim($("#DASB_NO").val())==""){
			alert("대시보드번호를 입력해주세요.")
			$("#DASB_NO").focus();
			
		} else if ($.trim($("#EMP_NO").val())==""){
			alert("사원번호를 입력해주세요.")
			$("#EMP_NO").focus();
			
		} else if ($.trim($("#TITLE").val())==""){
			alert("장표를 선택해주세요.")
			$("#TITLE").focus();
			
		} else if ($.trim($("#CHART_TYPE").val())==""){
			alert("차트타입을 입력해주세요.")
			$("#CHART_TYPE").focus();
			
		} else if ($.trim($("#WIDG_ORDER").val())==""){
			alert("위젯 순서를 입력해주세요.")
			$("#WIDG_ORDER").focus();
			
		
		} else if ($.trim($("#ATTCH_NO").val())==""){
			alert("장표 번호를 입력해주세요.")
			$("#ATTCH_NO").focus();
			
		
		} else {
			
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "widgAddAjax", 
				dataType : "json",
				data : params,
				success : function(res) {
					if(res.res == "SUCCESS") {
						$("#actionForm").submit();
					} else {
						$("#alert").attr("title", "알림");
						$("#alert").html("저장에 실패하였습니다.");
						$("#alert").dialog({
							buttons: {
								Ok: function() {
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
	});
	
	
	$("#pviewBar").on("click", function () {
		$("#CTYPE_VAL").val('bar');
	});
	
	$("#pviewCol").on("click", function () {
		$("#CTYPE_VAL").val('column');
	});
	
	$("#pviewLine").on("click", function () {
		$("#CTYPE_VAL").val('line');
	});
	
	$("#pviewPie").on("click", function () {
		$("#CTYPE_VAL").val('pie');
	});
	
	$("#pviewBar,#pviewCol, #pviewLine, #pviewPie").on("click", function(){
		
		// 불러온 쿼리를 담아서
		// ajax로 컨트롤러에 던짐
		// 컨트롤러에서 데이터 조회후 리턴
		// 받은 데이터로 테이블을 새로 생성
		// makeHighchartTable() 함수 실행
		/* 
		var testQuery = 'SELECT TDP AS NAME, CEIL(AVG(TSAL)) AS DATA'
						+ ' FROM ('
						+ '		SELECT TSAL, TDP'
						+ '		FROM TT'
						+ '		)'
						+ 'GROUP BY TDP';
		 */
		 
		var testQuery = $("#ATTCH_QUERY").val();
 
		var params = {'testQuery' : testQuery};
		
		$.ajax({
			type : "post", //데이터를 주고받는 방식
			url : "chartAjax", // {키:값, 키:값}// ""데이터가 넘어갈 주소 (결과를 받을 주소)
			dataType : "json",
			data : params, 	// 보내는 데이터
			success : function(res) { // 성공 시 해당 함수 실행, 결과는 result로 받겠다.
				//drawList(res.list);
				console.log(res.testList);
				
				var thisHtml = '';
				for ( var a = 0; res.testList.length > a; a++ ) {
					
					thisHtml +=	'<tr>'
						    + '    <td>' + res.testList[a].NAME + '</td>'
						    + '    <td>' + res.testList[a].DATA + '</td>'
						    + '  </tr>';
					
				}
				
				$('#datatable tbody').html(thisHtml);//
				//$("#CTYPE_VAL").val('column');
				makeHighchartTable();
				
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
		
	});
			
	
});

function testdetail() {
	var params = $("#actionForm").serialize();

	$.ajax({
		type : "post", //데이터를 주고받는 방식
		url : "attSelecDetailAjax", // {키:값, 키:값}// ""데이터가 넘어갈 주소 (결과를 받을 주소)
		dataType : "json",
		data : params, // 보내는 데이터
		success : function(res) { // 성공 시 해당 함수 실행, 결과는 result로 받겠다.
			console.log(res.alist.ATTCH_NO);
			console.log("attSelecDetailAjax 로드");
			console.log(res.alist);
			$("#ATTCH_NO").val(res.alist.ATTCH_NO);
			$("#ATTCH_QUERY").val(res.alist.ATTCH_QUERY);
			
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}

function checkList() {
	var params = $("#actionForm").serialize();

	$.ajax({
		type : "post", //데이터를 주고받는 방식
		url : "checkOrderAjax", // {키:값, 키:값}// ""데이터가 넘어갈 주소 (결과를 받을 주소)
		dataType : "json",
		data : params, // 보내는 데이터
		success : function(res) { // 성공 시 해당 함수 실행, 결과는 result로 받겠다.
			
		
			$("#CHECK_BTN").on("click", function () {
				console.log("for문실행");
				console.log(res.chclist[0].WIDG_ORDER);
				console.log(res.chclist[1].WIDG_ORDER);
				console.log(res.chclist[2].WIDG_ORDER);
				for ( var i = 0; i < res.chclist.length; i++){
					if( $("#WIDG_ORDER").val() == res.chclist[i].WIDG_ORDER) {
						$("#ORDER_KEY").val(res.chclist[i].WIDG_ORDER); // 중복값 찾아냈음
						console.log("값이 중복!");
						console.log("입력값" + $("#WIDG_ORDER").val());
						console.log("중복된 값" + res.chclist[i].WIDG_ORDER);
						console.log(res.chclist[i].WIDG_ORDER + "이상의 값을 1씩 더합니다");
						updataOrder();
						
					}
				}
				
				
				
				
			});
			
			
			
			
			
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}

function updataOrder() {
	var params = $("#actionForm").serialize();

	$.ajax({
		type : "post", //데이터를 주고받는 방식
		url : "updateOrderAjax", // {키:값, 키:값}// ""데이터가 넘어갈 주소 (결과를 받을 주소)
		dataType : "json",
		data : params, // 보내는 데이터
		success : function(res) { // 성공 시 해당 함수 실행, 결과는 result로 받겠다.		
			
			
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}

function reloadList() {
	var params = $("#actionForm").serialize();

	$.ajax({
		type : "post", //데이터를 주고받는 방식
		url : "attSelecAjax", // {키:값, 키:값}// ""데이터가 넘어갈 주소 (결과를 받을 주소)
		dataType : "json",
		data : params, // 보내는 데이터
		success : function(res) { // 성공 시 해당 함수 실행, 결과는 result로 받겠다.
			drawList(res.list);
			console.log("attSelecAjax 로드");
			console.log(res.list);
			
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}

function drawList(list) {
	
	
	$("#seltest").empty();
	$("#seltest").append('<option value="' +"선택"+ '" selected="selected">' + "선택" + '</option>');
	
	
	for(var i = 0; i< list.length ; i++){
		$("#seltest").append('<option value="' + list[i].TITLE +'">' + list[i].TITLE + '</option>');

	}
	
	
		
	
	
	

	
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
		<div class="contents_header_txt">위젯 추가</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="dasbDetail" id="actionForm" method="post">
		<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" id="WIDG_NO" name="WIDG_NO"  />
			<input type="hidden" id="CTYPE_VAL" name="CTYPE_VAL" "value="'bar'"  />
			<div class="dasbadd">
			
			
			
			대시보드 번호 : <input type ="text" name="DASB_NO" id="DASB_NO" value="${param.DASB_NO}" readonly="readonly"/><br/>
			사원번호 : <input type ="text" name="EMP_NO" id="EMP_NO" value="${sEmpNo}" readonly="readonly"/><br/>
			
			장표선택 :
				<input type="text" name="TITLE" id="TITLE"/>
				<select class="dasb_selc" id="seltest" name="dasb_selc">
					<option></option>
				</select>
				<br/>
			장표번호 : <input type="text" readonly="readonly" name="ATTCH_NO" id="ATTCH_NO" /><br/>
			장표쿼리: <textarea class="attch_query" rows="10" cols="20" name="ATTCH_QUERY"id="ATTCH_QUERY"></textarea><br/><br/><br/>
			
					<input type="button" id="pviewBar" name="pviewBar" value="바" />
					<input type="button" id="pviewCol" name="pviewCol" value="컬럼" />
					<input type="button" id="pviewLine" name="pviewLine" value="라인" />
					<input type="button" id="pviewPie" name="pviewPie" value="파이" />
			데이터테이블 : 
			<div class="dataArea" id="dataArea" name="dataArea">
				<figure class="highcharts-figure">
 
				  <table id="datatable" class="datatable">
					 <thead>
				      <tr>
				        <th>NAME</th>
				        <th>DATA</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td>aa</td>
				        <td>4</td>
				      </tr>
				      <tr>
				        
				        <td>bb</td>
				        <td>0</td>
				      </tr>
				      <tr>
				      
				        <td>cc</td>
				        <td>11</td>
				      </tr>
				      <tr>
				        
				        <td>dd</td>
				        <td>1</td>
				      </tr>
				      <tr>
				        
				        <td>ee</td>
				        <td>4</td>
				      </tr>
				    </tbody>
				  </table>
				</figure>
			</div>
		

			<div class="underline2">
				<div class="line01">미리보기</div>
				<div id="container"></div>
			</div>
			
			차트타입 : <input type="text" name="CHART_TYPE" id="CHART_TYPE"/><br/>
			위젯순서 : <input type="text" name="WIDG_ORDER" id="WIDG_ORDER"/> 
					<input type="hidden" name="ORDER_KEY" id="ORDER_KEY"/>
					<input type="button" value="검증" id="CHECK_BTN">
					<input type="text" name="loadOrder" id="loadOrder"/> 
					<input type="text" name="RESULT" id="RESULT"/>
					
					
			<br/>
			
		
			
			</div>
		
			
	
		</form>
		<input type="button" class="cc_btn" value="취소" id="cc_Btn">
		<input type="button" class="add_btn" value="추가" id="add_Btn">
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>