<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - Sample Page</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<style type="text/css">
#container {
  height: 400px;
}

.highcharts-figure, .highcharts-data-table table {
  min-width: 310px;
  max-width: 800px;
  margin: 1em auto;
}
.datatable {
	display: none;
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

.box0 {
	display: block;
	width: 100%;
	height: 100%;
	/* border: 1px solid red; */
}

.box1 {
	display: inline-block;
	width: 40%;
	height: 40%;
	/* border: 1px solid red; */
}

.contents1 {
	overflow: hidden;
	width: 1060px;
	/* height: 950px; */
	/* border: 1px solid red; */
}

.underbox1 {
	display: block;
	width: 800px;
	border-top: 2px solid #9aa9bd;
	border-bottom: 1px solid #9aa9bd;
	margin-bottom: 10px;
	/*  border: 1px solid red; */
}

.underline1 {
	font-size: 0pt;
	margin: 0px;
	position: relative;
	width: 100%;
	height: 100%;
	min-width: 800px;
	width: 100%;
	min-height: 43px;
	border-bottom: 1px solid #9aa9bd;
	display: inline-table;
	/*  border: 1px solid red; */
}

.underline2 {
	width: 100%;
	min-height: 43px;
	border-bottom: 1px solid #9aa9bd;
	display: inline-table;
}

.line01 {
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

.line02 {
	font-size: 10pt;
	font-weight: bold;
	background-color: #e4eaf2;
	width: 150px;
	min-height: 55px;
	line-height: 55px;
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}

.con01 {
	font-size: 10pt;
	min-height: 43px;
	line-height: 43px;
	display: inline-block;
	padding: 0px 5px;
}

.con02 {
	margin-top: 5px;
	margin-bottom: -10px;
	resize: none;
	width: 468px;
	height: 322px;
}

.contxt01 {
	height: 28px;
	font-size: 10pt;
	border-radius: 3px;
	margin: 5px 7px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
	width: 470px;
}

.search_filter01 {
	height: 28px;
	font-size: 10pt;
	border-radius: 3px;
	margin: 5px 3px 0px 5px;
	border: 1px solid #c2c2c2;
	padding: 1px 0px;
	outline: none;
	width: 300px;
	hight: 32px;
}

.selectbox01 {
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

.con03 {
	margin-top: 5px;
	margin-bottom: -10px;
	resize: none;
	width: 470px;
	height: 145px;
}

.line12 {
	width: 600px;
	height: 161px;
}

.line13 {
	width: 600px;
	height: 160px;
}

.line22 {
	width: 600px;
	height: 332px;
}

.txt01 {
	resize: none;
	margin-top: 5px;
	margin-bottom: -10px;
	resize: none;
	width: 470px;
	height: 145px;
	border: 1px solid #c2c2c2;
}
/* .detail_btn_area {
	width: 80px;
    height: 32px;
    font-size: 14px;
    background-color: #f7f7f7;
    border: 1px solid #c2c2c2;
    border-radius: 3px;
    margin: 0 3px;
    padding: 1px 2px;
    float: right;
    outline: none;
} */
.attchType {
	display: inline-block;
	width: 45px;
	height: 45px;
	padding: 0px 5px;
	margin-top: 5px;
	margin-bottom: -10px;
}

.pivot, .line22, .request, .dataArea, .dataTable {
	font-size: 10pt;
}



.query_ChartBtn {
	font-size: 10pt;
	display: inline-block;
	padding: 0px 5px;
}


</style>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<script src="https://code.highcharts.com/modules/data.js"></script>

<link rel="stylesheet" href="/wberp/resources/css/highcharts.css">

<!-- highcharts 전용 script -->
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
	
</script>

<script type="text/javascript">
$(document).ready(function(){
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
	
	
	
	
	
	$("#categBtn").on("click", function(){
		$("#Category").append('<option value="' + $("#Category_Text").val() + '">'  + $("#Category_Text").val() + '</option>');
		
	});
	$("#delBtn").on("click", function() {
		if(confirm("삭제하시겠습니까?")){
			
			$('#EIS_CATG_NO').val($('#Category option:selected').val());
			
			var params = $("#actionForm").serialize();
			$.ajax({ 
				type : "post",
				url : "catgDeleteAjax",
				dataType : "json",
				data : params,
				success: function(res){ 
					if(res.res == "SUCCESS"){
						
						alert('삭제완료');
						
						$("#EIS_CATG_NO").val($('#Category option:selected').val());
						/* $("#actionForm").submit(); */
					}else{
						$("#alert").attr("title", "알림");
						$("#alert p").html("삭제 실패!");
						$("#alert").dialog({
							buttons: {
								Ok: function(){
									$(this).dialog("close");
								}
							}
		
						});
					}
				},
				error : function(req, status, error){
					console.log("code : " + req.status);
					console.log("message : " + req.responseText);
				}
			});
		}
	});
	
	
	
$("#pviewBar,#pviewCol, #pviewLine, #pviewPie").on("click", function(){
		$("#datatable").removeAttr("class");
		
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
		 
		var testQuery = $("#query_Text").val();
 
		var params = {'testQuery' : testQuery};
		
		$.ajax({
			type : "post", //데이터를 주고받는 방식
			url : "chartAjax", // {키:값, 키:값}// ""데이터가 넘어갈 주소 (결과를 받을 주소)
			dataType : "json",
			data : params, // 보내는 데이터
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
}); // doc끝

reloadCatg();

function reloadCatg(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "catgList2Ajax",
		dataType : "json",
		data : params,
		success: function(res){
			catgList(res.list, res.catgCnt);
		},
		error : function(req, status, error){
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}

function catgList(list, catgCnt){
	var html = "";
	
			html += "<option value=\"0\">" + "선택" + "</option>";
		for(var i = 0; i < list.length; i++){
			html += "<option value=" + list[i].EIS_CATG_NO + ">" + list[i].EIS_CATG_NM + "</option>";
		}
		
	
	$("#Category").html(html);
}


$(document).on('change', '#Category', function() {
	 $("#Category_Text").val($('#Category option:selected').text());
});


/* $("#Category").change(function(e) {
           $("#Category_Text").val($('#Category option:selected').text());
        }); */


			var previewCode = 0;
			var attchTypeList = []; // 선택된 차트 배열
		
			$(document).ready(function() {
				
				$("#cancelBtn").on("click", function() {
					$("#actionForm").attr("action", "attchList");
						$("#actionForm").submit();
				
				
				});
	
				$("#addBtn").on("click", function() {
					if ($.trim($("#attch_title_text").val()) == "") {
						alert("제목을 입력해주세요");
						console.log("제목");
						$("#attch_title_text").focus();
					}/* else if($.trim($("#EMP_NM").val()) == ""){
						alert("작성자를 입력해주세요");
						$("#EMP_NM").focus(); 
					}*/else if ($.trim($("#Category_Text").val()) == ""|| $.trim($("#Category").val()) == "0") {
						alert("카테고리을 선택해주세요");
						console.log("카테");
						$("#Category option:selected").val();
						console.log("고리");
						$("#Category_Text").focus();
					} else if ($.trim($("#Info_Text")
							.val()) == "") {
						alert("내용을 입력해주세요");
						$("#Info_Text").focus();
					} else if ($.trim($("#query_Text")
							.val()) == "") {
						alert("쿼리을 입력해주세요");
						$("#query_Text").focus();
					} else {
	
						$('#EIS_CATG_NO').val($('#Category option:selected').val());
						$('#TITLE').val($('#attch_title_text').val());
						$('#INFO').val($('#Info_Text').val());
						$('#ATTCH_ QUERY').val($('#query_Text').val());
						$('#ATTCH_TYPE').val($('#attchTypeList').val());
						$('#PIVOT_WHET').val($('[name=pivot]:checked').val());
	
						var params = $("#actionForm")
								.serialize();
	
						$.ajax({
									type : "post",
									url : "attchAddAjax",
									dataType : "json",
									data : params,
									success : function(
											res) {
										if (res.res == "SUCCESS") {
											$(
													"#actionForm")
													.attr(
															"action",
															"attchList")
											$(
													"#actionForm")
													.submit();
										} else {
											$("#alert")
													.attr(
															"title",
															"알림");
											$(
													"#alert p")
													.html(
															"추가 실패");
											$("#alert")
													.dialog(
															{
																buttons : {
																	Ok : function() {
																		$(
																				this)
																				.dialog(
																						"close");
																	}
																}
															});
										}
									},
									error : function(
											req,
											status,
											error) {
										console
												.log("code : "
														+ req.status);
										console
												.log("message : "
														+ req.responseText);
									}
								});
					}
				});

						$("#actionForm").on("keypress", "input", function(e) {
							if (e.keyCode == 13) {
								return false;
							}
						});
						

						// 미리보기 버튼 함수
						$("#barChart").on("click", function() {
							
							if ($('#query_Text').val().trim().length > 0) {
								attchQuery();
								

							}

						});

						/* $("#colChart").on("click", function() {
							previewCode = 2;
							if ($('#query_Text').val().trim().length > 0) {
								attchQuery();

							}

						});

						$("#lineChart").on("click", function() {
							previewCode = 3;
							if ($('#query_Text').val().trim().length > 0) {

								attchQuery();

							}
						});

						$("#pieChart").on("click", function() {

							previewCode = 4;
							if ($('#query_Text').val().trim().length > 0) {
								attchQuery();

							}
						});

						$("#pt").on("click", function() {

							makeHighchartTable();

						}); */

						//쿼리 보내기
						function attchQuery() {
							var params = $("#actionForm").serialize();
							console.log(params);
							$.ajax({
								type : "post",
								url : "attchQueryAjax",
								dataType : "json",
								data : params,
								success : function(res) {
									if (res.resultMsg == "SUCCESS") {
										console.log(res.dataList[0]);
										$("#ts").html(res.dataList[0]);
										drawList(res.data);
										makeHighchartTable();
										$('#query_Text').val();
										/* // highcharts 만들기

										if (previewCode == 1) {
											console.log("code1");
											makeHighchartsBar(res);

										} else if (previewCode == 2) {
											console.log("code2");
											makeHighchartsColumn(res);

										} else if (previewCode == 3) {
											console.log("code3");
											makeHighchartsLine(res);

										} else if (previewCode == 4) {
											console.log("code4");
											makeHighchartsPie(res);

										} */

									} else {
										$("#alert").attr("title", "알림");
										$("#alert p").html("저장 실패!");
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
									console
											.log("message : "
													+ req.responseText);
								}
							});

							
						}

						function drawList(data) {
							
							var html = "";
							
							html += "<thead>";
							html += "<tr>";
							html += "<th>" + NAME + "</th>";
							html += "<th>" + res.dataList[0] + "</th>";
							html += "</tr>";
							html += "</thead>";

							/* for (var i = 0; i < data.dataList; i++) {
								
								//html += "<tr name=\"" + data.dataList[i] + "\">";
								html += "<tr name=\"" + data.dataList[i] + "\">";
								html += "<td>" + list[i].CNT + "</td>";

								html += "</tr>";
							}
								 */
								
								

							

							$("#datatable").html(html);
						}
						
						
						/* $("#Category").change(function(e) {
							$("#Category_Text").val($('#Category option:checked').text());
							
							
							
							if( $('#Category option:checked').text() == "추가") {
								$("#Category_Text").removeAttr("disabled");
							}
							
							
							if( $('#Category option:checked').val() != "") {
								
								$("#Category_Text").attr("disabled", "disabled");
							}
								
						}); */
						
							
							
							$("#able").on("click",function(){
								$("#target_btn").removeAttr("disabled");
							});
							
							$("#disable").on("click",function(){
								$("#target_btn").attr("disabled", "disabled");
							});
							
							
							
							
						/* $("#Category").change(function(e) {
								$("#Category").val() == '4'
									$("#Category_Text disabled:false")
								
							})
						} */

						$(".attchType").on("click",function() {

									var thisIndex = $(this).index(); // 버튼 순서
									var thisNo = $(this).index() + 1; // 차트 번호
									var thisVal = $('#attchTypeList').val(); // atchTypeList 에 나열할 값 리스트 ex) 1,3,5...

									if (attchTypeList.indexOf(thisNo) >= 0) {
										// 선택한 차트가 배열에 있는 경우 = 중복 >> 배열추가X, 버튼색 해제
										$($('.attchType')[thisIndex]).attr(
												'style', '');
										attchTypeList.splice(attchTypeList
												.indexOf(thisNo), 1);
									} else {
										// 선택한 차트가 배열에 없는 경우 = 중복X >> 배열추가O, 버튼색칠
										$($('.attchType')[thisIndex]).attr(
												'style',
												'background-color:#BFDBFF;')
										attchTypeList.push(thisNo);
										
									}

									attchTypeList.sort();
									$('#attchTypeList').val(attchTypeList);
									console.log(attchTypeList);
									
									/* 
									var thisIndex = $(this).index(); // 버튼 순서
									var thisNo = $(this).index() + 1; // 차트 번호
									var thisVal = $('#attchTypeList').val(); // atchTypeList 에 나열할 값 리스트 ex) 1,3,5...
									
									if ( thisVal == '' ) {
										thisVal += thisNo;
									} else {
										thisVal += ',' + thisNo;
									}
									
									$('#attchTypeList').val(thisVal);
									 */
								});
								
					});
					
					$(document).ready(function(){
						
						
						$("#categBtn").on("click", function(){
							if($.trim($("#Category_Text").val())==""){
								alert("카테고리 이름을 입력해주세요.")
								$("#Category_Text").focus();
							} else {
								var params = $("#actionForm").serialize();
								
								$.ajax({
									type : "post",
									url : "categAddAjax", 
									dataType : "json",
									data : params,
									success : function(res) {
										if(res.res == "SUCCESS") {
											/* $("#actionForm").submit(); */
											
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
					});
						
						
					
					/* $(document).on('click','.query_ChartBtn input', function(){
						$(this).toggleClass('on');
					}); */
</script>
<script type="text/javascript">
	/* 상세보기영역 가로변경 시 */
	/* .underbox {
	 width: 800px;
	 } */

	/* 버튼영역 가로변경 시 */
	/* .add_btn_area {
	 width: 800px;
	 } */
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
		<div class="contents_header_txt">장표 등록</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<div class="contents">
			<!-- 여기에 내용을 작성하시오. -->
			<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
			<form action="#" id="actionForm" method="post">
				<!-- 아래 두개 필수 -->
				<input type="hidden" id="top" name="top" value="${param.top}" /> 
				<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
				<input type="hidden" id="page" name="page" value="${page}" /> 
				<input type="hidden" id="attch_NO" name="attch_NO" value="${detail.ATTCH_NO}" />
				<input type="hidden" name="EIS_CATG_NO" id="EIS_CATG_NO" value="" />
				<input type="hidden" name="TITLE" id="TITLE" value="" />
				<input type="hidden" name="INFO" id="INFO" value="" />
				<input type="hidden" name="ATTCH_QUERY" id="ATTCH_QUERY" value="" />
				<input type="hidden" name="ATTCH_TYPE" id="ATTCH_TYPE" value="" />
				<input type="hidden" name="PIVOT_WHET" id="PIVOT_WHET" value="" />
				<input type="hidden" id="CTYPE_VAL" name="CTYPE_VAL" value="'bar'"  />
				<input type="hidden" name="sEmpNo" id="sEmpNo" value="${sEmpNo}" />

				<div class="contents1">
					<div class="underbox1">
						<div class="underline1">
							<div class="line01">제목</div>
							<div class="line11">
								<input class="contxt01" type="text" id="attch_title_text"
									name="attch_title_text" />
							</div>
						</div>
						<div class="underline1">
							<div class="line01">작성자</div>
							<div class="line11">
								<input class="contxt01" type="text" id="EMP_NM" name="EMP_NM"
									value="${sEmpNm}" disabled="disabled" />
							</div>
						</div>
						<div class="underline1">
							<div class="line01">카테고리</div>
							<div class="line11">
								<div class="jbox">
									<input class="search_filter01" name="Category_Text" id="Category_Text" type="text"  />
									<!-- 옵션에서 선택한 -->
									<input class="categBtn" id="categBtn" name="categBtn" type="image" style= 'height:25px;width:25px; margin: 2px 3px -8px 3px;' src="resources/images/eis/add.png" width="12" height="12"/>
									<input class="delBtn" id="delBtn" name="delBtn" type="image" style= 'height:25px;width:25px; margin: 2px 3px -8px 3px;' src="resources/images/eis/add.png" width="12" height="12"/>
									
									<select class="selectbox01" name="Category" id="Category">
										
										
										
									</select>
								</div>
							</div>
						</div>
						<div class="underline1">
							<div class="line01">내용</div>
							<div class="line12">
								<div class="con01">
									<textarea class="txt01" rows="10" cols="20" class="Info_Text"
										id="Info_Text"></textarea>
								</div>
							</div>
						</div>
						<div class="underline1">
							<div class="line01">쿼리</div>
							<div class="line13">
								<div class="con01">
									<textarea class="txt01" rows="10" cols="20" name="query_Text" id="query_Text"></textarea>
								</div>
								<br />
								<div class="query_ChartBtn" id="query_ChartBtn" name="query_ChartBtn">
									
									<input type="hidden" class="pieName" id="pieName" value="1" />
									<input type="hidden" class="pieY" id="pieY" value=2 />
								</div>
							</div>
						</div>
						<div class="underline1">
							<div class="line02">장표타입</div>
							<div class="con01">
								<div class="line11">
									<button type="button" class="attchType" id="pviewBar" value="바">
										<img src="resources/images/eis/graph1.png" width="30"
											height="30">
									</button>
									<button type="button" class="attchType" id="pviewCol" value="컬럼">
										<img src="resources/images/eis/graph2.png" width="30"
											height="30">
									</button>
									<button type="button" class="attchType" id="pviewLine" value="라인">
										<img src="resources/images/eis/graph3.png" width="30"
											height="30">
									</button>
									<button type="button" class="attchType" id="pviewPie" value="파이">
										<img src="resources/images/eis/graph2.png" width="30"
											height="30">
									</button>
									
									<input type="hidden" id="attchTypeList" name="attchTypeList" value="" />
								</div>
							</div>
							<div class="line01">피벗</div>
								<div class="pivot">
									<div class="line11">
										<input type="radio" name="pivot" id="pivotX" value="1" checked />
										<label for="pivotX">X축</label>
										<input type="radio" name="pivot" id="pivotY" value="2" />
										<label for="pivotY">Y축</label>
										${detail.ATTCH_QUERY}
									</div>
								</div>
						</div>
						<div class="underline2">
							<div class="line01">데이터테이블</div>
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
						</div>

						<div class="underline2">
							<div class="line01">미리보기</div>
							<div id="container"></div>
						</div>


						
						<div class="underline1">
							
						</div>
					</div>
					<div class="detail_btn_area">
						<input type="button" class="cancelBtn" id="cancelBtn" value="취소" />
						<input type="button" class="addBtn" id="addBtn" value="등록" />
						
						
<input id='target_btn' disabled="disabled" type='button' value='버튼'/>


<!-- <div>  

  <input type='button' value='활성화' id="able"/>
  <input type='button' value='비활성화' id="disable"/>
</div>
 -->




					</div>
				</div>

			</form>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>