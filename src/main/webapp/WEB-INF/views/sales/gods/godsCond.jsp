<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 상품조회</title>
<style type="text/css">
/* 검색영역 가로변경 시 */
.default_search_area {
	width: 800px;
	min-height: 40px;
}

/* 목록영역 가로변경 시 */
.default_board {
	width: 800px;
	
}

/* 개별 css는 여기에 */
.contents{
	font-size: 10pt;
}
.btn_area{
	float: right;
}
.gods_searchBox{
	height: 60px;
	background-color: #E4EAF2;
	font-size: 10pt;
	border-radius: 5px;
	padding: 20px;
	box-shadow: 1px 1px 4px #c2c2c2;
}
.gods_searchBox1{
	padding-bottom: 15px;
}
.gods_searchBox_godsName{
	display: inline-block;
	width: 60px;
	font-weight: bold;
	color: #022859;
}
.gods_searchBox_godsName_box{
	display: inline-block;
	width: 300px;
}

.gods_searchBox2{
	padding-top: 15px;
}
.gods_searchBox_projectName{
	display: inline-block;
	margin-left: 15px;
	width: 70px;
	font-weight: bold;
	color: #022859;
}
.gods_searchBox_projectName_box{
	display: inline-block;
	width: 425px;
}
.gods_searchBox_period{
	display: inline-block;
	margin-left: 15px;
	width: 60px;
	font-weight: bold;
	color: #022859;
}
.gods_searchBox_periodBox{
	display: inline-block;
	width: 160px;
}
.gods_searchBox_condition{
	display: inline-block;
	width: 30px;
	margin: 0 40px;
	font-weight: bold;
	color: #022859;
}
.gods_searchBox_condition_o{
	display: inline-block;
	width: 30px;
	margin: 0 20px;
	font-weight: bold;
	color: #022859;
}

.gods_searchBox_condition_box{
	display: inline-block;
	width: 150px;
}
#cotr_day_q_searchGbn{
	margin-right: 10px;
	width: 20px;
}
#searchBtn{
	margin-left : 180px;
}
.gods_searchResult{
	margin-top: 20px;
	margin-bottom: 20px;
}
.gods_searchResult_number{
	display: inline-block;
}
.gods_searchResult_sort{
	display: inline-block;
	float: right;
}

/* tooltip */
.tooltip {
	position: relative;
	display: inline-block;
	margin: auto;
}
.tooltip .tooltip-content {
	visibility: hidden;
	width: 250px;
	background-color: rgb(2, 40, 89);
	padding: 0;
	color: white;
	text-align: center;
	position: absolute;
	z-index: 1;
	bottom: 180%;
	left: 50%;
	margin-left: -110px;
	padding: 10px;
}
.tooltip .tooltip-content .c {
	margin-left: 180px;
	margin-bottom: -10px;
}
.tooltip .tooltip-content::after {
	content: " ";
	position: absolute;
	top: 100%;
	left: 50%;
	margin-left: -10px;
	border-width: 10px;
	border-style: solid;
	border-color: rgb(2, 40, 89) transparent transparent transparent;
}
.tooltip:hover .tooltip-content {
	visibility: visible;
}
#tool {
	width: 20px;
	height: 20px;
	background-image: url("resources/images/sales/gods/search.png");
	padding: 10px;
	background-color: #fff;
	border: 0px;
	margin-left: 10px;
}
</style>

