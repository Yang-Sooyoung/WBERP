<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>대시보드</title>
<style type="text/css">
/* 개별 css는 여기에 */

.dataArea, .attch_query {
	display:none;
}


.search_area {
	display: inline-block;
	width: 1100px;
	height: 32px;
}

.search {
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

.search_button {
	width: 32px;
	height: 32px;
	border: 0px;
	border-radius: 3px;
	vertical-align: top;
	outline: none;
	cursor: pointer;
}

.filter {
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

tr td {
	border-bottom: 1px solid #c2c2c2;
}

.button_area {
	display: inline-block;
	width: 300px;
	height: 32px;
	float: right;
}

.page_button_area {
	display: inline-block;
	width: 1100px;
	height: 30px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
}

.dasb_area {
    display: inline-block;
    width: 100%;
    font-size: 20px;
    background-color: #f9f9f9;
    border: 1px solid #c2c2c2;
    box-sizing: border-box;
    padding: 20px;
}
.dasb_area.full{
	position: fixed;
	top:0;
	left:0;
	width:100%;
	height:100%;
	overflow:auto;
}
.dasb_close{
	display:none;
	position:absolute;
	top:0;
	right:0;
}
.dasb_content{
	margin-top:20px;
	display:block;
	font-size:0;
}
.dasb_content .chart_box{
    display: inline-block;
    width: calc(25% - 15px);
    border: solid 1px #333;
    min-height: 30px;
    box-sizing: border-box;
    margin-right: 20px;
    margin-top:20px;
    position: relative;
}
.dasb_content .chart_box:nth-of-type(4n){
    margin-right: 0;
}
.dasb_content .chart_box:nth-of-type(-n+4){
    margin-top: 0;
}

.dasb_content .chart_box:after {
  content: "";
  display: block;
  padding-bottom: 75%;
}

.chart {
 	position: absolute;
    width: 100%;
    height: 100%;
    margin-top: 0px;
    font-size: 13px;
    
}

.chart.detail {
	
}
.chart_title {
 	position: absolute;
    width: 100%;
    height: 22%;
    background-color: #e4eaf2;
   
}


.dasb_set_area, .widg_set_area {
	display: inline-block;
	width: calc(100% - 40px);
	height: 40px;
	margin-top: 20px;
	margin-left: 20px;
	/* background-color: white; */
}

.dasb_selc {
	display: inline-block;
    border: 0px;
    /* background-color: #eaeaea; */
    font-size: 20px;
    font-weight: bold;
    padding: 5px 10px;
    border: solid 1px #ddd;
}

.dasb_set_name, .widg_set_name {
	display: inline-block;
	font-size: 15px;
	border: 1px solid;
	margin-left: 5px;
}

.dasb_set_btn_area, .widg_set_btn_area {
	display: inline-block;
	margin-left: 5px;
}

.dash_add_btn {
	display: inline-block;
	margin-left: 5px;
}

.widg_state {
	display: inline-block;
	font-size: 15px;
}

.dasb_list, .dasb_top{
	font-size: 15px;
}

.highcharts-figure, .highcharts-data-table table {
  min-width: 310px; 
  max-width: 800px;
  margin: 1em auto;
}

#container {
  height: 400px;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}
.highcharts-data-table caption {
  padding: 1em 0;
  font-size: 1.2em;
  color: #555;
}
.highcharts-data-table th {
	font-weight: 600;
  padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
  padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
  background: #f8f8f8;
}
.highcharts-data-table tr:hover {
  background: #f1f7ff;
}

.popupp{
	display: inline-block;
    width: 800px;
    height: 500px;
    background-color: #ffffff;
    position: absolute;
    top: calc(50% - 234px);
    left: calc(50% - 348px);
    z-index: 100;
    box-shadow: 1px 1px 4px 2px #000000;

}

.poppop {
	display: none;
}

.ptarea{
	display: inline-block;
    width: 100px;
    height: 500px;
    background-color: blue;
    
}
.pcarea{
	display: inline-block;
    width: 300px;
    height: 400px;
    background-color: blue;
}
.popchart{
	
   
   
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

$(document).ready(function() {
	//대시보드(제목만) 셀렉트박스로 로드
	reloadList();
	widgList();
	

	
	
 
	$(".chart_box").on("click",function() {
		//차트를 클릭하면
		//차트가 커지고 백그라운드가 생기고
		//테이블이 나타난다
		$("#poppop").removeAttr("class");
		
		console.log($(this).children().val() );
		
		
		var params = { 'WIDG_NO' : $(this).children().val()}
		
		
		console.log(params);
		
		
		$.ajax({
			type : "post", 
			url : "widgDetailAjax", 
			dataType : "json",
			data : params, 
			success : function(res) { 
				console.log("위젯 상세 팝업");
				console.log(res.dlist);
				console.log(res.dlist.ATTCH_QUERY);
				
				var Query = res.dlist.ATTCH_QUERY;
				var params = { 'Query' : Query}
				console.log(params);
				
				$.ajax({
					type : "post", 
					url : "popChartAjax", 
					dataType : "json",
					data : params, 
					success : function(res) { 
						
						console.log("팝업차트아작스");
						var thisHtml = '';
						
						for ( var j = 0; j < res.query.length; j++ ) {
							
							thisHtml +=	'<tr>'
								    + '    <td>' + res.query[j].X + '</td>'
								    + '    <td>' + res.query[j].Y + '</td>'
								    + '  </tr>';
							
						}
						
						$("#poptale tbody").html(thisHtml);
						
						Highcharts.chart( 'popchart' , {
							
							  data: {
							    table: 'poptale'
							  },
							  chart: {
							    type: 'bar'
							  },
							  title: {
							    text: '111'
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
							    }*/
							  }
							});
					},
					error : function(req, status, error) {
						console.log("code : " + req.status);
						console.log("message : " + req.responseText);
					} 
					
					
				});
				
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			} 
			
			
		}); //아작스끝
			
	}); 
	
	
	
	
	
	$("#closeBtn").on("click",function() {
		
		$("#poppop").attr("class", "poppop");
		
	}); 

	
	
	
	$("#seltest").change(function() { // 셀렉트 값 변경시 대시보드 번호 변경 & 번호에 맞는 위젯 리스트 불러오기
		
		$("#DASB_NO").val($("#seltest option:selected").val());
		$(".chart").html("");
		widgList();

	});


	$(document).on("click", ".dasb_full", function(){
		widgList();
		$(".dasb_area").addClass('full');
		$(".dasb_close").show();
	});
	
	$(document).on("click", ".dasb_close", function(){
		widgList();
		$(".dasb_area").removeClass('full');
		$(".dasb_close").hide();
	});

});




function widgList() { // 대시보드가 변경될때 대시보드 번호 값을 selectOne해서 
	
	
	var params = $("#actionForm").serialize();

	$.ajax({
		type : "post", 
		url : "dasbChartAjax", 
		dataType : "json",
		data : params, 
		success : function(res) { 
			console.log("widgList작동");
		
		
			for(var i = 1; i <= res.clist.length; i++){
				if( res.clist.length == 1 ){
					var query1 = res.clist[0].ATTCH_QUERY;
					var cLength = res.clist.length;
					$("#WIDG_NO1").val(res.clist[0].WIDG_NO);
					
					var params = { 'DASB_NO' : $("#DASB_NO").val() ,'cLength' : cLength,'query1' : query1 };
					
				} else if ( res.clist.length == 2 ) {
					var query1 = res.clist[0].ATTCH_QUERY;
					var query2 = res.clist[1].ATTCH_QUERY;
					var cLength = res.clist.length;
					$("#WIDG_NO1").val(res.clist[0].WIDG_NO);
					$("#WIDG_NO2").val(res.clist[1].WIDG_NO);
					var params = { 'DASB_NO' : $("#DASB_NO").val(), 'cLength' : cLength, 'query1' : query1, 'query2' : query2 };
					
				} else if ( res.clist.length == 3 ) {
					var query1 = res.clist[0].ATTCH_QUERY;
					var query2 = res.clist[1].ATTCH_QUERY;
					var query3 = res.clist[2].ATTCH_QUERY;
					var cLength = res.clist.length;
					$("#WIDG_NO1").val(res.clist[0].WIDG_NO);
					$("#WIDG_NO2").val(res.clist[1].WIDG_NO);
					$("#WIDG_NO3").val(res.clist[2].WIDG_NO);
					var params = { 'DASB_NO' : $("#DASB_NO").val(), 'cLength' : cLength,'query1' : query1, 'query2' : query2, 'query3' : query3};
					
				} else if ( res.clist.length == 4 ) {
					var query1 = res.clist[0].ATTCH_QUERY;
					var query2 = res.clist[1].ATTCH_QUERY;
					var query3 = res.clist[2].ATTCH_QUERY;
					var query4 = res.clist[3].ATTCH_QUERY;
					var cLength = res.clist.length;
					
					$("#WIDG_NO1").val(res.clist[0].WIDG_NO);
					$("#WIDG_NO2").val(res.clist[1].WIDG_NO);
					$("#WIDG_NO3").val(res.clist[2].WIDG_NO);
					$("#WIDG_NO4").val(res.clist[3].WIDG_NO);

					var params = { 'DASB_NO' : $("#DASB_NO").val(), 'cLength' : cLength,'query1' : query1, 'query2' : query2, 'query3' : query3, 'query4' : query4 };
					
				} else if ( res.clist.length == 5 ) {
					var query1 = res.clist[0].ATTCH_QUERY;
					var query2 = res.clist[1].ATTCH_QUERY;
					var query3 = res.clist[2].ATTCH_QUERY;
					var query4 = res.clist[3].ATTCH_QUERY;
					var query5 = res.clist[4].ATTCH_QUERY;
					var cLength = res.clist.length;
					
					$("#WIDG_NO1").val(res.clist[0].WIDG_NO);
					$("#WIDG_NO2").val(res.clist[1].WIDG_NO);
					$("#WIDG_NO3").val(res.clist[2].WIDG_NO);
					$("#WIDG_NO4").val(res.clist[3].WIDG_NO);
					$("#WIDG_NO5").val(res.clist[4].WIDG_NO);


					var params = { 'DASB_NO' : $("#DASB_NO").val(), 'cLength' : cLength,'query1' : query1, 'query2' : query2, 'query3' : query3, 'query4' : query4, 'query5' : query5 };
					
				} else if ( res.clist.length == 6 ) {
					var query1 = res.clist[0].ATTCH_QUERY;
					var query2 = res.clist[1].ATTCH_QUERY;
					var query3 = res.clist[2].ATTCH_QUERY;
					var query4 = res.clist[3].ATTCH_QUERY;
					var query5 = res.clist[4].ATTCH_QUERY;
					var query6 = res.clist[5].ATTCH_QUERY;
					var cLength = res.clist.length;
					$("#WIDG_NO1").val(res.clist[0].WIDG_NO);
					$("#WIDG_NO2").val(res.clist[1].WIDG_NO);
					$("#WIDG_NO3").val(res.clist[2].WIDG_NO);
					$("#WIDG_NO4").val(res.clist[3].WIDG_NO);
					$("#WIDG_NO5").val(res.clist[4].WIDG_NO);
					$("#WIDG_NO6").val(res.clist[5].WIDG_NO);

					var params = { 'DASB_NO' : $("#DASB_NO").val(), 'cLength' : cLength,'query1' : query1, 'query2' : query2, 'query3' : query3, 'query4' : query4, 'query5' : query5, 'query6' : query6};
					
				} else if ( res.clist.length == 7 ) {
					var query1 = res.clist[0].ATTCH_QUERY;
					var query2 = res.clist[1].ATTCH_QUERY;
					var query3 = res.clist[2].ATTCH_QUERY;
					var query4 = res.clist[3].ATTCH_QUERY;
					var query5 = res.clist[4].ATTCH_QUERY;
					var query6 = res.clist[5].ATTCH_QUERY;
					var query7 = res.clist[6].ATTCH_QUERY;
					var cLength = res.clist.length;
					
					$("#WIDG_NO1").val(res.clist[0].WIDG_NO);
					$("#WIDG_NO2").val(res.clist[1].WIDG_NO);
					$("#WIDG_NO3").val(res.clist[2].WIDG_NO);
					$("#WIDG_NO4").val(res.clist[3].WIDG_NO);
					$("#WIDG_NO5").val(res.clist[4].WIDG_NO);
					$("#WIDG_NO6").val(res.clist[5].WIDG_NO);
					$("#WIDG_NO7").val(res.clist[6].WIDG_NO);

					var params = { 'DASB_NO' : $("#DASB_NO").val(), 'cLength' : cLength,'query1' : query1, 'query2' : query2, 'query3' : query3, 'query4' : query4, 'query5' : query5, 'query6' : query6,  'query7' : query7};
					

				} else if ( res.clist.length == 8 ) {
					var query1 = res.clist[0].ATTCH_QUERY;
					var query2 = res.clist[1].ATTCH_QUERY;
					var query3 = res.clist[2].ATTCH_QUERY;
					var query4 = res.clist[3].ATTCH_QUERY;
					var query5 = res.clist[4].ATTCH_QUERY;
					var query6 = res.clist[5].ATTCH_QUERY;
					var query7 = res.clist[6].ATTCH_QUERY;
					var query8 = res.clist[7].ATTCH_QUERY;
					var cLength = res.clist.length;
					
					$("#WIDG_NO1").val(res.clist[0].WIDG_NO);
					$("#WIDG_NO2").val(res.clist[1].WIDG_NO);
					$("#WIDG_NO3").val(res.clist[2].WIDG_NO);
					$("#WIDG_NO4").val(res.clist[3].WIDG_NO);
					$("#WIDG_NO5").val(res.clist[4].WIDG_NO);
					$("#WIDG_NO6").val(res.clist[5].WIDG_NO);
					$("#WIDG_NO7").val(res.clist[6].WIDG_NO);
					$("#WIDG_NO8").val(res.clist[7].WIDG_NO);
					var params = { 'DASB_NO' : $("#DASB_NO").val(), 'cLength' : cLength, 'query1' : query1, 'query2' : query2, 'query3' : query3, 'query4' : query4, 'query5' : query5, 'query6' : query6,  'query7' : query7,  'query8' : query8 };
					
					
					
				}
			}
				
			console.log($("#WIDG_NO1").val());
			console.log($("#WIDG_NO2").val());
			console.log($("#WIDG_NO3").val());
			console.log($("#WIDG_NO4").val());
			console.log($("#WIDG_NO5").val());
			console.log($("#WIDG_NO6").val());
			console.log($("#WIDG_NO7").val());
			console.log($("#WIDG_NO8").val());
		
			
			console.log(params);
			console.log(params.query1);
			console.log(params);
			
			$.ajax({
				type : "post", //데이터를 주고받는 방식
				url : "chartAjax", // {키:값, 키:값}// ""데이터가 넘어갈 주소 (결과를 받을 주소)
				dataType : "json",
				data : params, // 보내는 데이터
				success : function(res) { // 성공 시 해당 함수 실행, 결과는 result로 받겠다.
					var thisHtml = '';
					console.log("chartAjax작동");
					console.log(res.query1.length);
					console.log(res.params);
					console.log("c length" + cLength);
					
					
					
					for(var i = 1 ; i <= cLength ; i++){
						console.log("for문 작동");
						console.log(i);
						if( i == 1 ) { // 1번위젯
							thisHtml = '';
							for ( var j = 0; j < res.query1.length; j++ ) {
								
								thisHtml +=	'<tr>'
									    + '    <td>' + res.query1[j].X + '</td>'
									    + '    <td>' + res.query1[j].Y + '</td>'
									    + '  </tr>';
								
							}
							
							$("#t1 tbody").html(thisHtml);
							
							
							
							Highcharts.chart( '1' , {
								
								  data: {
								    table: 't1'
								  },
								  chart: {
								    type: 'bar'
								  },
								  title: {
								    text: '111'
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
								    }*/
								  }
								});
							
							
							
							
							
							
						} else if ( i == 2 ) {
							thisHtml = '';
							for ( var j = 0; j < res.query2.length; j++ ) {
								
								thisHtml +=	'<tr>'
									    + '    <td>' + res.query2[j].X + '</td>'
									    + '    <td>' + res.query2[j].Y + '</td>'
									    + '  </tr>';
								
							}
							
							$("#t2 tbody").html(thisHtml);
							
							
							Highcharts.chart( '2' , {
								
								  data: {
								    table: 't2'
								  },
								  chart: {
								    type: 'pie'	
								  },
								  title: {
								    text: '222'
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
								    }*/
								  }
								});
							
						} else if ( i == 3 ) {
							thisHtml = '';
							for ( var j = 0; j < res.query3.length; j++ ) {
								
								thisHtml +=	'<tr>'
									    + '    <td>' + res.query3[j].X + '</td>'
									    + '    <td>' + res.query3[j].Y + '</td>'
									    + '  </tr>';
								
							}
							
							$("#t3 tbody").html(thisHtml);
							
							Highcharts.chart( '3' , {
								
								  data: {
								    table: 't3'
								  },
								  chart: {
								    type: 'column'	
								  },
								  title: {
								    text: '222'
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
								    }*/
								  }
								});
							
							
						} else if ( i == 4 ) {
							thisHtml = '';
							for ( var j = 0; j < res.query4.length; j++ ) {
								
								thisHtml +=	'<tr>'
									    + '    <td>' + res.query4[j].X + '</td>'
									    + '    <td>' + res.query4[j].Y + '</td>'
									    + '  </tr>';
								
							}
							
							$("#t4 tbody").html(thisHtml);
							
							Highcharts.chart( '4' , {
								
								  data: {
								    table: 't4'
								  },
								  chart: {
								    type: 'line'	
								  },
								  title: {
								    text: '222'
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
								    }*/
								  }
								});
							
							
						} else if ( i == 5 ) {
							thisHtml = '';
							for ( var j = 0; j < res.query5.length; j++ ) {
								
								thisHtml +=	'<tr>'
									    + '    <td>' + res.query5[j].X + '</td>'
									    + '    <td>' + res.query5[j].Y + '</td>'
									    + '  </tr>';
								
							}
							
							$("#t5 tbody").html(thisHtml);
							
							
							
							
							
							Highcharts.chart( '5' , {
								
								  data: {
								    table: 't5'
								  },
								  chart: {
								    type: 'bar'	
								  },
								  title: {
								    text: '222'
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
								    }*/
								  }
								});
							
							
						} else if ( i == 6 ) {
							thisHtml = '';
							for ( var j = 0; j < res.query6.length; j++ ) {
								
								thisHtml +=	'<tr>'
									    + '    <td>' + res.query6[j].X + '</td>'
									    + '    <td>' + res.query6[j].Y + '</td>'
									    + '  </tr>';
								
							}
							
							$("#t6 tbody").html(thisHtml);
							
							Highcharts.chart( '6' , {
								
								  data: {
								    table: 't6'
								  },
								  chart: {
								    type: 'pie'	
								  },
								  title: {
								    text: '222'
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
								    }*/
								  }
								});
							
						} else if ( i == 7 ) {
							thisHtml = '';
							for ( var j = 0; j < res.query7.length; j++ ) {
								
								thisHtml +=	'<tr>'
									    + '    <td>' + res.query7[j].X + '</td>'
									    + '    <td>' + res.query7[j].Y + '</td>'
									    + '  </tr>';
								
							}
							
							$("#t7 tbody").html(thisHtml);
							
							Highcharts.chart( '7' , {
								
								  data: {
								    table: 't7'
								  },
								  chart: {
								    type: 'column'	
								  },
								  title: {
								    text: '222'
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
								    }*/
								  }
								});
							
						} else if ( i == 8 ) {
							thisHtml = '';
							for ( var j = 0; j < res.query8.length; j++ ) {
								
								thisHtml +=	'<tr>'
									    + '    <td>' + res.query8[j].X + '</td>'
									    + '    <td>' + res.query8[j].Y + '</td>'
									    + '  </tr>';
								
							}
							
							$("#t8 tbody").html(thisHtml);
							
							Highcharts.chart( '8' , {
								
								  data: {
								    table: 't8' 
								  },
								  chart: {
								    type: 'line'	
								  },
								  title: {
								    text: '222'
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
								    }*/
								  }
								});//차트
							}//이프문
						
						
						
					}//포문
					
				
					
	
					
					
					
					
				}, //석세스
				error : function(req, status, error) {
					console.log("code : " + req.status);
					console.log("message : " + req.responseText);
				} //ㅇㅋ
				
				
			}); // 안에 아작스끝
				
		}, 
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		} 
	});
}
				
			





