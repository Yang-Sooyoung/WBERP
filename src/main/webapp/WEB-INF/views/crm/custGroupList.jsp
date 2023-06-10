<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP 공용 템플릿</title>
<style type="text/css">

/* 개별 css는 여기에 */
.default_board {
	width: 100% !important;
}

.cust_menu1 {
	height: 30px;
}

.cust_menu1_center {
	position: relative;
	width: 1300px;
	height: 30px;
	margin: 0 auto;
}

.groupnm, .cust_menu1_chan, .cust_menu1_date, .cust_menu1_age, .cust_menu1_area, .cust_menu1_check, .cust_menu1_search, .cust_menu1_reset, .cust_menu1_newcust {
	display: inline-block;
	vertical-align: top;
	margin-left: 10px;
	height: 18px;
}

.cam_menu1_newcam {
	display: inline-block;
	vertical-align: top;
	margin-left: 20px;
}

.cust_chan_select {
	height: 25px;
}

.groupnm {
	width: 130px;
	font-size: 12px;
}

.cust_menu1_date {
	font-size: 12px;
	margin-left: 10px;
}

.cust_menu1_age {
	font-size: 12px;
}

.age {
	width: 50px;
	height: 18px;
	font-size: 11px;
}

.reset_img {
	width: 30px;
	height: 25px;
	cursor: pointer;
}

.cust_menu1_select {
	width: 100px;
	height: 25px;
	text-align-last: center;
}

.cust_group_list {
	margin-top: 30px;
	width: 100%;
	border-collapse: collapse;
}

.cust_group_list table th {
	color: #3c3c3d;
	font-size: 11pt;
}

table tbody tr:hover {
	background-color: #4AA2D9;
}

.cust_group_list {
	border-top: 2px solid #000000;
}

.cust_group_list td, th {
	font-size: 11px;
	text-align: center;
	border-bottom: 1px solid #000000;
	padding: 10px;
}

.cust_menu1_search {
	display: inline-block;
	vertical-align: top;
}

.sear_img {
	width: 30px;
	height: 25px;
	cursor: pointer;
}

.cust_menu1_check {
	width: 100px;
	font-size: 12px;
}

.newcust {
	cursor: pointer;
}
/* 팝업 크기변경 시 */
.pop_cus_field, .pop_cus_list1, .pop_cus_list2 {
	display: inline-block;
	vertical-align: top;
}

.pop_customer {
	width: 100%;
	height: 310px;
	border-bottom: 1px solid #9aa9bd;
}

.pop_cus_field {
	width: 400px;
	height: 100%;
}

.pop_cus_list2 {
	width: 300px;
	height: 100%;
}

.cus_list1 {
	border: 1px solid #9aa9bd;
	width: 300px;
	height: 288px;
	overflow-y: scroll;
}

.cus_field {
	font-size: 13px;
	margin-top: 15px;
}

.customer2 {
	margin-top: 3px;
	margin-left: 5px;
}

.customer2:hover {
	background-color: #4AA2D9;
}

.pop_cus_field>.underline>.con1 {
	width: 285px;
}

.del_but_inline {
	display: inline-block;
	vertical-align: top;
}

