<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<<<<<<< HEAD
=======
<!DOCTYPE html>
<html>
<head>
>>>>>>> branch 'main' of https://github.com/axia911/gdj28
<title>Insert title here</title>
<<<<<<< HEAD
<link rel="stylesheet" href="resources/script/jstree/themes/default/style.css" />
 <link rel="stylesheet" href="resources/css/jquery/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/alert.css" />
=======
<c:import url="/header"></c:import>
<!-- <link rel="stylesheet" href="resources/script/jstree/themes/default/style.css" />
<link rel="stylesheet" href="resources/css/jquery/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/alert.css" /> -->
>>>>>>> branch 'main' of https://github.com/axia911/gdj28
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
body {
	margin: 0 0 0 0;
	padding: 0 0 0 0;
	width: 100%;
	height: 100%;
	position: absolute;
	font-family: 'Nanum Gothic'
}
<<<<<<< HEAD

.content_wrap {
	min-width: 700px;
	margin: 0 auto;
	font-size: 0pt;
}

.corp_manage_wrap {
	width: 660px;
}

.corp_wrap {
	position: relative;
}

.corp_btn {
	height: 30px;
	font-size: 9pt;
	color: #454545;
	border: 1px solid #c5c5c5;
	border-radius: 2px;
	padding: 0px 3px;
	margin-right: 4px;
	line-height: 1.0em;
	vertical-align: middle;
}

.corp_btn:active {
	border: 1px solid #003eff;
    background: #007fff;
    font-weight: normal;
    color: #ffffff;
}

.corp_table_btn {
	height: 30px;
	font-size: 9pt;
	color: #454545;
	border: 1px solid #c5c5c5;
	border-radius: 2px;
	padding: 0px 8px;
	line-height: 1.0em;
	vertical-align: middle;
	margin-left: 3px;
}

.corp_table_btn:active {
	border: 1px solid #003eff;
    background: #007fff;
    font-weight: normal;
    color: #ffffff;
}


.group {
	width: 100%;
	margin-bottom: 15px;
}

.group_header {
	height: 60px;
	font-size: 20pt;
	font-weight: bold;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35);
	line-height: 2.2em;
}

.group_header_b {
	display: inline-block;
	vertical-align: top;
	width: calc(100% - 400px);
	height: 60px;
	font-size: 20pt;
	font-weight: bold;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35);
	line-height: 2.2em;
}

.group_header_btn {
	display: inline-block;
	vertical-align: top;
	width: 388px;
	height: 40px;
	padding: 10px 12px 10px 0px;
	text-align: right;
}

.group_blank {
	display: inline-block;
	width: 100%;
	height: 15px;
}


.group_con, .group_con_s, .group_con_title, .group_con_txt, .group_con_txt_l, .group_con_txt_free, .group_con_txta {
	display: inline-block;
	vertical-align: top;
	min-height: 40px;
}

.group_con, .group_con_s {
	margin-bottom: 10px;
}

.group_con {
	width: 100%;
}

.group_con_s {
	width: 50%;
}

.group_con_title {
	width: 90px;
	font-size: 12pt;
	/* text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35); */
	line-height: 2.2em;
	padding: 0px 5px;
	color: #333333;
}

.group_con_txt {
	width: calc(100% - 100px);
	height: 40px;
	font-size: 12pt;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35);
	line-height: 2.0em;
}

.group_con_txt_l {
	width: calc(100% - 110px);
	height: 40px;
	font-size: 12pt;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35);
	line-height: 2.0em;
	padding-right: 10px;
	text-align: right;
}

.group_con_txt_free {
	width: calc(100% - 100px);
	font-size: 12pt;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35);
	line-height: 2.0em;
}

.group_con_txta {
	width: calc(100% - 14px);
	font-size: 10pt;
    padding: 5px 10px;
	resize: none;
    background: #ffffff;
    border: 1px solid #cccccc;
    border-radius: 4px;
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-sizing: border-box;
    color: #333333;
}

.group_con_input {
	width: calc(100% - 14px);
    height: 100%;
    padding: 0px 10px;
    background: #ffffff;
    border: 1px solid #cccccc;
    border-radius: 4px;
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-sizing: border-box;
    color: #333333;
}

#dept {
	display: inline-block;
	vertical-align: top;
	width: 250px;
	min-height: 500px;
	font-size: 9pt;
	border: 1px solid #cccccc;
    border-radius: 4px;
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-sizing: border-box;
}

.corp_manage_wrap .top_btn_area {
	margin-bottom: 5px;
	margin-right: 5px;
}

.corp_manage_wrap .user_info_wrap {
	display: inline-block;
	vertical-align: top;
	width: 400px;
	margin-left: 10px;
	min-height: 500px;
}

.corp_manage_wrap .user_info {
	width: 400px;
	font-size: 10pt;
	text-align: center;
	border-collapse: collapse;
}

.corp_manage_wrap .user_info tr {
	height: 30px;
	vertical-align: middle;
}

.corp_manage_wrap .user_info tr th {
	vertical-align: middle;
	padding: 0 0 10px 0;
	font-size: 11pt;
}

.corp_manage_wrap .user_info tr td {
	vertical-align: middle;
	padding: 0;
}

.corp_manage_wrap .user_info tr td input[type='text'], .corp_manage_wrap .user_info tr td input[type='password'], .corp_manage_wrap .user_info tr td input[type='number'] {
	width: 146px;
}

.corp_manage_wrap .user_info tr td .user_img {
	display: table-cell;
	vertical-align: middle;
	border: 1px solid #9e9e9e;
	width: 100px;
	height: 118px;
	cursor: pointer;
}

.corp_manage_wrap .user_info tr td .user_img img {
	width: 97px;
	max-height: 118px;
}

.corp_manage_wrap .user_info tr td .user_img_hidden {
	display: none;
}

.corp_manage_wrap .corp_popup_div #startDt, .corp_manage_wrap .corp_popup_div #endDt {
	width: 260px !important;
    border: 1px solid !important;
    border-radius: 3px !important;
    padding: 5px !important;
    margin-right: 5px !important;
}


=======
/* Contents default */
.content_wrap {
	min-width: 700px;
	margin: 0 auto;
	font-size: 0pt;
}

.corp_manage_wrap {
	width: 660px;
}

.corp_wrap {
	position: relative;
}

.corp_btn {
	height: 30px;
	font-size: 9pt;
	color: #454545;
	border: 1px solid #c5c5c5;
	border-radius: 2px;
	padding: 0px 3px;
	margin-right: 4px;
	line-height: 1.0em;
	vertical-align: middle;
}

.corp_btn:active {
	border: 1px solid #003eff;
    background: #007fff;
    font-weight: normal;
    color: #ffffff;
}

.corp_table_btn {
	height: 30px;
	font-size: 9pt;
	color: #454545;
	border: 1px solid #c5c5c5;
	border-radius: 2px;
	padding: 0px 8px;
	line-height: 1.0em;
	vertical-align: middle;
	margin-left: 3px;
}

