<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
$(document).ready(function() {
	$(".top_chat_btn").on("click", function() {
		console.log("a");
		$.ajax({
			type : "post",
			url : "ChattingAjax",
			dataType : "json",// {키:값, 키:값}
			success : function(res) {//성공 시 해당 함수 실행. 결과는 result로 받겠다.
				drawList(res.list, res.cnt);
				drawPaging(res.pd);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	});
});
	
function drawList(list, cnt) {
	var html = "";
	var html2 = "";
		
	if(cnt == 0) {
		html +="<tr>";
		html +="<td colspan=\"5\">데이터가 없습니다.</td>";
		html +="</tr>";
	} else {
		for(var i = 0 ; i < list.length ; i++) {
			html += "<tr name=" + list[i].CHAT_NO + ">";
			html +=	"<td>" + list[i] + "</td>";
			html +=	"</tr>";
		}
	}
	$("table tbody").html(html);
}

function drawPaging(pd) {
	var html = "";
	
	if($("#page").val() == 1) {
		html += "<span name=\"1\">이전</span> ";
	} else {
		html += "<span name=\"" + ($("#page").val() - 1) + "\">이전</span> ";
	}
	
	for(var i = pd.startPcount ; i <= pd.endPcount ; i++) {
		if($("#page").val() == i) {
			html += "<span name=\"" + i + "\"><b>" + i + "</b></span> ";
		} else {
			html += "<span name=\"" + i + "\">" + i + "</span> ";
		}
	}
	
	if($("#page").val() == pd.maxPcount) {
		html += "<span name=\"" + pd.maxPcount + "\">다음</span> ";
	} else {
		html += "<span name=\"" + ($("#page").val() * 1 + 1) + "\">다음</span>";//문자열 더하기가 있기 때문
	}
	
	$("#paging_area").html(html);
	
}
		
</script>
<input type="hidden" id="athrType" name="athrType" value="${athrTypeNo}" />
<form action="#" id="locationForm" method="post">
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
</form>
<!-- Top Bar -->
	<div class="top_area">
		<div class="logo"></div>
		<div class="top_menu_area">
			<c:forEach var="menu" items="${topMenu}">
				<div class="top_menu" topno="${menu.MENU_NO}" menuno="${menu.MENU_APARAM}" addr="${menu.MENU_ADDR}">
					<div class="top_menu_txt">${menu.MENU_NM}</div>
				</div>
			</c:forEach>
		</div>
		<div class="info_area">
			<div class="info_wrap">
				<div class="photo">
					<c:choose>
						<c:when test="${!empty sPhotoAddr}">
							<img alt="사진" src="resources/upload/${sPhotoAddr}">
						</c:when>
						<c:otherwise>
							<img alt="사진" src="resources/images/sample/photo.jpg">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="info_txt">
					${sDeptNm}<br />${sPosnNm} ${sEmpNm}
				</div>
				<div class="top_chat_btn">
					<div class="chat_cnt_on">3</div>
				</div>
				<div class="top_noti_btn">
					<div class="noti_cnt_on">3</div>
				</div>
				<div class="logout_btn">
					<div class="logout_btn_txt">로그아웃</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Left Menu -->
	<div class="left_area">
	</div>
	<!-- Contents -->
	<div class="contents_area">
		<div class="gnb">
			<div class="gnb_txt"></div>
		</div>
		
		<div id="chatWrap">
            <div id="chatHeader">Everyone</div>
            <div id="chatLog">
                <table id="chatList">
					<colgroup>
						<col width="160px">
						<col width="160px">
						<col width="400px">
						<col width="160px">
						<col width="160px">
					</colgroup>
					<thead>
						<tr class="top">
							<th>즐겨찾기</th>
							<th>이름</th>
							<th>대화 내용</th>
							<th>날짜</th>
							<th>갯수</th>
						</tr>
					</thead>
						<tbody>
						
						</tbody>
				</table>
            </div>
            <form id="chatForm">
                <input type="text" autocomplete="off" size="30" id="message" placeholder="메시지를 입력하세요">
                <input type="submit" value="보내기">
            </form>
		</div>
		
	</div>