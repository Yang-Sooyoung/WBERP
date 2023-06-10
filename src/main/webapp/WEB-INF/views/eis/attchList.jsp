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
.attchAdd {
	position: left;
}

.search_filter1 {
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

.searchTxt {
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

.button01 {
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
}

.default_board {
	display: inline-block;
    width: 1100px;
    margin-top: 0px;
}
.top1 {
	display: inline-block;
    width: 1100px;
    height: 32px;
}

.request {
	width: 1100px;
    border-top: 2px solid #7f7f7f;
    border-bottom: 2px solid #7f7f7f;
    border-spacing: 0px;
}

.tbody {
	height: 45px;
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

</style>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#testList").on("click", function() {
					$("#testForm").attr("action", "testList");
					$("#testForm").submit();
				});
				
				$("#jaehun").on("click", function() {
					$("#moon").attr("action", "jaehun");
					$("#moon").submit();
				})
				
				
				
				
				if('${param.searchGbn}' != '') {
					$("#searchGbn").val('${param.searchGbn}');
				}
				
				reloadList();
				
				$("#attchAdd").on("click", function() {
					$("#actionForm").attr("action", "attchAdd");
					$("#actionForm").submit();
				});
				
				$("#alertBtn").on("click", function() {
					makeAlert(1, "하이", "내용임", null);
				});
				
				$("#reList").on("click", function(){
					$("#searchTxt").val("");
					reloadList();
				});
				
				$("#searchBtn").on("click", function() {
					$("#page").val("1");
					reloadList();
				});
				

				$("#oneBtn").on(
						"click",
						function() {
							makeBtn1Popup(1, "버튼하나팝업", "내용들감", true, 400, 200,
									null, "하이", function() {
										closePopup(1);
									});
						}); 

				$("#twoBtn").on(
						"click",
						function() {
							makeBtn2Popup(2, "버튼둘팝업", "내용들감", true, 600, 400,
									null, "어라라", function() {
										makeAlert(3, "하이", "내용임", null);
									}, "하이", function() {
										closePopup(2);
									});
						});

				$("#threeBtn").on(
						"click",
						function() {
							makeBtn3Popup(3, "버튼셋팝업", "내용들감", false, 400, 600,
									null, "어라라", function() {
										closePopup(3);
									}, "하이", function() {
										closePopup(3);
									}, "마지막", function() {
										closePopup(3);
									});
						});

				$("#fourBtn").on(
						"click",
						function() {
							makeBtn4Popup(4, "버튼넷팝업", "내용들감", false, 400, 600,
									null, "엣헴", function() {
										popupBtnChange(4, 1, "버튼변경",
												function() {
													closePopup(4);
												});
									}, "하이", function() {
										closePopup(4);
									}, "하이", function() {
										closePopup(4);
									}, "마지막", function() {
										closePopup(4);
									});
						});
			});
	
	$(document).on("click", ".default_board tbody tr", function() {
		$("#attch_NO").val($(this).attr("name"));
		
		$("#actionForm").attr("action", "attchDetail");
		$("#actionForm").submit();
		console.log("문")
	});
	
	//$(".page_nation").on("click", "div", function() {
	$(document).on('click', '.page_nation div', function() {
		$("#page").val($(this).attr("name"));
		console.log("문")
		reloadList();
	});

function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "attchListAjax",
		dataType : "json", // {키:값, 키:값}
		data : params, // 보낼데이터
		success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로 받겠다.
			drawList(res.list, res.cnt);
			drawPaging(res.pb);
			console.log(res.pb);
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
			
		}
	});
}
function drawList(list, cnt) {
	var html = "";
	
	if(cnt == 0) {
		html += "<tr>" ;
		html += "<td colspan=\"5\">데이터가 없습니다.</td>";
		html += "</tr>" ;
	} else {
		for(var i = 0; i < list.length; i++){
			/* 
			html += "<tr name=\"" + list[i].ATTCH_NO + "\">";			
			html += "<td>" + list[i].ATTCH_NO + "</td>";			
			html += "</tr>";
			 */
			html += '<tr name="' + list[i].ATTCH_NO + '">'
				+ '		<td>' + list[i].ATTCH_NO + '</td>'	
				+ '		<td>' + list[i].TITLE + '</td>'	
				+ '		<td>' + list[i].EIS_CATG_NM + '</td>'	
				+ '		<td>' + list[i].EMP_NM + '</td>'	
				+ '		<td>' + list[i].REG_DATE + '</td>'	
				+ '</tr>';
			 
		}
	}
	$(".default_board tbody").html(html);
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
		<div class="contents_header_txt">장표관리</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="testForm" method="post">
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
		</form>
		
		<form action="#" id="moon" method="post">
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
		</form>
		
		
		
		
		
		
		
		
		
		<form action="#" id="actionForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" id="page" name="page" value="${page}" />
			<input type="hidden" id="attch_NO" name="attch_NO" value="${detail.attch_NO}" />
		
		<div class="top1">
			<select class="search_filter1" id = "searchGbn" name = "searchGbn">
				<option value="0">제목</option>
				<option value="1">작성자</option>
				<option value="2">카테고리</option>
			</select>
			<input type="text" placeholder="검색어" class="searchTxt" id = "searchTxt" name = "searchTxt" value = "${param.searchTxt}"/>
			<input type="button" value="목록" class="button01" id = "reList" name = ""/>
			<input type="button" value="등록" class="button01" id="attchAdd" />
			<!-- <input type="button" value="go" id="testList" />
			<input type="button" value="jaehun" id="jaehun" name="jaehun"/> -->
			<button type="button" class="search_button" id = "searchBtn" name = "searchBtn"><img src="resources/images/eis/search.png" width="20" height="20"></button>
			
		
		<div class="default_board">
			<table class="request">
				<colgroup>
					<col width="90px">
					<col width="426px">
					<col width="194px">
					<col width="194px">
					<col width="194px">
				</colgroup>
				<thead>
					<tr class="top">
						<th>번호</th>
						<th>제목</th>
						<th>카테고리</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			</div>
			<div class="page_wrap">
				<div class="page_nation">
				</div>
			</div>
		</div>
		</form>
		<!-- 버튼샘플 -->
		<!-- <input type="button" value="알림창" id="alertBtn" />
		<input type="button" value="1버튼" id="oneBtn" />
		<input type="button" value="2버튼" id="twoBtn" />
		<input type="button" value="3버튼" id="threeBtn" />
		<input type="button" value="4버튼" id="fourBtn" /> -->
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>