.corp_table_btn:active {
	border: 1px solid #003eff;
    background: #007fff;
    font-weight: normal;
    color: #ffffff;
}

/* Group */
.group {
	width: 100%;
	margin-bottom: 15px;
}

.group_header {
	height: 60px;
	font-size: 20pt;
	font-weight: bold;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35);
	line-height: 2.2em;
}

.group_header_b {
	display: inline-block;
	vertical-align: top;
	width: calc(100% - 400px);
	height: 60px;
	font-size: 20pt;
	font-weight: bold;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35);
	line-height: 2.2em;
}

.group_header_btn {
	display: inline-block;
	vertical-align: top;
	width: 388px;
	height: 40px;
	padding: 10px 12px 10px 0px;
	text-align: right;
}

.group_blank {
	display: inline-block;
	width: 100%;
	height: 15px;
}

/* Group Content */
.group_con, .group_con_s, .group_con_title, .group_con_txt, .group_con_txt_l, .group_con_txt_free, .group_con_txta {
	display: inline-block;
	vertical-align: top;
	min-height: 40px;
}

.group_con, .group_con_s {
	margin-bottom: 10px;
}

.group_con {
	width: 100%;
}

.group_con_s {
	width: 50%;
}

.group_con_title {
	width: 90px;
	font-size: 12pt;
	/* text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35); */
	line-height: 2.2em;
	padding: 0px 5px;
	color: #333333;
}

.group_con_txt {
	width: calc(100% - 100px);
	height: 40px;
	font-size: 12pt;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35);
	line-height: 2.0em;
}

.group_con_txt_l {
	width: calc(100% - 110px);
	height: 40px;
	font-size: 12pt;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35);
	line-height: 2.0em;
	padding-right: 10px;
	text-align: right;
}

.group_con_txt_free {
	width: calc(100% - 100px);
	font-size: 12pt;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35);
	line-height: 2.0em;
}

.group_con_txta {
	width: calc(100% - 14px);
	font-size: 10pt;
    padding: 5px 10px;
	resize: none;
    background: #ffffff;
    border: 1px solid #cccccc;
    border-radius: 4px;
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-sizing: border-box;
    color: #333333;
}

.group_con_input {
	width: calc(100% - 14px);
    height: 100%;
    padding: 0px 10px;
    background: #ffffff;
    border: 1px solid #cccccc;
    border-radius: 4px;
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-sizing: border-box;
    color: #333333;
}

#dept {
	display: inline-block;
	vertical-align: top;
	width: 250px;
	min-height: 500px;
	font-size: 9pt;
	border: 1px solid #cccccc;
    border-radius: 4px;
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-sizing: border-box;
}

.corp_manage_wrap .top_btn_area {
	margin-bottom: 5px;
	margin-right: 5px;
}

.corp_manage_wrap .user_info_wrap {
	display: inline-block;
	vertical-align: top;
	width: 400px;
	margin-left: 10px;
	min-height: 500px;
}

.corp_manage_wrap .user_info {
	width: 400px;
	font-size: 10pt;
	text-align: center;
	border-collapse: collapse;
}

.corp_manage_wrap .user_info tr {
	height: 30px;
	vertical-align: middle;
}

.corp_manage_wrap .user_info tr th {
	vertical-align: middle;
	padding: 0 0 10px 0;
	font-size: 11pt;
}

.corp_manage_wrap .user_info tr td {
	vertical-align: middle;
	padding: 0;
}

.corp_manage_wrap .user_info tr td input[type='text'], .corp_manage_wrap .user_info tr td input[type='password'], .corp_manage_wrap .user_info tr td input[type='number'] {
	width: 146px;
}

.corp_manage_wrap .user_info tr td .user_img {
	display: table-cell;
	vertical-align: middle;
	border: 1px solid #9e9e9e;
	width: 100px;
	height: 118px;
	cursor: pointer;
}

.corp_manage_wrap .user_info tr td .user_img img {
	width: 97px;
	max-height: 118px;
}

.corp_manage_wrap .user_info tr td .user_img_hidden {
	display: none;
}

.corp_manage_wrap .corp_popup_div #startDt, .corp_manage_wrap .corp_popup_div #endDt {
	width: 260px !important;
    border: 1px solid !important;
    border-radius: 3px !important;
    padding: 5px !important;
    margin-right: 5px !important;
}

/* jQuery */
>>>>>>> branch 'main' of https://github.com/axia911/gdj28
#posNo-menu .ui-widget, #authNo-menu .ui-widget, .corp_manage_wrap .ui-widget {
	font-size: 9pt !important;
}
</style>
<<<<<<< HEAD
<link rel="stylesheet" href="resources/css/corp/corp_popup.css" />
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript" src="resources/script/jstree/jstree.js"></script>
<script type="text/javascript" src="resources/script/common/alert.js"></script>
<script type="text/javascript" src="resources/script/common/util.js"></script>
=======
<!-- <link rel="stylesheet" href="resources/css/corp/corp_popup.css" /> -->
<!-- <script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript" src="resources/script/jstree/jstree.js"></script>
<script type="text/javascript" src="resources/script/common/alert.js"></script>
<script type="text/javascript" src="resources/script/common/util.js"></script> -->
>>>>>>> branch 'main' of https://github.com/axia911/gdj28
<script type="text/javascript">
var imgExt = "jpg|jpeg|gif|png|bmp";

