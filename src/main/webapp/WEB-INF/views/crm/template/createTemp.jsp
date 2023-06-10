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
/* 개별 css는 여기에 */
html, body {
	font-size: 0pt;
	margin: 0px;
	position: relative;
	width: 100%;
	height: 100%;
	min-width: 1280px;
}

.ctem_top {
	display : inline-block;
	height : 110px;
	width : 100%;
	font-size : 11pt;
}

.choose {
	padding-top : 25px;
	height : 30px;
}

.name {
	padding-top : 14px;
	height : 30px;
}

.channel {
	display : inline-block;
	height : 30px;
}

.txt_ch {
	display : inline-block;
	height : 30px;
	width : 100px;
	text-align : center;
}

.select_ch {
	display : inline-block;	
	height : 30px;
	width : 250px;
}

.category {
	display : inline-block;
	height : 30px;
	padding-right : 30px;
	text-align : right;
}

.txt_tem {
	display : inline-block;
	height : 30px;
	width : 243px;
	text-align : right;
	padding-right : 30px;
}

.select_cate {
	display : inline-block;
	height : 30px;
	width : 225px;
}


.cateAddBtn {
	width : 50px;
	height : 30px;
	background-color: #f7f7f7;
	font-size: 10pt;
	border-radius: 3px;
	margin: 0 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
	cursor: pointer;
}

.cate_addBtn:hover {
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}


.txt_name {
	display : inline-block;	
	height : 25px;
	width : 100px;
	font-size : 11pt;
	text-align : left;
	padding-top : 5px;
}

.tem_name_tbox {
	display : inline-block;
	vertical-align : top;
	height : 30px;
	width : 810px;
}

.ctem_middle {
	padding :10px 106px 0px !important;
	height : 430px;
}


.contents_top {
	padding : 30px 0px 35px 0px;
	height : 30px;
	margin-left : -61px;
}

.txt_title {
	display : inline-block;
	height : 30px;
	width : 60px;
	font-size : 11pt;
}

.tem_title_tbox {
	width :810px;
	height : 30px;
}

.contents_bottom {
	width : 900px;
	height : 250px;
}

.txt_contents {
	display : inline-block;
	width : 60px;
	font-size :11pt;
}

.tem_contents_tbox{
	width :650px;
	height: 200px;
	overflow : scroll;
}

.ctem_bottom {
	display : block;
	padding-left : 120px;
	width : 900px;
	height : 30px; 
	margin-bottom : 10px;
}

.ctem_bottom_plus {
	display : block;
	padding-left : 120px;
	width : 900px;
	height : 30px; 
	margin-bottom : 10px;
}

.txt_inputcont_area {
	display : inline-block;
}

.txt_inputcont {
	display : inline-block;
	width : 80px;
	height : 30px;
	font-size : 11pt;
	text-align : left;
	padding-bottom : 100px;
}

.num_area {
	display : inline-block;
	height : 30px;
	width : 280px;
}

.num_tbox {
	height : 30px;
	width : 230px;
	text-align : center;
}

.text_area{
	display : inline-block;
	height : 30px;
	width : 261px;
}

.resr_no {
	height : 37px;
	width : 230px;
}

.button_area {
	display : inline-block;
	heigth : 30px;
	width : 50px;
}

.detail_btn_area {
	display : inline-block;
	width : 184px;
}

.save_button {
	display : inline-block;
	padding-left : 30px;
	height : 30px;
	width : 120px;
}

.save_btn {
	width : 80px;
	height : 50px;
}

.addBtn_area {
	text-align : right;
	width : 932px;
}


.addBtn {
	min-width: 80px;
	height: 32px;
	background-color: #f7f7f7;
	font-size: 10pt;
	border-radius: 3px;
	margin-right : 10px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
	cursor: pointer;
}

.addBtn:hover {
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}

.cate_top {
	margin : 10px 0px;
}
.txt_catename {
	font-size : 12pt;
	display : inline-block;
}

.cate_tbox_area {
	display : inline-block;
	margin-left : 10px;
}
.cate_plusbtn_area {
	display : inline-block;
}

.cate_tbox {
	width : 130px;
	height : 23px;
	border-radius: 3px;
	margin-left : 10px;
	border: 1px solid #c2c2c2;
}

.page_wrap {
	width : 400px !important;
}

.cate_table {
	width : 400px;
}


</style>
<script type="text/javascript"
		src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
var resr_order = 1;
var flag = false;

