<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>연봉관리대장</title>
<style type="text/css">
/* 검색영역 가로변경 시 */
.default_search_area {
	width: 800px;
}

/* 목록영역 가로변경 시 */
.default_board {
	width: 800px;
}

/* 개별 css는 여기에 */
#tblExport {
	display : none;
}
table {
	pointer-events: none;
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript" src="resources/script/jquery/jquery.battatech.excelexport.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		if('${param.searchGbn}' != '') {
			$("#searchGbn").val('${param.searchGbn}');
		}
		
		reloadList();
		
		// 검색버튼
		$("#searchBtn").on("click", function() {
			$("#page").val("1");
			reloadList();
		}) ;
		
		// 페이징
		$(".page_nation").on("click", "div", function() {
			$("#page").val($(this).attr("name"));
			reloadList();
		});
		
		// 내보내기
		function itoStr($num) { 
			$num < 10 ? $num = '0'+$num : $num; 
			return $num.toString(); 
		} 
		var btn = $('#btnExport'); 
		var tbl = 'tblExport'; 
		
		$("#exportBtn").on('click', function () { 
			var dt = new Date(); 
			var year = itoStr( dt.getFullYear() ); 
			var month = itoStr( dt.getMonth() + 1 ); 
			var day = itoStr( dt.getDate() ); 
			var hour = itoStr( dt.getHours() ); 
			var mins = itoStr( dt.getMinutes() ); 
			var postfix = year + month + day + "_" + hour + mins; 
			var fileName = "MyTable_"+ postfix + ".xls"; 
			var uri = $("#"+tbl).excelexportjs({ 
				containerid: tbl , 
				datatype: 'table' , 
				returnUri: true 
			}); 
			$(this).attr('download', fileName).attr('href', uri).attr('target', '_blank'); 
		});

		
	});
	
	// 첫화면
	function reloadList() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "anulSalMangListAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				drawList(res.list, res.cnt);
				drawPaging(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	// 목록
	function drawList(list, cnt) {
		var html = "";
		if(cnt == 0) {
			html += "<tr>";
			html += "<td colspan=\"5\">데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
			for(var i = 0; i < list.length; i++) {
				html += "<tr name=\"" + list[i].SAL_NO + "\">";
				html += "<td>" + list[i].SAL_NO + "</td>";
				html += "<td>" + list[i].EMP_NM + "</td>";
				html += "<td>" + list[i].DEPT_NM + "</td>";
				html += "<td>" + list[i].POSN_NM + "</td>";
				html += "<td>" + list[i].ANUL_SAL + "</td>";
				html += "<td>" + list[i].STAD_YEAR + "</td>";
				html += "</tr>";
			}
		}
		$(".anulsal tbody").html(html);
	}
	
	// 페이징
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
	
	// 엑셀 업로드 파일 체크
	function checkFileType(filePath) {
		var fileFormat = filePath.split(".");
		
		if(fileFormat.indexOf("xls") > -1 || fileFormat.indexOf("xlsx") > -1) {
			return true;
		} else {
			return false;
		}
	}
	
	
	function check() {

		var file = $("#excelFile").val();

		if (file == "" || file == null) {
			alert("파일을 선택해주세요.");

			return false;
		} else if (!checkFileType(file)) {
			alert("엑셀 파일만 업로드 가능합니다.");

			return false;
		}

		if (confirm("업로드 하시겠습니까?")) {

			var options = {

				success : function(data) {
					console.log(data);
					alert("모든 데이터가 업로드 되었습니다.");
				},
				type : "POST"
			};

			$("#actionForm").ajaxSubmit(options);

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
		<div class="contents_header_txt">연봉관리대장</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 메뉴시작 -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="excelUploadAjax" method="post" id="actionForm">
		<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="sal_no" id="sal_no" value="${sal_no}" />
			<input type="hidden" name="page" id="page" value="${page}" />
			<div class="default_search_area">
				<select name="searchGbn" id="searchGbn">
					<option value="0">부서명</option>
					<option value="1">직급명</option>
					<option value="2">사원이름</option>
					<option value="3">기준연도</option>
				</select>
				<input type="text" placeholder="예)2020" name="searchTxt" value="${param.searchTxt}" />
				<div class="search_btn_area">
					<input type="button" name="searchBtn" id="searchBtn" value="검색" />
					<a id="exportBtn" href="#" download="">
						<input type="button" value="내보내기" />
					</a>
					<input type="button" id="addExcelImportBtn" onclick="check()" value="추가" />
					<input type="file" name="excelFile" id="excelFile" />
				</div>
			</div>
	
			<!-- 메뉴 끝 -->
			<!-- 목록 시작 -->
			<div class="default_board">
				<table class="anulsal">
					<colgroup>
						<col width="130px">
						<col width="134px">
						<col width="134px">
						<col width="134px">
						<col width="134px">
						<col width="134px">
					</colgroup>
					<thead>
						<tr class="top">
							<th>연봉번호</th>
							<th>사원이름</th>
							<th>부서명</th>
							<th>직급명</th>
							<th>연봉</th>
							<th>기준연도</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
				<!-- 목록 끝 -->
				<div class="page_wrap">
					<div class="page_nation"></div>
				</div>
			</div>
		</form>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
	
	<!-- 내보내기 -->
	<table id="tblExport">
		<thead>
			<tr class="top">
				<th>연봉번호</th>
				<th>사원이름</th>
				<th>부서명</th>
				<th>직급명</th>
				<th>연봉</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>경부장</td>
				<td>경영관리</td>
				<td>부장</td>
				<td>50,000,000</td>
			</tr>
			<tr>
				<td>2</td>
				<td>경사원</td>
				<td>경영관리</td>
				<td>대리</td>
				<td>40,000,000</td>
			</tr>
		</tbody>
	</table>
</body>
</html>