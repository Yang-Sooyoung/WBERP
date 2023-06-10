<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - Sale Schedule Add</title>
<style type="text/css">
/* 상세보기영역 가로변경 시 */
.add_underbox {
	width: 1100px;
	border-top: 2px solid #9aa9bd;
	border-bottom: 1px solid #9aa9bd;
	margin-bottom: 10px;
}

/* 버튼영역 가로변경 시 */
.add_detail_btn_area {
	width: 645px;
	text-align: right;
	margin-bottom: 10px;
}

.add_detail_btn_area input[type='button'] {
	min-width: 80px;
	height: 32px;
	background-color: #f7f7f7;
	font-size: 10pt;
	border-radius: 3px;
	margin: 0 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
	cursor: pointer;
}

.add_detail_btn_area input[type='button']:hover {
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}
/* 개별 css는 여기에 */
.add_con1, .add_con2, .add_con3 {
	font-size: 10pt;
	min-height: 43px;
	line-height: 43px;
	display: inline-block;
	padding: 0px 5px;
}

.add_con1 {
	width: 400px;
}

.add_con2 {
	width: 400px;
}

.add_con3 {
	width: 950px;
}

.add_txt {
	text-align: center;
	color: #A4A4A4;
}

.pl_txt {
	width: 500px;
	height: 28px;
	font-size: 10pt;
	border-radius: 3px;
	margin: 0 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
}

.regi_right {
	display: inline-block;
	vertical-align: top;
	font-size: 10pt;
	color: red;
	margin: 10px 0px 0px 720px;
}

.upload {
	margin: 0px 0px 5px 769px;
}

.add_file_txt {
	width: 927px;
	height: 120px;
	border: 1px solid #585858;
	padding: 2px;
	margin-top: 5px;
	margin-bottom: 5px;
	border-radius: 2px;
}

.add_txt {
	text-align: center;
	margin-top: 55px;
	color: #A4A4A4;
}

.add_line1 {
	font-size: 10pt;
	font-weight: bold;
	background-color: #e4eaf2;
	width: 150px;
	min-height: 43px;
	line-height: 43px;
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}

.pl_popup {
	max-width: calc(100% - 12px);
	width: 330px;
	height: 28px;
	font-size: 10pt;
	border-radius: 3px;
	margin: 0px 3px 0px 0px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
}

.default_board1,.default_board2,.default_board3{
	width: 570px;
}

.default_board1 table,.default_board2 table,.default_board3 table  {
	border-collapse: collapse;
	text-align: center;
	border-color: #c2c2c2;
	margin-top: 10px;
	border-top: 2px solid #7f7f7f;
	border-bottom: 2px solid #7f7f7f;
	font-size: 10pt;
}

.default_board1 table th,.default_board2 table th,.default_board3 table th {
	color: #3c3c3d;
	font-size: 11pt;
}

.default_board1 table tbody tr,.default_board2 table tbody tr,.default_board3 table tbody tr {
	height: 40px;
	border-top: 1px solid #c2c2c2;
	cursor: pointer;
}

.default_board1 table tbody tr:hover ,.default_board2 table tbody tr:hover,.default_board3 table tbody tr:hover {
	background-color: #022859;
	color: #fff;
}

.default_board1 .top {
	height: 45px;
	padding: 10px 0px;
	color: #292d33;
	background-color: #E4EAF2;
}

.default_board2 .top {
	height: 45px;
	padding: 10px 0px;
	color: #292d33;
	background-color: #E4EAF2;
}
.default_board3 .top {
	height: 45px;
	padding: 10px 0px;
	color: #292d33;
	background-color: #E4EAF2;
}
.popup_contents1,.popup_contents2,.popup_contents3 {
	display: inline-block;
	margin: 0px 5px 0px 15px;
	padding: 10px;
	overflow-y: auto;
	font-size: 10pt;
}



.searchBtn1,.searchBtn2,.searchBtn3{
	min-width: 80px;
	height: 32px;
	background-color: #f7f7f7;
	font-size: 10pt;
	border-radius: 3px;
	margin-top: 9px;
	margin-left: 3px;
	margin-right: 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
	cursor: pointer;
}

.searchBtn1:hover,.searchBtn2:hover,.searchBtn3:hover {
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}

.filter{
	max-width: calc(100% - 12px);
	height: 32px;
	background-color: #f7f7f7;
	font-size: 10pt;
	border-radius: 3px;
	margin: 0 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
}
.page_nation1,.page_nation2,.page_nation3 {
	display: inline-block;
}

