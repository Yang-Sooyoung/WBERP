<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP 공용 템플릿</title>
<style type="text/css">
/* 검색영역 가로변경 시 */
.cam_menu1 {
	height: 60px;
	width:800px;
}
.cam_menu1_center {
	width: 1100px;
	height: 30px;
	margin: 0 auto;
}
.cam_menu1_date, .supplySubc, .supplyType,.channelType,.cam_menu1_check, .cam_menu1_reset, .cam_menu1_newcam {
	display: inline-block;
	vertical-align: top;
	margin-left: 20px;
}
.reset_img {
margin-top: 10px;
	width: 30px;
	height: 25px;
	cursor: pointer;
}
.date_center{
	display: inline-block;
	height:32px;
	width:15px;
	font-size: 15pt;
	vertical-align: top;
	margin:0px 15px 0px 30px;
}

.channelType, .supplySubc, .supplyType{
	display: inline-block;
	margin-left:10px;
}
select{
	width:120px;
	height:25px;
}
#supply_unpr{
	margin: 10px 0px 0px 500px;
	width:150px;
	height:20px;
}

.cam_menu1_date {
	font-size: 11px;
	margin-left: 50px;
}

.cam_paging {
	height: 30px;
	font-size: 15px;
}

.cam_paging_center {
	display: inline-block;
	vertical-align: top;
	width: 100%;
	height: 50px;
	margin: 0 auto;
	text-align: center;
}

.paging_but {
	margin: 10px;
	padding: 5px 15px 5px 15px;
	display: inline-block;
	vertical-align: top;
}

.paging_but:hover {
	border: 1px solid #4aa2d9;
}

.paging_but_lr {
	margin: 10px;
	padding: 5px 10px 5px 10px;
	border: 1px solid #cccccc;
	display: inline-block;
	vertical-align: top;
}

.cam_menu1_search {
	margin-top: 10px;
	display: inline-block;
	vertical-align: top;
}

.sear_img {
	width: 30px;
	height: 25px;
	cursor: pointer;
}
.defaultBox{
	width:800px;
}
#con1,#con2 ,#con3,#con4,#con5,#con6 ,#con6 ,#con7{
	width:200px;
}
.con4, .con5, .con6 , .con6 ,.con7{
	font-size: 10pt;
	min-height: 43px;
	line-height: 43px;
	display: inline-block;
	padding: 0px 5px;
}
.etcLeftBox ,.etcRightBox{
font-size: 11pt;
display: inline-block;
	height:200px;
	width:180px;
	border: 2px solid #9aa9bd;
	margin-left:10px;
	position:relative;
	text-align: top;
	vertical-align: top;
	margin:10px;
	padding:10px;
}
.etcRightBox{
margin-left:20px;

}
#radioDiv{
	margin-top:10px;
}
#etcDiv{
	margin:20px 0px 20px 0px;
	
}
#etcCon{
	background-color:white;
	width:150px;
	border:0px;
	outline:0px;
	vertical-align: top;
	text-align: left;
	margin: 3px;
	
}	
#etcCon:hover{
	cursor:pointer;
	background-color: #4d688a;
	color:white;
}
#etcConBox{
	width:160px;
	height:20px;
}
/* 개별 css는 여기에 */

</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<script type="text/javascript">
var flag = 0; //채널추가,수정 관리 플레그 0:추가 , 1:수정
var etcFlag = 1; //부가정보 관리 플레그 1:채널유형 , 2:계약유형 , etc: 공급업체

