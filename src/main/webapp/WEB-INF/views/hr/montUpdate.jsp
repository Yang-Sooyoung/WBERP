<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>월간급여대장상세보기수정</title>
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
#updateBtn {
	display: inline-block;
	min-width: 80px;
	height: 32px;
	color: #000;
	background-color: #f7f7f7;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	cursor: pointer;
	margin-right: 5px;
	margin-left: 630px;
	padding: 1px 2px;
}

#cancelBtn {
	display: inline-block;
	min-width: 80px;
	height: 32px;
	color: #000;
	background-color: #f7f7f7;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	cursor: pointer;
	padding: 1px 2px;
}

#updateBtn:hover, #cancelBtn:hover {
	color: #fff;
	background-color: #022859;
	border: 1px solid #022859;
}

.selB {
	width: 106px;
	height: 32px;
	font-size: 10pt;
	border-radius: 3px;
	margin: 0 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
}

table {
	border-collapse: collapse;
	margin-top: 20px;
	font-size: 14px;
	text-align: center;
	border-top: 2px solid #9aa9bd;
	border-bottom: 2px solid #9aa9bd;
}

table tr {
	height: 43px;
	font-size: 10pt;
	font-weight: bold;
	border-top: 1px solid #9aa9bd;
}

.table_name {
	font-size: 16px;
	font-weight: bold;
	border-top: 1px solid #9aa9bd;
	background-color: #e4eaf2;
}

.txt {
	width: 100px;
	height: 28px;
	font-size: 10pt;
	border-radius: 3px;
	margin: 0 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
}