function reloadList() { // 대시보드 셀렉트박스 리스트
	var params = $("#actionForm").serialize();

	$.ajax({
		type : "post", //데이터를 주고받는 방식
		url : "dasbListAjax", // {키:값, 키:값}// ""데이터가 넘어갈 주소 (결과를 받을 주소)
		dataType : "json",
		data : params, // 보내는 데이터
		success : function(res) { // 성공 시 해당 함수 실행, 결과는 result로 받겠다.
			drawList(res.list);
			
			
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}

function drawList(list) { // 대시보드를 선택하는 셀렉트박스에 리스트 불러옴
	
		$("#seltest").empty();
		for(var i = 0; i< list.length ; i++){
			$("#seltest").append('<option value="' + list[i].DASB_NO + '">' + list[i].DASB_NM + '</option>');

		}
		
		if($("#seltest option").val() == '1'){
			$("#seltest option:eq(0)").attr("selected", "selected");
			
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
		<div class="contents_header_txt">대시보드</div>
	</div>

	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->


		<form action="#" id="actionForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" /> 
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type ="hidden" name ="DASB_NO" id="DASB_NO" value="1"/>
			<input type ="hidden" name ="mainBoard" id="mainBoard" value="1"/>
			
			<input type ="hidden" name ="seldasb" id="seldasb" value="${seldasb}"/>
			<input type="hidden" name="EMP_NO" id="EMP_NO" value="${sEMP_NO}"/><br/>
			
			
			
			<!-- 값 불러오기 -->
			<input type="hidden" id="CTYPE_VAL" name="CTYPE_VAL" value="'bar'"  />
			<input type="hidden" id="TITLE" name="TITLE" "value="TITLE"  />
			<input type="hidden" name="chartCon" id="chartCon" value=""/><br/>
			<input type="hidden" name="dtable" id="dtable" value=""/><br/>
			
			<textarea class="attch_query" rows="10" cols="20" name="ATTCH_QUERY" id="ATTCH_QUERY"></textarea>
			
			
			
		
		
		<div class="dasb_area">
			<div class="dasb_top">
				<select class="dasb_selc" id="seltest" name="dasb_selc">
					<option></option>
				</select>
				<input type="button" class="dasb_close" value="닫기" style="display:none;" />
				
			</div>
			<div class="dasb_content">
			<div class="dataArea" id="dataArea" name="dataArea">
				<figure class="highcharts-figure">
				
				
				  <table id="t1" class="datatable">
					 <thead>
				      <tr>
				        <th>X</th>
				        <th>Y</th>
				      </tr>
				    </thead>
				    <tbody>
				     
				    </tbody>
				  </table>
				</figure>
				
				<figure class="highcharts-figure">
				<table id="t2" class="datatable">
					 <thead>
				      <tr>
				        <th>X</th>
				        <th>Y</th>
				      </tr>
				    </thead>
				    <tbody>
				     
				    </tbody>
				  </table>
				</figure>
				
				<figure class="highcharts-figure">
				<table id="t3" class="datatable">
					 <thead>
				      <tr>
				        <th>X</th>
				        <th>Y</th>
				      </tr>
				    </thead>
				    <tbody>
				     
				    </tbody>
				  </table>
				</figure>
				
				<figure class="highcharts-figure">
				<table id="t4" class="datatable">
					 <thead>
				      <tr>
				        <th>X</th>
				        <th>Y</th>
				      </tr>
				    </thead>
				    <tbody>
				     
				    </tbody>
				  </table>
				</figure>
				
				<figure class="highcharts-figure">
				<table id="t5" class="datatable">
					 <thead>
					 	<tr>
					     	<th>x</th>
					     	<th>y</th>
					     	
				     	</tr>
				     </thead>
				     <tbody>
			
				     </tbody>
				  </table>
				</figure>
				
				<figure class="highcharts-figure">
				<table id="t6" class="datatable">
					 <thead>
				      <tr>
				        <th>X</th>
				        <th>Y</th>
				      </tr>
				    </thead>
				    <tbody>
				     
				    </tbody>
				  </table>
				</figure>
				
				<figure class="highcharts-figure">
				<table id="t7" class="datatable">
					 <thead>
				      <tr>
				        <th>X</th>
				        <th>Y</th>
				      </tr>
				    </thead>
				    <tbody>
				     
				    </tbody>
				  </table>
				</figure>
				
				<figure class="highcharts-figure">
				<table id="t8" class="datatable">
					 <thead>
				      <tr>
				        <th>X</th>
				        <th>Y</th>
				      </tr>
				    </thead>
				    <tbody>
				     
				    </tbody>
				  </table>
				</figure>
				
				
				
				
				
			</div>
			
			
			
				<div class="chart_box">
					
					<input type="hidden" id="WIDG_NO1" name="WIDG_NO1" value="1" />
					<div class="chart" id="1" >
					</div>
				</div>
				
				<div class="chart_box">
					
					<input type="hidden" id="WIDG_NO2" name="WIDG_NO2" value="2" />
					<div class="chart" id="2">
					</div>
				</div>
				
				<div class="chart_box">
					
					<input type="hidden" id="WIDG_NO3" name="WIDG_NO3" value="3" />
					<div class="chart" id="3">
					</div>
				</div>
				
				<div class="chart_box">
					
					<input type="hidden" id="WIDG_NO4" name="WIDG_NO4" value="4" />
					<div class="chart" id="4">
					
					</div>
				</div>
				
				<div class="chart_box">
					
					<input type="hidden" id="WIDG_NO5" name="WIDG_NO5" value="5" />
					<div class="chart" id="5">
					</div>
				</div>
				
				<div class="chart_box">
					
					<input type="hidden" id="WIDG_NO6" name="WIDG_NO6" value="6" />
					<div class="chart" id="6">
					</div>
				</div>
				
				<div class="chart_box">
					
					<input type="hidden" id="WIDG_NO7" name="WIDG_NO7" value="7" />
					<div class="chart" id="7">
					</div>
				</div>
				
				<div class="chart_box">

					<input type="hidden" id="WIDG_NO8" name="WIDG_NO8" value="8" />
					<div class="chart" id="8">
					</div>
				</div>
				
				
				
				
			</div>
		</div>
		
		</form>
		
		
		<input type="button" class="dasb_full" value="전체화면" />

	</div>
	
	


	<!-- bottom -->
	<c:import url="/bottom"></c:import>
	<div id="poppop" class="poppop">
		<div class="popup_bg"></div>
		<div class="popupp">
			<div class="popup_title">
				<div class="popup_title_txt">버튼하나팝업</div>
			</div>
			
			<div class="popup_contents">
				
					<figure class="highcharts-figure">
						<table id="poptale" class="datatable">
							<thead>
						      <tr>
						        <th>X</th>
						        <th>Y</th>
						      </tr>
							</thead>
					   	 	<tbody>
					     
							</tbody>
						</table>
					</figure>
				
				

					<div class="popchart" id="popchart">
						
					</div>
				
			
			</div>
			
			<div class="popup_btn">
				<input type="button" value="닫기" id="closeBtn">
			</div>
			
		</div>
	</div>
</body>
</html>