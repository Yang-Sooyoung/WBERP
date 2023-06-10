<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - Sample Page</title>
<style type="text/css">
/* 개별 css는 여기에 */
#sample4_roadAddress{
	width:300px;
}
.line2 {
	font-size: 8pt;
	font-weight: bold;
	width: 50px;
	min-height: 23px;
	line-height: 23px;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	color:#004c9d;
}

.con4 {
	font-size: 8pt;
	min-height: 23px;
	line-height: 23px;
	display: inline-block;
	padding: 0px 5px;
}
.underline2 {
	width: 100%;
	min-height: 23px;
	display: inline-table;
}
.underbox2 {
	width: 350px;
	margin-bottom: 10px;
}

.gods
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
	$(document).ready(function() {
		reloadList();
		$("#threeBtn").on("click",function() {
			var godspop = '';
				godspop += "<div class=\"underbox2\">"
				godspop += "</div>";
				godspop += "<div class=\"page_wrap\">";
				godspop += "<div class=\"page_nation\">";
				godspop += "</div>";
				godspop += "</div>";
			makeBtn1Popup(1, "고객사 등록된 상품 현황", godspop, true, 400, 500,
						reloadList(), "확인", function() {
							closePopup(1);
						});
			$(document).on("click", ".page_nation div", function() {
				$("#poppage").val($(this).attr("name"));
				reloadList();
			});
			
		});

		$("#listBtn").on("click", function() {
			history.back();
		});
		$("#updateBtn").on("click", function() {
			$("#actionForm").attr("action", "CustComEdit");
			$("#actionForm").submit();
		});
		$("#deleteBtn").on("click",function(){
			if(confirm("삭제하시겠습니까?")){
				var params=$("#actionForm").serialize();
				$.ajax({
					type : "post",
					url : "CustComDeleteAjax",
					dataType : "json", // {키:값, 키:값}
					data : params, //보낼데이터
					success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
						if(res.res=="SUCCESS"){
							$("#actionForm").attr("action","custCompInfoMang");
							$("#actionForm").submit();
						}else{
							$("#alert").attr("title","알림");
							$("#alert p").html("삭제에 실패하였습니다.");
							$("#alert").dialog({
								buttons: {
									Ok: function(){
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
	function reloadList(){
		var params=$("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "CustGodsListAjax",
			dataType : "json", // {키:값, 키:값}
			data : params, //보낼데이터
			success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
				drawList(res.poplist, res.popcnt);
				drawPaging(res.pb2);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
				console.log("error : " + error);
			}
		});
	}

	function drawList(poplist,popcnt){
		var html = "";
		if(popcnt==0){
			html +="<tr>";
			html +="<td colspan=\"7\">데이터가 없습니다.</td>";
			html +="</tr>";
		}else{
			for(var i=0; i<poplist.length; i++){
				html += "<div class=\"underline2 name=\""+poplist[i].CUST_NO+"\">"
				html += "<div class=\"line2\">부서명 : </div>";
				html += "<div class=\"con4\">"+poplist[i].DEPT_NM+ "</div>";
				html += "<div class=\"line2\">상품유형 : </div>";
				html += "<div class=\"con4\">"+poplist[i].GODS_NM+ "</div>";
				html += "</div>";
				html += "</div>";
			}
		}
		$(".underbox2").html(html);
	}
	//팝업페이징 부분
	function drawPaging(pb2) {
		var html = "";

		if ($("#poppage").val() == 1) {
			html += "<div class=\"arrow prev\" name=\"1\"></div>";
		} else {
			html += "<div class=\"arrow prev\" name =\"" + ($("#poppage").val() - 1) + "\"></div> ";
		}

		for (var i = pb2.startPcount; i <= pb2.endPcount; i++) {
			if ($("#poppage").val() == i) {
				html += "<div class=\"poppage_on\" name=\"" + i + "\">" + i + "</b></div> ";
			} else {
				html += "<div class=\"poppage\" name=\"" + i + "\">" + i + "</div> ";
			}
		}

		if ($("#poppage").val() == pb2.maxPcount) {
			html += "<div name =\"" +pb2.maxPcount + "\"></div>";
		} else {
			html += "<div class=\"arrow next\" name =\"" + ($("#poppage").val() * 1 + 1) + "\"></div> ";
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
		<div class="contents_header_txt">고객사 정보</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="entpNo" id="entpNo" value="${param.entpNo}"/>
			<input type="hidden" name="poppage" id="poppage" value="${poppage}" />
		</form>
			<div class="underbox">
				
				<div class="underline">
					<div class="line1">거래처명</div>
					<div class="con1">
						<input type="text" name="ENTP_NM" id="ENTP_NM" disabled="disabled" value="${data.ENTP_NM}"/>
					</div>
					<div class="line1">대표자</div>
					<div class="con1">
						<input type="text" name="DELG_NM" id="DELG_NM" disabled="disabled" value="${data.DELG_NM}"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">기업번호</div>
					<div class="con1">
						<input type="text" name="ENTP_NO" id="ENTP_NO" disabled="disabled" value="${data.ENTP_NO}"/>
					</div>
					<div class="line1">사업자번호 </div>
					<div class="con1">
						<input type="text" name="BUSN_NO" id="BUSN_NO" disabled="disabled" value="${data.BUSN_NO}"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">영업담당자</div>
					<div class="con1">
						<input type="text" disabled="disabled" value="${sEmpNm}"/>
						
					</div>
					<div class="line1">영업사원번호</div>
					<div class="con1">
						<input type="text" disabled="disabled" value="${sEmpNo}"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">상품목록</div>
					<div class="con1">
						<input type="button" name="threeBtn" id="threeBtn" value="등록된 상품보기"/>
					</div>
					<div class="line1">최종수정일 </div>
					<div class="con1">
						<input type="text" name="ENTP_MODF_DATE" id="ENTP_MODF_DATE" disabled="disabled" value="${data.ENTP_MODF_DATE}"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">대표번호</div>
					<div class="con1">
						<input type="text" name="DELG_TEL1" id="DELG_TEL1" value="${data.TEL1}" disabled="disabled" placeholder="전화번호 '-'를 제외하고 입력"/> -
					</div>
					<div class="con1">
						<input type="text" name="DELG_TEL2" id="DELG_TEL2" value="${data.TEL2}" disabled="disabled" placeholder="전화번호 '-'를 제외하고 입력"/> -
					</div>
					<div class="con1">
						<input type="text" name="DELG_TEL2" id="DELG_TEL2" value="${data.TEL2}" disabled="disabled" placeholder="전화번호 '-'를 제외하고 입력"/>
					</div>
					
				</div>
				
				<div class="underline">
					<div class="line1">주소</div>
					<div class="con3">
						<input type="text" name="ENTP_ADDR1" id="sample4_postcode" placeholder="우편번호" disabled="disabled" value="${data.POST_NO}">
						<input type="hidden" onclick="sample4_execDaumPostcode()" disabled="disabled" value="주소 찾기"><br>
						<input type="text" name="ENTP_ADDR2" id="sample4_roadAddress" placeholder="도로명주소" disabled="disabled" value="${data.ADDR_1}">
						<span id="guide" style="color:#999"></span> 					
					</div>
				</div>
			</div>
			<div class="detail_btn_area">
				<input type="button" value="수정" id="updateBtn" />
				<input type="button" value="삭제" id="deleteBtn" />
				<input type="button" value="취소" id="listBtn"/>
			</div>
		
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>