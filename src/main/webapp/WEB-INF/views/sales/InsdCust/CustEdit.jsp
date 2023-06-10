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
.con5 {
	font-size: 10pt;
	min-height: 43px;
	line-height: 43px;
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
	$(document).ready(function() {
		$("#listBtn").on("click", function() {
			history.back();
		});
		$("#updateBtn").on("click",function(){
			if($.trim($("#CUST_NM").val())==""){
				alert("고객이름을 입력해주세요.");
				$("#CUST_NM").focus();
			}else if($.trim($("#CELL_1").val())==""){
				alert("휴대폰 번호를 입력해주세요.");
				$("#CELL_1").focus();
			}else if($.trim($("#CELL_2").val())==""){
				alert("휴대폰 번호를 입력해주세요.");
				$("#CELL_2").focus();
			}else if($.trim($("#CELL_3").val())==""){
				alert("휴대폰 번호를 입력해주세요.");
				$("#CELL_3").focus();
			}else if($.trim($("#CUST_EMAIL1").val())==""){
				alert("이메일을 입력해주세요.");
				$("#CUST_EMAIL1").focus();
			}else if($.trim($("#CUST_EMAIL2").val())==""){
				alert("이메일을 입력해주세요.");
				$("#CUST_EMAIL2").focus();
			}else if($.trim($("#sample4_roadAddress").val())==""){
				alert("주소를 입력해주세요.");
				$("#sample4_roadAddress").focus();
			}else{
				var params=$("#actionForm").serialize();
				$.ajax({
					type : "post",
					url : "CustUpdateAjax",
					dataType : "json", // {키:값, 키:값}
					data : params, //보낼데이터
					success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
						if(res.res=="SUCCESS"){
							$("#actionForm").attr("action", "custInfoMang");
							$("#actionForm").submit();
						}else{
							$("#alert").attr("title","알림");
							$("#alert p").html("수정에 실패하였습니다.");
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
	function updateAjax(){
		var params=$("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "CustUpdateAjax",
			dataType : "json", // {키:값, 키:값}
			data : params, //보낼데이터
			success : function(res) { // 성공 시 해당 함수 실행. 결과는 result로받겠다.
				if(res.res=="SUCCESS"){
					$("#actionForm").attr("action", "CustDetail");
					$("#actionForm").submit();
				}else{
					$("#alert").attr("title","알림");
					$("#alert p").html("수정에 실패하였습니다.");
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
		<div class="contents_header_txt">고객 정보</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="custNo" id="custNo" value="${param.custNo}"/>
		
			<div class="underbox">
				
				<div class="underline">
					<div class="line1">고객이름 *</div>
					<div class="con1">
						<input type="text" name="CUST_NM" id="CUST_NM" value="${data.CUST_NM}"/>
					</div>
					<div class="line1">고객부서 *</div>
					<div class="con1">
						<input type="text" name="DEPT_NM" id="DEPT_NM" readonly value="${data.DEPT_NM}"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">고객번호 *</div>
					<div class="con1">
						<input type="text" name="CUST_NO" id="CUST_NO" readonly value="${data.CUST_NO}"/>
					</div>
					<div class="line1">기업번호 * </div>
					<div class="con1">
						<input type="text" name="ENTP_NO" id="ENTP_NO" readonly value="${data.ENTP_NO}"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">영업담당자 *</div>
					<div class="con1">
						<input type="text" readonly value="${sEmpNm}"/>
						
					</div>
					<div class="line1">영업사원번호 *</div>
					<div class="con1">
						<input type="text" readonly value="${sEmpNo}"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">등록일 *</div>
					<div class="con1">
						<input type="text" name="ADD_DATE" id="ADD_DATE" readonly value="${data.ADD_DATE}"/>
					</div>
					<div class="line1">수정일</div>
					<div class="con1">
						<input type="text" name="MODF_DATE" id="MODF_DATE" readonly value="${data.MODF_DATE}"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">휴대폰번호 *</div>
					<div class="con5">
						<input type="text" name="CELL_1" id="CELL_1" value="${data.CELL_1}" /> -
					</div>
					<div class="con5">
						<input type="text" name="CELL_2" id="CELL_2" value="${data.CELL_2}" /> -
					</div>
					<div class="con5">
						<input type="text" name="CELL_3" id="CELL_3" value="${data.CELL_3}" />
					</div>
				</div>
				<div class="underline">
					<div class="line1">대표번호 *</div>
					<div class="con1">
						<input type="text" name="CUST_TEL" id="CUST_TEL" value="${data.CUST_TEL}" placeholder="전화번호 '-'를 제외하고 입력"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">이메일 *</div>
					<div class="con1">
						<input type="text" name="CUST_EMAIL1" id="CUST_EMAIL1" value="${data.CUST_EMAIL1}"/> @
					</div>
					<div class="con1">
						<input type="text" name="CUST_EMAIL2" id="CUST_EMAIL2" value="${data.CUST_EMAIL2}"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">주소 *</div>
					<div class="con3">
						<input type="text" name="CUST_ADDR1" id="sample4_postcode" placeholder="우편번호" readonly value="${data.POST_NO}">
						<input type="button" onclick="sample4_execDaumPostcode()" readonly value="주소 찾기"><br>
						<input type="text" name="CUST_ADDR2" id="sample4_roadAddress" placeholder="도로명주소" readonly value="${data.CUST_ADDR}">
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
						<input type="text" name="CUST_ADDR3" id="sample4_leftAddress" placeholder="나머지주소"><br>
						<span id="guide" style="color:#999"></span> 					
					</div>
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
					<div class="con3"><textarea rows="10" cols="50"></textarea></div>
				</div>
				 -->
			</div>
			<div class="detail_btn_area">
				<input type="button" value="수정" id="updateBtn" />
				<input type="button" value="취소" id="listBtn"/>
			</div>
		</form>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>