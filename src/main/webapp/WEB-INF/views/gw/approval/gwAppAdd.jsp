<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 결재작성</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<style>
.underbox {
	width: 900px;
}
.detail_btn_area {
	width: 900px;
}
.con1 {
	width: 280px;
}
.default_board {
	width:600px;
}
.default_search_area {
	width:600px;
}
#empListForm{
	width:600px;
}
</style>
<script type="text/javascript"
		src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
		src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript" src="resources/script/jquery/jstree.js"></script>		
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#apprefnm1").on("click", function() {
			$("#appref1").val("");
			$("#apprefnm1").val("");
		});
		
		$("#apprefnm2").on("click", function() {
			$("#appref2").val("");
			$("#apprefnm2").val("");
		});
		
		$("#apprefnm3").on("click", function() {
			$("#appref3").val("");
			$("#apprefnm3").val("");
		});
		
		$("#appathrnm1").on("click", function() {
			$("#appathr1").val("");
			$("#appathrnm1").val("");
		});
		
		$("#appathrnm2").on("click", function() {
			$("#appathr2").val("");
			$("#appathrnm2").val("");
		});
		
		$("#appathrnm3").on("click", function() {
			$("#appathr3").val("");
			$("#appathrnm3").val("");
		});
		
		CKEDITOR.replace("appcont", { // appcont라는 객체를 CKEDITOR로 변환하겠다.
			resize_enabled : false, // 크기변환 가능 : 불가능
			language : "ko", // 언어 : 한국어
			enterMode : "2", // 엔터를 줄바꿈으로 사용하겠다
			width : "740",
			height : "300"
		});
		
		$(".detail_btn_area").on("click", "#addBtn", function() {
			$("#appcont").val(CKEDITOR.instances['appcont'].getData()); //#modecont의값에 modecont객체의 값을 넣겠다
			
			if($.trim($("#apptitle").val())=="" || $.trim($('input[name=appathr]').val())=="" || $.trim($("#apptype").val())=="") {
				makeBtn1Popup(1, "", "필수내용을 모두 작성해야합니다.", true, 400, 200,
						null, "확인", function() {
							closePopup(1);
							$("#appcont").focus();
					});
			} else {
				var fileForm = $("#Form");
		         
		         fileForm.ajaxForm({
		            success: function(res) {
		               if(res.result == "SUCCESS") {
		                  if(res.fileName.length > 0) { //올린 파일이 1개라도 있는 경우
		                     $("#docmatchfilenm").val(res.fileName[0]); //올린 파일명 추가
		                  }
		                  
		                  var params = $("#Form").serialize();
			  				$.ajax({
			  					type : "post",
			  					url : "AppAddAjax", //결재추가Ajax
			  					dataType : "json", 
			  					data : params, 
			  					success : function(res) {
			  						if (res.res == "SUCCESS") {
			  							makeBtn1Popup(1, "", "결재가 성공적으로 기안되었습니다.", true, 400, 200, //결재추가성공시 팝업창
			  								null, "확인", function() {
			  									closePopup(1);
			  									$("#sampleForm").attr("action", "gwApp");
			  									$("#sampleForm").submit();
			  							});
			  						}
			  					},
			  					error : function(req, status, error) {
			  						console.log("code : " + req.status);
			  						console.log("message : " + req.responseText);
			  					}
			  				});
		  				
		               } else {
		                  alert("파일 저장 실패");
		               }
		            },
		            error: function(req) {
		               console.log(req.responseText);
		               alert("파일 저장 에러");
		            }
		         });
		         
		         fileForm.submit(); 
			}
		});
		
		
		$(".detail_btn_area").on("click", "#cancelBtn", function() {
			$("#sampleForm").attr("action", "gwApp");
			$("#sampleForm").submit();
		});
		
		
		$(".con1").on("click", "#athrSearchBtn", function() {
			var html="";
			makeBtn1Popup(3, "사원검색", html, true, 700, 600,
				function(){
					html+="<form id=\"empListForm\" action=\"#\" method=\"post\">";
					html+="<input type=\"hidden\" id=\"page\" name=\"page\" value=\"${page}\"/>";
					html+="<div class=\"default_search_area\">";
					html+="<select name=\"searchGbn\" id=\"searchGbn\">";
					html+="<option value=\"0\">부서</option>";
					html+="<option value=\"1\">이름</option>";
					html+="</select>";
					html+="<input type=\"text\" name=\"searchTxt\" id=\"searchTxt\"/>";
					html+="<input type=\"button\" id=\"searchBtn\" value=\"검색\" />";
					html+="</div>";
					html+="</form>";
					html+="<div class=\"default_board\">";
					html+="<table id=\"empList\">";
					html+="<colgroup>";
					html+="<col width=\"200px\">";
					html+="<col width=\"200px\">";
					html+="<col width=\"200px\">";
					html+="</colgroup>";
					html+="<thead>";
					html+="<tr class=\"top\">";
					html+="<th>이름</th>";
					html+="<th>직급</th>";
					html+="<th>부서</th>";
					html+="</tr>";
					html+="</thead>";
					html+="<tbody>";
					html+="</tbody>";
					html+="</table>";
					html+="</div>";
					html+="<div class=\"page_wrap\">";
					html+="<div class=\"page_nation\"></div>";
					html+="</div>";
					
					$(".popup_contents").html(html);
					
					empList();
					
					$(".default_search_area").on("click", "#searchBtn", function() {
						empList();
					});
					
					$("#empListForm").on("keypress", "input", function(event) {
						if(event.keyCode == 13) {
							return false;
						}
					});
					
					$("#empList").on("click", "tr", function() {
						if($("#appathr1").val()=="") {
							$("#appathr1").val($(this).attr("name"));
							$("#appathrnm1").val($(this).attr("id"));
							alert("추가 되었습니다.");
						} else if ($("#appathr2").val()=="") {
							if($("#appathr1").val()==$(this).attr("name")) {
								alert("결재권자가 중복되었습니다.");
							} else {
								$("#appathr2").val($(this).attr("name"));
								$("#appathrnm2").val($(this).attr("id"));
								alert("추가 되었습니다.");
							}
						} else if ($("#appathr3").val()=="") {
							if($("#appathr1").val()==$(this).attr("name") || $("#appathr2").val()==$(this).attr("name")) {
								alert("결재권자가 중복되었습니다.");
							} else {
								$("#appathr3").val($(this).attr("name"));
								$("#appathrnm3").val($(this).attr("id"));
								alert("추가 되었습니다.");
							}
						} else {
							alert("3명까지만 추가 가능합니다.");
						}
					});
					
					$(".page_nation").on("click", "div", function() {
						$("#page").val($(this).attr("name"));
						empList();
					});
					
				}, "닫기", function() {
						closePopup(3);
				});
		});
		
		$(".con1").on("click", "#refSearchBtn", function() {
			var html="";
			makeBtn1Popup(3, "사원검색", html, true, 700, 600,
				function(){
					html+="<form id=\"empListForm\" action=\"#\" method=\"post\">";
					html+="<input type=\"hidden\" id=\"page\" name=\"page\" value=\"${page}\"/>";
					html+="<div class=\"default_search_area\">";
					html+="<select name=\"searchGbn\" id=\"searchGbn\">";
					html+="<option value=\"0\">부서</option>";
					html+="<option value=\"1\">이름</option>";
					html+="</select>";
					html+="<input type=\"text\" name=\"searchTxt\" id=\"searchTxt\"/>";
					html+="<input type=\"button\" id=\"searchBtn\" value=\"검색\" />";
					html+="</div>";
					html+="</form>";
					html+="<div class=\"default_board\">";
					html+="<table id=\"empList\">";
					html+="<colgroup>";
					html+="<col width=\"200px\">";
					html+="<col width=\"200px\">";
					html+="<col width=\"200px\">";
					html+="</colgroup>";
					html+="<thead>";
					html+="<tr class=\"top\">";
					html+="<th>이름</th>";
					html+="<th>직급</th>";
					html+="<th>부서</th>";
					html+="</tr>";
					html+="</thead>";
					html+="<tbody>";
					html+="</tbody>";
					html+="</table>";
					html+="</div>";
					html+="<div class=\"page_wrap\">";
					html+="<div class=\"page_nation\"></div>";
					html+="</div>";
					
					$(".popup_contents").html(html);
					
					empList();
					
					$(".default_search_area").on("click", "#searchBtn", function() {
						$("#page").val("1");
						empList();
					});
					
					$("#empListForm").on("keypress", "input", function(event) {
						if(event.keyCode == 13) {
							return false;
						}
					});
					
					$("#empList").on("click", "tr", function() {
						if($("#appref1").val()=="") {
							$("#appref1").val($(this).attr("name"));
							$("#apprefnm1").val($(this).attr("id"));
							alert("추가 되었습니다.");
						} else if ($("#appref2").val()=="") {
							if($("#appref1").val()==$(this).attr("name")) {
								alert("결재권자가 중복되었습니다.");
							} else {
								$("#appref2").val($(this).attr("name"));
								$("#apprefnm2").val($(this).attr("id"));
								alert("추가 되었습니다.");
							}
						} else if ($("#appref3").val()=="") {
							if($("#appref1").val()==$(this).attr("name") || $("#appref2").val()==$(this).attr("name")) {
								alert("결재권자가 중복되었습니다.");
							} else {
								$("#appref3").val($(this).attr("name"));
								$("#apprefnm3").val($(this).attr("id"));
								alert("추가 되었습니다.");
							}
						} else {
							alert("3명까지만 추가 가능합니다.");
						}
					});
					
					$(".page_nation").on("click", "div", function() {
						$("#page").val($(this).attr("name"));
						empList();
					});
					
				}, "닫기", function() {
						closePopup(3);
				});
		});
		
		
	});
	
	function empList() {
		var params = $("#empListForm").serialize();
		$.ajax({
			type : "post",
			url : "empListAjax",  //수신함 요청목록Ajax
			dataType : "json",
			data : params, 
			success : function(res) { 
				drawEmpList(res.list);
				drawPopPaging(res.pb);
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	
	function drawEmpList(list) {
		var html = "";
		for (var i = 0; i < list.length; i++) {
			html += "<tr name=\""+list[i].EMP_NO+"\" id=\""+list[i].EMP_NM+"\">";
			html += "<td>" + list[i].EMP_NM + "</td>";
			html += "<td>" + list[i].POSN_NM + "</td>";
			html += "<td>" + list[i].DEPT_NM + "</td>";
			html += "</tr>";
			$("#empList tbody").html(html);
		}
	}
	
	function drawPopPaging(pb) {
	      var html = "";

	      if ($("#page").val() == 1) {
	         html += "<div class=\"arrow prev\"></div>";
	      } else {
	         html += "<div class=\"arrow prev\" name =\"" + ($("#page").val() - 1) + "\"></div> ";
	      }

	      for (var i = pb.startPcount; i <= pb.endPcount; i++) {
	         if ($("#page").val() == i) {
	            html += "<div class=\"page_on\" name=\"" + i + "\">" + i + "</b></div> ";
	         } else {
	            html += "<div class=\"page\" name=\"" + i + "\">" + i + "</div> ";
	         }
	      }

	      if ($("#page").val() == pb.maxPcount) {
	         html += "<div class=\"arrow next\" name =\"" +pb.maxPcount + "\"></div>";
	      } else {
	         html += "<div class=\"arrow next\" name =\"" + ($("#page").val() * 1 + 1) + "\"></div> ";
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
		<div class="contents_header_txt">결재작성</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="sampleForm" method="post">
		<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
		</form>
		<form action="fileUploadAjax" id="Form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="empno" id="empno" value="${sEmpNo}" />
		<input type="hidden" name="docmatchfilenm" id="docmatchfilenm" />
		<input type="hidden" name="aprvno" id="aprvno" />
		<input type="hidden" name="aprvfileno" id="aprvfileno" />
		<input type="hidden" name="appathr" id="appathr1" />
		<input type="hidden" name="appathr" id="appathr2" />
		<input type="hidden" name="appathr" id="appathr3" />
		<input type="hidden" name="appref" id="appref1" />
		<input type="hidden" name="appref" id="appref2" />
		<input type="hidden" name="appref" id="appref3" />
		<div class="underbox">
				<div class="underline">
					<div class="line1">제목</div>
					<div class="con1">
						<input type="text" name="apptitle" id="apptitle" />
					</div>
					<div class="line1">결재유형</div>
					<div class="con1">
						<select name="apptype" id="apptype">
							<option value="공용결재" checked>공용결재</option>
						</select>
					</div>
				</div>
				<div class="underline">
					<div class="line1">참조자</div>
					<div class="con1">
						<!-- 조직도에서 사원을 누를시 이름을 출력해주고 사원번호를 input type hidden으로 값을 넣어줄예정 -->
						<input type="text" id="apprefnm1" readonly/>
						<input type="text" id="apprefnm2" readonly/>
						<input type="text" id="apprefnm3" readonly/><input type="button" id="refSearchBtn" value="찾기"/><br/>
						최대 3명까지 선택할 수 있습니다
					</div>
					<div class="line1">결재권자</div>
					<div class="con1">
						<input type="text" id="appathrnm1" readonly/>
						<input type="text" id="appathrnm2" readonly/>
						<input type="text" id="appathrnm3" readonly/><input type="button" id="athrSearchBtn" value="찾기" /><br/>
						최대 3명까지 선택할 수 있습니다
					</div>
				</div>
				<div class="underline">
					<div class="line1">파일첨부</div>
					<div class="con1">
						<input type="file" name="filenm" id="filenm"/>
					</div>
				</div>
				<div class="underline">
					<div class="line1">내용</div>
					<div class="con3">
						<textarea name="appcont" id="appcont">${mode.APRV_MODE_MODE}</textarea>
					</div>
				</div>
			</div>
			</form>
			<div class="detail_btn_area">
				<input type="button" id="addBtn" value="기안" />
				<input type="button" id="cancelBtn" value="취소" />
			</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>