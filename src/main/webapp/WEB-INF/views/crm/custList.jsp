<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객목록</title>
<style type="text/css">
.default_search_area {
	position: relative;
	width: calc(100% - 10px) !important;
	height: 30px;
}

/* 목록영역 가로변경 시 */
.default_board {
	width: 100% !important;
	margin-top: 30px;
}

.default_board table {
	width: 100%;
}

.cust_list_table th td {
	color: #3c3c3d;
	font-size: 10pt;
}

.cust_list_table th {
	border-top: 2px solid #000000;
	background-color: #e4eaf2;
	height: 30px;
}

.searchbtn {
	width: 200px;
}

.search_btn_area {
	vertical-align: right;
}

.cust_search {
	display: inline-block;
}

.sear_img {
	width: 30px;
	cursor: pointer;
	height: 30px !important;
}
.address {
	width: 300px;
}
/*.searchpng {
	vertical-align: top;
}*/
.searchcust, .sear_img, .register_cust, .reset_cust_list {
	display: inline-block;
	vertical-align: top;
	margin-left: 10px;
	height: 18px;
}

.register {
	width: 85px;
}

.resetbtn {
	background-repeat: no-repeat;
	background-position: center;
	cursor: pointer;
}

.btns {
	display: inline-block;
	vertical-align: top;
	text-align: center;
}
.inline {
	display: inline-block !important;
}
.con1 {
	width: 100% !important;
}

/* 팝업 크기변경 시 */

