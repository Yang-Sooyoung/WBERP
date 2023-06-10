<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 영업 상세보기</title>
<style type="text/css">
/* 상세보기영역 가로변경 시 */
.underbox {
	width: 800px;
}

/* 버튼영역 가로변경 시 */
.detail_btn_area {
	width: 800px;
}
/* 개별 css는 여기에 */
.contents{
	font-size: 10pt;
}
.default_search_area {
	width: 800px;
	min-height: 40px;
}
.sales_create_contents_essential {
	float: right;
	font-size: 10pt;
	margin-bottom: 10px;
	color: #DF0101;
}
.sales_create_contents_allCheckbox{
	display: inline-block;
}

.sales_create_upload{
	width: 800px;
}
.sales_create_upload1{
	display: inline-block;
}
.sales_create_upload2{
	display: inline-block;
	float: right;
	padding: 1px 2px 0px 0px;
}
.sales_create_downloadArea{
	height: 150px;
	width: 800px;
}
.sales_detail_contents_table {
	box-shadow: 1px 1px 4px #c2c2c2;
	margin: 0px 0px 40px 40px;
	height: 500px;
	width: 740px;
}

.sales_detail_contents_table1 {
	box-shadow: 1px 1px 4px #c2c2c2;
	margin: 0px 0px 40px 40px;
	height: 100px;
	width: 740px;
}

.sales_detail_contents_tableHeader {
	background-color: #E4EAF2;
	padding-left: 10px;
	height: 50px;
	font-weight: bold;
	color: #022859;
}