function emptyCheck(sel){
	if($.trim($(sel).val()) == ''){
		return true;
	}	else {
		return false;
	}
}
	$(document).ready(function() {
		channelTypeSelectAjax();
		//검색버튼
		$("#SearchBtn").on("click", function() {
			$("#page").val("1");
			reloadList();
		});

		//리셋버튼
		$("#resetBtn").on("click", function() {
			$("#channelTypeSelect").val("0");
			$("#supplySubcSelect").val("0");
			$("#supplyTypeSelect").val("0");
			$("#supply_unpr").val("");
			$("#ChanStartDate").val("");
			$("#ChanEndDate").val("");
			reloadList();
		});

		//페이징
		$(".page_nation").on("click", "div", function() {
			$("#page").val($(this).attr("name"));
			reloadList();
		});
		//디테일
		$("table").on("click","tr",function(){

			$("#chanNo").val($(this).attr("name"));
			$("#chanNo2").val($(this).attr("name"));
		 	makeBtn2Popup(2, "상세보기", ChanDetailDraw(), false, 400, 500,
					ChanDetailAjax(), "수정", function() {
		 								///수정///
								makeBtn3Popup(1,"수정",ChanAddDraw(), false, 400, 500,
										function(){
									flag = 1;
									 ChanAddPopAjax();
											 
										$("#popup1").on("change", "#supplyTypeSelectAdd", function() {
											
											if($("#supplyTypeSelectAdd").val() == 0){
												$("#startDate").attr("disabled",true);
												$("#endDate").attr("disabled",true);
												$("#supplyCnt").attr("disabled",true);
											}
											else if($("#supplyTypeSelectAdd").val() == 2){
												$("#supplyCnt").val(null);
												$("#startDate").removeAttr("disabled");
												$("#endDate").removeAttr("disabled");
												$("#supplyCnt").attr("disabled",true);
											}
											else{
												$("#startDate").val(null);
												$("#endDate").val(null);
												$("#startDate").attr("disabled",true);
												$("#endDate").attr("disabled",true);
												$("#supplyCnt").removeAttr("disabled");
											}
										});
								},
											"수정", function() {
												if(emptyCheck("#chanNM")){
													alert("채널명을 입력해주세요.");
													$("#chanNM").focus();
												}
													else if($("#channelTypeSelectAdd").val() == "0"){
													alert("채널유형을 선택해주세요.");
													$("#channelTypeSelectAdd").focus();
												} else if($("#supplySubcSelectAdd").val() == "0"){
													alert("공급업체를 선택해주세요.");
													$("#supplySubcSelectAdd").focus();
												}else if($("#supplyTypeSelectAdd").val() == "0"){
													alert("공급유형를 선택해주세요.");
													$("#supplyTypeSelectAdd").focus();
												} else if(emptyCheck("#UNPR")){
													alert("공급단가를 입력해주세요.");
													$("#UNPR").focus();
												} else if($("#supplyTypeSelectAdd").val() == 1 &&  $("#supplyCnt").val() == ""){
													
													alert("공급 건수를 입력해주세요.");
													$("#supplyCnt").focus();
												} 
												else if($("#supplyTypeSelectAdd").val() == 2 &&  $("#startDate").val() == ""){
													alert("시작 기간을 입력해주세요.");
													$("#startDate").focus();
												} else if($("#supplyTypeSelectAdd").val() == 2 &&  $("#endDate").val() == ""){
													alert("종료 기간을 입력해주세요.");
													$("#endDate").focus();
												} 
												else{
													console.log($("#supplyTypeSelectAdd").val());
													ChanUpdateAjax();
													
											closePopup(1);
												}
										}, "삭제", function() {
											if(confirm("채널을 삭제 하시겠습니까?")){
												ChanDeleteAjax();
												alert("채널을 삭제하였습니다!");
												flag = 0;
												
												closePopup(1);
											}
										}, "취소", function() {
											flag = 0;
											closePopup(1);
							});
		 				closePopup(2);
					}, "취소", function() {
						closePopup(2);
					}); 
		});
		
	//채널 등록
		$("#ChanAdd").on(
				"click",
				function() {
					makeBtn2Popup(1, "채널추가", ChanAddDraw(), true, 400, 520,
							function() {
						ChanAddPopAjax();
						$("#popup1").on("change", "#supplyTypeSelectAdd", function() {
							if($("#supplyTypeSelectAdd").val() == 0){
						
								$("#startDate").attr("disabled",true);
								$("#endDate").attr("disabled",true);
								$("#supplyCnt").attr("disabled",true);
							}
							else if($("#supplyTypeSelectAdd").val() == 2){
								$("#startDate").val(null);
								$("#endDate").val(null);
								$("#startDate").removeAttr("disabled");
								$("#endDate").removeAttr("disabled");
								$("#supplyCnt").attr("disabled",true);
							}
							else if($("#supplyTypeSelectAdd").val() == 1){
								$("#supplyCnt").val(null);
								$("#startDate").attr("disabled",true);
								$("#endDate").attr("disabled",true);
								$("#supplyCnt").removeAttr("disabled");
							}	else{
								$("#startDate").removeAttr("disabled");
								$("#endDate").removeAttr("disabled");
								$("#supplyCnt").removeAttr("disabled");
								$("#startDate").val(null);
								$("#endDate").val(null);
								$("#supplyCnt").val(null);
							}
						});
					}, "추가", function() {
								if(emptyCheck("#chanNM")){
									alert("채널명을 입력해주세요.");
									$("#chanNM").focus();
								}
									else if($("#channelTypeSelectAdd").val() == "0"){
									alert("채널유형을 선택해주세요.");
									$("#channelTypeSelectAdd").focus();
								} else if($("#supplySubcSelectAdd").val() == "0"){
									alert("공급업체를 선택해주세요.");
									$("#supplySubcSelectAdd").focus();
								}else if($("#supplyTypeSelectAdd").val() == "0"){
									alert("공급유형를 선택해주세요.");
									$("#supplyTypeSelectAdd").focus();
								} else if(emptyCheck("#UNPR")){
									alert("공급단가를 입력해주세요.");
									$("#UNPR").focus();
								} else if($("#supplyTypeSelectAdd").val() == 1 &&  $("#supplyCnt").val() == ""){
									alert("공급 건수를 입력해주세요.");
									$("#supplyCnt").focus();
								} 
								else if($("#supplyTypeSelectAdd").val() == 2 &&  $("#startDate").val() == ""){
									alert("시작 기간을 입력해주세요.");
									$("#startDate").focus();
								} else if($("#supplyTypeSelectAdd").val() == 2 &&  $("#endDate").val() == ""){
									alert("종료 기간을 입력해주세요.");
									$("#endDate").focus();
								} 
								else{
									 chanAdd();
									 reloadList();
								}
					}, "취소", function() {
										closePopup(1);
								});
			});
	
		
	///부가정보버튼///
		$("#EtcInfoMang").on(
				"click",
				function() {
					makeBtn1Popup(2, "부가정보", etcDraw(), true, 500, 400,
							function(){
						etcAjax();
						$(".etcLeftBox").on("click","input",function(){
							$("#etcInput").val($(this).val());
						});
						$(".etcLeftBox").on("click","div",function(){
							$("#etcConNo").val($(this).attr("name"));
						});
						$("input[type=radio][name=etcRadio]").change(function(){
							if(this.value=="1"){
								$("#etcFlaghidden").val("1");
								etcFlag = 1;
								etcAjax();
							} else if(this.value=="2"){
								$("#etcFlaghidden").val("2");
								etcFlag = 2;
								etcAjax();
							} else{
								$("#etcFlaghidden").val("3");
								etcFlag = 3;
								etcAjax();
							}
						});
						$("#addEtcBtn").on("click",function(){
							$("#etcAddNm").val($("#etcInput").val());
							if(emptyCheck("#etcInput")){
								alert("추가할 정보를 입력 해 주세요!");
							}else{
							addEtcAjax();
							}
						});
						$("#deleteEtcBtn").on("click",function(){
							$("#etcAddNm").val($("#etcInput").val());
							if(emptyCheck("#etcInput")){
								alert("삭제할 정보를 입력 또는 클릭해 주세요!");
							}else{
							deleteEtcAjax();
							}
						});
						
					}, "닫기", function() {
								etcFlag = 1;
								closePopup(2);
							});
				});
	
	});  //ready끝

	//첫화면
	function reloadList() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "channelListAjax",
			dataType : "json",
			data : params, 
			success : function(res) { 
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
			html += "<td colspan=\"5\">데이터가 없습니다.</td>";
			html += "</tr>";
		} else {
			for (var i = 0; i < list.length; i++) {
				html += "<tr name="+ list[i].CHAN_NO + ">";
				html += "<td>" + list[i].CHAN_NM + "</td>";
				html += "<td>" + list[i].CHAN_TYPE + "</td>";
				html += "<td>" + list[i].SUBC_NM + "</td>";
				html += "<td>" +list[i].UNPR+"원</td>";
				html += "<td>" + list[i].COTR_TYPE_NM +  "</td>";
				html += "</tr>";
			}
		}

		$("table tbody").html(html);
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
	///////////////목록 셀렉트///////////
	//아작스
		function channelTypeSelectAjax() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "channelTypeSelectAjax",
			dataType : "json",
			data : params, 
			success : function(res) { 
		 		channelTypeSelect(".channelType",res.chanlist,"channelTypeSelect","channelTypeSelect");	
				supplySubcSelect(".supplySubc",res.subclist,"supplySubcSelect","supplySubcSelect");
				supplyType(".supplyType",res.supllist,"supplyTypeSelect","supplyTypeSelect"); 
				reloadList();
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	//채널유형셀렉트(목록)
	function channelTypeSelect(className,list,name,id,val){
		var html = "";
		
			html+= "<select class=\"channelTypeSelect\" name="+name+" id="+id+">";
				html+="	<option value = \"0\">채널유형(전체)</option>";
	
			for (var i = 0; i < list.length; i++) {
				html+="	<option value ="+list[i].CHAN_TYPE_NO+">"+list[i].CHAN_TYPE+"</option>";
				}
				html+="	</select>";
				
		$(className).html(html);
				if(val != null){
				$(".channelTypeSelect[name='" + name + "']").val(val);
	
				}
		
	}
	//공급업체셀렉트(목록)
	function supplySubcSelect(className,list,name,id,val){
		var html = "";
		
			html+= "<select class=\"supplySubcSelect\" name="+name+" id="+id+">";
				html+="	<option value = \"0\">공급업체(전체)</option>";
	
			for (var i = 0; i < list.length; i++) {
				html+="	<option value =" +list[i].SUPL_SUBC_NO+">"+list[i].SUBC_NM+"</option>";
				}
				html+="	</select>";
				
		$(className).html(html);
		if(val != null){
			$(".supplySubcSelect[name='" + name + "']").val(val);
	
			}
	}
	//공급유형셀렉트(목록) 
	function supplyType(className, list,name,id,val){
		var html = "";
		
			html+= "<select class=\"supplyTypeSelect\" name="+name+" id="+id+">";
				html+= "<option value = \"0\">공급유형(전체)</option>";
	
			for (var i = 0; i < list.length; i++) {
				html+="	<option value =" +list[i].COTR_TYPE_NO+">"+list[i].COTR_TYPE_NM+"</option>";
				}
				html+="	</select>";
			
		$(className).html(html);
		if(val != null){
			$(".supplyTypeSelect[name='" + name + "']").val(val);

			}
	}
	//////추가 팝업 셀렉트 아작스///////
	function ChanAddPopAjax() {
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "channelTypeSelectAjax",
			dataType : "json",
			data : params, 
			success : function(res) { 
				if(flag != 0){
					ChanDetailAjax2(res);
				} else {
			 		channelTypeSelect(".con1",res.chanlist,"channelTypeSelectAdd","channelTypeSelectAdd", null);	
					supplySubcSelect(".con2",res.subclist,"supplySubcSelectAdd","supplySubcSelectAdd", null);
					supplyType(".con3",res.supllist,"supplyTypeSelectAdd","supplyTypeSelectAdd", null); 
				}
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	function chanAdd() {
		var params = $("#AddactionForm").serialize();
		$.ajax({
			type : "post",
			url : "chanAddAjax",
			dataType : "json",
			data : params, 
			success : function(res) { 
				if(confirm("새로운 채널이 추가 되었습니다!")){
					
					closePopup(1);
				}
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	
	//채널추가 팝업
	function ChanAddDraw(){
		var  html="";
html+="	<form action=\"AddactionForm\" method=\"post\" id=\"AddactionForm\">";
html+="<input type=\"hidden\" name=\"chanNo2\" id=\"chanNo2\" value="+$("#chanNo").val()+">";
html+=" 	<div class=\"underbox\"style=\"width:100%\">";
html+="		<div class=\"underline\">                                                                                   ";
html+="			<div class=\"line1\">채널명 *</div>                                                                  ";
html+="			<div class=\"con7\" id=\"con7\">                                                                                    ";
html+="				<input type=\"text\" placeholder=\"채널 명을 입력해주세요.\" id=\"chanNM\" name=\"chanNM\" style=\"width:180px\"/>  ";
html+="			</div>                                                                                                  ";
html+="		</div>                                                                                                      ";
html+="			<div class=\"underline\">                                                                               ";
html+="			<div class=\"line1\">채널유형 *</div>                                                                   ";
html+="			<div class=\"con1\" id=\"con1\">                                                                                    ";
html+="			</div>                                                                                                  ";
html+="		</div>                                                                                                      ";
html+="		<div class=\"underline\">                                                                                   ";
html+="			<div class=\"line1\">공급 업체 *</div>                                                                  ";
html+="			<div class=\"con2\" id=\"con2\">                                                                                    ";
html+="			</div>                                                                                                  ";
html+="		</div>                                                                                                      ";
html+="		<div class=\"underline\">                                                                                   ";
html+="			<div class=\"line1\">공급 유형 *</div>                                                                  ";
html+="			<div class=\"con3\" id=\"con3\">                                                                                    ";
html+="			</div>                                                                                                  ";
html+="		</div>                                                                                                      ";
html+="		<div class=\"underline\">                                                                                   ";
html+="			<div class=\"line1\">공급 단가 *</div>                                                                  ";
html+="			<div class=\"con4\" id=\"con4\">                                                                                    ";
html+="				<input type=\"text\" placeholder=\"공급 단가를 입력해주세요.\" id=\"UNPR\" name=\"UNPR\"/>                                    ";
html+="			</div>                                                                                                  ";
html+="		</div>                                                                                                      ";
html+="		<div class=\"underline\">                                                                                   ";
html+="			<div class=\"line1\">공급 기간 *</div>                                                                  ";
html+="			<div class=\"con5\" id=\"con5\">                                                                                    ";
html+="				<span>시작시 :</span><input type=\"date\" id=\"startDate\" name=\"startDate\" disabled/>                                                        ";
html+="				<span>종료시 :</span><input type=\"date\" id=\"endDate\" name=\"endDate\" disabled/>                                                        ";
html+="			</div>                                                                                                  ";
html+="		</div>                                                                                                      ";
html+="		<div class=\"underline\">                                                                                   ";
html+="			<div class=\"line1\">공급 건수 *</div>                                                                  ";
html+="			<div class=\"con6\" id=\"con6\">                                                                                    ";
html+="				<input type=\"text\" placeholder=\"총 공급 건수를 입력해주세요.\" id=\"supplyCnt\" name=\"supplyCnt\" disabled style=\"width:180px\"/>  ";
html+="			</div>                                                                                                  ";
html+="		</div>                                                                                                      ";
html+="	</div>                                                                                                          ";
html+="		<label>*모두 입력하지 않으면 등록 할 수 없습니다.</label>                ";
html+="</form>";
		return html;
}
	
	///디테일 아작스///
	function ChanDetailAjax() {
		var params = $("#actionForm").serialize();
		var html="";
		$.ajax({
			type : "post",
			url : "ChanDetailAjax",
			dataType : "json",
			data : params, 
			success : function(res) { 
				html="<span>"+res.list.CHAN_NM+"</span>";
				html+= "<input type=\"hidden\" id=\"ChanNo\" name=\"ChanNo\" value="+res.list.CHAN_NO+"/>";
				$("#con1").html(html);
				html="<span>"+res.list.CHAN_TYPE+"</span>";
				$("#con2").html(html);
				html="<span>"+res.list.SUBC_NM+"</span>";
				$("#con3").html(html);
				html="<span>"+res.list.COTR_TYPE_NM+"</span>";
				$("#con4").html(html);
				html="<span>"+res.list.UNPR+"</span>";
				$("#con5").html(html);
				if(res.list.COTR_START_PERD != null){
				html="<span>"+res.list.COTR_START_PERD+"</span></br><span>"+res.list.COTR_END_PERD+"</span>";
				$("#con6").html(html);
				}
				if(res.list.SUPL_CNT != null){
				html="<span>"+res.list.SUPL_CNT+"</span>";
				$("#con7").html(html);
				}
				
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
///디테일 드로우///
	function ChanDetailDraw(){
		var html="";
		html+="	<form action=\"DetailactionForm\" method=\"post\" id=\"DetailactionForm\">";
		html+="		<div class=\"underbox\" style=\"width: 100%\">   ";
		html+="			<div class=\"underline\">                    ";
		html+="				<div class=\"line1\">채널명 *</div>      ";
		html+="				<div class=\"con1\" id=\"con1\" name=\"con1\">                     ";
		html+="				</div>                                   ";
		html+="			</div>                                       ";
		html+="			<div class=\"underline\">                    ";
		html+="				<div class=\"line1\">채널유형 *</div>    ";
		html+="				<div class=\"con2\"id=\"con2\" name=\"con2\">                     ";
		html+="				</div>                                   ";
		html+="			</div>                                       ";
		html+="			<div class=\"underline\">                    ";
		html+="					<div class=\"line1\">공급 업체 *</div>	";
		html+="				<div class=\"con3\"id=\"con3\" name=\"con3\">                     ";
		html+="				</div>                                   ";
		html+="			</div>                                       ";
		html+="			<div class=\"underline\">                    ";
		html+="				<div class=\"line1\">공급 유형 *</div>   ";
		html+="				<div class=\"con4\"id=\"con4\" name=\"con4\">                     ";
		html+="				</div>                                   ";
		html+="			</div>                                       ";
		html+="			<div class=\"underline\">                    ";
		html+="				<div class=\"line1\">공급 단가 *</div>   ";
		html+="				<div class=\"con5\"id=\"con5\" name=\"con5\">                     ";
		html+="				</div>                                   ";
		html+="			</div>                                       ";
		html+="			<div class=\"underline\">                    ";
		html+="				<div class=\"line1\">공급 기간 *</div>   ";
		html+="				<div class=\"con6\"id=\"con6\" name=\"con6\">                     ";
		html+="				</div>                                   ";
		html+="			</div>                                       ";
		html+="			<div class=\"underline\">                    ";
		html+="				<div class=\"line1\">공급 건수 *</div>   ";
		html+="			<div class=\"con7\"id=\"con7\" name=\"con7\">                         ";
		html+="			</div>                                       ";
		html+="		</div>                                           ";
		html+="	</div>";
		html+="</form>";
		return html;
}	
	//디테일///
	function ChanDetailAjax2(data) {
		var params = $("#actionForm").serialize();
		var html="";
		$.ajax({
			type : "post",
			url : "ChanDetailAjax",
			dataType : "json",
			data : params, 
			success : function(res) { 
							
				$("#chanNM").val(res.list.CHAN_NM);
				$("#UNPR").val(res.list.UNPR);
				$("#startDate").val(res.list.COTR_START_PERD);
				$("#endDate").val(res.list.COTR_END_PERD);
				$("#supplyCnt").val(res.list.SUPL_CNT);
				
			
				channelTypeSelect(".con1",data.chanlist,"channelTypeSelectAdd","channelTypeSelectAdd",res.list.CHAN_TYPE_NO);	
				supplySubcSelect(".con2",data.subclist,"supplySubcSelectAdd","supplySubcSelectAdd",res.list.SUPL_SUBC_NO);
				supplyType(".con3",data.supllist,"supplyTypeSelectAdd","supplyTypeSelectAdd", res.list.COTR_TYPE_NO); 
				if($("#supplyTypeSelectAdd").val() == 1){
					 $("#startDate").attr("disabled",true);
						$("#endDate").attr("disabled",true);
						$("#supplyCnt").removeAttr("disabled");
				 }else if($("#supplyTypeSelectAdd").val() == 2){
					 $("#startDate").removeAttr("disabled");
						$("#endDate").removeAttr("disabled");
						$("#supplyCnt").attr("disabled",true);
				 }
				flag = 0;
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	//업데이트//
	function ChanUpdateAjax() {
		var params = $("#AddactionForm").serialize();
		$.ajax({
			type : "post",
			url : "ChanUpdateAjax",
			dataType : "json",
			data : params, 
			success : function(res) { 
				alert("채널을 수정하였습니다!");
				reloadList();
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	///삭제///
	function ChanDeleteAjax() {
		var params = $("#AddactionForm").serialize();
		$.ajax({
			type : "post",
			url : "ChanDeleteAjax",
			dataType : "json",
			data : params, 
			success : function(res) { 
				reloadList();
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	///부가정보 드로우///
function etcDraw(){
	var html="";
	html+= "		<div class=\"underbox\" style=\"width: 100%\">                   ";
	html+= "		<div class=\"etcLeftBox\">";
	html+= "		</div>                                                       ";
 	html+= "		<div class=\"etcRightBox\">                                       ";
	html+= "		<div id=\"radioDiv\">                                                        ";
	html+= "			<input type=\"radio\" name=\"etcRadio\" id=\"etcRadio\" checked value=\"1\"/>  채널유형  "; 
	html+= "			</div>                                                   ";
	html+= "			<div id=\"radioDiv\">                                                    ";
	html+= "			<input type=\"radio\" name=\"etcRadio\" id=\"etcRadio\" value=\"2\"/>  공급유형";
	html+= "			</div>                                                   ";
	html+= "			<div id=\"radioDiv\">                                                    ";
	html+= "			<input type=\"radio\" name=\"etcRadio\" id=\"etcRadio\" value=\"3\"/>  공급업체  ";
	html+= "			</div>                                                  ";
	html+= "			<div id=\"etcDiv\">                                                   ";
	html+= "				<input type=\"text\" placeholder=\"내용을 입력해 주세요\" id=\"etcInput\"\> ";
	html+= "			</div>                                                  ";
	html+= "			                                                         ";
	html+= "			<div>                                                    ";
	html+= "				<input type=\"button\" id=\"addEtcBtn\" value=\"추가\"/>                  ";
	html+= "				<input type=\"button\" id=\"deleteEtcBtn\" value=\"삭제\"/>                  ";
	html+= "			</div>                                                   ";
	html+= "		</div>                                                      "; 
	html+= "	</div>                                                          ";
		
	return html;
}
///부가정보 목록 드로우///
function etcConDraw(list,no,name){
	var html="";
	for (var i = 0; i < list.length; i++) {
		html+= "			<div class=\"etcConBox\ id=\"etcConBox\" name="+list[i][no]+">";
		html+= " <span>"+(i+1)+".</span><input type=\"button\" id=\"etcCon\" name="+list[i][no]+" value=\""+list[i][name]+"\" readonly />";
		html+= "			</div>                                                       ";
		}
	$(".etcLeftBox").html(html);
}
///부가정보 목록 아작스///
function etcAjax() {
	var params = $("#actionForm").serialize();
	$.ajax({
		type : "post",
		url : "etcAjax",
		dataType : "json",
		data : params, 
		success : function(res) { 
			if(etcFlag=="1"){
			console.log(etcFlag);
				etcConDraw(res.list1,"CHAN_TYPE_NO","CHAN_TYPE");
			} else if(etcFlag=="2"){
			console.log(etcFlag);
				etcConDraw(res.list2,"COTR_TYPE_NO","COTR_TYPE_NM");
			} else{
			console.log(etcFlag);
				etcConDraw(res.list3,"SUPL_SUBC_NO","SUBC_NM");
			}
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}
///부가정보 삭제 아작스///
function deleteEtcAjax(){
	var params = $("#actionForm").serialize();
	$.ajax({
		type : "post",
		url : "deleteEtcAjax",
		dataType : "json",
		data : params, 
		success : function(res) { 
			if(res.res == "LOSS"){
				alert("해당하는 이름의 정보가 존재하지않습니다!");
			}
			else{
			etcAjax();
			$("#etcConNo").val("");
			alert("부가정보가 삭제되었습니다!");
			}
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}

function addEtcAjax(){
	var params = $("#actionForm").serialize();
	$.ajax({
		type : "post",
		url : "addEtcAjax",
		dataType : "json",
		data : params, 
		success : function(res) { 
			console.log(res.res);
			if(res.res == "OVERLAP"){
				alert("중복된 이름이 존재합니다.");
			}
			else{
				alert("추가가 성공적으로 되었습니다!");
				etcAjax();
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
		<div class="contents_header_txt">채널 목록</div>
	</div>
	<!-- Contents -->
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 메뉴 시작 -->
		<form action="#" method="post" id="actionForm">
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="page" id="page" value="${page }" />
			<input type="hidden" name="chanNo" id="chanNo"/>
			<input type="hidden" name="etcFlaghidden" id="etcFlaghidden" value="1" />
			<input type="hidden" name="etcConNo" id="etcConNo" />
			<input type="hidden" name="etcAddNm" id="etcAddNm" />
			<div class="cam_menu1">
				<div class="cam_menu1_date">
				기간.
						<input id="ChanStartDate" name="ChanStartDate" type="date"  min="2015-01-01" max="2021-12-31" />
						~
						<input id="ChanEndDate" name="ChanEndDate" type="date"  min="2015-01-01" max="2021-12-31" />
				</div>
				<div class="channelType" id="channelType" name="channelType">
				</div>
				
				<div class="supplySubc" id="supplySubc" name="supplySubc" >
				</div>
				<div class="supplyType" id="supplyType" name="supplyType">
		</div>
				<input type="text" placeholder="공급 단가를 입력하세요." id="supply_unpr" name="supply_unpr">
				<div class="cam_menu1_reset">
						<img id="resetBtn" class="reset_img" src="resources/images/crm/campaign/reset.png">
					</div>
					<div class="cam_menu1_search">
						<img id="SearchBtn" class="sear_img" src="resources/images/crm/campaign/search.png">
					</div>
				</div>
		</form>
		<!-- 메뉴 끝 -->
		<!-- 캠페인 목록 시작 -->
		<div class="defaultBox">
		<div class=default_board>
			<table>
			<colgroup>
					<col width="580px">
					<col width="280px">
					<col width="450px">
					<col width="300px">
					<col width="300px">
				
				</colgroup>
				<thead>
					<tr class="top">
						<th>채널명</th>
						<th>채널유형</th>
						<th>공급업체</th>
						<th>단가</th>
						<th>계약유형</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
		<!-- 캠페인 목록 끝 -->
		<div class="page_wrap">
			<div class="page_nation"></div>
			
				<div class="search_btn_area" > <!-- 팝업 버튼들 -->
						<input type="button" value="채널 추가" id="ChanAdd" name="ChanAdd" style="height:29px; float:right"/>
						<input type="button" value="기타정보관리" id="EtcInfoMang" name="EtcInfoMang" style="height:29px; float:right"/>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>
