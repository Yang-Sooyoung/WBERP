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
			$("#listBtn").on("click",function(){
				history.back();
			});
			$("#addBtn").on("click",function(){
				if($.trim($("#ENTP_NM").val())==""){
					alert("거래처명을 입력해주세요.");
				}else if($.trim($("#BUSN_NO").val())==""){
					alert("사업자번호를 입력해주세요.");
				}else if($.trim($("#DELG_NM").val())==""){
					alert("대표자 이름을 입력해주세요.");
				}else if($.trim($("#DELG_TEL").val())==""){
					alert("대표번호를 입력해주세요.");
				}else if($.trim($("#sample4_roadAddress").val())==""){
					alert("주소를 입력해주세요.");
				}else{
					var params=$("#actionForm").serialize();
					$.ajax({
						type : "post",
						url : "CustComAddAjax",
						dataType : "json", // {키:값, 키:값}
						data : params, //보낼데이터
						success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
							if(res.res=="SUCCESS"){
								$("#actionForm").attr("action", "custCompInfoMang");
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
		<div class="contents_header_txt">고객사 등록</div>
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
					<div class="line1">거래처명 *</div>
					<div class="con1">
						<input type="text" name="ENTP_NM" id="ENTP_NM"/>
					</div>
					<div class="line1">사업자번호 *</div>
					<div class="con1">
						<input type="text" name="BUSN_NO" id="BUSN_NO"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">대표자</div>
					<div class="con1">
						<input type="text" name="DELG_NM" id="DELG_NM"/>
					</div>
					<div class="line1">대표번호 *</div>
					<div class="con1">
						<input type="text" name="DELG_TEL" id="DELG_TEL" placeholder="전화번호 '-'를 제외하고 입력"/>
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
					<div class="line1">주소 *</div>
					<div class="con3">
						<%--
						<input type="text" name="ENTP_ADDR" id="ENTP_ADDR" /> 
						<input type="button" value="주소 찾기" id="search_addr"/>
						 --%>
						<input type="text" name="ENTP_ADDR1" id="sample4_postcode" readonly  placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기"><br>
						<input type="text" name="ENTP_ADDR2" id="sample4_roadAddress" readonly  placeholder="도로명주소">
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
						<input type="text" name="ENTP_ADDR3" id="sample4_leftAddress" placeholder="나머지주소"><br>
						<span id="guide" style="color:#999"></span> 					</div>
				</div>
<<<<<<< HEAD
=======
>>>>>>> branch 'main' of https://github.com/axia911/gdj28
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