$(document).ready(function(){
<<<<<<< HEAD
	$.datepicker.setDefaults({
		monthNames: ['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear:true,
		showOn: 'both',
		closeText: '닫기',
		buttonImage: 'resources/images/calender.png',
		buttonImageOnly: true,
		dateFormat: 'yy/mm/dd'    
=======
	$("#b").on("click", function() {
		$("#sampleForm").submit();
>>>>>>> branch 'main' of https://github.com/axia911/gdj28
	});
	
<<<<<<< HEAD
=======
	
	$.datepicker.setDefaults({
		monthNames: ['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear:true,
		showOn: 'both',
		closeText: '닫기',
		buttonImage: 'resources/images/calender.png',
		buttonImageOnly: true,
		dateFormat: 'yy/mm/dd'    
	});
	
>>>>>>> branch 'main' of https://github.com/axia911/gdj28
	$('.corp_manage_wrap #dept').jstree({
		"core" : {
			"check_callback": true,
			"multiple" : false,
			"animation" : 0,
			"expand_selected_onload" : true,
			"restore_focus" : true
		},
		"types" : {
			"corp" : {
				"icon" : "resources/favicon/favicon.ico",
				"valid_children" : ["group","user"]
			},
			"group" : {
				"icon" : "resources/images/group.ico",
				"valid_children" : ["group","user"]
			},
			"user" : {
				"icon" : "resources/images/user.ico",
				"valid_children" : []
			}
		},
		"plugins" : [
			"contextmenu", "dnd", "search",
			"state", "types", "wholerow"
		],
		"search": {
            "case_insensitive": true,
            "show_only_matches" : true


        }
	}).on('select_node.jstree', function(e, data) {
		if(data.node.type == "user") {
			clearNodeSelectData();
			
			var params = {empNo: data.node.id.substr(4)};
			
			$.ajax({
				type : "post",
				url : "getEmpAjax",
				dataType : "json",
				data : params,
				success : function(result) {
					if(result == null) {
							makeTargetAlert(".corp_manage_wrap", "안내", "데이터 조회에 실패했습니다.", function(){});
					} else {
						var html = "";
						
						html += "<form action=\"#\" id=\"userInfoForm\">";
						html += "<input type=\"hidden\" name=\"empNo\" value=\"" + result.EMP_NO + "\"/>";
						html += "<input type=\"hidden\" name=\"empId\" value=\"" + result.EMP_ID + "\" />";
						html += "<input type=\"hidden\" name=\"empPw\" />";
						html += "<input type=\"hidden\" name=\"empNm\" value=\"" + result.EMP_NO + "\" />";
						html += "<input type=\"hidden\" name=\"authNo\" value=\"" + result.AUTH_NO + "\" />";
						html += "<input type=\"hidden\" name=\"posNo\" value=\"" + result.POS_NO + "\" />";
						html += "<input type=\"hidden\" name=\"deptNo\" value=\"" + result.DEPT_NO + "\" />";
						
						if(result.EMP_PIC != null && result.EMP_PIC != "") {
							html += "<input type=\"hidden\" name=\"empPic\" value=\"" + result.EMP_PIC + "\" />";
						} else {
							html += "<input type=\"hidden\" name=\"empPic\" />";
						}
						
						html += "</form>";
						html += "<form id=\"corpFileForm\" name=\"corpFileForm\" action=\"empImageUploadAjax\" method=\"post\" enctype=\"multipart/form-data\">";
						html += "<table class=\"user_info\">";
						html += "<colgroup>";
						html += "<col width=\"100px\" />";
						html += "<col width=\"150px\" />";
						html += "<col width=\"150px\" />";
						html += "</colgroup>";
						html += "<tr>";
						html += "<th class=\"user_info_title_area\" colspan=\"3\" align=\"left\">사용자 정보</th>";
						html += "</tr>";
						html += "<tr>";
						html += "<td rowspan=\"4\">";
						html += "<div class=\"user_img\">";
						
						if(result.EMP_PIC != null && result.EMP_PIC != "") {
							html += "<img src=\"resources/upload/" + result.EMP_PIC + "\" />";
						} else {
							html += "이미지가<br/>없습니다.";
						}
						
						html += "</div><input type=\"file\" name=\"attach1\" class=\"user_img_hidden\" accept=\"image/*\" />";
						html += "</td>";
						html += "<td>아이디</td>";
						
						if('0' == 1) {
							html += "<td><input type=\"text\" id=\"empId\" value=\"" + result.EMP_ID + "\" /></td>";
						} else {
							html += "<td>" + result.EMP_ID + "</td>";
						}
						
						html += "</tr>";
						
						if('0' == 1 || '7' == result.EMP_NO) {
							html += "<tr>";
							html += "<td>비밀번호</td>";
							html += "<td><input type=\"password\" id=\"empPw\" /></td>";
							html += "</tr>";
						}
						
						html += "<tr>";
						html += "<td>이름</td>";
						
						if('0' == 1 || '7' == result.EMP_NO) {
							html += "<td><input type=\"text\" id=\"empNm\" value=\"" + result.EMP_NM + "\" /></td>";
						} else {
							html += "<td>" + result.EMP_NM + "</td>";
						}
						
						html += "</tr>";
						html += "<tr>";
						html += "<td>부서</td>";
						html += "<td class=\"dept_nm\">" + result.DEPT_NM + "</td>";
						html += "</tr>";
						html += "<tr>";
						
						if('0' == 1 || '7' == result.EMP_NO) {
							html += "<td>&nbsp;</td>";
						}
						
						html += "<td>직급</td>";
						html += "<td>";
						
						$.ajax({
							type : "post",
							url : "getPosListAjax",
							dataType : "json",
							async: false,
							success : function(rs) {
								if(rs.message == "SUCCESS") {
									for(var i = 0 ; i < rs.posList.length ; i++) {
										if(result.POS_NO == rs.posList[i].POS_NO) {
											html += rs.posList[i].POS_NM;
										}
									}
								}
							}
						});
						
						html += "</td>";
						html += "</tr>";
						
						if('0' == 1) {
							html += "<tr>";
							html += "<td>&nbsp;</td>";
							html += "<td>권한</td>";
							html += "<td>";
							html += "<select id=\"authNo\">";
							
							$.ajax({
								type : "post",
								url : "getAuthListAjax",
								dataType : "json",
								async: false,
								success : function(rs) {
									if(rs.message == "SUCCESS") {
										for(var i = 0 ; i < rs.authList.length ; i++) {
											if(result.AUTH_NO == rs.authList[i].AUTH_NO) {
												html += "<option value=\"" + rs.authList[i].AUTH_NO + "\" selected=\"selected\">" + rs.authList[i].AUTH_NM + "</option>";
											} else {
												html += "<option value=\"" + rs.authList[i].AUTH_NO + "\">" + rs.authList[i].AUTH_NM + "</option>";
											}
										}
									}
								}
							});
							
							html += "</select>";
							html += "</td>";
							html += "</tr>";
						}
						
						if('0' == 1 || '7' == result.EMP_NO) {
							html += "<tr>";
							html += "<td colspan=\"3\">&nbsp;</td>";
							html += "</tr>";
							html += "<tr>";
							html += "<td class=\"user_info_btn_area\" colspan=\"3\" align=\"right\">";
							html += "<input type=\"button\" class=\"corp_table_btn\" id=\"empCancelBtn\" value=\"취소\" />";
							
							if('0' == 1) {
								html += "<input type=\"button\" class=\"corp_table_btn\" id=\"empDeleteBtn\" value=\"퇴사\" />";
							}
							
							html += "<input type=\"button\" class=\"corp_table_btn\" id=\"empUpdateBtn\" value=\"수정\" />";
							
							if('0' == 1) {
								html += "<input type=\"button\" class=\"corp_table_btn\" id=\"deptEmpUpdateBtn\" value=\"인사이동\" />";
							}
							html += "</td>";
							html += "</tr>";
						}
						
						html += "</table>";
						html += "</form>";
						
						$(".corp_manage_wrap .user_info_wrap").html(html);
						
						$( ".corp_manage_wrap .user_info_wrap select" ).selectmenu({width: "150px", fontSize: "9pt"});
					}
				}
			});
		} else {
			$(".corp_manage_wrap #selId").val(data.node.id);
			$(".corp_manage_wrap #selText").val(data.node.text.substr(0, data.node.text.lastIndexOf("(")));
			$(".corp_manage_wrap #selLevel").val(data.node.parents.length);
			$(".corp_manage_wrap #selCnt").val(data.node.text.substr(data.node.text.lastIndexOf("(") + 1, data.node.text.lastIndexOf(")") - data.node.text.lastIndexOf("(") - 1));
			
			$(".corp_manage_wrap .user_info_wrap").empty();
		}
	}).on('refresh.jstree', function(e, data) {
		var treeData = data.instance._model.data;
		
		var key = Object.keys(treeData);
		 
		for(var i = 0 ; i < key.length ; i++) {
			if(treeData[key[i]].parent == "#") {
				$("#dept").jstree().open_node(treeData[key[i]].id);
			}
		}
	});
	
	//조직도 리로드
	updateCorpTree();
	
	//조직추가
	$(".corp_manage_wrap #deptAddBtn").on("click", function() {
		var html = "";
		
		html += "<div class=\"corp_popup_bg_div\"></div>";
		html += "<div class=\"corp_popup_div\">";
		
		if(emptyCheck(".corp_manage_wrap #selText")) {
			html += "<div class=\"corp_popup_top\">회사등록</div>";
			html += "<div class=\"corp_popup_center\">";
			html += "<form action=\"#\" id=\"corpPopupForm\">";
			html += "<input type=\"hidden\" name=\"deptLevel\" value=\"0\" />";
			html += "<div class=\"input_title\">회사명</div>";
		} else {
			html += "<div class=\"corp_popup_top\">부서등록</div>";
			html += "<div class=\"corp_popup_center\">";
			html += "<form action=\"#\" id=\"corpPopupForm\">";
			html += "<input type=\"hidden\" name=\"diffDeptNo\" value=\"" + $("#selId").val().substr(4) + "\" />";
			html += "<input type=\"hidden\" name=\"deptLevel\" value=\"" + ($("#selLevel").val() * 1 + 1) + "\" />";
			html += "<div class=\"info_title\">상위부서</div>";
			html += "<div class=\"info_txt\">" + $("#selText").val() + "</div>";
			html += "<div class=\"input_title\">부서명</div>";
		}
		
		html += "<input type=\"text\" name=\"deptNm\" id=\"deptNm\" placeholder=\"Input Text Here\" />";
		html += "</form>";
		html += "</div>";
		html += "<div class=\"corp_popup_bottom\">";
		html += "<div class=\"corp_popup_left_btn\">CANCEL</div>";
		html += "<div class=\"corp_popup_center_btn\"></div>";
		html += "<div class=\"corp_popup_right_btn\">SUBMIT</div>";
		html += "</div>";
		html += "</div>";
		
		$(".corp_manage_wrap").append(html);
		
		$(".corp_manage_wrap .corp_popup_div").css("left", "calc(50% - " + $(".corp_manage_wrap .corp_popup_div").width() / 2 + "px)");
		$(".corp_manage_wrap .corp_popup_div").css("top", "calc(50% - " + $(".corp_manage_wrap .corp_popup_div").height() / 2 + "px)");
		
		$(".corp_manage_wrap .corp_popup_left_btn").off("click");
		$(".corp_manage_wrap .corp_popup_left_btn").on("click", function(){
			$(".corp_manage_wrap .corp_popup_bg_div").remove();
			$(".corp_manage_wrap .corp_popup_div").remove();
		});
		
		$(".corp_manage_wrap .corp_popup_right_btn").off("click");
		$(".corp_manage_wrap .corp_popup_right_btn").on("click", function(){
			
			if(emptyCheck(".corp_manage_wrap .corp_popup_div #deptNm")) {
				if(emptyCheck("#selText")) {
					makeTargetAlert(".corp_manage_wrap .corp_popup_div", "등록 안내", "회사명 입력하여 주세요.", function(){
						$(".corp_manage_wrap .corp_popup_div #deptNm").focus();
					});
				} else {
					makeTargetAlert(".corp_manage_wrap .corp_popup_div", "등록 안내", "부서명 입력하여 주세요.", function(){
						$(".corp_manage_wrap .corp_popup_div #deptNm").focus();
					});
				}
				
				
			} else {
				var params = $(".corp_manage_wrap #corpPopupForm").serialize();
				$.ajax({
					type : "post",
					url : "insertDeptAjax",
					dataType : "json",
					data : params,
					success : function(result) {
						if(result.message == "SUCCESS") {
							makeTargetAlert(".corp_manage_wrap", "알림", "등록되었습니다.", function(){
								$(".corp_manage_wrap .corp_popup_left_btn").click();
								updateCorpTree();
							});
						} else {
							makeTargetAlert(".corp_manage_wrap", "알림", "등록에 실패하였습니다.", function(){});
						}
					}
				});
			}
		});
	});
	
	//조직수정
	$(".corp_manage_wrap #deptUpdateBtn").on("click", function() {
		if(emptyCheck(".corp_manage_wrap #selId")) {
			makeTargetAlert(".corp_manage_wrap", "수정 안내", "수정하실 조직을 선택해 주세요.", function(){});
		} else {
			var html = "";
			
			html += "<div class=\"corp_popup_bg_div\"></div>";
			html += "<div class=\"corp_popup_div\">";
			
			if(emptyCheck("#selText")) {
				html += "<div class=\"corp_popup_top\">회사수정</div>";
				html += "<div class=\"corp_popup_center\">";
				html += "<form action=\"#\" id=\"corpPopupForm\">";
				html += "<input type=\"hidden\" name=\"deptLevel\" value=\"0\" />";
				html += "<div class=\"input_title\">회사명</div>";
			} else {
				html += "<div class=\"corp_popup_top\">부서수정</div>";
				html += "<div class=\"corp_popup_center\">";
				html += "<form action=\"#\" id=\"corpPopupForm\">";
				html += "<input type=\"hidden\" name=\"deptNo\" value=\"" + $("#selId").val().substr(4) + "\" />";
				html += "<div class=\"input_title\">부서명</div>";
			}
			
			html += "<input type=\"text\" name=\"deptNm\" id=\"deptNm\" placeholder=\"Input Text Here\" value=\"" + $("#selText").val() + "\" />";
			html += "</form>";
			html += "</div>";
			html += "<div class=\"corp_popup_bottom\">";
			html += "<div class=\"corp_popup_left_btn\">CANCEL</div>";
			html += "<div class=\"corp_popup_center_btn\"></div>";
			html += "<div class=\"corp_popup_right_btn\">SUBMIT</div>";
			html += "</div>";
			html += "</div>";
			
			$(".corp_manage_wrap").append(html);
			
			$(".corp_manage_wrap .corp_popup_div").css("left", "calc(50% - " + $(".corp_manage_wrap .corp_popup_div").width() / 2 + "px)");
			$(".corp_manage_wrap .corp_popup_div").css("top", "calc(50% - " + $(".corp_manage_wrap .corp_popup_div").height() / 2 + "px)");
			
			$(".corp_manage_wrap .corp_popup_left_btn").off("click");
			$(".corp_manage_wrap .corp_popup_left_btn").on("click", function(){
				$(".corp_manage_wrap .corp_popup_bg_div").remove();
				$(".corp_manage_wrap .corp_popup_div").remove();
			});
			
			$(".corp_manage_wrap .corp_popup_right_btn").off("click");
			$(".corp_manage_wrap .corp_popup_right_btn").on("click", function(){
				
				if(emptyCheck(".corp_manage_wrap .corp_popup_div #deptNm")) {
					if(emptyCheck("#selText")) {
						makeTargetAlert(".corp_manage_wrap .corp_popup_div", "수정 안내", "회사명 입력하여 주세요.", function(){
							$(".corp_manage_wrap .corp_popup_div #deptNm").focus();
						});
					} else {
						makeTargetAlert(".corp_manage_wrap .corp_popup_div", "수정 안내", "부서명 입력하여 주세요.", function(){
							$(".corp_manage_wrap .corp_popup_div #deptNm").focus();
						});
					}
				} else {
					var params = $(".corp_manage_wrap #corpPopupForm").serialize();
					$.ajax({
						type : "post",
						url : "updateDeptAjax",
						dataType : "json",
						data : params,
						success : function(result) {
							if(result.message == "SUCCESS") {
								makeTargetAlert(".corp_manage_wrap", "알림", "수정되었습니다.", function(){
									$(".corp_manage_wrap .corp_popup_left_btn").click();
									updateCorpTree();
								});
							} else {
								makeTargetAlert(".corp_manage_wrap", "알림", "수정에 실패하였습니다.", function(){});
							}
						}
					});
				}
			});
		}
	});
	
	//조직삭제
	$(".corp_manage_wrap #deptDelBtn").on("click", function() {
		if(emptyCheck(".corp_manage_wrap #selId")) {
			makeTargetAlert(".corp_manage_wrap", "삭제 안내", "삭제하실 조직을 선택해 주세요.", function(){});
		} else {
			if($("#selCnt").val() * 1 > 0) {
				makeTargetAlert(".corp_manage_wrap", "삭제 안내", "사원이 존재하여 삭제할 수 없습니다.", function(){});
			} else {
				makeTargetConfirmAlert(".corp_manage_wrap", "안내", "조직을 삭제하시겠습니까?", function(){
					var params = {"deptNo" : $("#selId").val().substr(4)};
					$.ajax({
						type : "post",
						url : "deleteDeptAjax",
						dataType : "json",
						data : params,
						success : function(result) {
							if(result.message == "SUCCESS") {
								makeTargetAlert(".corp_manage_wrap", "알림", "삭제되었습니다.", function(){
									$(".corp_manage_wrap .corp_popup_left_btn").click();
									updateCorpTree();
								});
							} else {
								makeTargetAlert(".corp_manage_wrap", "알림", "삭제에 실패하였습니다.", function(){});
							}
						}
					});
				});
			}
		}
	});
	
	//사용자 추가화면
	$(".corp_manage_wrap #userAddBtn").on("click", function() {
		if(emptyCheck(".corp_manage_wrap #selId")) {
			makeTargetAlert(".corp_manage_wrap", "안내", "조직을 선택해 주세요.", function(){
				$(".corp_manage_wrap .user_info_wrap").empty();
			});
		} else {
			var html = "";
			
			html += "<form action=\"#\" id=\"userInfoForm\">";
			html += "<input type=\"hidden\" name=\"empNo\" />";
			html += "<input type=\"hidden\" name=\"empId\" />";
			html += "<input type=\"hidden\" name=\"empPw\" />";
			html += "<input type=\"hidden\" name=\"empNm\" />";
			html += "<input type=\"hidden\" name=\"authNo\" />";
			html += "<input type=\"hidden\" name=\"posNo\" />";
			html += "<input type=\"hidden\" name=\"deptNo\" value=\"" + $(".corp_manage_wrap #selId").val().substr(4) + "\" />";
			html += "<input type=\"hidden\" name=\"empPic\" />";
			html += "</form>";
			html += "<form id=\"corpFileForm\" name=\"corpFileForm\" action=\"empImageUploadAjax\" method=\"post\" enctype=\"multipart/form-data\">";
			html += "<table class=\"user_info\">";
			html += "<colgroup>";
			html += "<col width=\"100px\" />";
			html += "<col width=\"150px\" />";
			html += "<col width=\"150px\" />";
			html += "</colgroup>";
			html += "<tr>";
			html += "<th class=\"user_info_title_area\" colspan=\"3\" align=\"left\">사용자 등록</th>";
			html += "</tr>";
			html += "<tr>";
			html += "<td rowspan=\"4\">";
			html += "<div class=\"user_img\">이미지를 <br/> 선택해 주세요.</div><input type=\"file\" name=\"attach1\" class=\"user_img_hidden\" accept=\"image/*\" />";
			html += "</td>";
			html += "<td>아이디</td>";
			html += "<td><input type=\"text\" id=\"empId\" /></td>";
			html += "</tr>";
			html += "<tr>";
			html += "<td>비밀번호</td>";
			html += "<td><input type=\"password\" id=\"empPw\" /></td>";
			html += "</tr>";
			html += "<tr>";
			html += "<td>이름</td>";
			html += "<td><input type=\"text\" id=\"empNm\" /></td>";
			html += "</tr>";
			html += "<tr>";
			html += "<td>부서</td>";
			html += "<td class=\"dept_nm\">" + $(".corp_manage_wrap #selText").val() + "</td>";
			html += "</tr>";
			html += "<tr>";
			html += "<td>&nbsp;</td>";
			html += "<td>직급</td>";
			html += "<td>";
			html += "<select id=\"posNo\">";
			
			$.ajax({
				type : "post",
				url : "getPosListAjax",
				dataType : "json",
				async: false,
				success : function(result) {
					if(result.message == "SUCCESS") {
						for(var i = 0 ; i < result.posList.length ; i++) {
							html += "<option value=\"" + result.posList[i].POS_NO + "\">" + result.posList[i].POS_NM + "</option>";
						}
					}
				}
			});
			
			html += "</select>";
			html += "</td>";
			html += "</tr>";
			html += "<tr>";
			html += "<td>&nbsp;</td>";
			html += "<td>권한</td>";
			html += "<td>";
			html += "<select id=\"authNo\">";
			
			$.ajax({
				type : "post",
				url : "getAuthListAjax",
				dataType : "json",
				async: false,
				success : function(result) {
					if(result.message == "SUCCESS") {
						for(var i = 0 ; i < result.authList.length ; i++) {
							html += "<option value=\"" + result.authList[i].AUTH_NO + "\">" + result.authList[i].AUTH_NM + "</option>";
						}
					}
				}
			});
			
			html += "</select>";
			html += "</td>";
			html += "</tr>";
			html += "<tr>";
			html += "<td colspan=\"3\">&nbsp;</td>";
			html += "</tr>";
			html += "<tr>";
			html += "<td class=\"user_info_btn_area\" colspan=\"3\" align=\"right\">";
			html += "<input type=\"button\" class=\"corp_table_btn\" id=\"empCancelBtn\" value=\"취소\" />";
			html += "<input type=\"button\" class=\"corp_table_btn\" id=\"empSaveBtn\" value=\"등록\" />";
			html += "</td>";
			html += "</tr>";
			html += "</table>";
			html += "</form>";
			
			$(".corp_manage_wrap .user_info_wrap").html(html);
			
			$( ".corp_manage_wrap .user_info_wrap select" ).selectmenu({width: "150px", fontSize: "9pt"});
		}
	});
	
	//아이디 중복체크
	$(".corp_manage_wrap .user_info_wrap #userInfoForm").off("focusout", "#empId");
	$(".corp_manage_wrap .user_info_wrap #userInfoForm").on("focusout", "#empId", function(){
		var params = {empId: $(this).val()};
		
		$.ajax({
			type : "post",
			url : "checkEmpIdAjax",
			dataType : "json",
			data : params,
			success : function(result) {
				if(result.message == "SUCCESS") {
					if(result.cnt > 0) {
						makeTargetAlert(".corp_manage_wrap", "안내", "중복된 아이디가 있습니다.", function(){
							$(".corp_manage_wrap .user_info_wrap #userInfoForm #empId").val("");
							$(".corp_manage_wrap .user_info_wrap #userInfoForm #empId").focus();
						});
					}
				}
			}
		});
	});
	
	
	//사용자 저장
	$(".corp_manage_wrap .user_info_wrap").off("click", "#empSaveBtn");
	$(".corp_manage_wrap .user_info_wrap").on("click", "#empSaveBtn", function() {
		if(emptyCheck(".corp_manage_wrap .user_info_wrap #empId")) {
			makeTargetAlert(".corp_manage_wrap", "안내", "아이디를 입력해 주세요.", function(){
				$(".corp_manage_wrap .user_info_wrap #empId").focus();
			});
		} else if(emptyCheck(".corp_manage_wrap .user_info_wrap #empPw")) {
			makeTargetAlert(".corp_manage_wrap", "안내", "비밀번호를 입력해 주세요.", function(){
				$(".corp_manage_wrap .user_info_wrap #empPw").focus();
			});
		} else if(emptyCheck(".corp_manage_wrap .user_info_wrap #empNm")) {
			makeTargetAlert(".corp_manage_wrap", "안내", "이름을 입력해 주세요.", function(){
				$(".corp_manage_wrap .user_info_wrap #empNm").focus();
			});
		} else {
			$(".corp_manage_wrap .user_info_wrap #userInfoForm [name='empId']").val($(".corp_manage_wrap .user_info_wrap #empId").val());
			$(".corp_manage_wrap .user_info_wrap #userInfoForm [name='empPw']").val($(".corp_manage_wrap .user_info_wrap #empPw").val());
			$(".corp_manage_wrap .user_info_wrap #userInfoForm [name='empNm']").val($(".corp_manage_wrap .user_info_wrap #empNm").val());
			$(".corp_manage_wrap .user_info_wrap #userInfoForm [name='posNo']").val($(".corp_manage_wrap .user_info_wrap #posNo").val());
			$(".corp_manage_wrap .user_info_wrap #userInfoForm [name='authNo']").val($(".corp_manage_wrap .user_info_wrap #authNo").val());
			
			var params = $(".corp_manage_wrap #userInfoForm").serialize();
			$.ajax({
				type : "post",
				url : "insertEmpAjax",
				dataType : "json",
				data : params,
				success : function(result) {
					if(result.message == "SUCCESS") {
						makeTargetAlert(".corp_manage_wrap", "알림", "등록되었습니다.", function(){
							var html = "";
							
							html += "<input type=\"button\" class=\"corp_table_btn\" id=\"empCancelBtn\" value=\"취소\" />";
							html += "<input type=\"button\" class=\"corp_table_btn\" id=\"empDeleteBtn\" value=\"퇴사\" />";
							html += "<input type=\"button\" class=\"corp_table_btn\" id=\"empUpdateBtn\" value=\"수정\" />";
							html += "<input type=\"button\" class=\"corp_table_btn\" id=\"deptEmpUpdateBtn\" value=\"인사이동\" />";
							
							$(".corp_manage_wrap .user_info_btn_area").html(html);
							$(".corp_manage_wrap .user_info_title_area").html("사용자 정보");
							
							$(".corp_manage_wrap .user_info_wrap [name='empNo']").val(result.empNo);
							
							$(".corp_manage_wrap .user_info_wrap #posNo").parent().html($(".corp_manage_wrap .user_info_wrap #posNo [value='" + $(".corp_manage_wrap .user_info_wrap #posNo").val() + "']").html());
							
							$(".corp_manage_wrap .user_info_wrap #empPw").val("");
							
							updateCorpTree();
						});
					} else {
						makeTargetAlert(".corp_manage_wrap", "알림", "등록에 실패하였습니다.", function(){});
					}
				}
			});
		}
	});
	
	//등록 및 상세보기 취소
	$(".corp_manage_wrap .user_info_wrap").off("click", "#empCancelBtn");
	$(".corp_manage_wrap .user_info_wrap").on("click", "#empCancelBtn", function() {
		$(".corp_manage_wrap .user_info_wrap").empty();
		$('.corp_manage_wrap #dept').jstree(true).deselect_all();
	});
	
	//이미지 클릭
	$(".corp_manage_wrap .user_info_wrap").off("click", ".user_img");
	$(".corp_manage_wrap .user_info_wrap").on("click", ".user_img", function() {
		$(".user_info_wrap .user_img_hidden").click();
	});
	
	//이미지 저장
	$(".corp_manage_wrap .user_info_wrap").off("change", ".user_img_hidden");
	$(".corp_manage_wrap .user_info_wrap").on("change", ".user_img_hidden", function() {
		var file = $(this).context.files[0].name;
		
		if(imgExt.indexOf(file.substr(file.lastIndexOf(".") + 1)) > -1) {
			var corpFileForm = $(".corp_manage_wrap .user_info_wrap #corpFileForm");
			
			corpFileForm.ajaxForm({ //보내기전 validation check가 필요할경우 
				success: function(responseText, statusText){
					if(responseText.result =="SUCCESS"){
						$(".corp_manage_wrap #userInfoForm [name='empPic']").val(responseText.fileName[0]);
						
						var html = "";
						
						html += "<img src=\"resources/upload/" + responseText.fileName[0] + "\" />"
						
						$(".corp_manage_wrap .user_info_wrap .user_img").html(html);
						$(".corp_manage_wrap .user_info_wrap .user_img").css("font-size", "0pt");
						
						$("#userInfoForm [name='empPic']").val(responseText.fileName[0]);
					}
				}
			});
			
			corpFileForm.submit();
		} else {
			makeTargetAlert(".corp_manage_wrap", "알림", "이미지 파일을 선택하여 주세요.", function(){});
		}
	});
	
	//사용자 퇴사
	$(".corp_manage_wrap .user_info_wrap").off("click", "#empDeleteBtn");
	$(".corp_manage_wrap .user_info_wrap").on("click", "#empDeleteBtn", function() {
		var html = "";
		
		html += "<div class=\"corp_popup_bg_div\"></div>";
		html += "<div class=\"corp_popup_div\">";
		
		html += "<div class=\"corp_popup_top\">퇴사처리</div>";
		html += "<div class=\"corp_popup_center\" style=\"width:301px;\">";
		html += "<form action=\"#\" id=\"corpPopupForm\">";
		html += "<input type=\"hidden\" name=\"empNo\" value=\"" + $(".corp_manage_wrap .user_info_wrap #userInfoForm [name='empNo']").val() + "\" />";
		
		html += "<div class=\"input_title\">퇴사일</div>";
		html += "<input type=\"text\" title=\"퇴사일\" id=\"endDt\" name=\"endDt\" value=\"" + getToday("-") + "\" readonly=\"readonly\" />";
		html += "</form>";
		html += "</div>";
		html += "<div class=\"corp_popup_bottom\">";
		html += "<div class=\"corp_popup_left_btn\">CANCEL</div>";
		html += "<div class=\"corp_popup_center_btn\"></div>";
		html += "<div class=\"corp_popup_right_btn\">SUBMIT</div>";
		html += "</div>";
		html += "</div>";
		
		$(".corp_manage_wrap").append(html);
		
		$(".corp_manage_wrap .corp_popup_div").css("left", "calc(50% - " + $(".corp_manage_wrap .corp_popup_div").width() / 2 + "px)");
		$(".corp_manage_wrap .corp_popup_div").css("top", "calc(50% - " + $(".corp_manage_wrap .corp_popup_div").height() / 2 + "px)");
		
		$(".corp_manage_wrap .corp_popup_div #endDt").datepicker({
			dateFormat : 'yy-mm-dd',
			duration: 200
		});
		
		$(".corp_manage_wrap .corp_popup_div .corp_popup_left_btn").off("click");
		$(".corp_manage_wrap .corp_popup_div .corp_popup_left_btn").on("click", function() {
			$(".corp_manage_wrap .corp_popup_div").remove();
			$(".corp_manage_wrap .corp_popup_bg_div").remove();
		});
		
		$(".corp_manage_wrap .corp_popup_div .corp_popup_right_btn").off("click");
		$(".corp_manage_wrap .corp_popup_div .corp_popup_right_btn").on("click", function() {
			makeTargetConfirmAlert(".corp_manage_wrap", "알림", "퇴사처리를 진행하시겠습니까?", function() {
				var params = $(".corp_manage_wrap .corp_popup_div #corpPopupForm").serialize();
				
				$.ajax({
					type : "post",
					url : "deleteEmpAjax",
					dataType : "json",
					data : params,
					success : function(result) {
						if(result.message == "SUCCESS") {
							makeTargetAlert(".corp_manage_wrap", "알림", "퇴사처리가 정상적으로 되었습니다.", function(){
								$(".corp_manage_wrap .user_info_wrap").empty();
								
								$(".corp_manage_wrap .corp_popup_div").remove();
								$(".corp_manage_wrap .corp_popup_bg_div").remove();
								
								updateCorpTree();
							});
						} else {
							makeTargetAlert(".corp_manage_wrap", "알림", "퇴사처리에 실패하였습니다.", function(){});
						}
					}
				});
			});
		});
	});
	
	//사용자 수정
	$(".corp_manage_wrap .user_info_wrap").off("click", "#empUpdateBtn");
	$(".corp_manage_wrap .user_info_wrap").on("click", "#empUpdateBtn", function() {
		if($(".corp_manage_wrap .user_info_wrap #empId").length > 0) {
			$(".corp_manage_wrap .user_info_wrap #userInfoForm [name='empId']").val($(".corp_manage_wrap .user_info_wrap #empId").val());
		}
		
		$(".corp_manage_wrap .user_info_wrap #userInfoForm [name='empPw']").val($(".corp_manage_wrap .user_info_wrap #empPw").val());
		$(".corp_manage_wrap .user_info_wrap #userInfoForm [name='empNm']").val($(".corp_manage_wrap .user_info_wrap #empNm").val());
		
		if($(".corp_manage_wrap .user_info_wrap #authNo").length > 0) {
			$(".corp_manage_wrap .user_info_wrap #userInfoForm [name='authNo']").val($(".corp_manage_wrap .user_info_wrap #authNo").val());
		}
		
		var params = $(".corp_manage_wrap #userInfoForm").serialize();
		
		$.ajax({
			type : "post",
			url : "updateEmpAjax",
			dataType : "json",
			data : params,
			success : function(result) {
				if(result.message == "SUCCESS") {
					makeTargetAlert(".corp_manage_wrap", "알림", "수정되었습니다.", function(){
						updateSelectCorpTree();
					});
				} else {
					makeTargetAlert(".corp_manage_wrap", "알림", "수정에 실패하였습니다.", function(){});
				}
			}
		});
	});
	
	//사용자 인사이동
	$(".corp_manage_wrap .user_info_wrap").off("click", "#deptEmpUpdateBtn");
	$(".corp_manage_wrap .user_info_wrap").on("click", "#deptEmpUpdateBtn", function() {
		var html = "";
		
		html += "<div class=\"corp_popup_bg_div\"></div>";
		html += "<div class=\"corp_popup_div\">";
		
		html += "<div class=\"corp_popup_top\">인사이동</div>";
		html += "<div class=\"corp_popup_center\">";
		html += "<form action=\"#\" id=\"corpPopupForm\">";
		html += "<input type=\"hidden\" name=\"empNo\" value=\"" + $(".corp_manage_wrap .user_info_wrap #userInfoForm [name='empNo']").val() + "\" />";
		html += "<input type=\"hidden\" name=\"deptNo\" value=\"" + $(".corp_manage_wrap .user_info_wrap #userInfoForm [name='deptNo']").val() + "\" />";
		html += "<input type=\"hidden\" id=\"deptNm\" />";
		
		html += "<div class=\"input_title\">직급</div>";
		
		html += "<select id=\"posNo\" name=\"posNo\">";
		
		$.ajax({
			type : "post",
			url : "getPosListAjax",
			dataType : "json",
			async: false,
			success : function(rs) {
				if(rs.message == "SUCCESS") {
					for(var i = 0 ; i < rs.posList.length ; i++) {
						if($(".corp_manage_wrap .user_info_wrap #userInfoForm [name='posNo']").val() == rs.posList[i].POS_NO) {
							html += "<option value=\"" + rs.posList[i].POS_NO + "\" selected=\"selected\">" + rs.posList[i].POS_NM + "</option>";
						} else {
							html += "<option value=\"" + rs.posList[i].POS_NO + "\">" + rs.posList[i].POS_NM + "</option>";
						}
					}
				}
			}
		});
		
		html += "</select>";
		
		html += "<div class=\"input_title\">부서</div>";
		html += "<div id=\"deptPopup\"></div>";
		html += "<div class=\"input_title\">변경일</div>";
		html += "<input type=\"text\" title=\"변경일\" id=\"startDt\" name=\"startDt\" value=\"" + getToday("-") + "\" readonly=\"readonly\" />";
		html += "</form>";
		html += "</div>";
		html += "<div class=\"corp_popup_bottom\">";
		html += "<div class=\"corp_popup_left_btn\">CANCEL</div>";
		html += "<div class=\"corp_popup_center_btn\"></div>";
		html += "<div class=\"corp_popup_right_btn\">SUBMIT</div>";
		html += "</div>";
		html += "</div>";
		
		$(".corp_manage_wrap").append(html);
		
		$(".corp_manage_wrap .corp_popup_div").css("display", "none");
		
		$(".corp_manage_wrap .corp_popup_div select").selectmenu({width: "300px", fontSize: "9pt"});
		
		$(".corp_manage_wrap .corp_popup_div #deptPopup").css("font-size", "9pt");
		
		$.ajax({
			type : "post",
			url : "getDeptListAjax",
			dataType : "json",
			success : function(result) {
				$('.corp_manage_wrap .corp_popup_div #deptPopup').jstree({
					"core" : {
						"check_callback": true,
						"multiple" : false,
						"animation" : 0,
						"expand_selected_onload" : true,
						"restore_focus" : true,
				        "data" : result
					},
					"types" : {
						"corp" : {
							"icon" : "resources/favicon/favicon.ico",
							"valid_children" : ["group","user"]
						},
						"group" : {
							"icon" : "resources/images/group.ico",
							"valid_children" : ["group","user"]
						}
					},
					"plugins" : [
						"contextmenu", "dnd", "search",
						"state", "types", "wholerow"
					],
					"search": {
			            "case_insensitive": true,
			            "show_only_matches" : true


			        }
				}).on('select_node.jstree', function(e, data) {
					$(".corp_manage_wrap .corp_popup_div [name='deptNo']").val(data.node.id.substr(4));
					$(".corp_manage_wrap .corp_popup_div #deptNm").val(data.node.text);
				}).on('ready.jstree', function() {
					$(".corp_manage_wrap .corp_popup_div").css("left", "calc(50% - " + $(".corp_manage_wrap .corp_popup_div").width() / 2 + "px)");
					$(".corp_manage_wrap .corp_popup_div").css("top", "calc(50% - " + $(".corp_manage_wrap .corp_popup_div").height() / 2 + "px)");
					
					$(".corp_manage_wrap .corp_popup_div #deptPopup").jstree(true).select_node("DEPT" + $(".corp_manage_wrap .user_info_wrap #userInfoForm [name='deptNo']").val());
					
					$(".corp_manage_wrap .corp_popup_div").show();
				});
			}
		});
		
		$(".corp_manage_wrap .corp_popup_div #startDt").datepicker({
			dateFormat : 'yy-mm-dd',
			duration: 200
		});
		
		$(".corp_manage_wrap .corp_popup_div .corp_popup_left_btn").off("click");
		$(".corp_manage_wrap .corp_popup_div .corp_popup_left_btn").on("click", function() {
			$(".corp_manage_wrap .corp_popup_div").remove();
			$(".corp_manage_wrap .corp_popup_bg_div").remove();
		});
		
		$(".corp_manage_wrap .corp_popup_div .corp_popup_right_btn").off("click");
		$(".corp_manage_wrap .corp_popup_div .corp_popup_right_btn").on("click", function() {
			if($(".corp_manage_wrap .corp_popup_div #posNo").val() == $(".corp_manage_wrap .user_info_wrap #userInfoForm [name='posNo']").val() && 
					$(".corp_manage_wrap .corp_popup_div [name='deptNo']").val() == $(".corp_manage_wrap .user_info_wrap #userInfoForm [name='deptNo']").val()) {
				makeTargetAlert(".corp_manage_wrap", "안내", "변경사항이 없습니다.", function(){});
			} else {
				var params = $(".corp_manage_wrap .corp_popup_div #corpPopupForm").serialize();
				
				$.ajax({
					type : "post",
					url : "updateDeptEmpAjax",
					dataType : "json",
					data : params,
					success : function(result) {
						if(result.message == "SUCCESS") {
							makeTargetAlert(".corp_manage_wrap", "알림", "인사이동이 정상적으로 되었습니다.", function(){
								
								$(".corp_manage_wrap .user_info_wrap #userInfoForm [name='posNo']").val($(".corp_manage_wrap .corp_popup_div #posNo").val()); 
								
								$(".corp_manage_wrap .user_info_wrap #posNo").parent().html($(".corp_manage_wrap .corp_popup_div #posNo [value='" + $(".corp_manage_wrap .corp_popup_div #posNo").val() + "']").html());
								
								$(".corp_manage_wrap .user_info_wrap #userInfoForm [name='deptNo']").val($(".corp_manage_wrap .corp_popup_div [name='deptNo']").val());
								
								$(".corp_manage_wrap .user_info_wrap .dept_nm").html($(".corp_manage_wrap .corp_popup_div #deptNm").val());
								
								$(".corp_manage_wrap .corp_popup_div").remove();
								$(".corp_manage_wrap .corp_popup_bg_div").remove();
								
								updateSelectCorpTree();
							});
						} else {
							makeTargetAlert(".corp_manage_wrap", "알림", "인사이동에 실패하였습니다.", function(){});
						}
					}
				});
			}
		});
	});
});

function updateCorpTree() {
	$.ajax({
		type : "post",
		url : "getCorpListAjax",
		dataType : "json",
		success : function(result) {
			$('.corp_manage_wrap #dept').jstree(true).settings.core.data = result;
			clearNodeSelectData();
			$('.corp_manage_wrap #dept').jstree(true).deselect_all();
			$('.corp_manage_wrap #dept').jstree(true).refresh();
		}
	});
}

function updateSelectCorpTree() {
	$.ajax({
		type : "post",
<<<<<<< HEAD
		url : "getCorpListAjax",
		dataType : "json",
		success : function(result) {
=======
		url : "http://gudi.co.kr/portal/getCorpListAjax",
		dataType : "json",
		success : function(result) {
			console.log(result);
>>>>>>> branch 'main' of https://github.com/axia911/gdj28
			$('.corp_manage_wrap #dept').jstree(true).settings.core.data = result;
			clearNodeSelectData();
			$('.corp_manage_wrap #dept').jstree(true).refresh();
		}
	});
}

function clearNodeSelectData() {
	$(".corp_manage_wrap #selId").val("");
	$(".corp_manage_wrap #selText").val("");
	$(".corp_manage_wrap #selLevel").val("");
	$(".corp_manage_wrap #selCnt").val("");
}
</script>
</head>
<body class="corp_body">
<!-- 윈도우 컨텐츠 기본 Wrap -->
<div class="content_wrap corp_manage_wrap">
	<div class="corp_wrap">
		<div class="group">
			<div class="group_header">조직관리</div>
			<input type="hidden" id="selId" />
			<input type="hidden" id="selText" />
			<input type="hidden" id="selLevel" />
			<input type="hidden" id="selCnt" />
			
			<div id="dept"></div>
			<div class="user_info_wrap"></div>
		</div>
	</div>
</div>
<<<<<<< HEAD
=======
<input type="button" id="b" value="b" />
<form action="http://gudi.co.kr/portal/getCorpListAjax" id="sampleForm" method="post"></form>
>>>>>>> branch 'main' of https://github.com/axia911/gdj28
</body>
</html>