.del_but {
	position: absolute;
	left: 765px;
	width: 30px;
	height: 30px;
	cursor: pointer;
	margin-top: 5px;
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<script type="text/javascript">
	var cdFlag1 = false;
	var cdFlag2 = false;
	$(document).ready(function() {
		SelectAll();

		//검색버튼
		$("#searchBtn").on("click", function() {
			$("#page").val("1");
			reloadList();
		});

		//리셋버튼
		$("#resetBtn").on("click", function() {
			$("#groupnm").val("");
			$("#startdate").val("");
			$("#enddate").val("");
			$("#minage").val("");
			$("#maxage").val("");
			$("#selectarea").val("-1");
			$("#sex").val("");
			reloadList();
		});

		//페이징
		$(".page_nation").on("click", "div", function() {
			$("#page").val($(this).attr("name"));
			reloadList();
		});

		//고객군등록팝업
		$("#custUpdateBtn").on("click", function() {
			popup1(addpop(), "추가");
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
			$("#email").on("click", function() {
				if ($("#email").is(":checked") == true) {
					$(this).val(4);
				} else {
					$(this).val(0);
				}
			});
		});

		//고객군 수정
		$("tbody").on("click", "tr", function() {
			$("#custgroupno").val($(this).attr("name"));
			popup2(updatepop(), "수정");
			$("#sms2").on("click", function() {
				if ($("#sms2").is(":checked") == true) {
					$(this).val(1);
				} else {
					$(this).val(0);
				}
			});
			$("#kakao2").on("click", function() {
				if ($("#kakao2").is(":checked") == true) {
					$(this).val(2);
				} else {
					$(this).val(0);
				}
			});
			$("#email2").on("click", function() {
				if ($("#email2").is(":checked") == true) {
					$(this).val(4);
				} else {
					$(this).val(0);
				}
			});
		});

		
	});

	//팝업 함수
	function popup1(con, btnnm) {
		makeBtn2Popup(2, "고객군 정보", con, true, 430, 475, popSelectList(), btnnm,
				function() {
					if ($.trim($("#filtnm").val()) == "") {
						alert("고객군명을 입력해 주세요.");
						$("#filtnm").focus();
					}else if($.trim($("#kakao").val()) == 0 && $.trim($("#sms").val()) == 0 && $.trim($("#email").val()) == 0){
						alert("채널을 선택해 주세요.");
					}else {
						custFilt();
					}
					closePopup(2);
				}, "취소", function() {
					closePopup(2);
				});
	}
	//팝업 함수
	function popup2(con, btnnm) {
		makeBtn3Popup(3, "고객군 정보", con, true, 430, 475, pop2SelectList(), btnnm,
				function() {
					if ($.trim($("#filtnm2").val()) == "") {
						alert("고객군명을 입력해 주세요.");
						$("#filtnm").focus();
					}else if($.trim($("#kakao2").val()) == 0 && $.trim($("#sms2").val()) == 0 && $.trim($("#email2").val()) == 0){
						alert("채널을 선택해 주세요.");
					} else {
						custgroupupdate();
					}
					closePopup(3);
				}, "삭제", function() {
					if (confirm("삭제하시겠습니까?")) {
						custGroupDelete();
					}
					closePopup(3);
				}, "취소", function() {
					closePopup(3);
				});
	}
	
	
	//고객군 삭제
	function custGroupDelete() {
		var params = $("#custGroupUpdateForm").serialize();
		$.ajax({
			type : "post",
			url : "custGroupDeleteAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				if (res.res == "SUCCESS") {
					alert("삭제에 성공하였습니다.");
					reloadList();
				} else {
					alert("삭제에 실패하였습니다.");
				}
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	//팝업 수정 아작스
	function custGroupUpdate() {
		var params = $("#custGroupUpdateForm").serialize();

		$.ajax({
			type : "post",
			url : "custGroupUpdateAjax",
			dataType : "json", // {키:값, 키:값}
			data : params, //보낼데이터
			success : function(res) { //성공 시 해당 함수 실행. 결과는 res로 받겠다.
				if (res.res == "SUCCESS") {
					alert("저장에 성고하였습니다.");
					reloadList();
				} else {
					alert("저장에 실패하였습니다.");
				}
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	//지역목록
	function detailUpdate(data) {
		$("#custgroupno2").val(data.CUST_GROUP_FILT_NO);
		$("#filtnm2").val(data.CUST_GROUP_FILT_NM);
		$("#startrang2").val(data.CUST_JOIN_START_RANG);
		$("#endrang2").val(data.CUST_JOIN_END_RANG);
		$("#agemin2").val(data.AGE_MIN);
		$("#agemax2").val(data.AGE_MAX);
		$("#area2Select").val(data.AREA_NO);
		if (data.SEX == 0) {
			$("#man").prop("checked", true);
		} else {
			$("#woman").prop("checked", true);
		}
	}
	
	//지역목록
	function detail2Update(chanType) {
		for(var i=0;i<chanType.length;i++){
			if (chanType[i].CHAN_TYPE_NO == 1) {
				$("#sms2").prop("checked", true);
				$("#sms2").val(1);
			} else if(chanType[i].CHAN_TYPE_NO == 2){
				$("#kakao2").prop("checked", true);
				$("#kakao2").val(2);
			} else if(chanType[i].CHAN_TYPE_NO == 4){
				$("#email2").prop("checked", true);
				$("#email2").val(4);
			}
		}
		
	}

	//고객군 수정
	function custgroupupdate() {
		var params = $("#custGroupUpdateForm").serialize();
		$.ajax({
			type : "post",
			url : "custGroupUpdateAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				if (res.res == "SUCCESS") {
					alert("수정에 성공하였습니다.");
					$("#custgroupseq2").val($("#custgroupno").val());
					console.log($("#custgroupseq2").val());
					custChanUpdate();
					if($("#kakao2").val()==2){
						$("#chan2Select").val(2);
						custFiltChan2();
					}
					if($("#sms2").val()==1){
						$("#chan2Select").val(1);
						custFiltChan2();
					}
					if($("#email2").val()==4){
						$("#chan2Select").val(4);
						custFiltChan2();
					}
					reloadList();
				} else {
					alert("수정에 실패하였습니다.");
				}
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	//고객군 수정
	function custChanUpdate() {
		var params = $("#custGroupUpdateForm").serialize();
		$.ajax({
			type : "post",
			url : "custChanUpdateAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				if (res.res == "SUCCESS") {
				} else {
				}
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	//update팝업
	function updatepop(data) {
		var html = "";
		html += "<form action=\"#\" method=\"post\" id=\"custGroupUpdateForm\">";
		html += "<input type=\"hidden\" id=\"custgroupno2\" name=\"custgroupno2\" />";
		html += "<input type=\"hidden\" id=\"areano\" name=\"areano\" />";
		html += "<input type=\"hidden\" id=\"chan2Select\" name=\"chan2Select\"  />";
		html += "<input type=\"hidden\" id=\"custgroupseq2\" name=\"custgroupseq2\"  />";
		html += "<input type=\"hidden\" id=\"chantypeno\" name=\"chantypeno\" />";
		html += "<div id=\"filtno\" id=\"filtno\" class=\"pop_cus_field\">                                         ";
		html += "	<div class=\"underline\">                                             ";
		html += "		<div class=\"line1\">고객군명 *</div>                             ";
		html += "		<div class=\"con1\">                                              ";
		html += "			<input type=\"text\" name=\"filtnm2\" id=\"filtnm2\"/>                                       ";
		html += "		</div>                                                            ";
		html += "	</div>                                                                ";
		html += "	<div class=\"underline\">                                             ";
		html += "		<div class=\"line1\">채널</div>                                   ";
		html += "		<div class=\"con1\">                                              ";
		////////////////////////채널목록///////////////////////
		html+="	<input type=\"checkbox\" value=\"0\" id=\"kakao2\" name=\"chanCheck\">      ";
		html+="	카카오톡                                                                   ";
		html+="	<input type=\"checkbox\" value=\"0\" id=\"sms2\" name=\"chanCheck\">        ";
		html+="	sms                                                                        ";
		html+="	<input type=\"checkbox\" value=\"0\" id=\"email2\" name=\"chanCheck\">      ";
		html+="	email                                                                      ";
		/////////////////////////////////////////////////////
		html += "		</div>                                                            ";
		html += "	</div>                                                                ";
		html += "	<div class=\"underline\">                                             ";
		html += "		<div class=\"line1\">가입일</div>                                 ";
		html += "		<div class=\"con1\">                                              ";
		html += "			<input type=\"date\" id=\"startrang2\" name=\"startrang2\"/>                                       ";
		html += "			~                                                             ";
		html += "			<input type=\"date\" id=\"endrang2\" name=\"endrang2\"/>                                       ";
		html += "		</div>                                                            ";
		html += "	</div>                                                                ";
		html += "	<div class=\"underline\">                                             ";
		html += "		<div class=\"line1\">나이</div>                                   ";
		html += "		<div class=\"con1\">                                              ";
		html += "			<input id =\"agemin2\" name =\"agemin2\" class=\"ageTxt\" type=\"text\" placeholder=\"최소 나이\"/> ~ ";
		html += "			<input id =\"agemax2\" name =\"agemax2\" class=\"ageTxt\" type=\"text\" placeholder=\"최대 나이\"/>    ";
		html += "		</div>                                                            ";
		html += "	</div>                                                                ";
		html += "	<div class=\"underline\">               ";
		html += "	<div class=\"line1\">지역</div>         ";
		html += "	<div class=\"con1\">                    ";
		///////////////////////////지역////////////////////////
		html += "		<select name=\"area2Select\" id =\"area2Select\">";
		html += "		</select>";
		/////////////////////////////////////////////////////
		html += "	</div>                                  ";
		html += "	</div>                                  ";
		html += "	<div class=\"underline\">                                             ";
		html += "		<div class=\"line1\">성별</div>                                   ";
		html += "		<div class=\"con1\">                                              ";
		html += "			<input type=\"radio\" id=\"man\" name=\"sex2\" value=\"0\"/>  ";
		html += "			남자                                                          ";
		html += "			<input type=\"radio\" id=\"woman\" name=\"sex2\"  value=\"1\"/>                      ";
		html += "			여자                                                          ";
		html += "		</div>                                                            ";
		html += "	</div>                                                                ";
		html += "</div>                                                                 ";
		html += "</form>";

		return html;
	}

	//팝업데이터아작스
	function popSelectList() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post",
			url : "popSelectListAjax",
			dataType : "json", // {키:값, 키:값}
			data : params, //보낼데이터
			success : function(res) { //성공 시 해당 함수 실행. 결과는 res로 받겠다.
				areaList(res.area);
				
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	//팝업데이터아작스
	function pop2SelectList() {
		var params = $("#actionForm").serialize();

		$.ajax({
			type : "post",
			url : "popSelectListAjax",
			dataType : "json", // {키:값, 키:값}
			data : params, //보낼데이터
			success : function(res) { //성공 시 해당 함수 실행. 결과는 res로 받겠다.
				area2List(res.area);
				detailUpdate(res.data);
				detail2Update(res.chanType);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	//지역목록
	function areaList(area) {
		var html = "";

		for (var i = 0; i < area.length; i++) {
			html += "<option  value=\"" + area[i].AREA_NO + "\">"
			html += area[i].AREA_NM + "</option>";
		}

		$("#areaSelect").html(html);

	}

	//지역목록
	function area2List(area) {
		var html = "";

		for (var i = 0; i < area.length; i++) {
			html += "<option  value=\"" + area[i].AREA_NO + "\">"
			html += area[i].AREA_NM + "</option>";
		}

		$("#area2Select").html(html);

	}

	//고객군 추가 아작스
	function custFilt() {
		var params = $("#custFiltAddForm").serialize();
		$.ajax({
			type : "post",
			url : "custFlitAddAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				if (res.res == "SUCCESS") {
					//alert("등록에 성공하셨습니다.");
					$("#custgroupseq").val(res.custgroupseq);
					console.log($("#custgroupseq").val());
					if($("#kakao").val()==2){
						$("#chanSelect").val(2);
						custFiltChan();
					}
					if($("#sms").val()==1){
						$("#chanSelect").val(1);
						custFiltChan();				
					}
					if($("#email").val()==4){
						$("#chanSelect").val(4);
						custFiltChan();				
					}
					reloadList();
				} else {
					alert("등록에 실패하였습니다.");
				}
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	//고객군 채널 추가 아작스
	function custFiltChan() {
		var params = $("#custFiltAddForm").serialize();
		$.ajax({
			type : "post",
			url : "custFlitChanAddAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				if (res.res == "SUCCESS") {
					//alert("등록에 성공하셨습니다.");
				} else {
					alert("등록에 실패하였습니다.");
				}
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	//고객군 채널 추가 아작스
	function custFiltChan2() {
		var params = $("#custGroupUpdateForm").serialize();
		$.ajax({
			type : "post",
			url : "custFlitChanAdd2Ajax",
			dataType : "json",
			data : params,
			success : function(res) {
				if (res.res == "SUCCESS") {
					//alert("등록에 성공하셨습니다.");
				} else {
					alert("등록에 실패하였습니다.");
				}
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	//add팝업
	function addpop() {
		var html = "";

		html += "<form action=\"#\" method=\"post\" id=\"custFiltAddForm\">";
		html += "<input type=\"hidden\" id=\"custgroupseq\" name=\"custgroupseq\"  />";
		html += "<input type=\"hidden\" id=\"chanSelect\" name=\"chanSelect\"  />";
		html += "<div id=\"filtno\" id=\"filtno\" class=\"pop_cus_field\">                                         ";
		html += "	<div class=\"underline\">                                             ";
		html += "		<div class=\"line1\">고객군명 *</div>                             ";
		html += "		<div class=\"con1\">                                              ";
		html += "			<input type=\"text\" name=\"filtnm\" id=\"filtnm\"/>                                       ";
		html += "		</div>                                                            ";
		html += "	</div>                                                                ";
		html += "	<div class=\"underline\">                                             ";
		html += "		<div class=\"line1\">채널</div>                                   ";
		html += "		<div class=\"con1\">                                              ";
		////////////////////////채널목록///////////////////////
		html+="	<input type=\"checkbox\" value=\"0\" id=\"kakao\" name=\"chanCheck\">      ";
		html+="	카카오톡                                                                   ";
		html+="	<input type=\"checkbox\" value=\"0\" id=\"sms\" name=\"chanCheck\">        ";
		html+="	sms                                                                        ";
		html+="	<input type=\"checkbox\" value=\"0\" id=\"email\" name=\"chanCheck\">      ";
		html+="	email                                                                      ";
		/////////////////////////////////////////////////////
		html += "		</div>                                                            ";
		html += "	</div>                                                                ";
		html += "	<div class=\"underline\">                                             ";
		html += "		<div class=\"line1\">가입일</div>                                 ";
		html += "		<div class=\"con1\">                                              ";
		html += "			<input type=\"date\" name=\"startrang\"/>                                       ";
		html += "			~                                                             ";
		html += "			<input type=\"date\" name=\"endrang\"/>                                       ";
		html += "		</div>                                                            ";
		html += "	</div>                                                                ";
		html += "	<div class=\"underline\">                                             ";
		html += "		<div class=\"line1\">나이</div>                                   ";
		html += "		<div class=\"con1\">                                              ";
		html += "			<input name =\"agemin\" class=\"ageTxt\" type=\"text\" placeholder=\"최소 나이\"/> ~ ";
		html += "			<input name =\"agemax\" class=\"ageTxt\" type=\"text\" placeholder=\"최대 나이\"/>    ";
		html += "		</div>                                                            ";
		html += "	</div>                                                                ";
		html += "	<div class=\"underline\">               ";
		html += "	<div class=\"line1\">지역</div>         ";
		html += "	<div class=\"con1\">                    ";
		///////////////////////////지역////////////////////////
		html += "		<select name=\"areaSelect\" id =\"areaSelect\">";
		html += "		</select>";
		/////////////////////////////////////////////////////
		html += "	</div>                                  ";
		html += "	</div>                                  ";
		html += "	<div class=\"underline\">                                             ";
		html += "		<div class=\"line1\">성별</div>                                   ";
		html += "		<div class=\"con1\">                                              ";
		html += "			<input type=\"radio\" name=\"sex\" checked=\"checked\" value=\"0\"/>  ";
		html += "			남자                                                          ";
		html += "			<input type=\"radio\" name=\"sex\"  value=\"1\"/>                      ";
		html += "			여자                                                          ";
		html += "		</div>                                                            ";
		html += "	</div>                                                                ";
		html += "</div>                                                                 ";
		html += "</form>";

		return html;
	}

	//셀렉트박스
	function SelectAll() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "popSelectListAjax",
			dataType : "json", // {키:값, 키:값}
			data : params, //보낼데이터
			success : function(res) { //성공 시 해당 함수 실행. 결과는 res로 받겠다.
				selectAllist(res.area, res.chan);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	//목록
	function selectAllist(area, chan) {
		var html = "";

		html += "<option value=\"-1\">--지역--</option>";
		for (var i = 0; i < area.length; i++) {
			html += "<option  value=\"" + area[i].AREA_NO + "\">"
			html += area[i].AREA_NM + "</option>";
		}

		$("#selectarea").html(html);
		cdFlag1 = true;
		var html = "";

		html += "<option value=\"-1\">--채널--</option>";
		for (var i = 0; i < chan.length; i++) {
			html += "<option  value=\"" + chan[i].CHAN_TYPE_NO + "\">"
			html += chan[i].CHAN_TYPE + "</option>";
		}

		cdFlag2 = true;

		if (cdFlag1 && cdFlag2) {
			reloadList();
			cdFlag1 = false;
			cdFlag2 = false;
		}
	}

	//첫화면
	function reloadList() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "custGroupListAjax",
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

	//목록
	function drawList(list, cnt) {
		var html = "";
		if (cnt == 0) {
			html += "<tr>";
			html += "<td colspan=\"6\">데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
			for (var i = 0; i < list.length; i++) {
				html += "<tr name=\"" + list[i].CUST_GROUP_FILT_NO + "\">";
				html += "<td>" + list[i].CUST_GROUP_FILT_NM + "</td>";
				if (list[i].CUST_JOIN_START_RANG != null
						&& list[i].CUST_JOIN_END_RANG != null) {
					html += "<td>" + list[i].CUST_JOIN_START_RANG + " ~ "
							+ list[i].CUST_JOIN_END_RANG + "</td>";
				} else {
					html += "<td>데이터가 없습니다.</td>";
				}
				if (list[i].AGE_MIN != null && list[i].AGE_MAX != null) {
					html += "<td>" + list[i].AGE_MIN + "세" + " ~ "
							+ list[i].AGE_MAX + "세" + "</td>";
				} else {
					html += "<td>데이터가 없습니다.</td>";
				}
				if (list[i].AREA_NM != null) {
					html += "<td>" + list[i].AREA_NM + "</td>";
				} else {
					html += "<td>데이터가 없습니다.</td>";
				}
				if (list[i].SEX_NM != null) {
					html += "<td>" + list[i].SEX_NM + "</td>";
				} else {
					html += "<td>데이터가 없습니다.</td>";
				}
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
		<div class="contents_header_txt">고객군 목록</div>
	</div>
	<!-- Contents -->
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 메뉴 시작 -->
		<form action="#" method="post" id="actionForm">
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="page" id="page" value="${page }" />
			<input type="hidden" id="custgroupno" name="custgroupno" value="1" />
			<div class="cust_menu1">
				<div class="cust_menu1_center">
					고객군명
					<input type="text" class="groupnm" id="groupnm" name="groupnm" placeholder="고객군명" />
					<div class="cust_menu1_date">
						가입기간
						<input id="startdate" name="startdate" type="date" min="2015-01-01" max="2021-12-31" />
						~
						<input id="enddate" name="enddate" type="date" min="2015-01-01" max="2021-12-31" />
					</div>
					<div class="cust_menu1_age">
						<input type="text" class="age" id="minage" name="minage" placeholder="최소나이" />
						~
						<input type="text" class="age" id="maxage" name="maxage" placeholder="최대나이" />
					</div>
					<div class="cust_menu1_area">
						<select class="cust_menu1_select" name="selectarea" id="selectarea">

						</select>
					</div>
					<div class="cust_menu1_check">
						<label><input type="radio" checked="checked" name="sex" value="0" />남성</label> <label><input type="radio" name="sex" value="1" />여성</label>
					</div>
					<div class="cust_menu1_search">
						<img id="searchBtn" class="sear_img" src="resources/images/crm/campaign/search.png">
					</div>
					<div class="cust_menu1_reset">
						<img id="resetBtn" class="reset_img" src="resources/images/crm/campaign/reset.png">
					</div>
					<div class="cam_menu1_newcam">
						<input id="custUpdateBtn" type="button" value="고객군 등록" class="newcam" />
					</div>
				</div>
			</div>
		</form>
		<!-- 메뉴 끝 -->
		<!-- 고객군 목록 시작 -->
		<div class="default_board">
			<table class="cust_group_list">
				<thead>
					<tr class="top">
						<th>고객군명</th>
						<th>가입기간</th>
						<th>나이</th>
						<th>지역</th>
						<th>성별</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
		<!-- 캠페인 목록 끝 -->
		<div class="page_wrap">
			<div class="page_nation"></div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>

</body>
</html>