</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	
	//주소찾기
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
    
	//이메일
    function email_change(){
    if(document.custAddForm.emailaddr.options[document.custAddForm.emailaddr.selectedIndex].value == '0'){
     document.custAddForm.email2.disabled = true;
     document.custAddForm.email2.value = "";
    }if(document.custAddForm.emailaddr.options[document.custAddForm.emailaddr.selectedIndex].value == '9'){
     document.custAddForm.email2.disabled = false;
     document.custAddForm.email2.value = "";
     document.custAddForm.email2.focus();
    }else{
     document.custAddForm.email2.disabled = true;
     document.custAddForm.email2.value = document.custAddForm.emailaddr.options[document.custAddForm.emailaddr.selectedIndex].value;

    }

    }

    function email_change2(){
        if(document.custUpdateForm.emailaddr.options[document.custUpdateForm.emailaddr.selectedIndex].value == '0'){
         document.custUpdateForm.email2.disabled = true;
         document.custUpdateForm.email2.value = "";
        }if(document.custUpdateForm.emailaddr.options[document.custUpdateForm.emailaddr.selectedIndex].value == '9'){
         document.custUpdateForm.email2.disabled = false;
         document.custUpdateForm.email2.value = "";
         document.custUpdateForm.email2.focus();
        }else{
         document.custUpdateForm.email2.disabled = true;
         document.custUpdateForm.email2.value = document.custUpdateForm.emailaddr.options[document.custUpdateForm.emailaddr.selectedIndex].value;

        }

        }
    
 </script>
 <script type="text/javascript">
	$(document).ready(function() {
		reloadList();
		

		//검색버튼
		$("#searchBtn").on("click", function() {
			$("#page").val("1");
			reloadList();
		});

		//새로고침버튼
		$("#resetBtn").on("click", function() {
			$("#searchTxt").val("");
			reloadList();
		});
		//페이징
		$(".page_nation").on("click", "div", function() {
			$("#page").val($(this).attr("name"));
			reloadList();
		});
		
		
		
		
		//상세보기
		$("tbody").on("dblclick", "tr", 
				function() {
				$("#detlcustno").val($(this).attr("name"));
			makeBtn3Popup(2, "고객 정보 상세보기", detailpop(), true, 840, 600,
					popcustDetail(), "수정", 
					function() {
				closePopup(2);
				makeBtn2Popup(3, "고객 정보 수정", updatepop(), true, 840, 600,
						updatecust(), "저장", function() {
							//고객군추가
							if ($.trim($("#custnm").val()) == "") {
								alert("이름을 입력해 주세요.");
								$("#custnm").focus();
							}else if ($.trim($("#birth").val()) == ""){
								alert("생년월일을 입력해 주세요.");
								$("#birth").focus();
							}else if ($.trim($("#cellno").val()) == ""){								
								alert("휴대 전화번호를 입력해 주세요.");
								$("#cellno").focus();
							}else if ($.trim($("#email").val()) == ""){
								alert("이메일을 입력해 주세요.");
								$("#email").focus();
							}else if ($.trim($("#sample4_roadAddress").val()) == ""){
								alert("주소를 입력해 주세요.");
								$("#addr").focus();
							}
						
							else {
								saveupdatecust();
								closePopup(3);
								reloadList();
							}
						}, "취소", function() {
							if(confirm("저장을 취소하시겠습니까?")== true){
								closePopup(3);								
							}else{
								return false;
							}
						});
				$("#sms3").on("click", function() {
			        if ($("#sms3").is(":checked") == true) {
			           $(this).val(1);
			        } else {
			           $(this).val(0);
			        }
			     });
			     $("#kakao3").on("click", function() {
			        if ($("#kakao3").is(":checked") == true) {
			           $(this).val(2);
			        } else {
			           $(this).val(0);
			        }
			     });
			     $("#chanemail3").on("click", function() {
			        if ($("#chanemail3").is(":checked") == true) {
			           $(this).val(4);
			        } else {
			           $(this).val(0);
			        }
			     });
					}, "삭제", function() {
						if(confirm("삭제하시겠습니까?")) {
							var params = $("#custUpdateForm").serialize();
							
							$.ajax({
								type : "post",
								url : "custDeleteAjax",
								dataType : "json", 
								data : params,
								success : function(res) {
										alert("삭제되었습니다");
										closePopup(2);
										reloadList();
								},
								error : function(req, status, error) {
									alert("삭제실패");
									console.log("code : " + req.status);
									console.log("message : " + req.responseText);
									console.log("error : " + error);
								}
							  });
						}
					}
					, "취소", function() {
						closePopup(2);
					});
		});
	
		
	//고객등록 버튼
	$("#custBtn").on(
			"click",
			function() {
				makeBtn2Popup(2, "고객 정보 등록", addpop(), true, 840, 600,
						null, "추가", function() {
							//고객군추가
							if ($.trim($("#custnm").val()) == "") {
								alert("이름을 입력해 주세요.");
								$("#custnm").focus();
							}else if ($.trim($("#birth").val()) == ""){
								alert("생년월일을 입력해 주세요.");
								$("#birth").focus();
							}else if ($.trim($("#sex").val()) == ""){
								alert("성별을 입력해 주세요.");
								$("#sex").focus();
							}else if ($.trim($("#cellno").val()) == ""){
								alert("휴대 전화번호를 입력해 주세요.");
								$("#cellno").focus();
							}else if ($.trim($("#email").val()) == ""){
								alert("이메일을 입력해 주세요.");
								$("#email").focus();
							}else if ($.trim($("#sample4_roadAddress").val()) == ""){
								alert("주소를 입력해 주세요.");
								$("#addr").focus();
							}
							else {
								addcust();
								closePopup(2);
								reloadList();
							}
						}, "취소", function() {
							closePopup(2);
						});
				
				$("#sms").on("click", function() {
			        if ($("#sms").is(":checked") == true) {
			           $(this).val(1);
			        } else {
			           $(this).val(0);
			        }
			     });
			     $("#kakao").on("click", function() {
			        if ($("#kakao").is(":checked") == true) {
			           $(this).val(2);
			        } else {
			           $(this).val(0);
			        }
			     });
			     $("#chanemail").on("click", function() {
			        if ($("#chanemail").is(":checked") == true) {
			           $(this).val(4);
			        } else {
			           $(this).val(0);
			        }
			     });
			});
	
	});
	
	//첫화면
	function reloadList() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post",
			url : "custListAjax",
			dataType : "json", // {키:값, 키:값}
			data : params, //보낼데이터
			success : function(res) { //성공 시 해당 함수 실행. 결과는 res로 받겠다.
				drawList(res.list, res.cnt);
				drawPaging(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	//고객목록
	function drawList(list, cnt) {
		var html = "";
		if (cnt == 0) {
			html += "<tr>";
			html += "<td colspan=\"5\">데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
			for (var i = 0; i < list.length; i++) {
				html += "<tr name=\"" + list[i].CUST_NO + "\">";
				html += "<td>" + list[i].CUST_NO + "</td>";
				html += "<td>" + list[i].NM + "</td>";
				html += "<td>" + list[i].BIRTH + "</td>";
				html += "<td>" + list[i].SEX_NM + "</td>";
				html += "<td>" + list[i].CELL_NO + "</td>";
				html += "<td>" + list[i].EMAIL + "@" + list[i].EMAILADDR + "</td>";
				html += "<td>" + list[i].ADDR + "</td>";
				html += "</tr>";
			}
		}

		$("tbody").html(html);
	}

	//페이징
	function drawPaging(pb) {
		var html = "";

		if ($("#page").val() == 1) {
			html += "<div class=\"arrow prev\" name=\"1\"></div>";
		} else {
			html += "<div class=\"arrow prev\" name =\""
					+ ($("#page").val() - 1) + "\"></div> ";
		}

		for (var i = pb.startPcount; i <= pb.endPcount; i++) {
			if ($("#page").val() == i) {
				html += "<div class=\"page_on\" name=\"" + i + "\">" + i
						+ "</b></div> ";
			} else {
				html += "<div class=\"page\" name=\"" + i + "\">" + i
						+ "</div> ";
			}
		}

		if ($("#page").val() == pb.maxPcount) {
			html += "<div name =\"" +pb.maxPcount + "\"></div>";
		} else {
			html += "<div class=\"arrow next\" name =\""
					+ ($("#page").val() * 1 + 1) + "\"></div> ";
		}

		$(".page_nation").html(html);
	}
	
	//고객정보 추가 아작스, 수신동의 아작스
	function addcust() {
		var params = $("#custAddForm").serialize();
		console.log(params);
		$.ajax({
			type : "post",
			url : "popcustAddAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				$("#custnoseq").val(res.custnoseq);
				if (res.res == "SUCCESS") {
					if($("#sms").val() == 1){
						$("#channm").val(1);
						console.log($("#channm").val());
						addcustchan();
					}if($("#kakao").val() == 2){
						console.log($("#channm").val());
						$("#channm").val(2);
						addcustchan();
					}if($("#chanemail").val() == 4){
						console.log($("#channm").val());
						$("#channm").val(4);									
						addcustchan();
					}
					reloadList();
					alert("저장되었습니다.");
				} 
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	//고객정보 추가 아작스, 수신동의 아작스
	function addcustchan() {
		var params = $("#custAddForm").serialize();
		console.log(params);
		$.ajax({
			type : "post",
			url : "popcustchanAddAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				if (res.res == "SUCCESS") {
					alert("저장되었습니다.");
				} 
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	//고객정보 추가 아작스, 수신동의 아작스
	function addcustchan1() {
		var params = $("#custUpdateForm").serialize();
		$.ajax({
			type : "post",
			url : "popcustchan1AddAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				if (res.res == "SUCCESS") {
					alert("저장되었습니다.");
				} 
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	//상세보기 아작스
	function popcustDetail() {
		var params = $("#actionForm").serialize();
		console.log(params);
		$.ajax({
			type : "post",
			url : "custDetailAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				detailpoplist(res.data,res.list)
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	//상세보기
	function detailpoplist(data,list) {
		$("#detlcustno").val(data.CUST_NO);
		$("#custnm").val(data.NM);
		$("#birth").val(data.BIRTH);
		$("#telno").val(data.TEL_NO);
		$("#cellno").val(data.CELL_NO);
		$("#email").val(data.EMAIL+ "@" +data.EMAILADDR);
		$("#sample4_postcode").val(data.POST_NO);
		$("#sample4_roadAddress").val(data.ADDR);
		$("#sample4_jibunAddress").val(data.DETL_ADDR);
		$("#memo").val(data.MEMO);
		if (data.SEX == 0) {
			$("#man").prop("checked",true);
		}else {
			$("#woman").prop("checked",true);
		}
		for(var i=0;i<list.length;i++){
			if (list[i].CHAN_TYPE_NO == 1) {
				$("#sms2").prop("checked", true);
				$("#sms2").val(1);
			} else if(list[i].CHAN_TYPE_NO == 2){
				$("#kakao2").prop("checked", true);
				$("#kakao2").val(2);
			} else if(list[i].CHAN_TYPE_NO == 4){
				$("#chanemail2").prop("checked", true);
				$("#chanemail2").val(4);
			}
		}
		
	}
	
	//수정 상세보기 아작스
	function updatecust(data) {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "custDetailAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				updatepoplist(res.data,res.list);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	//수정 상세보기
	function updatepoplist(data,list) {
		$("#custUpdateForm #detlcustno").val(data.CUST_NO);
		$("#custUpdateForm #custnoseq3").val(data.CUST_NO);
		$("#custUpdateForm #custnm").val(data.NM);
		$("#custUpdateForm #birth").val(data.BIRTH);
		$("#custUpdateForm #telno").val(data.TEL_NO);
		$("#custUpdateForm #cellno").val(data.CELL_NO);
		$("#custUpdateForm #email").val(data.EMAIL);
		$("#custUpdateForm #emailaddr").val(data.EMAILADDR);
		$("#custUpdateForm #sample4_postcode").val(data.POST_NO);
		$("#custUpdateForm #sample4_roadAddress").val(data.ADDR);
		$("#custUpdateForm #sample4_jibunAddress").val(data.DETL_ADDR);
		$("#custUpdateForm #memo").val(data.MEMO);
		console.log(data.MEMO);
		if (data.SEX == 0) {
			$("#custUpdateForm #man").prop("checked",true);
		}else {
			$("#custUpdateForm #woman").prop("checked",true);
		}
		for(var i=0;i<list.length;i++){
			if (list[i].CHAN_TYPE_NO == 1) {
				$("#sms3").prop("checked", true);
				$("#sms3").val(1);
			} else if(list[i].CHAN_TYPE_NO == 2){
				$("#kakao3").prop("checked", true);
				$("#kakao3").val(2);
			} else if(list[i].CHAN_TYPE_NO == 4){
				$("#chanemail3").prop("checked", true);
				$("#chanemail3").val(4);
			}
		}
	}
	
	//수정 아작스
	function saveupdatecust(data) {
		var params = $("#custUpdateForm").serialize();
		$.ajax({
			type : "post",
			url : "custUpdateAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				if($("#sms3").val() == 1){
					$("#channm1").val(1);
					addcustchan1();
				}if($("#kakao3").val() == 2){
					$("#channm1").val(2);
					addcustchan1();
				}if($("#chanemail3").val() == 4){
					$("#channm1").val(4);									
					addcustchan1();
				}
				alert("정보가 변경되었습니다.");
				reloadList();
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	
	//detail팝업
	function detailpop() {
		var html = "";   
		var params = $("#actionForm").serialize();
			
	html +=	"	<form action=\"#\" method=\"post\" id=\"custUpdateForm1\">";
	html += "	<input type=\"hidden\" id=\"sEmpNo\" name=\"sEmpNo\" value=\"${sEmpNo}\" />";
	html += "	<input type=\"hidden\" id=\"detlcustno\" name=\"custno\" />";
	html +=	"	<div class=\"popup_contents\">";
	html += "	<input type=\"hidden\" name=\"custnoseq2\" id=\"custnoseq2\" />";
			/////고객이름/////                                                                   
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">이름 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" name=\"custnm\" id=\"custnm\" style=\"border:0;\" readonly=\"readonly\"/>";
	html +=	"			</div>";
	html +=	"		</div>";
		/////생년월일/////                                                                   
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">생년월일 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"date\" name=\"birth\" id=\"birth\" style=\"border:0;\" readonly=\"readonly\"/>";
	html +=	"			</div>";
	html +=	"		</div>";
		/////성별/////                                                                       
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">성별 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"radio\" value=\"0\" name=\"sex\" id=\"man\" checked=\"checked\"  />남성 ";	
	html += "				<input type=\"radio\" value=\"1\" name=\"sex\" id=\"woman\" />여성";
	html +=	"			</div>";
	html +=	"		</div>";
			/////전화번호/////                                                                    
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">전화번호</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" name=\"telno\" id=\"telno\"  size=\"30\" style=\"border:0;\" readonly=\"readonly\"/> ";
	html +=	"			</div>";
	html +=	"		</div>";
		/////휴대전화번호/////                                                              
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">휴대 전화번호 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" name=\"cellno\" id=\"cellno\" placeholder=\"전화번호 '-'를 제외하고 입력\" size=\"30\" style=\"border:0;\" readonly=\"readonly\" /> ";
	html +=	"			</div>";
	html +=	"		</div>";
			/////이메일/////                                                                   
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">이메일 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" name=\"email\" id=\"email\" style=\"border:0;\" readonly=\"readonly\" class=\"email\" /> <input type=\"hidden\" name=\"emailaddr\" id=\"emailaddr\" placeholder=\"직접입력\" />";
	html +=	"					<select class=\"selectbox\" id=\"email_selectbox\" style=\"display:none\" name=\"email_selectbox\">";
	html +=	"					<option value=\"1\" selected=\"selected\">이메일 선택</option>";
	html +=	"					<option value=\"naver.com\">naver.com</option>";
	html +=	"					<option value=\"gmail.com\">gmail.com</option>";
	html +=	"					<option value=\"yahoo.co.kr\">yahoo.co.kr</option>";
	html +=	"					<option value=\"nate.com\">nate.com</option>";
	html +=	"					<option value=\"korea.com\">korea.com</option>";
	html +=	"				</select>";
	html +=	"			</div>";
	html +=	"		</div>";
			/////주소/////                                                                  
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">주소 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" name=\"ENTP_ADDR1\" id=\"sample4_postcode\" value=\"${ENTP_ADDR1}\" style=\"border:0;\" readonly=\"readonly\" placeholder=\"우편번호\">";
	html +=	"		</div>"+" <br>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" class=\"address\" name=\"ENTP_ADDR2\" id=\"sample4_roadAddress\" style=\"border:0;\" readonly=\"readonly\" placeholder=\"도로명주소\">";
	html +=	"			</div>"+" <br>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" class=\"address\" name=\"ENTP_ADDR3\" id=\"sample4_jibunAddress\" style=\"border:0;\" readonly=\"readonly\" placeholder=\"지번주소\">";
	html +=	"			<span id=\"guide\" style=\"color:#999\"></span>";
	html +=	"			</div>";
	html +=	"			</div>";
	/////수신동의/////                                                                    
			
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">수신 동의 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"		<input type=\"checkbox\" value=\"0\" id=\"sms2\"  />SMS ";
	html += "		<input type=\"checkbox\" value=\"0\" id=\"kakao2\"  />카카오톡 ";
	html +=	"		<input	type=\"checkbox\" value=\"0\" id=\"chanemail2\"  />이메일 ";
	html +=	"			</div>";
	html +=	"		</div>";
		/////메모/////                                                                        
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">메모</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<textarea rows=\"7\" name=\"memo\" id=\"memo\" style=\"border:0;\" readonly=\"readonly\" cols=\"80\"></textarea>";
	html +=	"			</div>";
	html +=	"		</div>";
	html +=	"	</div>";
	html +=	"	</form>";
		                          
	                                                                                                             
		return html;                                                                                             

	}
	
	//수정 팝업
	function updatepop() {
		var html = "";   
		var params = $("#actionForm").serialize();
			
	html +=	"	<form action=\"#\" method=\"post\" id=\"custUpdateForm\">";
	html += "	<input type=\"hidden\" id=\"sEmpNo\" name=\"sEmpNo\" value=\"${sEmpNo}\" />";
	html += "	<input type=\"hidden\" id=\"detlcustno\" name=\"custno\" />";
	html +=	"	<div class=\"popup_contents\" id=\"popup_contents\">";
	html += "	<input type=\"hidden\" name=\"custnoseq3\" id=\"custnoseq3\" />";
	html += "	<input type=\"hidden\" name=\"channm1\" id=\"channm1\" />";
			/////고객이름/////                                                                   
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">이름 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" name=\"custnm\" id=\"custnm\" />";
	html +=	"			</div>";
	html +=	"		</div>";
		/////생년월일/////                                                                   
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">생년월일 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"date\" name=\"birth\" id=\"birth\" />";
	html +=	"			</div>";
	html +=	"		</div>";
		/////성별/////                                                                       
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">성별 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"radio\" value=\"0\" name=\"sex\" id=\"man\" checked=\"checked\"  />남성 ";	
	html += "				<input type=\"radio\" value=\"1\" name=\"sex\" id=\"woman\" />여성";
	html +=	"			</div>";
	html +=	"		</div>";
			/////전화번호/////                                                                    
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">전화번호</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" name=\"telno\" id=\"telno\" placeholder=\"전화번호 '-'를 제외하고 입력\"  size=\"30\" /> ";
	html +=	"			</div>";
	html +=	"		</div>";
		/////휴대전화번호/////                                                              
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">휴대 전화번호 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" name=\"cellno\" id=\"cellno\" placeholder=\"전화번호 '-'를 제외하고 입력\" size=\"30\" /> ";
	html +=	"			</div>";
	html +=	"		</div>";
			/////이메일/////                                                                   
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">이메일 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" name=\"email\" id=\"email\" class=\"email\" /> @ <input type=\"text\" name=\"emailaddr\" id=\"emailaddr\" placeholder=\"직접입력\" />";
	html +=	"					<select class=\"selectbox\" id=\"email_selectbox\" onchange=\"email_change() name=\"emailaddr\">";
	html +=	"					<option value=\"1\" selected=\"selected\">이메일 선택</option>";
	html +=	"					<option value=\"naver.com\">naver.com</option>";
	html +=	"					<option value=\"gmail.com\">gmail.com</option>";
	html +=	"					<option value=\"yahoo.co.kr\">yahoo.co.kr</option>";
	html +=	"					<option value=\"nate.com\">nate.com</option>";
	html +=	"					<option value=\"korea.com\">korea.com</option>";
	html +=	"				</select>";
	html +=	"			</div>";
	html +=	"		</div>";
			/////주소/////                                                                  
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">주소 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" name=\"ENTP_ADDR1\" id=\"sample4_postcode\" value=\"${ENTP_ADDR1}\" placeholder=\"우편번호\">";
	html +=	"		</div>"+" <br>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" class=\"address\" name=\"ENTP_ADDR2\" id=\"sample4_roadAddress\" placeholder=\"도로명주소\">";
	html +=	"				<input type=\"button\" onclick=\"sample4_execDaumPostcode()\" value=\"주소 찾기\"> "+" <br>";
	html +=	"			</div>"+" <br>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" class=\"address\" name=\"ENTP_ADDR3\" id=\"sample4_jibunAddress\" placeholder=\"지번주소\">";
	html +=	"				<input type=\"text\" name=\"ENTP_ADDR4\" id=\"sample4_leftAddress\" placeholder=\"나머지주소\">";
	html +=	"			<span id=\"guide\" style=\"color:#999\"></span>";
	html +=	"			</div>";
	html +=	"			</div>";
	/////수신동의/////                                                                    
			
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">수신 동의 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"		<input type=\"checkbox\" value=\"0\" id=\"sms3\"  />SMS ";
	html += "		<input type=\"checkbox\" value=\"0\" id=\"kakao3\"  />카카오톡 ";
	html +=	"		<input	type=\"checkbox\" value=\"0\" id=\"chanemail3\"  />이메일 ";
	html +=	"			</div>";
	html +=	"		</div>";
		/////메모/////                                                                        
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">메모</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<textarea rows=\"7\" name=\"memo\" id=\"memo\" cols=\"80\"></textarea>";
	html +=	"			</div>";
	html +=	"		</div>";
	html +=	"	</div>";
	html +=	"	</form>";
		                          
	                                                                                                             
		return html;                                                                                             

	}
	
	//추가 팝업
	function addpop() {
		var html = "";   
		
			
	html +=	"	<form action=\"#\" method=\"post\" name=\"custAddForm\" id=\"custAddForm\">";
	html += "	<input type=\"hidden\" id=\"sEmpNo\" name=\"sEmpNo\" value=\"${sEmpNo}\" />";
	html +=	"	<div class=\"popup_contents\">";
	html += "	<input type=\"hidden\" name=\"custnoseq\" id=\"custnoseq\" />";
	html += "	<input type=\"hidden\" name=\"channm\" id=\"channm\" />";
			/////고객이름/////                                                                   
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">이름 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" name=\"custnm\" id=\"custnm\" />";
	html +=	"		</div>";
	html +=	"	</div>";
		/////생년월일/////                                                                   
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">생년월일 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"date\" name=\"birth\" id=\"birth\" />";
	html +=	"			</div>";
	html +=	"		</div>";
		/////성별/////                                                                       
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">성별 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"radio\" value=\"0\" name=\"sex\" id=\"sex\" checked=\"checked\" />남성 ";	
	html += "				<input type=\"radio\" value=\"1\" name=\"sex\" id=\"sex\" />여성";
	html +=	"			</div>";
	html +=	"		</div>";
			/////전화번호/////                                                                    
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">전화번호</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" name=\"telno\" id=\"telno\" placeholder=\"전화번호 '-'를 제외하고 입력\" size=\"30\" /> ";
	html +=	"			</div>";
	html +=	"		</div>";
		/////휴대전화번호/////                                                              
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">휴대 전화번호 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" name=\"cellno\" id=\"cellno\" placeholder=\"전화번호 '-'를 제외하고 입력\" size=\"30\" /> ";
	html +=	"			</div>";
	html +=	"		</div>";
			/////이메일/////                                                                   
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">이메일 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" name=\"email\" id=\"email\" class=\"email\" onfocus=\"this.value='';\" /> @ <input type=\"text\" class id=\"email2\" value=\"\" disabled placeholder=\"직접입력\" />";
	html +=	"					<select class=\"selectbox\" id=\"email\" name=\"emailaddr\" onchange=\"email_change()\">";
	html +=	"					<option value=\"0\" selected=\"selected\">이메일 선택</option>";
	html +=	"					<option value=\"9\" \">직접입력</option>";
	html +=	"					<option value=\"naver.com\">naver.com</option>";
	html +=	"					<option value=\"gmail.com\">gmail.com</option>";
	html +=	"					<option value=\"yahoo.co.kr\">yahoo.co.kr</option>";
	html +=	"					<option value=\"nate.com\">nate.com</option>";
	html +=	"					<option value=\"korea.com\">korea.com</option>";
	html +=	"				</select>";
	html +=	"			</div>";
	html +=	"		</div>";
			/////주소/////                                                                  
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">주소 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" name=\"ENTP_ADDR1\" id=\"sample4_postcode\" placeholder=\"우편번호\">";
	html +=	"		</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" class=\"inline\" name=\"ENTP_ADDR2\" id=\"sample4_roadAddress\" placeholder=\"도로명주소\">";
	html +=	"				<input type=\"button\" onclick=\"sample4_execDaumPostcode()\" value=\"주소 찾기\"> "+" <br>";
	html +=	"			</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<input type=\"text\" name=\"ENTP_ADDR3\" class=\"inline\" id=\"sample4_jibunAddress\" placeholder=\"지번주소\">";
	html +=	"				<input type=\"text\" name=\"ENTP_ADDR4\" id=\"sample4_leftAddress\" placeholder=\"나머지주소\">";
	html +=	"			<span id=\"guide\" style=\"color:#999\"></span>";
	html +=	"			</div>";
	html +=	"			</div>";
	/////수신동의/////                                                                    
			
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">수신 동의 *</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"		<input type=\"checkbox\" id=\"sms\" value=\"0\" />SMS ";
	html += "		<input type=\"checkbox\" id=\"kakao\" value=\"0\"  />카카오톡 ";
	html +=	"		<input	type=\"checkbox\" id=\"chanemail\" value=\"0\" />이메일 ";
	html +=	"			</div>";
	html +=	"		</div>";
		/////메모/////                                                                        
	html +=	"		<div class=\"underline\">";
	html +=	"			<div class=\"line1\">메모</div>";
	html +=	"			<div class=\"con1\">";
	html +=	"				<textarea rows=\"7\" name=\"memo\" id=\"memo\" cols=\"80\"></textarea>";
	html +=	"			</div>";
	html +=	"		</div>";
	html +=	"	</div>";
	html +=	"	</form>";
		                          
	                                                                                                             
		return html;                                                                                             

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
		<div class="contents_header_txt">고객 목록</div>
	</div>

	<!-- Contents -->
	<div class="contents_area">
		<div class="contents">
			<!-- 여기에 내용을 작성하시오. -->
			<form action="#" method="post" id="actionForm">
				<input type="hidden" id="top" name="top" value="${param.top}" /> 
				<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
				<input type="hidden" id="detlcustno" name="custno" value="${custno}" />
					 <input type="hidden" name="page" id="page" value="${page}" />
				<div class="default_search_area">
					<select name="searchGbn">
						<option value="0">이름</option>
						<option value="1">전화번호</option>
					</select> <input type="text" class="searchcust" id="searchTxt"
						name="searchTxt" placeholder="검색어" value="${param.searchTxt}"/>
					<img id="searchBtn" class="sear_img"
						src="resources/images/crm/campaign/search.png">
					<div class="search_btn_area">
						<input type="button" class="register_cust" id="custBtn"
							value="고객등록" /> <input type="button" class="reset_cust_list"
							id="resetBtn" value="새로고침" />
					</div>
				</div>
			</form>
			<div class="default_board">
				<table class="cust_list_table">
					<thead>
						<tr>
							<th>고객번호</th>
							<th>이름</th>
							<th>생년월일</th>
							<th>성별</th>
							<th>휴대전화번호</th>
							<th>이메일</th>
							<th>주소</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div class="page_wrap">
					<div class="page_nation"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>