.txt1 {
	width: 190px;
	height: 28px;
	font-size: 10pt;
	border-radius: 3px;
	margin: 0 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
	$(document).ready(function() {
		if ('${param.searchGbn}' != '') {
			$("#searchGbn").val('${param.searchGbn}');
		}

		reloadList();

		// 페이징
		$(".page_nation").on("click", "div", function() {
			$("#page").val($(this).attr("name"));
			reloadList();
		});

		// 취소
		$("#cancelBtn").on("click", function() {
			history.back();
		});

		// 저장
		$("#updateBtn").on("click", function() {
			var params = $("#actionForm").serialize();
			console.log(params);
			$.ajax({
				type : "post",
				url : "montUpdateAjax",
				dataType : "json",
				data : params,
				success : function(res) {
					if (res.res == "SUCCESS") {
						$("#actionForm").attr("action", "montDetail");
						$("#actionForm").submit();
					}
				},
				error : function(req, status, error) {
					console.log("code : " + req.status);
					console.log("message : " + req.responseText);
				}
			});
		});

	});

	function reloadList() {
		var params = $("#actionForm").serialize();
		console.log(params);
		$.ajax({
			type : "post",
			url : "montDetailAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				console.log(res.list);
				drawList(res.list, res.cnt);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	function drawList(list, cnt) {
		var html = "";
		var n = list.length/2+1;
		html += "<tr>";
		html += "<td rowspan="+n+" style=\"background-color: #e4eaf2;\">"
				+ "지급내역" + "</td>";

		for (var i = 0; i < list.length; i++) {
			if (i > 0 && i % 2 == 0) {
				html += "</tr>"
				html += "<tr>"
			}
			html += "<td>" + list[i].SAL_CODE + "</td>";
			html += "<td>" + list[i].PRICE + "</td>";
		}
		if (list.length % 2 == 0) {
			html += "</tr>"
			html += "<tr>"
			html += "<td>" + " " + "</td>";
			html += "<td>" + " " + "</td>";
		}
		html += "<td style=\"background-color: #e4eaf2;\">" + "지급합계" + "</td>";
		html += "<td>" + ${mont.SUM} +"</td>";
		html += "</tr>";
		
		$(".mont tbody").html(html);
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
		<div class="contents_header_txt">월간급여대장 상세보기 수정</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 메뉴시작 -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="mont_sort_sal_list_no" id="mont_sort_sal_list_no" value="${param.mont_sort_sal_list_no}" />
			<input type="hidden" name="page" id="page" value="${param.page}" />
			<input type="button" value="저장" id="updateBtn" /> 
			<input type="button" value="취소" id="cancelBtn" />
			<!-- 메뉴 끝 -->
			<!-- 목록 시작 -->
			<div>
				<table>
					<colgroup>
						<col width="150px" />
						<col width="250px" />
						<col width="150px" />
						<col width="250px" />
					</colgroup>
					<tbody>
						<tr>
							<td class="table_name">성명</td>
							<td>${mont.EMP_NM}</td>
							<td class="table_name">부서명</td>
							<td>${mont.DEPT_NM}</td>
						</tr>
						<tr>
							<td class="table_name">귀속연월</td>
							<td>${mont.STAD_YEAR}</td>
							<td class="table_name">직급명</td>
							<td>${mont.POSN_NM}</td>
						</tr>
					</tbody>
				</table>
				<table class="mont">
					<colgroup>
						<col width="160px">
						<col width="160px">
						<col width="160px">
						<col width="160px">
						<col width="160px">
					</colgroup>
					<tbody>
						
					</tbody>
				</table>
				<table>
					<colgroup>
						<col width="160px">
						<col width="160px">
						<col width="160px">
						<col width="160px">
						<col width="160px">
					</colgroup>
					<tbody>
						<tr>
							<td rowspan="5" class="table_name">추가지급</td>
							<td><select class="selB" name="sal_code" id="sal_code">
									<option value="" hidden>지급명</option>
									<option value="1">시간외근로수당</option>
									<option value="2">상여금</option>
									<option value="3">연차수당</option>
									<option value="4">직책수당</option>
									<option value="5">포상</option>
							</select></td>
							<td><input type="text" class="txt" name="price" id="price" placeholder="금액" /></td>
							<td><select class="selB" name="sal_code" id="sal_code">
									<option value="" hidden>지급명</option>
									<option value="1">시간외근로수당</option>
									<option value="2">상여금</option>
									<option value="3">연차수당</option>
									<option value="4">직책수당</option>
									<option value="5">포상</option>
							</select></td>
							<td><input type="text" class="txt" name="price" id="price" placeholder="금액" /></td>
						</tr>
						<tr>
							<td><select class="selB" name="sal_code">
									<option value="" hidden>지급명</option>
									<option value="1">시간외근로수당</option>
									<option value="2">상여금</option>
									<option value="3">연차수당</option>
									<option value="4">직책수당</option>
									<option value="5">포상</option>
							</select></td>
							<td><input type="text" class="txt" name="price" placeholder="금액" /></td>
							<td><select class="selB" name="sal_code">
									<option value="" hidden>지급명</option>
									<option value="1">시간외근로수당</option>
									<option value="2">상여금</option>
									<option value="3">연차수당</option>
									<option value="4">직책수당</option>
									<option value="5">포상</option>
							</select></td>
							<td><input type="text" class="txt" name="price" placeholder="금액" /></td>
						</tr>
						<tr>
							<td><select class="selB" name="sal_code">
									<option value="" hidden>지급명</option>
									<option value="1">시간외근로수당</option>
									<option value="2">상여금</option>
									<option value="3">연차수당</option>
									<option value="4">직책수당</option>
									<option value="5">포상</option>
							</select></td>
							<td><input type="text" class="txt" name="price" placeholder="금액" /></td>
							<td><select class="selB" name="sal_code">
									<option value="" hidden>지급명</option>
									<option value="1">시간외근로수당</option>
									<option value="2">상여금</option>
									<option value="3">연차수당</option>
									<option value="4">직책수당</option>
									<option value="5">포상</option>
							</select></td>
							<td><input type="text" class="txt" name="price" placeholder="금액" /></td>
						</tr>
						<tr>
							<td><select class="selB" name="sal_code">
									<option value="" hidden>지급명</option>
									<option value="1">시간외근로수당</option>
									<option value="2">상여금</option>
									<option value="3">연차수당</option>
									<option value="4">직책수당</option>
									<option value="5">포상</option>
							</select></td>
							<td><input type="text" class="txt" name="price" placeholder="금액" /></td>
							<td><select class="selB" name="sal_code">
									<option value="" hidden>지급명</option>
									<option value="1">시간외근로수당</option>
									<option value="2">상여금</option>
									<option value="3">연차수당</option>
									<option value="4">직책수당</option>
									<option value="5">포상</option>
							</select></td>
							<td><input type="text" class="txt" name="price" placeholder="금액" /></td>
						</tr>
						<tr>
							<td><select class="selB" name="sal_code">
									<option value="" hidden>지급명</option>
									<option value="1">시간외근로수당</option>
									<option value="2">상여금</option>
									<option value="3">연차수당</option>
									<option value="4">직책수당</option>
									<option value="5">포상</option>
							</select></td>
							<td><input type="text" class="txt" name="price" placeholder="금액" /></td>
							<td><select class="selB" name="sal_code">
									<option value="" hidden>지급명</option>
									<option value="1">시간외근로수당</option>
									<option value="2">상여금</option>
									<option value="3">연차수당</option>
									<option value="4">직책수당</option>
									<option value="5">포상</option>
							</select></td>
							<td><input type="text" class="txt" name="price" placeholder="금액" /></td>
						</tr>
					</tbody>
				</table>
				<table>
					<colgroup>
						<col width="160px">
						<col width="160px">
						<col width="160px">
						<col width="160px">
						<col width="160px">
					</colgroup>
					<tbody>
						<tr>
							<td rowspan="3" class="table_name">공제내역</td>
							<td>국민연금</td>
							<td>${mont.PRICE1}</td>
							<td>산재보험</td>
							<td>${mont.PRICE4}</td>
						</tr>
						<tr>
							<td>건강보험</td>
							<td>${mont.PRICE3}</td>
							<td>고용보험</td>
							<td>${mont.PRICE2}</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td class="table_name">공제합계</td>
							<td class="table_name">${mont.GONG}</td>
						</tr>
					</tbody>
				</table>
				<table>
					<colgroup>
						<col width="400px" />
						<col width="400px" />
					</colgroup>
					<tr>
						<td>실지급액</td>
						<td class="table_name">${mont.REALSAL}</td>
					</tr>
				</table>
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