.page_nation1 .none {
	display: none;
}
.page_nation2 .none {
	display: none;
}
.page_nation3 .none {
	display: none;
}
.page_nation1 div,.page_nation2 div,.page_nation3 div{
	display: inline-block;
	vertical-align: top;
	margin: 0 3px;
	float: left;
	border: 1px solid #c2c2c2;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #f7f7f7;
	font-size: 10pt;
	border-radius: 3px;
	cursor: pointer;
}

.page_nation1 .arrow {
	border: 1px solid #c2c2c2;
}
.page_nation2 .arrow {
	border: 1px solid #c2c2c2;
}
.page_nation3 .arrow {
	border: 1px solid #c2c2c2;
}
.page_nation1 .prev {
	background: #f8f8f8 url('resources/images/common/left.png') no-repeat center center;
}
.page_nation2 .prev {
	background: #f8f8f8 url('resources/images/common/left.png') no-repeat center center;
}
.page_nation3 .prev {
	background: #f8f8f8 url('resources/images/common/left.png') no-repeat center center;
}
.page_nation1 .next {
	background: #f8f8f8 url('resources/images/common/right.png') no-repeat center center;
}
.page_nation2 .next {
	background: #f8f8f8 url('resources/images/common/right.png') no-repeat center center;
}
.page_nation3 .next {
	background: #f8f8f8 url('resources/images/common/right.png') no-repeat center center;
}
.page_nation1 div:hover, .page_nation1 .page_on	{
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}
.page_nation2 div:hover, .page_nation2 .page_on	{
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}
.page_nation3 div:hover, .page_nation3 .page_on	{
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
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
                document.getElementById('scheloct').value = fullRoadAddr;
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
	
		
		
		$("#cancelBtn").on("click", function() {
			makeBtn2Popup(1, "등록 취소 팝업", "취소하시겠습니까?", true, 400, 200,
					null, "확인", function() {
						$("#actionForm").attr("action", "saleScheMang");
						$("#actionForm").submit();
					}, "취소", function() {
						closePopup(1);
					});
			
		});
		
		$("#addBtn").on("click", function() {

			if ($.trim($("#schenm").val()) == "") {
				alert("활동명을 입력해 주세요.");
				$("#schenm").focus();
			} else if ($.trim($("#schestartday").val()) == "") {
				alert("날짜를 입력해 주세요.");
				$("#schestartday").focus();
			} else if ($.trim($("#entpnm").val()) == "") {
				alert("고객사명을 입력해 주세요.");
			} else if ($.trim($("#schestartdaytimeh").val()) == "") {
				alert("시간을 입력해 주세요.");
			} else if ($.trim($("#schestartdaytimem").val()) == "") {
				alert("시간을 입력해 주세요.");
			} else if ($.trim($("#scheenddaytimeh").val()) == "") {
				alert("시간을 입력해 주세요.");
			} else if ($.trim($("#scheenddaytimem").val()) == "") {
				alert("시간을 입력해 주세요.");
			} else if ($.trim($("#custnm").val()) == "") {
				alert("고객을 입력해 주세요.");
			} else if ($.trim($("#scheloct").val()) == "") {
				alert("장소를 입력해 주세요.");
				$("#scheloct").focus();
			} else {
				var fileForm = $("#fileForm");
				
				fileForm.ajaxForm({ //fileForm을 ajaxForm으로 변환하겠다 =이 폼을 실행하면 Ajax로 구동하겠다.(설정)
				success: function(res){
					if(res.result =="SUCCESS"){
						if(res.fileName.length > 0){//올린 파일이 1개라도 있는 경우
							$("#atchfilenm").val(res.fileName[0]); // 올린 파일명 추가
						}	
						
				var params = $("#actionForm").serialize();

				$.ajax({
					type : "post",
					url : "saleScheMangAddAjax",
					dataType : "json",
					data : params,
					success : function(res) {
						if (res.res == "SUCCESS") {
							$("#actionForm").attr("action", "saleScheMang");
							$("#actionForm").submit();
						} else {
							$("#alert").attr("title", "알림");
							$("#alert p").html("저장에 실패하였습니다.");
							$("#alert").dialog({
								buttons : {
									Ok : function() {
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
			} else {
				alert("파일저장실패");
			} 
			}, //ajax error
			error: function(req){
				console.log(req.responseText);
				alert("파일저장 에러"); 
			}
			
		});
		fileForm.submit();
	}
});
		//고객사명 검색 버튼
		$("#entpnmBtn").on("click", function() {
			
			var html = "";
			html += "	<div class=\"popup_contents1\">";
			html += "	</div>";
			
		
			makeBtn1Popup(1, "고객사 명 검색", html, true, 650, 650,
					reloadSearchPopup1(), "닫기", function() {
							closePopup(1);
						});
			 
			$(document).on("click", ".page_nation1 div", function() {
				$("#searchPage").val($(this).attr("name"));
				 reloadSearchPopup1();
			});
			
			
			$(document).on("click","#searchBtn1", function() {
				if($("#searchGbn1").val() != '') {
					
					console.log($("#searchGbn1").val());
					$("#searchGbn1Hidden").val($("#searchGbn1").val());
					console.log($("#searchGbn1Hidden").val());
				}
				$("#searchTxt1Hidden").val($("#searchTxt1").val());
				console.log($("#searchTxt1Hidden").val());
				$("#searchPage").val("1");
				reloadSearchPopup1();
			});
			
			$(document).on("click", "tr#cList", function() {
				$("#entpno").val($(this).attr("name"));
				$("#entpnm").val($(this).children("input").attr("id"));
				console.log($("#entpno").val());
				console.log($("#entpnm").val());
				closePopup(1);
			});
		}); 
		
		
		//고객 검색버튼
		$("#custnmBtn").on("click", function() {
			
			var html = "";
			html += "	<div class=\"popup_contents2\">";
			html += "	</div>";
			
		
			makeBtn1Popup(1, "고객 검색", html, true, 650, 650,
					reloadSearchPopup2(), "닫기", function() {
							closePopup(1);
						});
			 
			$(document).on("click", ".page_nation2 div", function() {
				$("#search2Page").val($(this).attr("name"));
				 reloadSearchPopup2();
			});
			
			
			$(document).on("click","#searchBtn2", function() {
				if($("#searchGbn2").val() != '') {
					
					console.log($("#searchGbn2").val());
					$("#searchGbn2Hidden").val($("#searchGbn2").val());
					console.log($("#searchGbn2Hidden").val());
				}
				$("#searchTxt2Hidden").val($("#searchTxt2").val());
				console.log($("#searchTxt2Hidden").val());
				$("#search2Page").val("1");
				reloadSearchPopup2();
			});
			
			$(document).on("click","tr#searchList2", function() {
				$("#custno").val($(this).attr("name"));
				$("#custnm").val($(this).children("input").attr("name"));
				$("#custcell").val($(this).children("input").attr("id"));
				console.log($("#custnm").val());
				console.log($("#custno").val());
				closePopup(1);
			});
		}); 
		
	
		
		//상품 검색 버튼
		$("#godsnmBtn").on("click", function() {
			
			var html = "";
			html += "	<div class=\"popup_contents3\">";
			html += "	</div>";
			
		
			makeBtn1Popup(1, "상품 명 검색", html, true, 650, 650,
					reloadSearchPopup3(), "닫기", function() {
							closePopup(1);
						});
			 
			$(document).on("click", ".page_nation3 div", function() {
				$("#search3Page").val($(this).attr("name"));
				 reloadSearchPopup3();
			});
			
			
			$(document).on("click","#searchBtn3", function() {
				if($("#searchGbn3").val() != '') {
					
					console.log($("#searchGbn3").val());
					$("#searchGbn3Hidden").val($("#searchGbn3").val());
					console.log($("#searchGbn3Hidden").val());
				}
				$("#searchTxt3Hidden").val($("#searchTxt3").val());
				console.log($("#searchTxt3Hidden").val());
				$("#search3Page").val("1");
				reloadSearchPopup3();
			});
			
			$(document).on("click","tr#searchList3", function() {
				$("#godsno").val($(this).attr("name"));
				$("#godsnm").val($(this).children("input").attr("id"));
				console.log($("#godsno").val());
				console.log($("#godsnm").val());
				closePopup(1);
			});
		}); 
		
		$("#actionForm").on("keypress", "input", function(e) {
			if (e.keyCode == 13) {
				return false;
			}
		});
	});
	//고객사명 검색
	function reloadSearchPopup1() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post",
			url : "saleScheAddSearchAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				$(".popup_contents1").html(drawSearchPopup1());
				cList(res.list1, res.cnt);
				drawPopupPaging1(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	
	function cList(list1, cnt) {
		var html = "";
		if(cnt == 0){
			html += "<tr>";
			html += "<td colspan=\"2\">데이터가 없습니다.</td>"; 
			html += "</tr>";
		}else{
			for (var i = 0; i < list1.length; i++) {
				html += "<tr name=\"" + list1[i].ENTP_NO + "\" id =\"cList\">";
				html += "<input type=\"hidden\" id=\""+list1[i].ENTP_NM +"\"  />";
				html += "<td>" + list1[i].ENTP_NM + "</td>";
				html += "<td>" + list1[i].DELG_NM + "</td>";
				html += "</tr>";
			}
		}
		$(".default_board1 tbody").html(html);

	}

	function drawSearchPopup1() {
		var html = "";

		html +=	"<select class=\"filter\" name=\"searchGbn1\" id=\"searchGbn1\">  ";
		html +=	"<option value=\"0\">고객사 명</option>                     ";
		html +=	"<option value=\"1\">대표자</option>                        ";
		html += "</select>                                                 ";
		html += "	<input class=\"pl_popup\" type=\"text\"   name=\"searchTxt1\" id=\"searchTxt1\"/>";
		html += "<input type=\"button\" class=\"searchBtn1\" id=\"searchBtn1\" value=\"검색\" />                                  ";
		html += "	<div class=\"default_board1\" >                                      ";
		html += "		<table class=\"search_list\">                                   ";
		html += "			<colgroup>                                                ";
		html += "				<col width=\"285px\"/>                                  ";
		html += "				<col width=\"285px\"/>                                  ";
		html += "</colgroup>                                                           ";
		html += "<thead>                                                               ";
		html += "			<tr class=\"top\">                                          ";
		html += "				<th>고객사 명</th>                                    ";
		html += "				<th>대표자</th>                                       ";
		html += "	</tr>                                                             ";
		html += "			</thead>                                                  ";
		html += "			<tbody>                                                   ";
		html += "			</tbody>                                                  ";
		html += "		</table>                                                      ";
		html += "		<div class=\"page_wrap\">                                       ";
		html += "			<div class=\"page_nation1\">                                 ";
		html += "		</div>                                                        ";
		html += "		</div>                                                        ";

		return html;
	}

	//고객 검색
	function reloadSearchPopup2() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post",
			url : "saleScheAddSearch2Ajax",
			dataType : "json",
			data : params,
			success : function(res) {
				$(".popup_contents2").html(drawSearchPopup2());
				searchList2(res.list2, res.cnt);
				drawPopupPaging2(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	function searchList2(list2, cnt) {
		var html = "";
		if(cnt == 0){
			html += "<tr>";
			html += "<td colspan=\"3\">데이터가 없습니다.</td>"; 
			html += "</tr>";
		}else{
			for (var i = 0; i < list2.length; i++) {
				html += "<tr name=\"" + list2[i].CUST_NO + "\" id=\"searchList2\">";
				
				html += "<input type=\"hidden\" name =\"" +list2[i].CUST_NM +"\" id=\""+list2[i].CUST_CELL+"\"  />";
				html += "<td>" + list2[i].CUST_NM + "</td>";
				html += "<td>" + list2[i].ENTP_NM + "</td>";
				html += "<td >" + list2[i].CUST_CELL + "</td>";
				html += "</tr>";
			}
		}
		$(".default_board2 tbody").html(html);

	}
	
	function drawSearchPopup2() {
		var html = "";

		html +=	"<select class=\"filter\" name=\"searchGbn2\" id=\"searchGbn2\"> 		 ";
		html +=	"<option value=\"0\">고객</option>                    						 ";
		html +=	"<option value=\"1\">고객사 명</option>                    								    ";
		html += "</select>                                                								 ";
		html += "<input class=\"pl_popup\" type=\"text\"   name=\"searchTxt2\" id=\"searchTxt2\"/>			";
		html += "<input type=\"button\" class=\"searchBtn2\" id=\"searchBtn2\" value=\"검색\" />                                ";
		html += "	<div class=\"default_board2\" >                                      ";
		html += "				<table class=\"search_list\">	         					 ";
		html += "					<colgroup>	   					  ";
		html += "						<col width=\"190px\"/>	    ";
		html += "						<col width=\"190px\"/>	    ";
		html += "						<col width=\"190px\"/>	           ";
		html += "					</colgroup>           ";
		html += "					<thead>	       ";
		html += "					<tr class=\"top\">	";
		html += "						<th>고객명</th>	";
		html += "						<th>고객사 명</th>	           ";
		html += "						<th>전화번호</th>	     ";
		html += "					</tr>	     ";
		html += "					</thead>	     ";
		html += "					<tbody>	        ";
		html += "	</tbody>          ";
		html += "					</table>       ";
		html += "					<div class=\"page_wrap\">        ";
		html += "						<div class=\"page_nation2\">        ";
		html += "</div>						        ";
		html += "				</div>						     ";
	

		return html;
	}
	//상품검색
	function reloadSearchPopup3() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post",
			url : "saleScheAddSearch3Ajax",
			dataType : "json",
			data : params,
			success : function(res) {
				$(".popup_contents3").html(drawSearchPopup3());
				searchList3(res.list3, res.cnt);
				drawPopupPaging3(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	function searchList3(list3, cnt) {
		var html = "";
		if(cnt == 0){
			html += "<tr>";
			html += "<td colspan=\"5\">데이터가 없습니다.</td>"; 
			html += "</tr>";
		}else{
			for (var i = 0; i < list3.length; i++) {
				html += "<tr name=\"" + list3[i].GODS_NO + "\" id=\"searchList3\">";
				
				html += "<input type=\"hidden\" id=\""+list3[i].GODS_NM+"\"  />";
				html += "<td>" + list3[i].GODS_NM + "</td>";
				html += "<td>" + list3[i].LOAN_KIND + "</td>";
				html += "<td>" + list3[i].LOAN_PERS + "</td>";
				html += "<td>" + list3[i].LOAN_PERD + "</td>";
				html += "<td >" + list3[i].LOAN_LIMT + "</td>";
				html += "</tr>";
			}
		}
		$(".default_board3 tbody").html(html);

	}
	
	function drawSearchPopup3() {
		var html = "";

		html +=	"<select class=\"filter\" name=\"searchGbn3\" id=\"searchGbn3\"> 		 ";
		html +=	"<option value=\"0\">영업 상품명</option>                    						 ";
		html +=	"<option value=\"1\">대출종류</option>                    								    ";
		html += "</select>                                                								 ";
		html += "<input class=\"pl_popup\" type=\"text\"   name=\"searchTxt3\" id=\"searchTxt3\"/>			";
		html += "<input type=\"button\" class=\"searchBtn3\" id=\"searchBtn3\" value=\"검색\" />                                ";
		html += "	<div class=\"default_board3\" >                                      ";
		html += "				<table class=\"search_list\">	         					 ";
		html += "					<colgroup>	   					  ";
		html += "					<col width=\"130px\"/>	   ";
		html += "					<col width=\"130px\"/>	   ";
		html += "					<col width=\"130px\"/>	          ";
		html += "					<col width=\"130px\"/>	          ";
		html += "					<col width=\"130px\"/>	          ";
		html += "					</colgroup>           ";
		html += "					<thead>	       ";
		html += "					<tr class=\"top\">	";
		html += "						<th>영업 상품명</th>               ";
		html += "						<th>대출 종류</th>                ";
		html += "						<th>대출 대상</th>          ";
		html += "						<th>대출 기간</th>          ";
		html += "						<th>대출 한도 금액</th>       ";
		html += "					</tr>	     ";
		html += "					</thead>	     ";
		html += "					<tbody>	        ";
		html += "	</tbody>          ";
		html += "					</table>       ";
		html += "					<div class=\"page_wrap\">        ";
		html += "						<div class=\"page_nation3\">        ";
		html += "</div>						        ";
		html += "				</div>						     ";
	

		return html;
	}
	
	function drawPopupPaging1(pb) {
		var html = "";

		if ($("#searchPage").val() == 1) {
			html += "<div class=\"arrow prev\" name=\"1\"></div>";
		} else {
			html += "<div class=\"arrow prev\" name =\"" + ($("#searchPage").val() - 1) + "\"></div> ";
		}

		for (var i = pb.startPcount; i <= pb.endPcount; i++) {
			if ($("#searchPage").val() == i) {
				html += "<div class=\"page_on\" name=\"" + i + "\">" + i + "</b></div> ";
			} else {
				html += "<div class=\"page\" name=\"" + i + "\">" + i + "</div> ";
			}
		}

		if ($("#searchPage").val() == pb.maxPcount) {
			html += "<div name =\"" +pb.maxPcount + "\"></div>";
		} else {
			html += "<div class=\"arrow next\" name =\"" + ($("#searchPage").val() * 1 + 1) + "\"></div> ";
		}

		$(".page_nation1").html(html);
	}
	
	function drawPopupPaging2(pb) {
		var html = "";

		if ($("#search2Page").val() == 1) {
			html += "<div class=\"arrow prev\" name=\"1\"></div>";
		} else {
			html += "<div class=\"arrow prev\" name =\"" + ($("#search2Page").val() - 1) + "\"></div> ";
		}

		for (var i = pb.startPcount; i <= pb.endPcount; i++) {
			if ($("#search2Page").val() == i) {
				html += "<div class=\"page_on\" name=\"" + i + "\">" + i + "</b></div> ";
			} else {
				html += "<div class=\"page\" name=\"" + i + "\">" + i + "</div> ";
			}
		}

		if ($("#search2Page").val() == pb.maxPcount) {
			html += "<div name =\"" +pb.maxPcount + "\"></div>";
		} else {
			html += "<div class=\"arrow next\" name =\"" + ($("#search2Page").val() * 1 + 1) + "\"></div> ";
		}

		$(".page_nation2").html(html);
	}
	
	function drawPopupPaging3(pb) {
		var html = "";

		if ($("#search3Page").val() == 1) {
			html += "<div class=\"arrow prev\" name=\"1\"></div>";
		} else {
			html += "<div class=\"arrow prev\" name =\"" + ($("#search3Page").val() - 1) + "\"></div> ";
		}

		for (var i = pb.startPcount; i <= pb.endPcount; i++) {
			if ($("#search3Page").val() == i) {
				html += "<div class=\"page_on\" name=\"" + i + "\">" + i + "</b></div> ";
			} else {
				html += "<div class=\"page\" name=\"" + i + "\">" + i + "</div> ";
			}
		}

		if ($("#search3Page").val() == pb.maxPcount) {
			html += "<div name =\"" +pb.maxPcount + "\"></div>";
		} else {
			html += "<div class=\"arrow next\" name =\"" + ($("#search3Page").val() * 1 + 1) + "\"></div> ";
		}

		$(".page_nation3").html(html);
	}
</script>
</head>
<body>
	<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNo">${param.menuNo}</c:param>
	</c:import>

		<div class="contents_header">
			<div class="contents_header_txt">영업 일정 등록</div>
			<div class="regi_right">*는 필수 항목</div>
		</div>
		<div class="contents">
			<div class="add_underbox">
	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="top" name="top" value="${param.top}" />
		<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
		<input type="hidden" name="sysdate" id="sysdate" value='' />
		<input type="hidden" name="salescheno" id="salescheno" />
		<input type="hidden" name="scheno" id="scheno" />
		<input type="hidden" name="salescheatchfileno" id="salescheatchfileno" />
		<input type="hidden" name="atchfilenm" id="atchfilenm" />
		<input type="hidden" name="empno" id="empno" value="${param.empno}" />
		<input type="hidden" name="entpno" id="entpno" />
		<input type="hidden" name="custno" id="custno" />
		<input type="hidden" name="godsno" id="godsno" />
		<input type="hidden" name="page" id="page" value="${param.page}" />
		<input type="hidden" name="searchPage" id="searchPage" value="${searchPage}" />
		<input type="hidden" name="search2Page" id="search2Page" value="${search2Page}" />
		<input type="hidden" name="search3Page" id="search3Page" value="${search3Page}" />
		<input type="hidden" name="sEmpNo" value="${sEmpNo}" />
		<input type="hidden" name="searchGbn1Hidden" id="searchGbn1Hidden"  value="${param.searchGbn1Hidden}"/>
		<input type="hidden" name="searchTxt1Hidden" id="searchTxt1Hidden" value="${param.searchTxt1Hidden}" />
		<input type="hidden" name="searchGbn2Hidden" id="searchGbn2Hidden"  value="${param.searchGbn2Hidden}"/>
		<input type="hidden" name="searchTxt2Hidden" id="searchTxt2Hidden" value="${param.searchTxt2Hidden}" />
		<input type="hidden" name="searchGbn3Hidden" id="searchGbn3Hidden"  value="${param.searchGbn3Hidden}"/>
		<input type="hidden" name="searchTxt3Hidden" id="searchTxt3Hidden" value="${param.searchTxt3Hidden}" />
				<div class="underline">
					<div class="add_line1">담당자</div>
					<div class="add_con1">
						<input type="text" value="${sEmpNm}" disabled="disabled" id="empnm" name="empnm"/>
					</div>
					<div class="add_line1">부서</div>
					<div class="add_con1">
						<select>
							<option disabled="disabled" selected="selected" id="deptnm">${sDeptNm}</option>
						</select>
					</div>
				</div>
				<div class="underline">
					<div class="add_line1">이메일</div>
					<div class="add_con1">
						<input type="text" id="email" name="email" disabled="disabled" value="${data.EMAIL}" />
					</div>
					<div class="add_line1">핸드폰 번호</div>
					<div class="add_con1">
						<input type="text" id="cellno" name="cellno" disabled="disabled" value="${data.CELL_NO}" />
					</div>
				</div>
				<div class="underline">
					<div class="add_line1">활동명 *</div>
					<div class="add_con1">
						<input type="text" id="schenm" name="schenm"/>
					</div>
					<div class="add_line1">날짜 *</div>
					<div class="add_con1">
						<input type="date" id="schestartday" name="schestartday"/>
					</div>
				</div>
				<div class="underline">
					<div class="add_line1">고객사 명 *</div>
					<div class="add_con1">
						<input type="text" disabled="disabled" id="entpnm" name="entpnm"/>
						<input type="button" id="entpnmBtn" value="검색" />
					</div>
					<div class="add_line1">시간 *</div>
					<div class="add_con1">
						<select class="time_txt1" id="schestartdaytimeh" name="schestartdaytimeh">
							<option value="">선택</option>
							<option value="00">00</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
						</select> : <select class="time_txt2" id="schestartdaytimem" name="schestartdaytimem">
							<option value="" >선택</option>
							<option value="00">00</option>
							<option value="30">30</option>
						</select> ~ <select class="time_txt3" id="scheenddaytimeh" name="scheenddaytimeh">
							<option value="" >선택</option>
							<option value="00">00</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
						</select> : <select class="time_txt4" id="scheenddaytimem" name="scheenddaytimem">
							<option value="" >선택</option>
							<option value="00">00</option>
							<option value="30">30</option>
						</select>
					</div>
				</div>
				<div class="underline">
					<div class="add_line1">고객 *</div>
					<div class="add_con1">
						<input type="text" disabled="disabled" id="custnm" name="custnm"/>
						<input type="button" id="custnmBtn" value="검색" />
					</div>
					<div class="add_line1">전화번호 *</div>
					<div class="add_con1">
						<input type="text" disabled="disabled" id="custcell" />
					</div>
				</div>
				<div class="underline">
					<div class="add_line1">장소 *</div>
					<div class="add_con3">
						<input class="pl_txt" name="scheloct" type="text" id="scheloct"/>
						<input type="hidden" name="ENTP_ADDR1" id="sample4_postcode" disabled="disabled" placeholder="우편번호">
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
						<input type="hidden" name="ENTP_ADDR3" id="sample4_leftAddress" placeholder="나머지주소">
						<span id="guide" style="color:#999"></span> 
						<input type="button" onclick="sample4_execDaumPostcode()" value="검색" />
					</div>
				</div>
				<div class="underline">
					<div class="add_line1">영업 상품</div>
					<div class="add_con1">
						<input type="text" id="godsnm" name="godsnm"/>
						<input type="button" id="godsnmBtn" value="검색" />
					</div>
					<div class="add_line1">영업 목적</div>
					<div class="add_con1">
						<input type="text" id="salepurp"  name="salepurp"/>
					</div>
				</div>

				
					<div class="underline">
						<div class="add_line1">활동 내용</div>
						<div class="add_con3">
							<textarea rows="8" cols="130" id="actvcont" name="actvcont"></textarea>
						</div>
					</div>
	</form>
				<div class="underline">
					<div class="add_line1">첨부파일</div>
					<div class="add_con3">
						<div class="add_file_txt">
							<form id="fileForm" name="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
								 <input type="file" name="attFile" />
							</form>		
						</div>
					</div>
				</div>
			</div>
			<div class="add_detail_btn_area">
				<input type="button" value="등록" id="addBtn" />
				<input type="button" value="취소" id="cancelBtn" />
			</div>
		</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>