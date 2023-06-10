<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 고객사 등록</title>
<style type="text/css">
/* 개별 css는 여기에 */
#sample4_roadAddress{
	width:300px;
}
tbody{
	text-align: center;
	font-size : 13px;
}
tbody tr:hover{
	background-color : #e4eaf2;
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
 
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
 
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
 
                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
<script type="text/javascript">
	$(document).ready(
		function() {
			console.log($("#ENTP_NO").val);
			$("#search_entp").on("click",function(){
				var entppop = '';
				entppop += "<div class=\"underbox2\">";
				entppop += "<form id=\"popForm\" method=\"post\">";
				entppop += "<input type=\"hidden\" name=\"poppage\" id=\"poppage\" value=\"1\" />";
				entppop += "<div class=\"default_search_area\">";
				entppop += "<select name=\"searchGbn\" id=\"searchGbn\">";
				entppop += "<option value=\"0\">기업번호</option>";
				entppop += "<option value=\"1\">기업명</option>";
				entppop += "<option value=\"2\">사업자번호</option>";
				entppop += "<option value=\"3\">대표자이름</option>";
				entppop += "</select>";
				entppop += "<input type=\"text\" placeholder=\"검색어\" name=\"searchTxt\" value=\"${param.searchTxt}\"/>";
				entppop += "<div class=\"search_btn_area\">";
				entppop += "<input type=\"button\" value=\"검색\" id=\"searchBtn\" />";
				entppop += "</div>";
				entppop += "</div>";
				entppop += "</form>";
				entppop += "<table class=\"custlist_table\"><colgroup>";
				entppop += "<col width=\"120px\">";
				entppop += "<col width=\"120px\">";
				entppop += "<col width=\"120px\">";
				entppop += "<col width=\"120px\">";
				entppop += "<col width=\"120px\">";
				entppop += "</colgroup>";
				entppop += "<thead><tr class=\"top\"><th>기업번호</th><th>기업명</th><th>사업자번호</th><th>대표자</th><th>대표번호</th></thead>"
				entppop += "<tbody>";
				entppop += "</tbody>";
				entppop += "</table>";
				entppop += "</div>";
				entppop += "<div class=\"page_wrap\">";
				entppop += "<div class=\"page_nation\">";
				entppop += "</div>";
				entppop += "</div>";
				makeBtn1Popup(1, "고객사 찾기", entppop, true, 820, 800,
						function() {
							reloadList()
						}, "확인", function() {
							closePopup(1);
						});
				$(document).on("click", ".page_nation div", function() {
					$("#poppage").val($(this).attr("name"));
					reloadList();
				});
				if('${param.searchGbn}' != '') {
					$("#searchGbn").val('${param.searchGbn}');
				} 
				$("#searchBtn").on("click", function() {
					$("#poppage").val("1");
					reloadList();
				});
				$(".custlist_table tbody").on("click", "tr", function() { // 상세페이지
			      	$("#ENTP_NO").val($(this).attr("name"));
					console.log($("#ENTP_NO").val());
					closePopup(1);
			  	});
			});
			$("#listBtn").on("click",function(){
				history.back();
			});
			$("#addBtn").on("click",function(){
				if($.trim($("#CUST_NM").val())==""){
					alert("고개이름을 입력해주세요.");
				}else if($.trim($("#DEPT_NM").val())==""){
					alert("고객부서를 입력해주세요.");
				}else if($.trim($("#ENTP_NO").val())==""){
					alert("기업명을 입력해주세요.");
				}else if($.trim($("#CUST_CELL").val())==""){
					alert("휴대폰번호를 입력해주세요.");
				}else if($.trim($("#CUST_EMAIL1").val())==""){
					alert("이메일를 입력해주세요.");
				}else if($.trim($("#CUST_EMAIL2").val())==""){
					alert("이메일를 입력해주세요.");
				}else if($.trim($("#sample4_roadAddress").val())==""){
					alert("주소를 입력해주세요.");
				}else{
					var params=$("#actionForm").serialize();
					$.ajax({
						type : "post",
						url : "CustAddAjax",
						dataType : "json", // {키:값, 키:값}
						data : params, //보낼데이터
						success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
							if(res.res=="SUCCESS"){
								$("#actionForm").attr("action", "custInfoMang");
								$("#actionForm").submit();
							}else{
								$("#alert").attr("title","알림");
								$("#alert p").html("저장에 실패하였습니다.");
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
			$("#actionForm").on("keypress","input",function(e){
				if(e.keyCode==13){
					return false;
				}
			});
		});
	function reloadList(){
		var params=$("#popForm").serialize();
		console.log(params);
		$.ajax({
			type : "post",
			url : "CustListPopAjax",
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
	//리스트 뿌려주기
	function drawList(list,cnt){
		var html = "";
		if(cnt==0){
			html +="<tr>";
			html +="<td colspan=\"7\">데이터가 없습니다.</td>";
			html +="</tr>";
		}else{
			for(var i=0; i<list.length; i++){
				html +="<tr name=\""+list[i].ENTP_NO+"\">";
				html +="<td>"+list[i].ENTP_NO+ "</td>";
				html +="<td>"+list[i].ENTP_NM+ "</td>";
				html +="<td>"+list[i].BUSN_NO+"</td>";
				html +="<td>"+list[i].DELG_NM+"</td>";
				html +="<td>"+list[i].DELG_TEL+"</td>";
				html +="</tr>";
			}
		}
		$(".custlist_table tbody").html(html);
	}
	//페이징 부분
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
		<div class="contents_header_txt">고객 등록</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
			<!-- 아래 두개 필수 -->
			
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="sEmpNo" value="${sEmpNo}" />
			<div class="underbox">
				<div class="underline">
					<div class="line1">고객이름 *</div>
					<div class="con1">
						<input type="text" name="CUST_NM" id="CUST_NM"/>
					</div>
					<div class="line1">고객부서 *</div>
					<div class="con1">
						<input type="text" name="DEPT_NM" id="DEPT_NM"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">기업번호 *</div>
					<div class="con1">
						<input type="text" name="ENTP_NO" id="ENTP_NO" value="${ENTP_NO}"/>
						<input type="button" value="기업찾기" id="search_entp"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">영업담당자 *</div>
					<div class="con1">
						<input type="text" value="${sEmpNm}"/>
						
					</div>
					<div class="line1">영업사원번호 *</div>
					<div class="con1">
						<input type="text" value="${sEmpNo}"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">휴대폰번호 *</div>
					<div class="con1">
						<input type="text" name="CUST_CELL" id="CUST_CELL" placeholder="전화번호 '-'를 제외하고 입력"/>
					</div>
					<div class="line1">대표번호</div>
					<div class="con1">
						<input type="text" name="CUST_TEL" id="CUST_TEL" placeholder="전화번호 '-'를 제외하고 입력"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">이메일 *</div>
					<div class="con3">
						<input type="text" class="email" name="CUST_EMAIL1" id="CUST_EMAIL1" /> @ 
						<input type="text" name="CUST_EMAIL2" id="CUST_EMAIL2" placeholder="직접입력" />
						<select class="selectbox" name="email_selectbox">
							<option value="이메일 선택" selected="selected">이메일 선택</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="gmail.com">nate.com</option>
						</select>
					</div>
				</div>
				<div class="underline">
					<div class="line1">주소 *</div>
					<div class="con3">
						<%--
						<input type="text" name="ENTP_ADDR" id="ENTP_ADDR" /> 
						<input type="button" value="주소 찾기" id="search_addr"/>
						 --%>
						<input type="text" name="CUST_ADDR1" id="sample4_postcode" readonly  placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기"><br>
						<input type="text" name="CUST_ADDR2" id="sample4_roadAddress" readonly  placeholder="도로명주소">
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
						<input type="text" name="CUST_ADDR3" id="sample4_leftAddress" placeholder="나머지주소"><br>
						<span id="guide" style="color:#999"></span> 					</div>
				</div>
				<div class="underline">
					<div class="line1">수신 동의</div>
					<div class="con2">
						<input type="checkbox" id="sns" name="susin" value=0 onclick='getCheckboxValue(event)'/>문자 
						<input type="checkbox" id="kakao" name="susin" value=1 onclick='getCheckboxValue(event)'/>카톡
						<input type="checkbox" id="email" name="susin" value=2 onclick='getCheckboxValue(event)'/>이메일
					</div>
				</div>
				<!-- 
				<div class="underline">
					<div class="line1">의견메모</div>
					<div class="con3"><textarea rows="10" cols="50" name="OPNN_CONT" id="OPNN_CONT"></textarea></div>
				</div>
				-->
			</div>
			<div class="detail_btn_area">
				<input type="button" value="등록" id="addBtn" />
				<input type="button" value="취소" id="listBtn"/>
			</div>
			
		</form>
		
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>