.sales_detail_contents_tableContents {
	padding-left: 10px;
}
.contents_activities{
	width: 780px;
	margin-top: 10px;
}
.write_con {
	width: 480px;
	height: 90px;
	resize: none;
	margin: 2px;
}
.con {
	width: 480px;
}
.tabs {
	width: 840px;
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
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
	$(document).ready(function() {
		console.log($("#sugsCnt").val());
		
		$("#tabNo").val("0");
		   commentReloadList();
		   tabReloadList();
		
		$("#listBtn").on("click", function() {
			$("#actionForm").attr("action", "saleMang");
			$("#actionForm").submit();
		});
		
		$("#updateBtn").on("click", function() {
			$("#actionForm").attr("action", "saleMangUpdate");
			$("#actionForm").submit();
		});
		
		//탭
		$("#tabs").tabs();
				
		var tabs = $( "#tabs" ).tabs();
		
		$("body").on( "click", "li", function() {
		   if($(this).attr("id") == "sugsTabs"){
			   $("#tabNo").val("0");
			   commentReloadList();
			   tabReloadList();
			   $("#opnnCont2").val("");
			   $("#opnnCont3").val("");
		   } else if($(this).attr("id") == "negtTabs"){
			   $("#tabNo").val("1");
			   commentReloadList();
			   tabReloadList();
			   $("#opnnCont1").val("");
			   $("#opnnCont3").val("");
		   } else{
			   $("#tabNo").val("2");
			   commentReloadList();
			   tabReloadList();
			   $("#opnnCont1").val("");
			   $("#opnnCont2").val("");
		   }
		});
		
		//탭 페이지
		$("#commentPage").on("click", "span", function() {
			if($("#tabNo").val() == "0"){				
				$("#sugsPage").val($(this).attr("name"));
				commentReloadList();
				tabReloadList();
			} else if($("#tabNo").val() == "1"){
				$("#negtPage").val($(this).attr("name"));
				commentReloadList();
				tabReloadList();
			} else {
				$("#cotrPage").val($(this).attr("name"));
				commentReloadList();
				tabReloadList();
			}
			
		});
		
		//코멘트 등록
		$("body").on("click", "#commentSaveBtn", function() {
			if($("#tabNo").val() == "0") {
				$("#saleOpnnCont").val($("#opnnCont1").val());
			} if($("#tabNo").val() == "1") {			
				$("#saleOpnnCont").val($("#opnnCont2").val());
			} if($("#tabNo").val() == "2") {
				$("#saleOpnnCont").val($("#opnnCont3").val());
			} if($.trim($("#opnnCont1").val()) == "" && $("#tabNo").val() == "0") {
				alert("내용을 입력하여 주세요.");
				$("#opnnCont1").focus();
			} else if($.trim($("#opnnCont2").val()) == "" && $("#tabNo").val() == "1") {
				alert("내용을 입력하여 주세요.");
				$("#opnnCont2").focus();
			} else if($.trim($("#opnnCont3").val()) == "" && $("#tabNo").val() == "2") {
				alert("내용을 입력하여 주세요.");
				$("#opnnCont3").focus();
			}  else {
				var params = $("#actionForm").serialize();
				
				$.ajax({
					type : "post",
					url : "commentAddAjax",
					dataType : "json",
					data : params,
					success : function(res) {
						if(res.res == "SUCCESS") {
							commentReloadList();
							$("#opnnCont1").val("");
							$("#opnnCont2").val("");
							$("#opnnCont3").val("");
						} else {
							alert("작성중 문제가 발생하였습니다.");
						}
					},
					error : function(req, status, error) {
						console.log("code : " + req.status);
						console.log("message : " + req.responseText);
					}
				});
			}
		});
		
		//코멘트 수정
		$(".comment_list_wrap").on("click", "#commentUpdateBtn", function() {
			$("#saleOpnnNo").val($(this).parent().parent().attr("name"));
			if($("#tabNo").val() == "0") {
				$("#opnnCont1").val($(this).parent().parent().children(".con1").children(".con").html());
				$("body .btn_wrap1 #commentSaveBtn").val("수정");
				$("body .btn_wrap1 #commentSaveBtn").attr("id", "commentUpdateBtn1");
			} else if($("#tabNo").val() == "1") {
				$("#opnnCont2").val($(this).parent().parent().children(".con1").children(".con").html());				
				$("body .btn_wrap2 #commentSaveBtn").val("수정");
				$("body .btn_wrap2 #commentSaveBtn").attr("id", "commentUpdateBtn1");
			} else {
				$("#opnnCont3").val($(this).parent().parent().children(".con1").children(".con").html());								
				$("body .btn_wrap3 #commentSaveBtn").val("수정");
				$("body .btn_wrap3 #commentSaveBtn").attr("id", "commentUpdateBtn1");
			}
		});
		
		$("body").on("click", "#commentUpdateBtn1", function() {
			if($("#tabNo").val() == "0") {
				$("#saleOpnnCont").val($("#opnnCont1").val());
			} if($("#tabNo").val() == "1") {			
				$("#saleOpnnCont").val($("#opnnCont2").val());
			} if($("#tabNo").val() == "2") {
				$("#saleOpnnCont").val($("#opnnCont3").val());
			} if($.trim($("#opnnCont1").val()) == "" && $("#tabNo").val() == "0") {
				alert("내용을 입력하여 주세요.");
				$("#opnnCont1").focus();
			} else if($.trim($("#opnnCont2").val()) == "" && $("#tabNo").val() == "1") {
				alert("내용을 입력하여 주세요.");
				$("#opnnCont2").focus();
			} else if($.trim($("#opnnCont3").val()) == "" && $("#tabNo").val() == "2") {
				alert("내용을 입력하여 주세요.");
				$("#opnnCont3").focus();
			} else {
				var params = $("#actionForm").serialize();
				
				$.ajax({
					type : "post",
					url : "commentUpdateAjax",
					dataType : "json",
					data : params,
					success : function(res) {
						if(res.res == "SUCCESS") {
							$("#saleOpnnNo").val("");
							$("#saleOpnnCont").val("");
							commentReloadList();
							$("body .btn_wrap1 #commentUpdateBtn1").val("등록");
							$("body .btn_wrap1 #commentUpdateBtn1").attr("id", "commentSaveBtn");
							$("body .btn_wrap2 #commentUpdateBtn1").val("등록");
							$("body .btn_wrap2 #commentUpdateBtn1").attr("id", "commentSaveBtn");
							$("body .btn_wrap3 #commentUpdateBtn1").val("등록");
							$("body .btn_wrap3 #commentUpdateBtn1").attr("id", "commentSaveBtn");
							$("#opnnCont1").val("");
							$("#opnnCont2").val("");
							$("#opnnCont3").val("");
						} else if(res.res == "FAILED") {
							alert("잘못된 데이터를 입력하셨습니다.");
						} else {
							alert("수정중 문제가 발생하였습니다.");
						}
					},
					error : function(req, status, error) {
						console.log("code : " + req.status);
						console.log("message : " + req.responseText);
					}
				});
			}
		});
		
		//코멘트 삭제
		$(".comment_list_wrap").on("click", "#commentDeleteBtn", function() {
			if(confirm("삭제하시겠습니까?")) {
				$("#saleOpnnNo").val($(this).parent().parent().attr("name"));
				
				var params = $("#actionForm").serialize();
				
				$.ajax({
					type : "post",
					url : "commentDeleteAjax",
					dataType : "json",
					data : params,
					success : function(res) {
						if(res.res == "SUCCESS") {
							$("#saleOpnnNo").val("");
							commentReloadList();
						} else if(res.res == "FAILED") {
							alert("잘못된 데이터를 입력하셨습니다.");
						} else {
							alert("삭제중 문제가 발생하였습니다.");
						}
					},
					error : function(req, status, error) {
						console.log("code : " + req.status);
						console.log("message : " + req.responseText);
					}
				});
			}
		});
		
		//영업단계 팝업
		
		//제안 등록
		$("#sugsAddBtn").on("click", function() {
			
			var html = "";
			
			html += "<form action=\"sugsActionForm\" method=\"post\" id=\"sugsActionForm\" >";
			html += "<input type=\"hidden\" name=\"saleNo1\" id=\"saleNo1\" value=\"${param.saleNo}\" />";
			html += "<input type=\"hidden\" name=\"search3Page\" id=\"search3Page\" value=\"1\" />";
			html += "<input type=\"hidden\" name=\"searchGbn3Hidden\" id=\"searchGbn3Hidden\" value=\"${param.searchGbn3Hidden}\" />";
			html += "<input type=\"hidden\" name=\"searchTxt3Hidden\" id=\"searchTxt3Hidden\" value=\"${param.searchTxt3Hidden}\" />";
			html += "<input type=\"hidden\" name=\"godsNo1\" id=\"godsNo1\"/>";

			html += "<div class=\"default_search_area\">";
			html += "<div class=\"search_btn_area\">*는 필수항목</div></div>";
			html += "<div class=\"underbox\">";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">제안일*</div>";
			html += "<div class=\"con1\">";
			html += "<input type=\"date\" id=\"sugsDay\" name=\"sugsDay\" /></div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">상품명*</div>";
			html += "<div class=\"con1\">";
			html += "<input type=\"text\" id=\"godsNm1\" name=\"godsNm1\" disabled=\"disabled\" />"
			html += "<input type=\"button\" id=\"godsNmBtn1\" name=\"godsNmBtn1\" value=\"검색\"/></div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출종류*</div>";
			html += "<div class=\"con1\">";
			html += "<select id=\"loanKind1\" name=\"loanKind1\">";
			html += "<option value=\"0\">기업운전</option>";
			html += "<option value=\"1\">기업시설</option>";
			html += "<option value=\"2\">기업정책</option>";
			html += "</select>";
			html += "</div></div>";	
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출기간*</div>";
			html += "<div class=\"con1\">";
			html += "<select id=\"loanPerd1\" name=\"loanPerd1\">";
			html += "<option value=\"0\">6개월 이내</option>";
			html += "<option value=\"1\">1년 이내</option>";
			html += "<option value=\"2\">2년 이내</option>";
			html += "<option value=\"3\">3년 이내</option>";
			html += "<option value=\"4\">3년 이상</option>";
			html += "</select>";
			html += "</div></div>";			
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">고객니즈*</div>";
			html += "<div class=\"con1\">";
			html += "<textarea class=\"write_con\" id=\"custNeds\" name=\"custNeds\"></textarea></div></div></div>";
			html += "</form>";
			
			makeBtn2Popup(1, "제안 등록", html, false, 850, 460, function() {
				
				$("#godsNmBtn1").on("click", function() {
					
					var html = "";
					html += "<div class=\"popup_contents3\">";
					html += "</div>";
					
					makeBtn1Popup(2, "상품명 검색", html, true, 650, 650,
							reloadSearchPopup3(), "닫기", function() {
									closePopup(2);
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
						$("#godsNo1").val($(this).attr("name"));
						$("#godsNm1").val($(this).children("input").attr("id"));
						console.log($("#godsNo1").val());
						console.log($("#godsNm1").val());
						closePopup(2);
					});
				});
			}, "등록", function() {
				if ($.trim($("#sugsDay").val()) == ""){
					alert("제안일을 입력해주세요.");
					$("#custNeds").focus();
				} else if ($.trim($("#godsNm1").val()) == ""){
					alert("상품명을 입력해주세요.");
					$("#godsNm1").focus();
				} else if ($.trim($("#loanKind1").val()) == ""){
					alert("대출종류를 입력해주세요.");
					$("#loanKind1").focus();
				} else if ($.trim($("#loanPerd1").val()) == ""){
					alert("대출기간을 입력해주세요.");
					$("#loanPerd1").focus();
				} else if ($.trim($("#custNeds").val()) == ""){
					alert("고객니즈를 입력해주세요.");
					$("#custNeds").focus();
				} else {
					var params = $("#sugsActionForm").serialize();
					$.ajax({
						type : "post",
						url : "sugsAddAjax",
						dataType : "json", 
						data : params, 
						success : function(res) {
							if(res.res == "SUCCESS"){
								$("#actionForm").attr("action", "saleMangDetail");
								$("#actionForm").submit();
							} else {
								$("#alert").attr("title", "알림");
								$("#alert p").html("저장에 실패하였습니다.");
								$("#alert").dialog({
									buttons: {
										Ok: function() {
											$(this).dialog("close");
										}
									}
								});
							}
						},
						error: function(req, status, error){ 
							console.log("code : " + req.status);
							console.log("message : " + req.responseText);
						}
					});
				}
			}, "취소", function() {
					closePopup(1);
				});
			
		});
		
		//협상 등록
		$("#negtAddBtn").on("click", function() {
			
			var html = "";
			
			html += "<div class=\"default_search_area\">";
			html += "<div class=\"search_btn_area\">*는 필수항목</div></div>";
			html += "<div class=\"underbox\">"; //
			html += "<form action=\"negtActionForm\" method=\"post\" id=\"negtActionForm\" >";
			html += "<input type=\"hidden\" name=\"saleNo2\" id=\"saleNo2\" value=\"${param.saleNo}\" />";
			html += "<input type=\"hidden\" name=\"search4Page\" id=\"search4Page\" value=\"1\" />";
			html += "<input type=\"hidden\" name=\"searchGbn4Hidden\" id=\"searchGbn4Hidden\" value=\"${param.searchGbn4Hidden}\" />";
			html += "<input type=\"hidden\" name=\"searchTxt4Hidden\" id=\"searchTxt4Hidden\" value=\"${param.searchTxt4Hidden}\" />";
			html += "<input type=\"hidden\" name=\"godsNo2\" id=\"godsNo2\"/>";
			html += "<input type=\"hidden\" name=\"negtFile\" id=\"negtFile\" />";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">상품명*</div>";
			html += "<div class=\"con1\">";
			html += "<input type=\"text\" id=\"godsNm2\" name=\"godsNm2\" disabled=\"disabled\" />"
			html += "<input type=\"button\" id=\"godsNmBtn2\" name=\"godsNmBtn2\" value=\"검색\"/></div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출종류*</div>";
			html += "<div class=\"con1\">";
			html += "<select id=\"loanKind2\" name=\"loanKind2\">";
			html += "<option value=\"0\">기업운전</option>";
			html += "<option value=\"1\">기업시설</option>";
			html += "<option value=\"2\">기업정책</option>";
			html += "</select>";
			html += "</div></div>";	
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출기간*</div>";
			html += "<div class=\"con1\">";
			html += "<select id=\"loanPerd2\" name=\"loanPerd2\">";
			html += "<option value=\"0\">6개월 이내</option>";
			html += "<option value=\"1\">1년 이내</option>";
			html += "<option value=\"2\">2년 이내</option>";
			html += "<option value=\"3\">3년 이내</option>";
			html += "<option value=\"4\">3년 이상</option>";
			html += "</select>";
			html += "</div></div>";	
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">담보*</div>";
			html += "<div class=\"con1\">";
			html += "<select id=\"colt1\" name=\"colt1\">";
			html += "<option value=\"0\">신용</option>";
			html += "<option value=\"1\">보증</option>";
			html += "<option value=\"2\">부동산 담보</option>";
			html += "<option value=\"3\">예적금 담보</option>";
			html += "<option value=\"4\">기타</option>";
			html += "<option value=\"5\">제한없음</option>";
			html += "</select>";
			html += "</div></div>";	
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">금액*</div>";
			html += "<div class=\"con1\">";
			html += "<input type=\"text\" id=\"price1\" name=\"price1\" /></div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">고객반응*</div>";
			html += "<div class=\"con1\">";
			html += "<textarea class=\"write_con\" id=\"custRect\" name=\"custRect\"></textarea></div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">고객요구사항*</div>";
			html += "<div class=\"con1\">";
			html += "<textarea class=\"write_con\" id=\"custDemnMatr\" name=\"custDemnMatr\"></textarea></div></div>";
			html += "</form>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">견적서*</div>";
			html += "<div class=\"con1\">";
			html += "<form id=\"negtFileForm\" name=\"negtFileForm\" method=\"post\" action=\"fileUploadAjax\" enctype=\"multipart/form-data\" >";
			html += "<input type=\"file\" name=\"attFile1\" />";
			html += "</form>";
			html += "</div></div></div>";			
			
			makeBtn2Popup(1, "협상 등록", html, false, 850, 620, function() {
				//상품 검색 버튼
				$("#godsNmBtn2").on("click", function() {
					var html = "";
					html += "<div class=\"popup_contents3\">";
					html += "</div>";
					
					makeBtn1Popup(2, "상품명 검색", html, true, 650, 650,
							reloadSearchPopup4(), "닫기", function() {
									closePopup(2);
								});
					 
					$(document).on("click", ".page_nation3 div", function() {
						$("#search4Page").val($(this).attr("name"));
						 reloadSearchPopup4();
					});
					
					
					$(document).on("click","#searchBtn4", function() {
						if($("#searchGbn4").val() != '') {
							
							console.log($("#searchGbn4").val());
							$("#searchGbn4Hidden").val($("#searchGbn4").val());
							console.log($("#searchGbn4Hidden").val());
						}
						$("#searchTxt4Hidden").val($("#searchTxt4").val());
						console.log($("#searchTxt4Hidden").val());
						$("#search4Page").val("1");
						reloadSearchPopup3();
					});
					
					$(document).on("click","tr#searchList4", function() {
						$("#godsNo2").val($(this).attr("name"));
						$("#godsNm2").val($(this).children("input").attr("id"));
						console.log($("#godsNo2").val());
						console.log($("#godsNm2").val());
						closePopup(2);
					});
				});
			}, "등록", function() {
				
				if ($.trim($("#godsNm2").val()) == ""){
					alert("상품명을 입력해주세요.");
					$("#godsNm2").focus();
				} else if ($.trim($("#loanKind2").val()) == ""){
					alert("대출종류를 입력해주세요.");
					$("#loanKind2").focus();
				} else if ($.trim($("#loanPerd2").val()) == ""){
					alert("대출기간을 입력해주세요.");
					$("#loanPerd2").focus();
				} else if ($.trim($("#colt1").val()) == ""){
					alert("담보를 입력해주세요.");
					$("#colt1").focus();
				} else if ($.trim($("#price1").val()) == ""){
					alert("금액을 입력해주세요.");
					$("#price1").focus();
				} else if ($.trim($("#custRect").val()) == ""){
					alert("고객반응을 입력해주세요.");
					$("#custRect").focus();
				} else if ($.trim($("#custDemnMatr").val()) == ""){
					alert("고객요구사항을 입력해주세요.");
					$("#custDemnMatr").focus();
				} else if ($.trim($("#negtFile").val()) == ""){
					alert("견적서를 업로드해주세요.");
					$("#negtFile").focus();
				} else {
					var fileForm=$("#negtFileForm");
					fileForm.ajaxForm({
						success: function(res){
							if(res.result =="SUCCESS"){
								if(res.fileName.length>0){
									$("#negtFile").val(res.fileName[0]);
								}
								var params=$("#negtActionForm").serialize();
								$.ajax({
									type : "post",
									url : "negtAddAjax",
									dataType : "json",
									data : params,
									success : function(res) { 
										if(res.res=="SUCCESS"){
											$("#actionForm").attr("action", "saleMangDetail");
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
							} else {
								alert("저장실패");
							} 
						},
						error: function(req){
							console.log(req.responseText);
							alert("파일저장 에러"); 
						}
					});
					
					fileForm.submit();
				}
			}, "취소", function() {
					closePopup(1);
				});
		});
		
		//계약 등록
		$("#cotrAddBtn").on("click", function() {
			
			var html = "";
			
			html += "<div class=\"default_search_area\">";
			html += "<div class=\"search_btn_area\">*는 필수항목</div></div>";
			html += "<div class=\"underbox\">"; //
			html += "<form action=\"cotrActionForm\" method=\"post\" id=\"cotrActionForm\" >";
			html += "<input type=\"hidden\" name=\"saleNo3\" id=\"saleNo3\" value=\"${param.saleNo}\" />";
			html += "<input type=\"hidden\" name=\"search5Page\" id=\"search5Page\" value=\"1\" />";
			html += "<input type=\"hidden\" name=\"searchGbn5Hidden\" id=\"searchGbn5Hidden\" value=\"${param.searchGbn5Hidden}\" />";
			html += "<input type=\"hidden\" name=\"searchTxt5Hidden\" id=\"searchTxt5Hidden\" value=\"${param.searchTxt5Hidden}\" />";
			html += "<input type=\"hidden\" name=\"godsNo3\" id=\"godsNo3\"/>";
			html += "<input type=\"hidden\" name=\"cotrFile\" id=\"cotrFile\" />";			
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">계약일*</div>";
			html += "<div class=\"con1\">";
			html += "<input type=\"date\" id=\"cotrDay\" name=\"cotrDay\" /></div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">상품명*</div>";
			html += "<div class=\"con1\">";
			html += "<input type=\"text\" id=\"godsNm3\" name=\"godsNm3\" disabled=\"disabled\" />"
			html += "<input type=\"button\" id=\"godsNmBtn3\" name=\"godsNmBtn3\" value=\"검색\"/></div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출종류*</div>";
			html += "<div class=\"con1\">";
			html += "<select id=\"loanKind3\" name=\"loanKind3\">";
			html += "<option value=\"0\">기업운전</option>";
			html += "<option value=\"1\">기업시설</option>";
			html += "<option value=\"2\">기업정책</option>";
			html += "</select>";
			html += "</div></div>";	
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출기간*</div>";
			html += "<div class=\"con1\">";
			html += "<select id=\"loanPerd3\" name=\"loanPerd3\">";
			html += "<option value=\"0\">6개월 이내</option>";
			html += "<option value=\"1\">1년 이내</option>";
			html += "<option value=\"2\">2년 이내</option>";
			html += "<option value=\"3\">3년 이내</option>";
			html += "<option value=\"4\">3년 이상</option>";
			html += "</select>";
			html += "</div></div>";	
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">담보*</div>";
			html += "<div class=\"con1\">";
			html += "<select id=\"colt2\" name=\"colt2\">";
			html += "<option value=\"0\">신용</option>";
			html += "<option value=\"1\">보증</option>";
			html += "<option value=\"2\">부동산 담보</option>";
			html += "<option value=\"3\">예적금 담보</option>";
			html += "<option value=\"4\">기타</option>";
			html += "<option value=\"5\">제한없음</option>";
			html += "</select>";
			html += "</div></div>";	
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">금액*</div>";
			html += "<div class=\"con1\">";
			html += "<input type=\"text\" id=\"price2\" name=\"price2\" /></div></div>";
			html += "</form>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">계약서*</div>";
			html += "<div class=\"con1\">";
			html += "<form id=\"cotrFileForm\" name=\"cotrFileForm\" method=\"post\" action=\"fileUploadAjax\" enctype=\"multipart/form-data\" >";
			html += "<input type=\"file\" name=\"attFile2\" />";
			html += "</form>";
			html += "</div></div></div>";
			
			makeBtn2Popup(1, "계약 등록", html, false, 850, 450, function() {
				//상품 검색 버튼
				$("#godsNmBtn3").on("click", function() {
					var html = "";
					html += "<div class=\"popup_contents3\">";
					html += "</div>";
					
					makeBtn1Popup(2, "상품명 검색", html, true, 650, 650,
							reloadSearchPopup5(), "닫기", function() {
									closePopup(2);
								});
					 
					$(document).on("click", ".page_nation3 div", function() {
						$("#search5Page").val($(this).attr("name"));
						 reloadSearchPopup5();
					});
					
					
					$(document).on("click","#searchBtn5", function() {
						if($("#searchGbn5").val() != '') {
							
							console.log($("#searchGbn3").val());
							$("#searchGbn5Hidden").val($("#searchGbn5").val());
							console.log($("#searchGbn5Hidden").val());
						}
						$("#searchTxt5Hidden").val($("#searchTxt5").val());
						console.log($("#searchTxt5Hidden").val());
						$("#search5Page").val("1");
						reloadSearchPopup5();
					});
					
					$(document).on("click","tr#searchList5", function() {
						$("#godsNo3").val($(this).attr("name"));
						$("#godsNm3").val($(this).children("input").attr("id"));
						console.log($("#godsNo3").val());
						console.log($("#godsNm3").val());
						closePopup(2);
					});
				});
			}, "등록", function() {
				if ($.trim($("#cotrDay").val()) == ""){
					alert("계약일을 입력해주세요.");
					$("#cotrDay").focus();
				} else if ($.trim($("#godsNm3").val()) == ""){
					alert("상품명을 입력해주세요.");
					$("#godsNm3").focus();
				} else if ($.trim($("#loanKind3").val()) == ""){
					alert("대출종류를 입력해주세요.");
					$("#loanKind3").focus();
				} else if ($.trim($("#loanPerd3").val()) == ""){
					alert("대출기간을 입력해주세요.");
					$("#loanPerd3").focus();
				} else if ($.trim($("#colt2").val()) == ""){
					alert("담보를 입력해주세요.");
					$("#colt2").focus();
				} else if ($.trim($("#price2").val()) == ""){
					alert("금액을 입력해주세요.");
					$("#price2").focus();
				} else {
					var fileForm=$("#cotrFileForm");
					fileForm.ajaxForm({ 
						success: function(res){
							if(res.result =="SUCCESS"){
								if(res.fileName.length>0){
									$("#cotrFile").val(res.fileName[0]);
								}
								var params=$("#cotrActionForm").serialize();
								$.ajax({
									type : "post",
									url : "cotrAddAjax",
									dataType : "json", 
									data : params, 
									success : function(res) { 
										if(res.res=="SUCCESS"){
											$("#actionForm").attr("action", "saleMangDetail");
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
							} else {
								alert("저장실패");
							} 
						}, 
						error: function(req){
							console.log(req.responseText);
							alert("파일저장 에러"); 
						}
					});
					
					fileForm.submit();
				}
			}, "취소", function() {
					closePopup(1);
				});
		});
		
		
		//제안 수정
		$("#sugsUpdateBtn").on("click", function() {
			console.log($("#saleNo6").val());
			var html = "";
			
			html += "<form action=\"sugsActionForm6\" method=\"post\" id=\"sugsActionForm6\" >";
			html += "<input type=\"hidden\" name=\"saleNo6\" id=\"saleNo6\" value=\"${param.saleNo}\" />";
			html += "<input type=\"hidden\" name=\"search6Page\" id=\"search6Page\" value=\"1\" />";
			html += "<input type=\"hidden\" name=\"searchGbn6Hidden\" id=\"searchGbn6Hidden\" value=\"${param.searchGbn6Hidden}\" />";
			html += "<input type=\"hidden\" name=\"searchTxt6Hidden\" id=\"searchTxt6Hidden\" value=\"${param.searchTxt6Hidden}\" />";
			html += "<input type=\"hidden\" name=\"sugsNo6\" id=\"sugsNo6\" value=\"${param.sugsNo}\" />";
			html += "<input type=\"hidden\" name=\"godsNo6\" id=\"godsNo6\"/>";

			html += "<div class=\"default_search_area\">";
			html += "<div class=\"search_btn_area\">*는 필수항목</div></div>";
			
			html += "<div class=\"underbox\">";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">제안일*</div>";
			html += "<div class=\"con1\">";
			html += "<input type=\"date\" id=\"sugsDay6\" name=\"sugsDay6\" value=\"${sugs.SUGS_DAY}\"/>"
			html += "</div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">상품명*</div>";
			html += "<div class=\"con1\">";
			html += "<input type=\"text\" id=\"godsNm6\" name=\"godsNm6\" disabled=\"disabled\" value=\"${sugs.GODS_NM}\" />"
			html += "<input type=\"button\" id=\"godsNmBtn6\" name=\"godsNmBtn6\" value=\"검색\"/></div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출종류*</div>";
			html += "<div class=\"con1\">";
			html += "<select id=\"loanKind6\" name=\"loanKind6\" value=\"${sugs.LOAN_KIND}\" >";
			html += "<option value=\"0\">기업운전</option>";
			html += "<option value=\"1\">기업시설</option>";
			html += "<option value=\"2\">기업정책</option>";
			html += "</select>";
			html += "</div></div>";	
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출기간*</div>";
			html += "<div class=\"con1\">";
			html += "<select id=\"loanPerd6\" name=\"loanPerd6\" value=\"${sugs.LOAN_PERD}\" >";
			html += "<option value=\"0\">6개월 이내</option>";
			html += "<option value=\"1\">1년 이내</option>";
			html += "<option value=\"2\">2년 이내</option>";
			html += "<option value=\"3\">3년 이내</option>";
			html += "<option value=\"4\">3년 이상</option>";
			html += "</select>";
			html += "</div></div>";			
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">고객니즈*</div>";
			html += "<div class=\"con1\">";
			html += "<textarea class=\"write_con\" id=\"custNeds6\" name=\"custNeds6\">" + $("#sugsTabList").children().children().eq(1).children(".con1").children().html() + "</textarea>";
			html += "</div></div>";
			html += "</div>";
			html += "</form>";
			
			makeBtn2Popup(1, "제안 수정", html, false, 850, 460, function() {
				
				$("#godsNmBtn6").on("click", function() {
					
					var html = "";
					html += "<div class=\"popup_contents3\">";
					html += "</div>";
					
					makeBtn1Popup(2, "상품명 검색", html, true, 650, 650,
							reloadSearchPopup6(), "닫기", function() {
									closePopup(2);
								});
					 
					$(document).on("click", ".page_nation3 div", function() {
						$("#search6Page").val($(this).attr("name"));
						 reloadSearchPopup6();
					});
					
					
					$(document).on("click","#searchBtn6", function() {
						if($("#searchGbn6").val() != '') {
							
							console.log($("#searchGbn6").val());
							$("#searchGbn6Hidden").val($("#searchGbn6").val());
							console.log($("#searchGbn6Hidden").val());
						}
						$("#searchTxt6Hidden").val($("#searchTxt6").val());
						console.log($("#searchTxt6Hidden").val());
						$("#search6Page").val("1");
						reloadSearchPopup6();
					});
					
					$(document).on("click","tr#searchList6", function() {
						$("#godsNo6").val($(this).attr("name"));
						$("#godsNm6").val($(this).children("input").attr("id"));
						console.log($("#godsNo6").val());
						console.log($("#godsNm6").val());
						closePopup(2);
					});
				});
			}, "등록", function() {
				if ($.trim($("#sugsDay6").val()) == ""){
					alert("제안일을 입력해주세요.");
					$("#custNeds6").focus();
				} else if ($.trim($("#godsNm6").val()) == ""){
					alert("상품명을 입력해주세요.");
					$("#godsNm6").focus();
				} else if ($.trim($("#loanKind6").val()) == ""){
					alert("대출종류를 입력해주세요.");
					$("#loanKind6").focus();
				} else if ($.trim($("#loanPerd6").val()) == ""){
					alert("대출기간을 입력해주세요.");
					$("#loanPerd6").focus();
				} else if ($.trim($("#custNeds6").val()) == ""){
					alert("고객니즈를 입력해주세요.");
					$("#custNeds6").focus();
				} else {
					var params = $("#sugsActionForm6").serialize();
					$.ajax({
						type : "post",
						url : "sugsUpdateAjax",
						dataType : "json", 
						data : params, 
						success : function(res) {
							if(res.res == "SUCCESS"){
								$("#actionForm").attr("action", "saleMangDetail");
								$("#actionForm").submit();
							} else {
								$("#alert").attr("title", "알림");
								$("#alert p").html("저장에 실패하였습니다.");
								$("#alert").dialog({
									buttons: {
										Ok: function() {
											$(this).dialog("close");
										}
									}
								});
							}
						},
						error: function(req, status, error){ 
							console.log("code : " + req.status);
							console.log("message : " + req.responseText);
						}
					});
				}
			}, "취소", function() {
					closePopup(1);
				});
			
		});
		
		//협상 수정
		$("#negtUpdateBtn").on("click", function() {
			
			var html = "";
			
			html += "<div class=\"default_search_area\">";
			html += "<div class=\"search_btn_area\">*는 필수항목</div></div>";
			html += "<div class=\"underbox\">"; //
			html += "<form action=\"negtActionForm7\" method=\"post\" id=\"negtActionForm7\" >";
			html += "<input type=\"hidden\" name=\"saleNo7\" id=\"saleNo7\" value=\"${param.saleNo}\" />";
			html += "<input type=\"hidden\" name=\"search7Page\" id=\"search7Page\" value=\"1\" />";
			html += "<input type=\"hidden\" name=\"searchGbn7Hidden\" id=\"searchGbn7Hidden\" value=\"${param.searchGbn7Hidden}\" />";
			html += "<input type=\"hidden\" name=\"searchTxt7Hidden\" id=\"searchTxt7Hidden\" value=\"${param.searchTxt7Hidden}\" />";
			html += "<input type=\"hidden\" name=\"negtNo7\" id=\"negtNo7\" value=\"${param.negtNo}\" />";
			html += "<input type=\"hidden\" name=\"godsNo7\" id=\"godsNo7\"/>";
			html += "<input type=\"hidden\" name=\"negtFile7\" id=\"negtFile7\" />";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">상품명*</div>";
			html += "<div class=\"con1\">";
			html += "<input type=\"text\" id=\"godsNm7\" name=\"godsNm7\" disabled=\"disabled\" value=\"${negt.GODS_NM}\"/>"
			html += "<input type=\"button\" id=\"godsNmBtn7\" name=\"godsNmBtn7\" value=\"검색\"/></div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출종류*</div>";
			html += "<div class=\"con1\">";
			html += "<select id=\"loanKind7\" name=\"loanKind7\">";
			html += "<option value=\"0\">기업운전</option>";
			html += "<option value=\"1\">기업시설</option>";
			html += "<option value=\"2\">기업정책</option>";
			html += "</select>";
			html += "</div></div>";	
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출기간*</div>";
			html += "<div class=\"con1\">";
			html += "<select id=\"loanPerd7\" name=\"loanPerd7\">";
			html += "<option value=\"0\">6개월 이내</option>";
			html += "<option value=\"1\">1년 이내</option>";
			html += "<option value=\"2\">2년 이내</option>";
			html += "<option value=\"3\">3년 이내</option>";
			html += "<option value=\"4\">3년 이상</option>";
			html += "</select>";
			html += "</div></div>";	
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">담보*</div>";
			html += "<div class=\"con1\">";
			html += "<select id=\"colt7\" name=\"colt7\">";
			html += "<option value=\"0\">신용</option>";
			html += "<option value=\"1\">보증</option>";
			html += "<option value=\"2\">부동산 담보</option>";
			html += "<option value=\"3\">예적금 담보</option>";
			html += "<option value=\"4\">기타</option>";
			html += "<option value=\"5\">제한없음</option>";
			html += "</select>";
			html += "</div></div>";	
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">금액*</div>";
			html += "<div class=\"con1\">";
			html += "<input type=\"text\" id=\"price7\" name=\"price7\" value=\"${negt.PRICE}\"/></div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">고객반응*</div>";
			html += "<div class=\"con1\">";
			html += "<textarea class=\"write_con\" id=\"custRect7\" name=\"custRect7\">" + $("#negtTabList").children().children().eq(5).children(".con1").children().html() + "</textarea></div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">고객요구사항*</div>";
			html += "<div class=\"con1\">";
			html += "<textarea class=\"write_con\" id=\"custDemnMatr7\" name=\"custDemnMatr7\">" + $("#negtTabList").children().children().eq(6).children(".con1").children().html() + "</textarea></div></div>";
			html += "</form>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">견적서*</div>";
			html += "<div class=\"con1\">";
			html += "<form id=\"negtFileForm7\" name=\"negtFileForm7\" method=\"post\" action=\"fileUploadAjax\" enctype=\"multipart/form-data\" >";
			html += "<input type=\"file\" name=\"attFile7\" />";
			html += "</form>";
			html += "</div></div></div>";
			
			
			makeBtn2Popup(1, "협상 수정", html, false, 850, 620, function() {
				//상품 검색 버튼
				$("#godsNmBtn7").on("click", function() {
					var html = "";
					html += "<div class=\"popup_contents3\">";
					html += "</div>";
					
					makeBtn1Popup(2, "상품명 검색", html, true, 650, 650,
							reloadSearchPopup7(), "닫기", function() {
									closePopup(2);
								});
					 
					$(document).on("click", ".page_nation3 div", function() {
						$("#search7Page").val($(this).attr("name"));
						 reloadSearchPopup7();
					});
					
					
					$(document).on("click","#searchBtn7", function() {
						if($("#searchGbn7").val() != '') {
							
							console.log($("#searchGbn7").val());
							$("#searchGbn7Hidden").val($("#searchGbn7").val());
							console.log($("#searchGbn7Hidden").val());
						}
						$("#searchTxt7Hidden").val($("#searchTxt7").val());
						console.log($("#searchTxt7Hidden").val());
						$("#search7Page").val("1");
						reloadSearchPopup7();
					});
					
					$(document).on("click","tr#searchList7", function() {
						$("#godsNo7").val($(this).attr("name"));
						$("#godsNm7").val($(this).children("input").attr("id"));
						console.log($("#godsNo7").val());
						console.log($("#godsNm7").val());
						closePopup(2);
					});
				});
			}, "등록", function() {
				
				if ($.trim($("#godsNm7").val()) == ""){
					alert("상품명을 입력해주세요.");
					$("#godsNm7").focus();
				} else if ($.trim($("#loanKind7").val()) == ""){
					alert("대출종류를 입력해주세요.");
					$("#loanKind7").focus();
				} else if ($.trim($("#loanPerd7").val()) == ""){
					alert("대출기간을 입력해주세요.");
					$("#loanPerd7").focus();
				} else if ($.trim($("#colt7").val()) == ""){
					alert("담보를 입력해주세요.");
					$("#colt7").focus();
				} else if ($.trim($("#price7").val()) == ""){
					alert("금액을 입력해주세요.");
					$("#price7").focus();
				} else if ($.trim($("#custRect7").val()) == ""){
					alert("고객반응을 입력해주세요.");
					$("#custRect7").focus();
				} else if ($.trim($("#custDemnMatr7").val()) == ""){
					alert("고객요구사항을 입력해주세요.");
					$("#custDemnMatr7").focus();
				} else if ($.trim($("#negtFile7").val()) == ""){
					alert("견적서를 업로드해주세요.");
					$("#negtFile7").focus();
				} else {
					var fileForm=$("#negtFileForm7");
					fileForm.ajaxForm({
						success: function(res){
							if(res.result =="SUCCESS"){
								if(res.fileName.length>0){
									$("#negtFile7").val(res.fileName[0]);
								}
								var params=$("#negtActionForm7").serialize();
								$.ajax({
									type : "post",
									url : "negtUpdateAjax",
									dataType : "json",
									data : params,
									success : function(res) { 
										if(res.res=="SUCCESS"){
											$("#actionForm").attr("action", "saleMangDetail");
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
							} else {
								alert("저장실패");
							} 
						},
						error: function(req){
							console.log(req.responseText);
							alert("파일저장 에러"); 
						}
					});
					
					fileForm.submit();
				}
			}, "취소", function() {
					closePopup(1);
				});
		});
		
		//계약 수정
		$("#cotrUpdateBtn").on("click", function() {
			
			var html = "";
			
			html += "<div class=\"default_search_area\">";
			html += "<div class=\"search_btn_area\">*는 필수항목</div></div>";
			html += "<div class=\"underbox\">"; //
			html += "<form action=\"cotrActionForm8\" method=\"post\" id=\"cotrActionForm8\" >";
			html += "<input type=\"hidden\" name=\"saleNo8\" id=\"saleNo8\" value=\"${param.saleNo}\" />";
			html += "<input type=\"hidden\" name=\"search8Page\" id=\"search8Page\" value=\"1\" />";
			html += "<input type=\"hidden\" name=\"searchGbn8Hidden\" id=\"searchGbn8Hidden\" value=\"${param.searchGbn8Hidden}\" />";
			html += "<input type=\"hidden\" name=\"searchTxt8Hidden\" id=\"searchTxt8Hidden\" value=\"${param.searchTxt8Hidden}\" />";
			html += "<input type=\"hidden\" name=\"cotrNo8\" id=\"cotrNo8\" value=\"${param.cotrNo}\" />";
			html += "<input type=\"hidden\" name=\"godsNo8\" id=\"godsNo8\"/>";
			html += "<input type=\"hidden\" name=\"cotrFile8\" id=\"cotrFile8\" />";			
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">계약일*</div>";
			html += "<div class=\"con1\">";
			html += "<input type=\"date\" id=\"cotrDay8\" name=\"cotrDay8\" value=\"${cotr.COTR_DAY}\"/></div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">상품명*</div>";
			html += "<div class=\"con1\">";
			html += "<input type=\"text\" id=\"godsNm8\" name=\"godsNm8\" disabled=\"disabled\" value=\"${cotr.GODS_NM}\"/>"
			html += "<input type=\"button\" id=\"godsNmBtn8\" name=\"godsNmBtn8\" value=\"검색\"/></div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출종류*</div>";
			html += "<div class=\"con1\">";
			html += "<select id=\"loanKind8\" name=\"loanKind8\">";
			html += "<option value=\"0\">기업운전</option>";
			html += "<option value=\"1\">기업시설</option>";
			html += "<option value=\"2\">기업정책</option>";
			html += "</select>";
			html += "</div></div>";	
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출기간*</div>";
			html += "<div class=\"con1\">";
			html += "<select id=\"loanPerd8\" name=\"loanPerd8\">";
			html += "<option value=\"0\">6개월 이내</option>";
			html += "<option value=\"1\">1년 이내</option>";
			html += "<option value=\"2\">2년 이내</option>";
			html += "<option value=\"3\">3년 이내</option>";
			html += "<option value=\"4\">3년 이상</option>";
			html += "</select>";
			html += "</div></div>";	
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">담보*</div>";
			html += "<div class=\"con1\">";
			html += "<select id=\"colt8\" name=\"colt8\">";
			html += "<option value=\"0\">신용</option>";
			html += "<option value=\"1\">보증</option>";
			html += "<option value=\"2\">부동산 담보</option>";
			html += "<option value=\"3\">예적금 담보</option>";
			html += "<option value=\"4\">기타</option>";
			html += "<option value=\"5\">제한없음</option>";
			html += "</select>";
			html += "</div></div>";	
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">금액*</div>";
			html += "<div class=\"con1\">";
			html += "<input type=\"text\" id=\"price8\" name=\"price8\" value=\"${cotr.PRICE}\"/></div></div>";
			html += "</form>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">계약서*</div>";
			html += "<div class=\"con1\">";
			html += "<form id=\"cotrFileForm8\" name=\"cotrFileForm8\" method=\"post\" action=\"fileUploadAjax\" enctype=\"multipart/form-data\" >";
			html += "<input type=\"file\" name=\"attFile8\" />";
			html += "</form>";
			html += "</div></div></div>";
			
			makeBtn2Popup(1, "계약 수정", html, false, 850, 450, function() {
				//상품 검색 버튼
				$("#godsNmBtn8").on("click", function() {
					var html = "";
					html += "<div class=\"popup_contents3\">";
					html += "</div>";
					
					makeBtn1Popup(2, "상품명 검색", html, true, 650, 650,
							reloadSearchPopup8(), "닫기", function() {
									closePopup(2);
								});
					 
					$(document).on("click", ".page_nation3 div", function() {
						$("#search8Page").val($(this).attr("name"));
						 reloadSearchPopup8();
					});
					
					
					$(document).on("click","#searchBtn8", function() {
						if($("#searchGbn8").val() != '') {
							
							console.log($("#searchGbn8").val());
							$("#searchGbn8Hidden").val($("#searchGbn8").val());
							console.log($("#searchGbn8Hidden").val());
						}
						$("#searchTxt8Hidden").val($("#searchTxt8").val());
						console.log($("#searchTxt8Hidden").val());
						$("#search8Page").val("1");
						reloadSearchPopup8();
					});
					
					$(document).on("click","tr#searchList8", function() {
						$("#godsNo8").val($(this).attr("name"));
						$("#godsNm8").val($(this).children("input").attr("id"));
						console.log($("#godsNo8").val());
						console.log($("#godsNm8").val());
						closePopup(2);
					});
				});
			}, "등록", function() {
				if ($.trim($("#cotrDay8").val()) == ""){
					alert("계약일을 입력해주세요.");
					$("#cotrDay8").focus();
				} else if ($.trim($("#godsNm8").val()) == ""){
					alert("상품명을 입력해주세요.");
					$("#godsNm8").focus();
				} else if ($.trim($("#loanKind8").val()) == ""){
					alert("대출종류를 입력해주세요.");
					$("#loanKind8").focus();
				} else if ($.trim($("#loanPerd8").val()) == ""){
					alert("대출기간을 입력해주세요.");
					$("#loanPerd8").focus();
				} else if ($.trim($("#colt8").val()) == ""){
					alert("담보를 입력해주세요.");
					$("#colt8").focus();
				} else if ($.trim($("#price8").val()) == ""){
					alert("금액을 입력해주세요.");
					$("#price8").focus();
				} else if ($.trim($("#cotrFile8").val()) == ""){
					alert("계약서를 업로드해주세요.");
					$("#cotrFile8").focus();
				} else {
					var fileForm=$("#cotrFileForm8");
					fileForm.ajaxForm({ 
						success: function(res){
							if(res.result =="SUCCESS"){
								if(res.fileName.length>0){
									$("#cotrFile8").val(res.fileName[0]);
								}
								var params=$("#cotrActionForm8").serialize();
								$.ajax({
									type : "post",
									url : "cotrUpdateAjax",
									dataType : "json", 
									data : params, 
									success : function(res) { 
										if(res.res=="SUCCESS"){
											$("#actionForm").attr("action", "saleMangDetail");
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
							} else {
								alert("저장실패");
							} 
						}, 
						error: function(req){
							console.log(req.responseText);
							alert("파일저장 에러"); 
						}
					});
					
					fileForm.submit();
				}
			}, "취소", function() {
					closePopup(1);
				});
		});

	});
	
	
	//함수들
	
	//단계별 리스트 아작스
	function tabReloadList() {
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "tabListAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				if($("#tabNo").val() == "0"){
					sugsTabDrawList(res.sugs, res.sugsCnt);
				} else if($("#tabNo").val() == "1"){
					negtTabDrawList(res.negt, res.negtCnt);
				} else {
					cotrTabDrawList(res.cotr, res.cotrCnt);															
				}
				
				if(res.sugsCnt == 0){
					$("#sugsAddBtn").show();
					$("#sugsUpdateBtn").hide();
				} else {
					$("#sugsAddBtn").hide();
					$("#sugsUpdateBtn").show();
				}
				if(res.negtCnt == 0){
					$("#negtAddBtn").show();
					$("#negtUpdateBtn").hide();
				} else {
					$("#negtAddBtn").hide();
					$("#negtUpdateBtn").show();
				}
				if(res.cotrCnt == 0){
					$("#cotrAddBtn").show();
					$("#cotrUpdateBtn").hide();
				} else {
					$("#cotrAddBtn").hide();
					$("#cotrUpdateBtn").show();
				}
				
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	//제안 정보
	function sugsTabDrawList(sugs, sugsCnt) {
		var html = "";
		
		if(sugsCnt == ""){
			html += "데이터가 없습니다.";
		} else {
			html += "<div class=\"underbox\">";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">제안일</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + sugs.SUGS_DAY + "</div></div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">상품명</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + sugs.GODS_NM + "</div></div></div>"
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출종류</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + sugs.LOAN_KIND + "</div></div></div>"
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출기간</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + sugs.LOAN_PERD + "</div></div></div>"
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">고객니즈</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + sugs.CUST_NEDS + "</div></div></div>"
			html += "</div>";
		}
		$("#sugsTabList").html(html);
	}	
	
	//협상 정보
	function negtTabDrawList(negt, negtCnt) {
		var html = "";
		
		if(negtCnt ==""){
			html += "데이터가 없습니다.";
		} else {
			html += "<div class=\"underbox\">";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">상품명</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + negt.GODS_NM + "</div></div></div>"
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출종류</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + negt.LOAN_KIND + "</div></div></div>"
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출기간</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + negt.LOAN_PERD + "</div></div></div>"
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">담보</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + negt.COLT + "</div></div></div>"
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">금액</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + negt.PRICE + "</div></div></div>"
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">고객반응</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + negt.CUST_RECT + "</div></div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">고객 요구사항</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + negt.CUST_DEMN_MATR + "</div></div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">견적서</div>";
			html += "<div class=\"con1\">";
			if (negt.ATCH_FILE_NM != ""){
				html += "<div class=\"con\"><a href=\"resources/upload/" + negt.ATCH_FILE_NM + "\" download>" + negt.ATCH_FILE_NM + "</div>";
			} else {
				html += "첨부파일이 없습니다.";
			}
			html += "</div></div></div>";
		}
		$("#negtTabList").html(html);
	}
	
	//계약 정보
	function cotrTabDrawList(cotr, cotrCnt) {
		var html = "";
		
		if(cotrCnt == ""){
			html += "데이터가 없습니다.";
		} else {
			html += "<div class=\"underbox\">";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">계약일</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + cotr.COTR_DAY + "</div></div></div>";
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">상품명</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + cotr.GODS_NM + "</div></div></div>"
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출종류</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + cotr.LOAN_KIND + "</div></div></div>"
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">대출기간</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + cotr.LOAN_PERD + "</div></div></div>"
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">담보</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + cotr.COLT + "</div></div></div>"
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">금액</div>";
			html += "<div class=\"con1\">";
			html += "<div class=\"con\">" + cotr.PRICE + "</div></div></div>"
			html += "<div class=\"underline\">";
			html += "<div class=\"line1\">계약서</div>";
			html += "<div class=\"con1\">";
			if (cotr.ATCH_FILE_NM != ""){
				html += "<div class=\"con\"><a href=\"resources/upload/" + cotr.ATCH_FILE_NM + "\" download>" + cotr.ATCH_FILE_NM + "</div>";
			} else {
				html += "첨부파일이 없습니다.";
			}
			html += "</div></div></div>";
		}	
		$("#cotrTabList").html(html);
	}
	
	//코멘트 리스트 아작스
	function commentReloadList() {
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "commentListAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				if($("#tabNo").val() == "0"){
					commentDrawList(res.sugs, res.sugsCnt);
					drawPaging(res.sugsPb, "#sugsPage");
				} else if($("#tabNo").val() == "1"){
					commentDrawList(res.negt, res.negtCnt);
					drawPaging(res.negtPb, "#negtPage");
				} else {
					commentDrawList(res.cotr, res.cotrCnt);															
					drawPaging(res.cotrPb, "#cotrPage");
				}
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	//코멘트 리스트
	function commentDrawList(list, cnt) {
		var html = "";
		
		if(cnt == 0) {
			html += "<div class=\"data_req_wrap\">";
			html += "<div class=\"data_req\">데이터가 없습니다.</div>";
			html += "</div>";
		} else {
			for(var i = 0 ; i < list.length ; i++) {
				html += "<div class=\"underline\" name=\"" + list[i].SALE_OPNN_NO + "\">";
				html += "<div class=\"line1\">" + list[i].EMP_NM + "</div>";
				html += "<div class=\"con1\">";
				html += "<div class=\"con\">" + list[i].OPNN_CONT + "</div>";
				html += "</div>";
				html += "<div class=\"btn_wrap\">";
				if("${sEmpNo}" == list[i].EMP_NO) {
					html += "<input type=\"button\" value=\"수정\" class=\"action2_btn\" id=\"commentUpdateBtn\" name=" + list[i].SALE_OPNN_NO + "/>";
					html += "<input type=\"button\" value=\"삭제\" class=\"action2_btn\" id=\"commentDeleteBtn\" name=" + list[i].SALE_OPNN_NO + "/>";
				}
				html += "</div>";
				html += "</div>";
			}
		}
		
		$(".comment_list_wrap").html(html);
	}

	//코멘트 페이징
	function drawPaging(pb, name) {
	    var html = "";

	    if ($(name).val() == 1) {
	    	html += "<div class=\"arrow prev\" name=\"1\"></div>";
		    } else {
		    html += "<div class=\"arrow prev\" name =\"" + ($(name).val() - 1) + "\"></div> ";
		    }

		for (var i = pb.startPcount; i <= pb.endPcount; i++) {
		  	if ($(name).val() == i) {
		   		html += "<div class=\"page_on\" name=\"" + i + "\">" + i + "</b></div> ";
		    } else {
		      html += "<div class=\"page\" name=\"" + i + "\">" + i + "</div> ";
		    }
		}
		if ($(name).val() == pb.maxPcount) {
		  	html += "<div name =\"" +pb.maxPcount + "\"></div>";
		  	} else {
		  		html += "<div class=\"arrow next\" name =\"" + ($(name).val() * 1 + 1) + "\"></div> ";
		    }   
		$(".page_nation").html(html);
	}
	
	//영업별 수정 아작스
	function updataAjax(){
		var params =$("#actionForm").serialize();
		$.ajax({
			type :"post",
			url :"sugsUpdateAjax",
			dataType :"json",
			data :params,
			success :function(res){
				if(res.res == "SUCCESS"){
					$("#actionForm").attr("action","saleMangDetail");
					$("#actionForm").submit();

				}else{
					$("#alert").attr("title","알림");
					$("#alert p").html("저장에 실패하였습니다.");
					$("#alert").dialog({
						buttons :{
							Ok :function(){
								$(this).dialog("close");
							}
						}
					});
				}	
			},
			error :function(req,status,error){
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});	
	}
	
	//상품검색-제안
	function reloadSearchPopup3() {
		var params = $("#sugsActionForm").serialize();

		$.ajax({
			type : "post",
			url : "saleMangAddSearch3Ajax",
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

		html +=	"<select class=\"filter\" name=\"searchGbn3\" id=\"searchGbn3\">";
		html +=	"<option value=\"0\">영업 상품명</option>";
		html +=	"<option value=\"1\">대출종류</option>";
		html += "</select>";
		html += "<input class=\"pl_popup\" type=\"text\"   name=\"searchTxt3\" id=\"searchTxt3\"/>";
		html += "<input type=\"button\" class=\"searchBtn3\" id=\"searchBtn3\" value=\"검색\" />";
		html += "<div class=\"default_board3\" >";
		html += "<table class=\"search_list\">";
		html += "<colgroup>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "</colgroup>";
		html += "<thead>";
		html += "<tr class=\"top\">";
		html += "<th>영업 상품명</th>";
		html += "<th>대출 종류</th>";
		html += "<th>대출 대상</th>";
		html += "<th>대출 기간</th>";
		html += "<th>대출 한도 금액</th>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody>";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"page_wrap\">";
		html += "<div class=\"page_nation3\">";
		html += "</div>";
		html += "</div>";


		return html;
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
	
	//상품검색-협상
	function reloadSearchPopup4() {
		var params = $("#negtActionForm").serialize();

		$.ajax({
			type : "post",
			url : "saleMangAddSearch4Ajax",
			dataType : "json",
			data : params,
			success : function(res) {
				$(".popup_contents3").html(drawSearchPopup4());
				searchList4(res.list3, res.cnt);
				drawPopupPaging4(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	function searchList4(list3, cnt) {
		var html = "";
		if(cnt == 0){
			html += "<tr>";
			html += "<td colspan=\"5\">데이터가 없습니다.</td>"; 
			html += "</tr>";
		}else{
			for (var i = 0; i < list3.length; i++) {
				html += "<tr name=\"" + list3[i].GODS_NO + "\" id=\"searchList4\">";
				
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

	function drawSearchPopup4() {
		var html = "";

		html +=	"<select class=\"filter\" name=\"searchGbn4\" id=\"searchGbn4\">";
		html +=	"<option value=\"0\">영업 상품명</option>";
		html +=	"<option value=\"1\">대출종류</option>";
		html += "</select>";
		html += "<input class=\"pl_popup\" type=\"text\"   name=\"searchTxt4\" id=\"searchTxt4\"/>";
		html += "<input type=\"button\" class=\"searchBtn4\" id=\"searchBtn4\" value=\"검색\" />";
		html += "<div class=\"default_board3\" >";
		html += "<table class=\"search_list\">";
		html += "<colgroup>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "</colgroup>";
		html += "<thead>";
		html += "<tr class=\"top\">";
		html += "<th>영업 상품명</th>";
		html += "<th>대출 종류</th>";
		html += "<th>대출 대상</th>";
		html += "<th>대출 기간</th>";
		html += "<th>대출 한도 금액</th>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody>";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"page_wrap\">";
		html += "<div class=\"page_nation3\">";
		html += "</div>";
		html += "</div>";


		return html;
	}
	
	function drawPopupPaging4(pb) {
		var html = "";

		if ($("#search4Page").val() == 1) {
			html += "<div class=\"arrow prev\" name=\"1\"></div>";
		} else {
			html += "<div class=\"arrow prev\" name =\"" + ($("#search4Page").val() - 1) + "\"></div> ";
		}

		for (var i = pb.startPcount; i <= pb.endPcount; i++) {
			if ($("#search4Page").val() == i) {
				html += "<div class=\"page_on\" name=\"" + i + "\">" + i + "</b></div> ";
			} else {
				html += "<div class=\"page\" name=\"" + i + "\">" + i + "</div> ";
			}
		}

		if ($("#search4Page").val() == pb.maxPcount) {
			html += "<div name =\"" +pb.maxPcount + "\"></div>";
		} else {
			html += "<div class=\"arrow next\" name =\"" + ($("#search4Page").val() * 1 + 1) + "\"></div> ";
		}

		$(".page_nation3").html(html);
	}
	
	//상품검색-계약
	function reloadSearchPopup5() {
		var params = $("#cotrActionForm").serialize();

		$.ajax({
			type : "post",
			url : "saleMangAddSearch5Ajax",
			dataType : "json",
			data : params,
			success : function(res) {
				$(".popup_contents3").html(drawSearchPopup5());
				searchList5(res.list3, res.cnt);
				drawPopupPaging5(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	function searchList5(list3, cnt) {
		var html = "";
		if(cnt == 0){
			html += "<tr>";
			html += "<td colspan=\"5\">데이터가 없습니다.</td>"; 
			html += "</tr>";
		}else{
			for (var i = 0; i < list3.length; i++) {
				html += "<tr name=\"" + list3[i].GODS_NO + "\" id=\"searchList5\">";
				
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

	function drawSearchPopup5() {
		var html = "";

		html +=	"<select class=\"filter\" name=\"searchGbn5\" id=\"searchGbn5\">";
		html +=	"<option value=\"0\">영업 상품명</option>";
		html +=	"<option value=\"1\">대출종류</option>";
		html += "</select>";
		html += "<input class=\"pl_popup\" type=\"text\" name=\"searchTxt5\" id=\"searchTxt5\"/>";
		html += "<input type=\"button\" class=\"searchBtn5\" id=\"searchBtn5\" value=\"검색\" />";
		html += "<div class=\"default_board3\" >";
		html += "<table class=\"search_list\">";
		html += "<colgroup>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "</colgroup>";
		html += "<thead>";
		html += "<tr class=\"top\">";
		html += "<th>영업 상품명</th>";
		html += "<th>대출 종류</th>";
		html += "<th>대출 대상</th>";
		html += "<th>대출 기간</th>";
		html += "<th>대출 한도 금액</th>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody>";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"page_wrap\">";
		html += "<div class=\"page_nation3\">";
		html += "</div>";
		html += "</div>";

		return html;
	}
	
	function drawPopupPaging5(pb) {
		var html = "";

		if ($("#search5Page").val() == 1) {
			html += "<div class=\"arrow prev\" name=\"1\"></div>";
		} else {
			html += "<div class=\"arrow prev\" name =\"" + ($("#search5Page").val() - 1) + "\"></div> ";
		}

		for (var i = pb.startPcount; i <= pb.endPcount; i++) {
			if ($("#search5Page").val() == i) {
				html += "<div class=\"page_on\" name=\"" + i + "\">" + i + "</b></div> ";
			} else {
				html += "<div class=\"page\" name=\"" + i + "\">" + i + "</div> ";
			}
		}

		if ($("#search5Page").val() == pb.maxPcount) {
			html += "<div name =\"" +pb.maxPcount + "\"></div>";
		} else {
			html += "<div class=\"arrow next\" name =\"" + ($("#search5Page").val() * 1 + 1) + "\"></div> ";
		}

		$(".page_nation3").html(html);
	}
	
	//상품검색-제안
	function reloadSearchPopup6() {
		var params = $("#sugsActionForm6").serialize();

		$.ajax({
			type : "post",
			url : "saleMangUpdateSearch6Ajax",
			dataType : "json",
			data : params,
			success : function(res) {
				$(".popup_contents3").html(drawSearchPopup6());
				searchList6(res.list3, res.cnt);
				drawPopupPaging6(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	function searchList6(list3, cnt) {
		var html = "";
		if(cnt == 0){
			html += "<tr>";
			html += "<td colspan=\"5\">데이터가 없습니다.</td>"; 
			html += "</tr>";
		}else{
			for (var i = 0; i < list3.length; i++) {
				html += "<tr name=\"" + list3[i].GODS_NO + "\" id=\"searchList6\">";
				
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

	function drawSearchPopup6() {
		var html = "";

		html +=	"<select class=\"filter\" name=\"searchGbn6\" id=\"searchGbn6\">";
		html +=	"<option value=\"0\">영업 상품명</option>";
		html +=	"<option value=\"1\">대출종류</option>";
		html += "</select>";
		html += "<input class=\"pl_popup\" type=\"text\"   name=\"searchTxt6\" id=\"searchTxt6\"/>";
		html += "<input type=\"button\" class=\"searchBtn6\" id=\"searchBtn6\" value=\"검색\" />";
		html += "<div class=\"default_board3\" >";
		html += "<table class=\"search_list\">";
		html += "<colgroup>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "</colgroup>";
		html += "<thead>";
		html += "<tr class=\"top\">";
		html += "<th>영업 상품명</th>";
		html += "<th>대출 종류</th>";
		html += "<th>대출 대상</th>";
		html += "<th>대출 기간</th>";
		html += "<th>대출 한도 금액</th>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody>";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"page_wrap\">";
		html += "<div class=\"page_nation3\">";
		html += "</div>";
		html += "</div>";


		return html;
	}
	
	function drawPopupPaging6(pb) {
		var html = "";

		if ($("#search6Page").val() == 1) {
			html += "<div class=\"arrow prev\" name=\"1\"></div>";
		} else {
			html += "<div class=\"arrow prev\" name =\"" + ($("#search6Page").val() - 1) + "\"></div> ";
		}

		for (var i = pb.startPcount; i <= pb.endPcount; i++) {
			if ($("#search6Page").val() == i) {
				html += "<div class=\"page_on\" name=\"" + i + "\">" + i + "</b></div> ";
			} else {
				html += "<div class=\"page\" name=\"" + i + "\">" + i + "</div> ";
			}
		}

		if ($("#search6Page").val() == pb.maxPcount) {
			html += "<div name =\"" +pb.maxPcount + "\"></div>";
		} else {
			html += "<div class=\"arrow next\" name =\"" + ($("#search6Page").val() * 1 + 1) + "\"></div> ";
		}

		$(".page_nation3").html(html);
	}
	
	//상품검색-협상
	function reloadSearchPopup7() {
		var params = $("#negtActionForm7").serialize();

		$.ajax({
			type : "post",
			url : "saleMangUpdateSearch7Ajax",
			dataType : "json",
			data : params,
			success : function(res) {
				$(".popup_contents3").html(drawSearchPopup7());
				searchList7(res.list3, res.cnt);
				drawPopupPaging7(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	function searchList7(list3, cnt) {
		var html = "";
		if(cnt == 0){
			html += "<tr>";
			html += "<td colspan=\"5\">데이터가 없습니다.</td>"; 
			html += "</tr>";
		}else{
			for (var i = 0; i < list3.length; i++) {
				html += "<tr name=\"" + list3[i].GODS_NO + "\" id=\"searchList7\">";
				
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

	function drawSearchPopup7() {
		var html = "";

		html +=	"<select class=\"filter\" name=\"searchGbn7\" id=\"searchGbn7\">";
		html +=	"<option value=\"0\">영업 상품명</option>";
		html +=	"<option value=\"1\">대출종류</option>";
		html += "</select>";
		html += "<input class=\"pl_popup\" type=\"text\" name=\"searchTxt7\" id=\"searchTxt7\"/>";
		html += "<input type=\"button\" class=\"searchBtn4\" id=\"searchBtn7\" value=\"검색\" />";
		html += "<div class=\"default_board3\" >";
		html += "<table class=\"search_list\">";
		html += "<colgroup>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "</colgroup>";
		html += "<thead>";
		html += "<tr class=\"top\">";
		html += "<th>영업 상품명</th>";
		html += "<th>대출 종류</th>";
		html += "<th>대출 대상</th>";
		html += "<th>대출 기간</th>";
		html += "<th>대출 한도 금액</th>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody>";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"page_wrap\">";
		html += "<div class=\"page_nation3\">";
		html += "</div>";
		html += "</div>";


		return html;
	}
	
	function drawPopupPaging7(pb) {
		var html = "";

		if ($("#search7Page").val() == 1) {
			html += "<div class=\"arrow prev\" name=\"1\"></div>";
		} else {
			html += "<div class=\"arrow prev\" name =\"" + ($("#search7Page").val() - 1) + "\"></div> ";
		}

		for (var i = pb.startPcount; i <= pb.endPcount; i++) {
			if ($("#search7Page").val() == i) {
				html += "<div class=\"page_on\" name=\"" + i + "\">" + i + "</b></div> ";
			} else {
				html += "<div class=\"page\" name=\"" + i + "\">" + i + "</div> ";
			}
		}

		if ($("#search7Page").val() == pb.maxPcount) {
			html += "<div name =\"" +pb.maxPcount + "\"></div>";
		} else {
			html += "<div class=\"arrow next\" name =\"" + ($("#search7Page").val() * 1 + 1) + "\"></div> ";
		}

		$(".page_nation3").html(html);
	}
	
	//상품검색-계약
	function reloadSearchPopup8() {
		var params = $("#cotrActionForm8").serialize();

		$.ajax({
			type : "post",
			url : "saleMangUpdateSearch8Ajax",
			dataType : "json",
			data : params,
			success : function(res) {
				$(".popup_contents3").html(drawSearchPopup8());
				searchList8(res.list3, res.cnt);
				drawPopupPaging8(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}

	function searchList8(list3, cnt) {
		var html = "";
		if(cnt == 0){
			html += "<tr>";
			html += "<td colspan=\"5\">데이터가 없습니다.</td>"; 
			html += "</tr>";
		}else{
			for (var i = 0; i < list3.length; i++) {
				html += "<tr name=\"" + list3[i].GODS_NO + "\" id=\"searchList8\">";
				
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

	function drawSearchPopup8() {
		var html = "";

		html +=	"<select class=\"filter\" name=\"searchGbn8\" id=\"searchGbn8\">";
		html +=	"<option value=\"0\">영업 상품명</option>";
		html +=	"<option value=\"1\">대출종류</option>";
		html += "</select>";
		html += "<input class=\"pl_popup\" type=\"text\" name=\"searchTxt8\" id=\"searchTxt8\"/>";
		html += "<input type=\"button\" class=\"searchBtn5\" id=\"searchBtn8\" value=\"검색\" />";
		html += "<div class=\"default_board3\" >";
		html += "<table class=\"search_list\">";
		html += "<colgroup>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "<col width=\"130px\"/>";
		html += "</colgroup>";
		html += "<thead>";
		html += "<tr class=\"top\">";
		html += "<th>영업 상품명</th>";
		html += "<th>대출 종류</th>";
		html += "<th>대출 대상</th>";
		html += "<th>대출 기간</th>";
		html += "<th>대출 한도 금액</th>";
		html += "</tr>";
		html += "</thead>";
		html += "<tbody>";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"page_wrap\">";
		html += "<div class=\"page_nation3\">";
		html += "</div>";
		html += "</div>";

		return html;
	}
	
	function drawPopupPaging8(pb) {
		var html = "";

		if ($("#search8Page").val() == 1) {
			html += "<div class=\"arrow prev\" name=\"1\"></div>";
		} else {
			html += "<div class=\"arrow prev\" name =\"" + ($("#search8Page").val() - 1) + "\"></div> ";
		}

		for (var i = pb.startPcount; i <= pb.endPcount; i++) {
			if ($("#search8Page").val() == i) {
				html += "<div class=\"page_on\" name=\"" + i + "\">" + i + "</b></div> ";
			} else {
				html += "<div class=\"page\" name=\"" + i + "\">" + i + "</div> ";
			}
		}

		if ($("#search8Page").val() == pb.maxPcount) {
			html += "<div name =\"" +pb.maxPcount + "\"></div>";
		} else {
			html += "<div class=\"arrow next\" name =\"" + ($("#search8Page").val() * 1 + 1) + "\"></div> ";
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
	<!-- 화면에 맞추어 제목작성 -->
	<div class="contents_header">
		<div class="contents_header_txt">영업 상세보기</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" name="page" value="${param.page}" />
			<input type="hidden" name="saleNo" value="${param.saleNo}" />
			<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
			<input type="hidden" name="empNm" value="${param.empNm}" />
			<input type="hidden" name="entpNm" value="${param.entpNm}" />
			<input type="hidden" name="custNo" id="custNo" value="${param.custNo}"/>
			<input type="hidden" name="custNm" value="${param.custNm}" />
			<input type="hidden" name="startDay" value="${param.startDay}" />
			<input type="hidden" name="endDay" value="${param.endDay}" />
			<input type="hidden" name="saleNm" value="${param.saleNm}" />
			<input type="hidden" name="saleFileNo" id="saleFileNo" />

			<input type="hidden" name="sugsPage" id="sugsPage" value="1" />
			<input type="hidden" name="negtPage" id="negtPage" value="1" />
			<input type="hidden" name="cotrPage" id="cotrPage" value="1" />
			<input type="hidden" name="saleOpnnNo" id="saleOpnnNo" />
			<input type="hidden" name="saleOpnnCont" id="" />
			<input type="hidden" name="tabNo" id="tabNo" />
			<input type="hidden" name="sugsNo" id="sugsNo" />
			<input type="hidden" name="negtNo" id="negtNo" />
			<input type="hidden" name="cotrNo" id="cotrNo" />
			<input type="hidden" name="sugsCnt" id="sugsCnt" />
			<input type="hidden" name="negtCnt" id="negtCnt" />
			<input type="hidden" name="cotrCnt" id="cotrCnt" />
			<input type="hidden" name="empNo" value="${sEmpNo}" />
			<input type="hidden" name="empNm" value="${sEmpNm}" />
	
		<div class="default_search_area">
			<div class="search_btn_area">
				<input type="button" value="목록" id="listBtn" />
				<input type="button" value="수정" id="updateBtn"/>
			</div>
		</div>
		<div class="underbox">
			<div class="underline">
				<div class="line1">영업명</div>
				<div class="con1">${sale.SALE_NM}</div>
			</div>
			<div class="underline">
				<div class="line1">고객명</div>
				<div class="con1">${sale.CUST_NM}</div>
				<div class="line1">고객사명</div>
				<div class="con1">${sale.ENTP_NM}</div>
			</div>
			<div class="underline">
				<div class="line1">담당자</div>
				<div class="con1">${sale.EMP_NM}</div>
				<div class="line1">진행현황</div>
				<div class="con1">${sale.CODE_NM}</div>
			</div>
			<div class="underline">
				<div class="line1">시작일</div>
				<div class="con1">${sale.START_DAY}</div>
				<div class="line1">종료일</div>
				<div class="con1">${sale.END_DAY}</div>
			</div>
			<div class="underline">
				<div class="line1">상세내용</div>
				<div class="con1">${sale.DETL_CONT}</div>
			</div>
			<div class="underline">
				<div class="line1">비고</div>
				<div class="con1">${sale.REMK}</div>
			</div>
		</div>
			
			<!-- 탭 -->		
			<div class="contents_header_txt">영업활동</div>
			<div class="contents_activities">
				<div class="tabs" id="tabs">
				  <ul>
				    <li id="sugsTabs" name="sugsTabs"><a href="#tabs-1">제안</a></li>
				    <li id="negtTabs" name="negtTabs"><a href="#tabs-2">협상</a></li>
				    <li id="cotrTabs" name="cotrTabs"><a href="#tabs-3">계약</a></li>
				  </ul>
				  
				  <!-- 제안탭 -->
				  <div id="tabs-1" name="tabs-1">
				  	<div class="contents_header_txt">제안</div>
				    <div id="sugsTabList">
										
					</div>

					<div class="detail_btn_area">
						<input type="button" value="등록" id="sugsAddBtn" name="sugsAddBtn" />
						<input type="button" value="수정" id="sugsUpdateBtn" name="sugsUpdateBtn" />
					</div>
					<div class="contents_header_txt">코멘트</div>
					<div class="underbox" id="write_area">
						<div class="underline">			
							<div class="line1">${sEmpNm}</div>
							<div class="con1">
								<textarea class="write_con" name="opnnCont1" id="opnnCont1"></textarea>
							</div>
							<div class="line1">
								<div class="btn_wrap">
									<div class="btn_wrap1">
										<input type="button" value="등록" class="action_btn" id="commentSaveBtn" />
									</div>
								</div>
							</div>
						</div>
						<div class="comment_list_wrap"></div>				
					</div>
					<div id="commentPage" class="page_wrap">
						<div class="page_nation"></div>
					</div>					
				  </div>
				  
				  
				  <!-- 협상탭 -->
				  <div id="tabs-2" name="tabs-2">
				  	<div class="contents_header_txt">협상</div>
					<div id="negtTabList">
						
					</div>
					<div class="detail_btn_area">
						<input type="button" value="수정" id="negtUpdateBtn" name="negtUpdateBtn" />
						<input type="button" value="등록" id="negtAddBtn" name="negtAddBtn" />
					</div>
					<div class="contents_header_txt">코멘트</div>
					<div class="underbox" id="write_area">
						<div class="underline">			
							<div class="line1">${sEmpNm}</div>
							<div class="con1">
								<textarea class="write_con" name="opnnCont2" id="opnnCont2"></textarea>
							</div>
							<div class="line1">
								<div class="btn_wrap">
									<div class="btn_wrap2">
										<input type="button" value="등록" class="action_btn" id="commentSaveBtn" />
									</div>
								</div>
							</div>
						</div>
						<div class="comment_list_wrap"></div>
					</div>
					<div id="commentPage" class="page_wrap">
						<div class="page_nation"></div>
					</div>					
				  </div>
				  
				  <!-- 계약탭 -->
				  <div id="tabs-3" name="tabs-3">
				  	<div class="contents_header_txt">계약</div>
					
					<div id="cotrTabList">
						
					</div>
					<div class="detail_btn_area">
						<input type="button" value="수정" id="cotrUpdateBtn" name="cotrUpdateBtn" />
						<input type="button" value="등록" id="cotrAddBtn" name="cotrAddBtn" />
					</div>
					<div class="contents_header_txt">코멘트</div>
					<div class="underbox" id="write_area">
						<div class="underline">			
							<div class="line1">${sEmpNm}</div>
							<div class="con1">
								<textarea class="write_con" name="opnnCont3" id="opnnCont3"></textarea>
							</div>
							<div class="line1">
								<div class="btn_wrap">
									<div class="btn_wrap3">
										<input type="button" value="등록" class="action_btn" id="commentSaveBtn" />
									</div>
								</div>
							</div>
						</div>
						<div class="comment_list_wrap"></div>
					</div>
					<div id="commentPage" class="page_wrap">
						<div class="page_nation"></div>
					</div>					
				  </div>
			</div>
		</div>
		</form>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>