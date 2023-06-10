<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	margin-left : 67px;
}

.txt_tem {
	display : inline-block;
	height : 30px;
	width : 236px;
	text-align : right;
	padding-right : 30px;
}

.select_cate {
	display : inline-block;
	height : 30px;
	width : 225px;
}


.cate_addBtn {
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
	padding : 10px 106px 0px !important;
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

.plus_btn_area {
	display : inline-block;
}

.addBtn_area {
	width : 920px;
	text-align : right;
}


.updateBtn {
	min-width: 80px;
	height: 32px;
	background-color: #f7f7f7;
	font-size: 10pt;
	border-radius: 3px;
	margin: 10px 2px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
	cursor: pointer;
}

.updateBtn:hover {
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}

.cancelBtn {
	min-width: 80px;
	height: 32px;
	background-color: #f7f7f7;
	font-size: 10pt;
	border-radius: 3px;
	margin: 10px 0px 0px 3px;
	border: 1px solid #c2c2c2;
	padding: 1px 2px;
	outline: none;
	cursor: pointer;
}

.cancelBtn:hover {
	background-color: #022859;
	color: #fff;
	border: 1px solid #022859;
}

</style>
<script type="text/javascript"
		src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
var resr_order = 0;
var flag = false;
var setOrderFlag = false;

$(document).ready(function() {
	CKEDITOR.replace("temp_cont", { 
		resize_enabled : false,
		language : "ko",
		enterMode : "2",
		width : "815",
		height : "300"
	});	

	CKEDITOR.instances.temp_cont.setData('${param.temp_cont}');
	
	//채널, 카테고리 옵션 불러오기
	tempChanOptionAjax();
	tempCateOptionAjax();
	
	if('${param.select_ch}' != '') {
		$("#select_ch").val('${tempBoard.CHAN_TYPE_NO}');
	}
	if('${param.select_cate}' != '') {
		$("#select_cate").val('${tempBoard.CATG_NO}');
	}
	
	//예약어 영역 css 변경
	var obj = $('div[name = "detail_btn_area"]');
	var t = 0;  
	$(obj).each(function(index) {
		if (index == obj.length-1){
			$(this).css('display', 'inline-block');
		} else {
			$(this).children("#plus_btn").css('display', 'none');
		}
	});
  
	
	//채널에 따라 폼 변경 (이메일만 제목 추가, 제거 )
	$("#select_ch").change(function() {
		if($(this).val() == 1 || 2 || 3 && flag == true){
			removeTitle();
		}
		
		if($(this).val() == 4 && flag == false){
			appendTitle();
		}
			
	});
	
	//예약어 추가시 누른 플러스 버튼 숨기기
	$(document).on("click","#plus_btn",function(){
		if(setOrderFlag == false) {
			resr_order = $(this).attr("name");
			setOrderFlag = true;
		}
		
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
	
	//예약어 중복 선택 불가
	$(document).on('change', "#resr_no", function() {
		var clickVal = $(this).val()
		
		if(!checkSelectDupl(clickVal)) {
			$(this).val(0);
		}
	});
	
	$("#cancelBtn").on("click", function() {
		history.back();
	});
	
	//수정
	$("#updateBtn").on("click", function() {
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
				tempMailUpdateAjax();
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
				tempMmsUpdateAjax();		
			}
			
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
		html += "<div class=\"detail_btn_area\" name=\"detail_btn_area\">"
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
	
	//예약어 중복 체크
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
	
	//예약어 빈칸 체크(예약어 하나일땐 빈칸 가능)
	function checkSelectNull() {
		var temp = [];
		var obj = $('select[name = "resr_no"]');
		var t = 0;
		
		$(obj).each(function(i) {
			temp[i] = $(this).val();
			console.log(temp[i]);
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
	
	//예약어 버튼 영역 display 바꾸기 위해 마지막항목인지 체크
	function checkResrNoLast() {
		var temp = [];
		var obj = $('select[name = "detail_btn_area"]');
		var t = 0;
		
		$(obj).each(function(i) {
			temp[i] = $(this).val();
	
		});

		for(var i = 0; i < temp.length; i++){
			if(temp[i] == clickVal){
				t++;
			}
		}
	};
	
	//메일 외 채널 수정
	function tempMmsUpdateAjax() {
		$("#temp_cont").val(CKEDITOR.instances['temp_cont'].getData());
		var params = $("#actionForm").serialize();
		console.log(params);
		if(confirm("수정하시겠습니까?")) {
			$.ajax({
				type : "post",
				url : "tempMmsUpdateAjax",
				dataType : "json", 
				data : params, 
				success : function(res) {
					if(res.res == "SUCCESS") {
						$("#actionForm").attr("action", "tempList");
						$("#actionForm").submit();
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
	}
	
	//메일 채널 수정
	function tempMailUpdateAjax() {
		$("#temp_cont").val(CKEDITOR.instances['temp_cont'].getData());
		var params = $("#actionForm").serialize();
		console.log(params);
		if(confirm("수정하시겠습니까?")) {
			$.ajax({
				type : "post",
				url : "tempMailUpdateAjax",
				dataType : "json", 
				data : params, 
				success : function(res) {
					if(res.res == "SUCCESS") {
						$("#actionForm").attr("action", "tempList");
						$("#actionForm").submit();
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
	
		function drawCateOption(cateList, cnt) {
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
<input type="hidden" id="top" name="top" value="${param.top}"/>
<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}"/>
<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}"/>
<input type="hidden" name="sEmpNo" value="${sEmpNo}"/>
<input type="hidden" name="tempNo" id="tempNo" value="${param.tempNo}"/>
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
					</div>
			</div>
			<div class="name">
				<div class="txt_name">템플릿 이름</div>
				<input type = "text" class = "tem_name_tbox" name = "temp_nm" id="temp_nm" value="${tempBoard.TEMP_NM}"/>
			</div>
		</div>
		<div class="ctem_middle">
			<div class="contents_bottom">
				<input type="text" class="tem_contents_tbox" name="temp_cont" id="temp_cont" value="${tempBoard.TEMP_CONT}"/>
			</div>
		</div>
		<div class= "bottom_wrap">
		<c:forEach items="${tempResr}" var="map" varStatus="status">
		<div class="ctem_bottom">
				<div class="txt_inputcont_area">
					<div class="txt_inputcont">입력내용</div>
				</div>
				<div class="num_area">
					<input type="text" class="num_tbox" name = "resr_order" id="resr_order" value = "{${map.RESR_ORDER}}"/>
				</div>
				<div class="text_area">
					<select class="resr_no" name="resr_no" id="resr_no">
						<option value = "0"></option>
						<option value = "1"<c:if test = "${map.RESRWORD_NO eq '1'}">selected</c:if>>생년월일</option>
						<option value = "2"<c:if test = "${map.RESRWORD_NO eq '2'}">selected</c:if>>성함</option>
						<option value = "3"<c:if test = "${map.RESRWORD_NO eq '3'}">selected</c:if>>성별</option>
						<option value = "4"<c:if test = "${map.RESRWORD_NO eq '4'}">selected</c:if>>전화번호</option>
						<option value = "5"<c:if test = "${map.RESRWORD_NO eq '5'}">selected</c:if>>휴대전화번호</option>
						<option value = "6"<c:if test = "${map.RESRWORD_NO eq '6'}">selected</c:if>>이메일</option>
						<option value = "7"<c:if test = "${map.RESRWORD_NO eq '7'}">selected</c:if>>등록일</option>
					</select>                           
				</div>
				<div class="detail_btn_area" name="detail_btn_area">
						<input type="button" class="plus_btn" name="${map.RESR_ORDER}" id="plus_btn" value ="+"/>
						<input type="button" class="mins_btn" name="mins_btn" id="mins_btn" value ="-"/>
				</div>
			</div>
	</c:forEach>
		</div>
		<div class = "addBtn_area">
			<input type = "button" class = "updateBtn" name = "updateBtn" id = "updateBtn" value = "등록">
			<input type = "button" class = "cancelBtn" name = "cancelBtn" id = "cancelBtn" value = "취소">
		</div>
	</div>
</form>

	<c:import url="/bottom"></c:import>
</body>
</html>