$(document).ready(function() {
	CKEDITOR.replace("temp_cont", {
		resize_enabled : false,
		language : "ko",
		enterMode : "2",
		width : "815",
		height : "300"
	});	
	
	if('${param.select_ch}' != '') {
		$("#select_ch").val('${param.select_ch}');
	}
	if('${param.select_cate}' != '') {
		$("#select_cate").val('${param.select_cate}');
	}
	
	//채널, 카테고리 옵션 불러오기
	tempChanOptionAjax();
	tempCateOptionAjax();
	
	//이메일 선택시 제목 항목 추가, 제거 
	$("#select_ch").change(function() {
		
		if($(this).val() == 1 || 2 || 3 && flag == true){
			removeTitle();
		}
		
		if($(this).val() == 4 && flag == false){
			appendTitle();
		}
			
	});
	
	//카테고리 추가 버튼 팝업
	$(".cateAddBtn").on("click", function() {
		
		var html = "";

		html += "<form  action=\"#\" id = \"popupForm\" method = \"post\">"
		html +=	"<input type=\"hidden\" name=\"page\" id=\"page\" value=\"1\"/>"
		html += "<div class=\"default_board\">"
		html += "<table class=\"cateTable\">"
		html += "<colgroup>"
		html += "<col width=\"70px\" />"
		html += "<col width=\"330px\" />"
		html += "</colgroup>"
		html += "<thead>"
		html += "<tr class=\"top\">"
		html += "<th>번호</th>"
		html += "<th> 이름 </th>"
		html += "</tr>"
		html += "</thead>"
		html += "<tbody>"
		html += "</tbody>"
		html += "</table>"
		html += "<div class=\"page_wrap\">"
		html += "<div class=\"page_nation\">"
		html += "</div>"
		html += "</div>"
		html += "</div>"
		html += "<div class=\"cate_top\">"
		html += "<div class=\"txt_catename\">추가 카테고리명</div>"
		html += "<div class=\"cate_tbox_area\" id = \"cate_tbox_area\" name = \"cate_tbox_area\">"
		html += "<input type=\"text\" class=\"cate_tbox\" id=\"cate_tbox\" name=\"cate_tbox\"/>"
		html += "</div>"
		html += "</div>"
		html += "</form>"
		
		makeBtn2Popup(1, "카테고리 추가", html, false, 500, 400, function() {
			tempCateListAjax();
		}, "추가", function() {
			
			checkCateDuplAjax();
		}, "취소", function() {
			closePopup(1);
		});
	});
	
	//예약어 중복 선택 불가
	$(document).on('change', "#resr_no", function() {
		var clickVal = $(this).val();
		
		if(!checkSelectDupl(clickVal)) {
			$(this).val(0);
		}
	});

	//예약어 추가시 누른 플러스 버튼 숨기기
	$(document).on("click","#plus_btn",function(){
		drawResr();
		$(this).css('display', 'none');
	});	
	
	//예약어 제거시 이전 예약어에 추가 버튼 보이게 하기
	$(document).on("click","#mins_btn",function(){
		var detail_btn_area = $(this).parent().parent().prev().children(".detail_btn_area");
		if(typeof $(this).parent().parent().next().html() == "undefined") {
			detail_btn_area.children("#plus_btn").css('display', 'inline-block');
		}

		$(this).parent().parent().remove();
	}); 
	
	//목록으로
	$("#listBtn").on("click", function() {
		history.back();
	});
	
	//등록
	$(document).on("click", "#addBtn", function() {
		$("#temp_cont").val(CKEDITOR.instances['temp_cont'].getData());	
		//이메일일 경우 제목도 빈칸체크
		if($("#select_ch").val() == 4) {
			if($.trim($("#temp_nm").val()) == "") {
				alert("템플릿 이름을 입력해 주세요.");
				$("#temp_nm").focus();
			} else if($.trim($("#temp_title").val()) == "") {
				alert("제목을 입력해 주세요.");
				$("#temp_title").focus();
			} else if($.trim($("#temp_cont").val()) == "") {
				alert("내용을 입력해 주세요.");
				$("#temp_cont").focus();
			} else if(checkSelectNull()) {
				alert("예약어 내용을 선택해 주세요.");
			} else {
				mailAjax();
			}
		}
		
		else {
			if($.trim($("#temp_nm").val()) == "") {
				alert("템플릿 이름을 입력해 주세요.");
				$("#temp_nm").focus();
			} else if($.trim($("#temp_cont").val()) == "") {
				alert("내용을 입력해 주세요.");
				$("#temp_cont").focus();
			} else if(checkSelectNull()) {
				alert("예약어 내용을 선택해 주세요.");
			} else {
				mmsAjax();		
			}
			
	}
});
	
	$("#actionForm").on("keypress", "input", function(e) {
		if(e.keyCode == 13) {
			return false;
		}
	});
});

	//예약어 추가시 항목 그리기
	function drawResr() {
		var html = "";
		resr_order ++;
		
		html += "<div class=\"ctem_bottom_plus\">"
		html += "<div class=\"txt_inputcont_area\">"
		html += "<div class=\"txt_inputcont\">입력내용</div>"
		html += "</div>"
		html += "<div class=\"num_area\">"
		html += "<input type=\"text\" class=\"num_tbox\" name = \"resr_order" + resr_order + "\" id=\"resr_order" + resr_order + "\" value = \"{" + resr_order + "}\"/>"
		html += "<input type=\"hidden\" id=\"resr_order\" name=\"resr_order\" value=\"" + resr_order + "\"/>"
		html += "</div>"
		html += "<div class=\"text_area\">"
		html += "<select class=\"resr_no\" name=\"resr_no\" id=\"resr_no\">"
		html += "<option value = \"0\"></option>"
		html += "<option value = \"1\">생년월일</option>"
		html += "<option value = \"2\">성함</option>"
		html += "<option value = \"3\">성별</option>"
		html += "<option value = \"4\">전화번호</option>"
		html += "<option value = \"5\">휴대전화번호</option>"
		html += "<option value = \"6\">이메일</option>"
		html += "<option value = \"7\">등록일</option>"
		html += "</select>"	
		html += "</div>"
		html += "<div class=\"detail_btn_area\">"
		html += "<input type=\"button\" class=\"plus_btn\" name=\"plus_btn\" id=\"plus_btn\" value =\"+\"/>"
		html += "<input type=\"button\" class=\"mins_btn\" name=\"mins_btn\" id=\"mins_btn\" value =\"-\"/>"
		html += "</div>"
		html +=	"</div>"
		
		$(".bottom_wrap").append(html);

	}	
	
	//제목 제거
	function removeTitle() {
		$("#contents_top").remove();
		$('.name').css('padding-top', '14px');
		$('.ctem_middle').css('height', '430px');
		$('.ctem_middle').css('padding', '10px 112px 0px');
		flag = false;
	}
	
	//제목 추가
	function appendTitle() {
		var html = "";
		
		html += "<div class=\"contents_top\" id = \"contents_top\">"
		html += "<div class=\"txt_title\">제목</div>"
		html += "<input type = \"text\" class = \"tem_title_tbox\" name=\"temp_title\" id=\"temp_title\" value=\"${param.temp_title}\"/>"
		html += "</div>"
		
		$(".ctem_middle").prepend(html);
		$('.name').css('padding-top', '25px');
		$('.ctem_middle').css('height', '530px');
		$('.ctem_middle').css('padding', '0px 120px');
		flag = true;
	}

	//예약어 셀렉트박스 중복체크
	function checkSelectDupl(clickVal) {
		var temp = [];
		var obj = $('select[name = "resr_no"]');
		var t = 0;
		
		$(obj).each(function(i) {
			temp[i] = $(this).val();
		});

		for(var i = 0; i < temp.length; i++){
			if(temp[i] == clickVal){
				t++;
			}
		}
		
		if(t > 1) {
			alert('동일한 예약어가 존재합니다');
			return false;
		}
		return true;
	}
	
	//예약어 셀렉트박스 빈칸체크(예약어 하나일 때 빈칸은 허용)
	function checkSelectNull() {
		var temp = [];
		var obj = $('select[name = "resr_no"]');
		var t = 0;
		
		$(obj).each(function(i) {
			temp[i] = $(this).val();
		});
		
		if(!(temp.length == 1)){
			for(var i = 0; i < temp.length; i++){
				if(temp[i] == 0){
					t++;
				}
			}
		}
				if(t > 0) {
					return true;
				}
		return false;
	}
	
	//메일 선택시 제목 항목까지 포함 추가
	function mailAjax() {
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "tempMailAddAjax",
			dataType : "json", 
			data : params,
			success : function(res) {
				if(res.res == "SUCCESS") {
					$("#actionForm").attr("action", "tempList");
					$("#actionForm").submit();
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
	
	//그외 모든채널 추가 
	function mmsAjax(){
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "tempMmsAddAjax",
			dataType : "json", 
			data : params, 
			success : function(res) {
				if(res.res == "SUCCESS") {
					$("#actionForm").attr("action", "tempList");
					$("#actionForm").submit();
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
	
	//채널 테이블 정보를 가져와 셀렉트박스 옵션에 그리기
	function tempChanOptionAjax(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "tempChanOptionAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				drawChanOption(res.chanList);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});		
	}
	
	function drawChanOption (chanList) {
		var html = "";
				for(var i = 0; i< chanList.length; i++) {
				html += "<option value = \"" + chanList[i].CHAN_TYPE_NO + "\">" + chanList[i].CHAN_TYPE + "</option>";
				html += "</tr>";
			}
		$(".select_ch").html(html);
	}
	
	//카테고리 테이블 정보를 가져와 셀렉트박스 옵션에 그리기
	function tempCateOptionAjax(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "tempCateOptionAjax",
			dataType : "json", 
			data : params, 
			success : function(res) {
				drawCateOption(res.cateList, res.cnt);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});		
	}
	
		function drawCateOption (cateList, cnt) {
			var html = "";
			
				if(cnt == 0) {
					html += "<tr>";
					html += "<td colspn = \"5\">데이터가 없습니다.</td>";
					html += "<tr>";
				} else {
					for(var i = 0; i< cateList.length; i++) {
					html += "<option value = \"" + cateList[i].CATG_NO + "\">" + cateList[i].CATG_NM + "</option>";
					html += "</tr>";
					}
				}
			$(".select_cate").html(html);
		}
		
	//카테고리 추가 팝업에 현재 존재하는 카테고리 그리기
	function tempCateListAjax(){
		var params = $("#popupForm").serialize();
		console.log(params);tempCateListAjax
		$.ajax({
			type : "post",
			url : "tempCateListAjax",
			dataType : "json", 
			data : params, 
			success : function(res) {
				drawCateList(res.cateList, res.cnt);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});		
}
	
	function drawCateList(cateList, cnt) {
		var html = "";
		
			if(cnt == 0) {
				html += "<tr>";
				html += "<td colspn = \"5\">데이터가 없습니다.</td>";
				html += "<tr>";
			} else {
				for(var i = 0; i< cateList.length; i++) {
				html += "<tr name=\"" + cateList[i].CATG_NO + "\">";
				html += "<td>" + cateList[i].CATG_NO +"</td>";
				html += "<td>" + cateList[i].CATG_NM +"</td>";
				html += "</tr>";
				}
			}
			$(".cateTable tbody").html(html);
	}

	//카테고리 추가시 중복 카테고리 체크
	function checkCateDuplAjax() {
		var params = $("#popupForm").serialize();
		console.log(params);
		
		$.ajax({
			type : "post",
			url : "checkCateDuplAjax",
			dataType : "json", 
			data : params, 
			success : function(res) {
				if(res.cnt == 0) {
					cateAddAjax();
				} else {
					alert("중복된 카테고리가 있습니다.");
				}
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
		
	}
		
	//카테고리 추가
		function cateAddAjax(){
			var params = $("#popupForm").serialize();
			$.ajax({
				type : "post",
				url : "tempCateAddAjax",
				dataType : "json", 
				data : params,
				success : function(res) {
					if(res.res == "SUCCESS") {						
						alert("추가되었습니다.");
						closePopup(1);
					} else {
						alert("저장에 실패하였습니다.");	
						closePopup(1);
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

<form  action="#" id = "actionForm" method = "post">
<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}"/>
<input type="hidden" name="sEmpNo" value="${sEmpNo}"/>
<div class="contents">
		<div class="ctem_top">
			<div class="choose">
				<div class="channel">
				<div class="txt_ch">채널</div>
					<select class="select_ch" name="select_ch" id="select_ch">
					</select>
				</div>
				<div class="category">
					<div class="txt_tem">템플릿 카테고리</div>
						<select class="select_cate" name="select_cate" id="select_cate">
						</select>
						<input type = "button" class = "cateAddBtn" id = "cateAddBtn" name = "cateAddBtn" value = "+">
					</div>
			</div>
			<div class="name">
				<div class="txt_name">템플릿 이름</div>
				<input type = "text" class = "tem_name_tbox" name = "temp_nm" id="temp_nm" value="${param.temp_nm}"/>
			</div>
		</div>
		<div class="ctem_middle">
			<div class="contents_bottom">
				<input type="text" class="tem_contents_tbox" name="temp_cont" id="temp_cont" value="${param.temp_cont}"/>
			</div>
		</div>
		<div class= "bottom_wrap">
			<div class="ctem_bottom">
				<div class="txt_inputcont_area">
					<div class="txt_inputcont">입력내용</div>
				</div>
				<div class="num_area">
					<input type="text" class="num_tbox" name = "resr_order" id="resr_order" value = "{1}"/>
				</div>
				<div class="text_area">
					<select class="resr_no" name="resr_no" id="resr_no">
						<option value = "0"></option>
						<option value = "1">생년월일</option>
						<option value = "2">성함</option>
						<option value = "3">성별</option>
						<option value = "4">전화번호</option>
						<option value = "5">휴대전화번호</option>
						<option value = "6">이메일</option>
						<option value = "7">등록일</option>
					</select>
				</div>
				<div class="detail_btn_area">
					<input type="button" class="plus_btn" name="plus_btn" id="plus_btn" value ="+"/>
				</div>
			</div>
		</div>
		<div class = "addBtn_area">
			<input type = "button" class = "addBtn" name = "addBtn" id = "addBtn" value = "등록">
		</div>
	</div>
</form>
	<c:import url="/bottom"></c:import>
</body>
</html>