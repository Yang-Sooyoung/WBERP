<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

.pivot, .line22, .request, .dataArea, .dataTable {
	font-size: 10pt;
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
	/* border:  1px solid red; */
	
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

.datatable {
	display: none;
}

.con33 {
	font-size: 10pt;
	min-height: 43px;
	line-height: 43px;
	display: inline-block;
	padding: 0px 5px;
	margin-right: 150px;
}

.con44 {
	font-size: 10pt;
    min-height: 24px;
    line-height: 28px;
    display: inline-block;
    padding: 0px 5px 5px;
}

.line33 {
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
	width: 475px;
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

.line22 {
	width: 600px;
	height: 332px;
}

.txt01 {
	resize : none;
	margin-top: 5px;
	margin-bottom: -10px;
	resize: none;
	width: 470px;
	height: 145px;
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
.pivot {
	font-size: 10pt;
}

.delBtn .listBtn {
	width: 80px;
    height: 32px;
    font-size: 14px;
    background-color: #f7f7f7;
    border: 1px solid #c2c2c2;
    border-radius: 3px;
    margin: 0 3px;
    padding: 1px 2px;
    float: left;
    outline: none;
}

.clicked {
	background-color:#BFDBFF;
}


.underline2 {
	width: 100%;
	min-height: 43px;
	border-bottom: 1px solid #9aa9bd;
	display: inline-table;
}


</style>


<!-- 미리보기관련  -->
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
var attchTypeList = "${detail.ATTCH_TYPE}".split(",");
var attchTypeList2 = "${detail.ATTCH_TYPE}"
console.log(attchTypeList);
console.log(attchTypeList2);
	$(document).ready(function() {
		/* debugger */
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
	
		
		if(attchTypeList.length > 0) {
			for(var i=0; i<attchTypeList.length; i++) {
				var attchTypeIndex = attchTypeList[i] - 1;
				$('.attchType:nth('+attchTypeIndex+')').addClass('clicked');
			}
		}
		
		// 돌아가기
		$("#listBtn").on("click", function(){
			console.log('문listBtn');
			$("#actionForm").attr("action", "attchList");
				$("#actionForm").submit();
			});
		
		$("#upBtn").on("click", function(){
				$("#actionForm").attr("action", "attchUpdate");
				$("#actionForm").submit();
			
			
		});
		
		
		/* $("#chart").on("click", function(){
			console.log('문listBtn');
			$("#actionForm").attr("action", "chart");
				$("#actionForm").submit();
		}); */
		
		// 삭제
		$("#delBtn").on("click", function(){
			if(confirm("삭제하시겠습니까?")){
				var params = $("#actionForm").serialize();
				$.ajax({
					type : "post",
					url : "attchDeleteAjax",
					dataType : "json",
					data : params,
					success: function(res){ 
						if(res.res == "SUCCESS"){
							$("#actionForm").attr("action", "attchList")
							$("#actionForm").submit();
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
		
		
		
/* 		$('.attchType').on(function() {
			
		for(var i=0; i<attchTypeList.length; i++) {
		    console.log(attchTypeList[i]-1)
		}
		}); */
		
		//수정에서 
		/* $('.attchType').click(function(e) {
			$(this).toggleClass('clicked');
		}); */
		
		
		$('input:radio[name=pivot]:input[value=${detail.PIVOT_WHET}]').attr("checked", true);
	
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
						makeHighchartTable();
						
					},
					error : function(req, status, error) {
						console.log("code : " + req.status);
						console.log("message : " + req.responseText);
					}
				});
				
			
		}); // doc끝
		
		
	});
	/* console.log("${detail.attch_NO}");
	console.log("${detail.PIVOT_WHET}"); */
	
	
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
		<div class="contents_header_txt">장표 상세보기</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" id="page" name="page" value="${page}" />
			<input type="hidden" id="attch_NO" name="attch_NO" value="${detail.ATTCH_NO}" />
			<input type="hidden" name="ATTCH_TYPE" id="ATTCH_TYPE" value="${detail.ATTCH_TYPE}" />
			<input type="hidden" name="PIVOT_WHET" id="PIVOT_WHET" value="${detail.PIVOT_WHET}" />
			<input type="hidden" id="CTYPE_VAL" name="CTYPE_VAL" value="'bar'"  />
		</form>
		<div class="contents">
			<!-- 여기에 내용을 작성하시오. -->
				
				<div class="contents1">
					<div class="underbox1">
						<div class="underline1">
							<div class="line01">제목</div>
							<div class="line11">
								<input class="contxt01" type="text" value="${detail.TITLE}" disabled="disabled"/>
							</div>
						</div>
						<div class="underline1">
							<div class="line01">작성자</div>
							<div class="line11">
								<input class="contxt01" type="text" value="${detail.EMP_NM}" disabled="disabled"/>
								console.log("detail.EMP_NM");
							</div>
						</div>
						
						
						<div class="underline1">
							<div class="line01">카테고리</div>
							<div class="line11">
								<input class="search_filter01" type="text" value="${detail.EIS_CATG_NM}" disabled="disabled"/>
															</div>
						</div>
						<div class="underline1">
							<div class="line01">내용</div>
							<div class="line12">
								<div class="con01"><textarea class="txt01" rows="10" cols="20" disabled="disabled">${detail.INFO}</textarea></div>
							</div>
						</div>
						<div class="underline1">
							<div class="line01">쿼리</div>
							<div class="line12">
								<div class="con01"><textarea class="txt01" rows="10" cols="20" id="query_Text" disabled="disabled">${detail.ATTCH_QUERY}</textarea></div>
								console.log("detail.query_Text");
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
								<div class="line33">피벗</div>
								<div>
									<div class="con33">
										<div class="con44">
											<input type="radio" name="pivot" id="pivotX" value="1" disabled="disabled" />
											<label for="pivotX">유</label>
											<input type="radio" name="pivot" id="pivotY" value="2" disabled="disabled" />
											<label for="pivotY">무</label>
										</div>
									</div>
									</div>
						</div>
						<!-- <div class="underline1">
							<div class="line01">피벗</div>
								<div class="pivot">
									<div class="line11">
										<div class="con01">
											<input type="radio" name="pivot" id="pivotX" value="1" disabled="disabled" />
											<label for="pivotX">유</label>
											<input type="radio" name="pivot" id="pivotY" value="2" disabled="disabled" />
											<label for="pivotY">무</label>
										</div>
									</div>
								</div>
						</div>
						 -->
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
				<input type="button" class="upBtn" id="upBtn" value="수정" />
				<input type="button" class="delBtn" id="delBtn" value="삭제" />
				<input type="button" class="listBtn" id="listBtn" value="목록" />
				<!-- <input type="button" class="chart" id="chart" value="차트" /> -->
			</div>
				</div>
			
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>