<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
	$(document).ready(function() {
		if('${param.cotr_day_q_searchGbn}' != '') {
			$("#cotr_day_q_searchGbn").val('${param.cotr_day_q_searchGbn}');
		}
		if('${param.cotr_day_y_searchGbn}' != '') {
			$("#cotr_day_y_searchGbn").val('${param.cotr_day_y_searchGbn}');
		}
		
		reloadList();
		
		
		
		// 검색버튼
		$("#searchBtn").on("click", function() {
				console.log(1);
				$("#page").val("1");
				reloadList();
			});
		
		// 페이징 부분
		$(".page_nation").on("click", "div", function() {
			$("#page").val($(this).attr("name"));
			reloadList();
		});

		// 상품명 클릭 시 해당영업번호로 이동
		 $(".gods_table tbody").on("click", "tr", function() { // 상품 탭으로 넘어가기는 성공했는디 이제 데이터가 없네
		      $("#saleNo").val($(this).attr("name"));
		      
		      $("#detailForm").attr("action", "saleMangDetail");
				$("#detailForm").submit();
		   });
	});
	
	function reloadList(){
		
		var params = $("#actionForm").serialize(); 
		
		$.ajax({ 
			type : "post", 
			url : "godsCondAjax",
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
				html += "<tr name=\"" + list[i].SALE_NO + "\">"; //원래 list[i].GODS_NO
				html += "<td>" + list[i].GODS_NO + "</td>";
				html += "<td>" + list[i].GODS_NM ;
				html += "<div class=\"tooltip\">"; /* tooltip 구현부 */
				html += "<span><input type=\"button\" id=\"tool\"></span>";
				html += "<div class=\"tooltip-content\">";
				html += "<p>" + list[i].SUMR + "</p>";
				html += "</div>";
				html += "</div>";
				html += "</td>";                                            
				html += "<td>" + list[i].SALE_NO ;
				html += "</td>";                                            
				html += "</tr>";                                            
			} 
		}
		$(".gods_table tbody").html(html);
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
		<div class="contents_header_txt">상품현황</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<input type="hidden" id="top" name="top" value="${param.top}"/>
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}"/>
			<input type="hidden" name="page" id="page" value="${page}"/>
			<input type="hidden" name="gods_no" id="gods_no" />
			
	
<div class="default_search_area">
			
		</div>
		<div class="default_search_area">
			<div class="gods_searchBox">
				
				<div class="gods_searchBox2">
					<div class="gods_searchBox_condition_o">연도</div>
					<select class="con1_in" name="cotr_day_y_searchGbn" id="cotr_day_y_searchGbn" >
							<option value="2021">2021</option>
							<option value="2020">2020</option>
							<option value="2019">2019</option>
							<option value="2018">2018</option>
							<option value="2017">2017</option>
							<option value="2016">2016</option>
							<option value="2015">2015</option>
							<option value="2014">2014</option>
							<option value="2013">2013</option>
							<option value="2012">2012</option>
							<option value="2011">2011</option>
							<option value="2010">2010</option>
							<option value="2009">2009</option>
							<option value="2008">2008</option>
							<option value="2007">2007</option>
							<option value="2006">2006</option>
							<option value="2005">2005</option>
							<option value="2004">2004</option>
							<option value="2003">2003</option>
							<option value="2002">2002</option>
							<option value="2001">2001</option>
							<option value="2000">2000</option>
					</select>
					<div class="gods_searchBox_condition">분기</div>
					1<input type= "radio" name="cotr_day_q_searchGbn" id="cotr_day_q_searchGbn" value = "1" checked="checked">
					2<input type= "radio" name="cotr_day_q_searchGbn" id="cotr_day_q_searchGbn" value = "2">
					3<input type= "radio" name="cotr_day_q_searchGbn" id="cotr_day_q_searchGbn" value = "3">
					4<input type= "radio" name="cotr_day_q_searchGbn" id="cotr_day_q_searchGbn" value = "4">
					<input type="button" value="검 색" id="searchBtn"/>
				</div>				
			</div>
		</div>	
		
		</form>
		<form action="#" method="post" id="detailForm">
			<input type="hidden" id="top" name="top" value="${param.top}"/>
			<input type="hidden" id="menuNo" name="menuNo" value="37"/>
			<input type="hidden" name="page" id="page" value="${page}"/>
			<input type="hidden" name="saleNo" id="saleNo" value="${saleNo}"/>
			
	</form>
		
		<!-- 여기에 내용을 작성하시오. -->
			<!-- 상품명 조회 -->		
			<div class="default_board">
				<table class="gods_table">
					<colgroup>
						<col width="50px"/>
						<col width="700px"/>
						<col width="80px"/>
					</colgroup>
					<thead>
						<tr class="top">
							<th>No.</th>
							<th>상품명</th>
							<th>영업번호</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			
		<div class="page_wrap">
			<div class="page_nation"></div></div></div></div>
	<c:import url="/bottom"></c:import>
</body>
</html>
