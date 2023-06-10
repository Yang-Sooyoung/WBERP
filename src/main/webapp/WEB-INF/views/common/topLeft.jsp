<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
#chatWrap, #chatWrap2 {
	display: inline-block;
    width: 450px;
    height: calc(100% - 2px);
    background-color: #FFFFFF;
    border: 1px solid #ddd;
    position: absolute;
    right: 0px;
    top: 0px;
    z-index: 100;
    box-shadow: 1px 1px 4px #c2c2c2;
}

#chatHeader {
    height: 60px;
    line-height: 60px;
    font-size: 20px;
    font-weight: 900;
    border-bottom: 1px solid #ddd;
    background-color: #E4EAF1;
    color: #fff;
}

/**#chatHeader select {
	width: 200px;
	outline: none;
    border: none;
	/* background: url('arrow.jpg') no-repeat 95% 50%;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	text-align: center;
    line-height: 60px;
    font-size: 20px;
    font-weight: 900;
}**/

#chatLog, #chatLog1 {
    height: calc(100% - 0px);
    overflow-y: auto;
    font-size: 14pt;
}

#chatList {
    border-radius: 5px;
	cursor: pointer;
	font-size: 12pt;
}

.roomEl {
    text-align: center;
    border-bottom: 1px solid #f0f0f0;
    padding: 10px 0px;
    cursor: pointer;
}

#chatLog1 .myMsg {
    text-align: right;
    font-size: 11pt;
}

#chatLog1 .anotherMsg {
    text-align: left;
    margin-bottom: 5px;
    font-size: 11pt;
}

.msg {
    display: inline-block;
    border-radius: 7px;
    padding: 7px 15px;
    margin-bottom: 10px;
    margin-: 5px;
}

.msgRead {
	font-size: 9px;
	color: #e43434;
}
.msgDate {
	font-size: 9px;
}

.anotherMsg > .msg {
    background-color: #f1f0f0;

}

.myMsg > .msg {
    background-color: #0084FF;
    color: #fff;
}

.anotherName {
    font-size: 11px;
    display: block;
}

.ChatFrom {
    display: block;
    width: 100%;
    height: 50px;
    border-top: 2px solid #f0f0f0;
}

#message1 {
    width: 85%;
    height: calc(100% - 1px);
    border: none;
    padding-bottom: 0;
}

#message1:focus {
    outline: none;
}

.ChatFrom > input[type=button] {
    outline: none;
    border: none;
    background: none;
    color: #0084FF;
    font-size: 17px;
    cursor: pointer;
}

#chatList {
	border-collapse: collapse;
}

#chatList tbody tr:hover {
	background-color: #0084FF;
}

#chatHeader > input[type=button] {
	outline: none;
    border: none;
    background: none;
    color: #0084FF;
    font-size: 27px;
    float: left;
    cursor: pointer;
    
}

#chatHeader input[type="text"] {
	height: 20px;
    font-size: 10pt;
    border-radius: 3px;
    margin: 0 3px;
    border: 1px solid #c2c2c2;
    padding: 1px 2px;
    outline: none;
}
#chatHeader > #out {
	outline: none;
    border: none;
    background: none;
    color: #0084FF;
    font-size: 13px;
    float: right;
}

#chatCom {
	font-size: 13px;
}


.addEmpNm {
	text-align: center;
    margin-top: 20px;
    margin-bottom: 10px;
}

#addEmp1 {
	height: 28px;
    font-size: 10pt;
    border-radius: 3px;
    margin: 0 3px;
    border: 1px solid #c2c2c2;
    padding: 1px 2px;
    outline: none;
}

/* 알림 */
.noti_area {
	display: inline-block;
	vertical-align: top;
    width: 450px;
    height: 100%;
    background-color: #e4eaf2;
    position: absolute;
    z-index: 100;
    right: 0px;
    top: 0;
}

.noti_header {
    height: 50px;
    text-align: left;
    line-height: 60px;
    font-size: 20px;
    font-weight: bold;
    box-shadow: 1px 1px 4px #c2c2c2;
    border-top: none;
    color: #022859;
    padding-left: 15px;
}

.noti_wrap {
	height: 100% !important;
}

.noti {
	border-collapse: separate;
    text-indent: initial;
	border-spacing: 0;
	padding: 5px;
}

.noti tr {
	display: table-row;
    vertical-align: inherit;
	height: 80px;
	cursor: pointer;
}

.noti td:hover {
	background-color: rgba(145, 183, 217, 0.5);
}

.noti td {
	font-size: 11pt;
	font-weight: 500;
	margin: 14px 0 0 10px;
}

.noti_title {
	display: block;
	font-weight: 600;
}

.nDate {
	display: inline-block;
	vertical-align: top;
	font-weight: normal;
	float: right;
	font-size: 10pt;
}

</style>
<script type="text/javascript">
var refreshInterval = null;
var refreshInterval2 = null;


$(document).ready(function() {
	notiRead();
	
	//알림 버튼
	$(".top_noti_btn").on("click", function() {
		if($(".noti_area").length > 0) {
			$(".noti_area").remove();
		} else {
			notiList();
			$("#chatWrap").remove();
		}
	});
	
	//알림 목록
	$("body").on("click", ".noti tr", function() {
		$("#notcno").val($(this).attr("name"));
		var notiId = $(this).attr("id");
		var params = $("#noticeForm").serialize();
		
		$.ajax({
			type : "post",
			url : "noticeUpdateAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				
				/* if(notiId == 0) {
					$("#top").val("1");
					$("#menuNo").val("12");
					$("#locationForm").attr("action", "gwSchDetail");
					$("#locationForm").submit();
				} else  */
				if(notiId == 1) {
					$("#top").val("1");
					$("#menuNo").val("13");
					$("#locationForm").attr("action", "gwAppRecp");
					$("#locationForm").submit();
				}
			},
			error : function(req, status, error) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
		
	});
	
	
	
	$(".default_search_area").on("click","#searchGbn #searchBtn", function() {
		drawChat2();
		console.log("ddd");
	});

	
	//채팅목록
	$(".top_chat_btn").on("click", function() {
		if($("#chatWrap").length > 0) {
			$("#chatWrap").remove();
			$("#chatWrap2").remove();
			clearInterval(refreshInterval2);
		} else {
			$("#chatroom").val($(this).attr("name"));
			drawChat();
		}
	});
	
	//채팅방
	$("body").on("click", "#chatLog tr", function() {
		$("#chatroom").val($(this).attr("name"));
		//$("#lastChatNo").val();
	//	$("#chatWrap").remove();
		clearInterval(refreshInterval2);
		roomChat1();
		readCheck();
	});
	
	//뒤로가기
	$("body").on("click", "#chatHeader #back", function() {
		$("#chatWrap2").remove();
		drawChat();
		readCheck();
		clearInterval(refreshInterval);
	});
	
	
	//전송
	$("body").on("click", ".ChatFrom #sendBt", function() {
		$("#chatroomno").val($("#chatroom").val());
		fileUplode();
		readCheck();
	});
	
	
	//그룹대화
	$("body").on("click", ".addEmpNm #addEmpNm1", function() {
			custArray = "";
			custArray2 = "";
			$("#addEmp1").val("");
			$("#addEmpNm1").val("");
		});
		
		
		
	$("body").on("click", ".plus", function() {
		var html="";
		makeBtn2Popup(3, "사원검색", html, true, 700, 600,
			function(){
				html+="<form id=\"empListForm\" action=\"#\" method=\"post\">";
				html+="<input type=\"hidden\" id=\"page\" name=\"page\" value=\"${page}\"/>";
				html+="<input type=\"hidden\" id=\"addEmp1\" name=\"addEmp\" />";
				html+="<input type=\"hidden\" id=\"$sEmpNo\" name=\"sEmpNo\" value=\"${sEmpNo}\"/>";
				html+="<div class=\"default_search_area\">";
				html+="<select name=\"searchGbn\" id=\"searchGbn\">";
				html+="<option value=\"0\">부서</option>";
				html+="<option value=\"1\">이름</option>";
				html+="</select>";
				html+="<input type=\"text\" name=\"searchTxt\" id=\"searchTxt\"/>";
				html+="<input type=\"button\" id=\"searchBtn\" value=\"검색\" />";
				html+="</div>";
				
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
				
				html += "<div class=\"addEmpNm\">";
				html += "<input type=\"text\" name=\"addEmpNm\" id=\"addEmpNm1\" readonly>";
				html += "</div>";
				html+="</form>";
				
				$(".popup_contents").html(html);
				$("#page").val("1");
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
				
				//고객 목록 저장
				var custArray = "";
				var custArray2 = "";
			
				$("#empList").on("click", "tr", function() {
					custArray += ",";
					//custArray += $(this).attr("id");
					custArray2 += ",";
					//custArray2 += $(this).attr("name");
					//$("#addEmpNm1").val(custArray);
					//$("#addEmp1").val(custArray2);
					if(custArray2 == $(this).attr("name")) {
						alert("중복 되었습니다.")
					} else {
						custArray += $(this).attr("id");
						custArray2 += $(this).attr("name");
						$("#addEmpNm1").val(custArray);
						$("#addEmp1").val(custArray2);
					}
					console.log(custArray2);
					console.log($("#addEmp1").val());
						
					
				});
				
				$(".page_nation").on("click", "div", function() {
					$("#page").val($(this).attr("name"));
					empList();
				});
				
			}, "대화하기", function() {
					//기능넣기
					groupChat();
					
					closePopup(3);
			},
				"닫기", function() {
				closePopup(3);
			});
		//groupChat();
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
	
	//나가기
	$("body").on("click", "#chatHeader #out", function() {
		if(confirm("나가시겠습니까")) {
			outChat();
		}
	});
	
	//파일첨부
	function fileUplode(){
		var fileForm = $("#fileForm");
        
	        fileForm.ajaxForm({
	           success: function(res) {
	              if(res.result == "SUCCESS") {
	                 if(res.fileName.length > 0) { //올린 파일이 1개라도 있는 경우
	                    $("#chatatchfilenm").val(res.fileName[0]); //올린 파일명 추가
	                 }
	                 
	                 if($.trim($("#chatatchfilenm").val())=="" && $.trim($("#message1").val())=="") {
						$("#message1").focus();
					 } else {
						sendChat();	
						$("#attFile").val("");
						$("#chatatchfilenm").val("");
					 }
	 				
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
//엔터로 보내기
function enterCheck(){
	$("#chatroomno").val($("#chatroom").val());
	if(event.keyCode == 13){
		if($.trim($("#message1").val()) == "") {
			$("#message1").focus();
		} else {
			sendChat();
		}
		return;
	}
}


function scrollDown() {
	$("#chatLog1").animate({
		scrollTop: $("#chatLog1").prop("scrollHeight") 
	}, 'slow', function () {});
}

//나가기
function outChat() {
	var params = $("#ChattingForm").serialize();

	$.ajax({
		type : "post",
		url : "ChatDeleteAjax",
		dataType : "json",// {키:값, 키:값}
		data : params,//보낼데이터(필수는 아님, 보낼 데이터가 없으면 인보내도됨)
		success : function(res) {//성공 시 해당 함수 실행. 결과는 res로 받겠다.
			if(res.res == "SUCCESS") {
				drawChat();
			} else {
				$("#alert").attr("title", "알림");
				$("#alert p").html("삭제에 실패!");
				$("#alert").dialog({
					buttons : {
						Ok: function() {
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

//마지막 채팅번호 업데이트
function readCheck() {
	var params = $("#ChattingForm").serialize();

	$.ajax({
		type : "post",
		url : "readAjax",
		dataType : "json",// {키:값, 키:값}
		data : params,//보낼데이터(필수는 아님, 보낼 데이터가 없으면 인보내도됨)
		success : function(res) {//성공 시 해당 함수 실행. 결과는 res로 받겠다.
			
		},
		error : function(req) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}
//채팅목록
function drawChat(){
	clearInterval(refreshInterval2);

	var params = $("#ChattingForm").serialize();
	
    $.ajax({
          type : "post",
          url : "ChattingAjax",
          dataType : "json",// {키:값, 키:값}
          data : params,//보낼데이터
          success : function(res) {//성공 시 해당 함수 실행. 결과는 result로 받겠다.
        	  console.log("실행");
              drawChatList(res.list, res.cnt);
	         
          },
          error : function(req) {
             console.log("code : " + req.status);
             console.log("message : " + req.responseText);
             
            //refreshInterval2 = setInterval(drawChat,1000);
          }
       });
}

//채팅목록
function drawChat2(){
	clearInterval(refreshInterval2);

	var params = $("#Chatting1Form").serialize();
	
    $.ajax({
          type : "post",
          url : "ChattingAjax",
          dataType : "json",// {키:값, 키:값}
          data : params,//보낼데이터
          success : function(res) {//성공 시 해당 함수 실행. 결과는 result로 받겠다.
              drawChatList(res.list, res.cnt);
	         
          },
          error : function(req) {
             console.log("code : " + req.status);
             console.log("message : " + req.responseText);
             
          }
       });
}

//채팅방
function roomChat1() {
	clearInterval(refreshInterval);
	 
	var params = $("#ChattingForm").serialize();
		
		$.ajax({
			type : "post",
			url : "ChattingDetailAjax",
			dataType : "json",// {키:값, 키:값}
			data : params,//보낼데이터
			success : function(res) {//성공 시 해당 함수 실행. 결과는 result로 받겠다.
				drawChatShape(res.alia);
				readCheck();
				clearInterval(refreshInterval);
				drawChatDetail(res.chat);
			},
			error : function(req) {
				
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
				
			}
		});
}

//채팅방2
function roomChat2() {
	clearInterval(refreshInterval);
	 
	var params = $("#ChattingForm").serialize();
		
		$.ajax({
			type : "post",
			url : "ChattingDetailAjax",
			dataType : "json",// {키:값, 키:값}
			data : params,//보낼데이터
			success : function(res) {//성공 시 해당 함수 실행. 결과는 result로 받겠다.
				drawChatDetail(res.chat);
				readCheck();
				//refreshInterval = setInterval(roomChat2,1000);
				
			},
			error : function(req) {
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
				
				//refreshInterval = setInterval(roomChat2,1000);
			}
		});
}

//전송(에 필요한것/사원정보(${sDeptNm}:부서<br />${sPosnNm}:직급 ${sEmpNm}:이름), 채팅방번호, )
function sendChat() {
	$("#chatcont").val($("#message1").val());
	
	var params = $("#chatForm").serialize();
	
	$.ajax({
		type : "post",
		url : "ChattingSendAjax",
		dataType : "json",// {키:값, 키:값}
		data : params,//보낼데이터
		success : function(res) {//성공 시 해당 함수 실행. 결과는 result로 받겠다.
			roomChat2();
			readCheck();
			$("#chatcont").val("");
			$("#message1").val("");
			
		},
		error : function(req) {
			alert(req.errorMessage);
			$("#chatcont").val("");
			$("#message1").val("");
		}
	});
}

//채팅추가
function groupChat() {
	var params = $("#empListForm").serialize();
	$.ajax({
		type : "post",
		url : "GroupChattingAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			if(res.res == "SUCCESS") {
				roomChat1();
				$("#chatroom").val(res.chatroom);
			} else {
				
			}
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}

//채팅목록그리기
function drawChatList(list, cnt) {
	var html = "";
	console.log(list);
	if(cnt == 0) {
		html +="<tr>";
		html +="<td colspan=\"5\">데이터가 없습니다.</td>";
		html +="</tr>";
	} else {
			html += "<form action=\"#\" id=\"Chatting1Form\" method=\"post\">";
			html += "<input type=\"hidden\" id=\"chatroom\" name=\"chatroom\" value=\"${param.chatroom}\" />";
			html += "<input type=\"hidden\" name=\"sEmpNo\" id=\"sEmpNo\" value=\"${sEmpNo}\" />";
			html += "	<input type=\"hidden\" name=\"lastChatNo\" id=\"lastChatNo\" value=\"${maxNo}\" />";
			html += "	<input type=\"hidden\" name=\"lastchatno\" value=\"${lastChatNo}\" />";
			html += "	<input type=\"hidden\" name=\"chatRoomNo\" id=\"chatRoomNo\" value=\"${chat.CHAT_ROOM_NO}\" />";
			
			html += "<div id=\"chatWrap\">";
			
			html += "<div id=\"chatHeader\">"; 
            html += "<input class =\"plus\" type=\"button\" value=\"+\">";
           
            html+="<div class=\"default_search_area\">"; 
        	html +=	"채팅";
            html += "<select name=\"searchGbn\" id=\"searchGbn\">";
        	html += "<option value=\"1\">이름</option>";
        	html += "</select>";
				html+="<input type=\"text\" name=\"searchTxt\" id=\"searchTxt\"/>";
				html+="<input type=\"button\" id=\"searchBtn\" value=\"검색\" />";
			html+="</div>";
        	
            html += "</div>";
            
            
            html += "<div id=\"chatLog\">";
            html += "<table id=\"chatList\">";
            html += "<colgroup>";
			html += "<col width=\"160px\">";
			html += "<col width=\"160px\">";
			html += "<col width=\"400px\">";
			html += "<col width=\"160px\">";
			html += "<col width=\"160px\">"
			html += "</colgroup>";
			
			html +=	"<tbody>";
				for(var i = 0; i < list.length; i++) {
					html += "<tr class=\"roomEl active\" name=\"" + list[i].CHAT_ROOM_NO + "\">";
					html +=	"<td class=\"roomEl\">" + list[i].CHAT_ROOM_PERS_NM + "</td>";
					if (list[i].CHAT_CONT != null && list[i].CHAT_CONT != null) {
	    				html += "<td class=\"msg\">" + list[i].CHAT_CONT + "</td>";
					}else if(list[i].CHAT_ATCH_FILE_NM != null && list[i].CHAT_ATCH_FILE_NM != null){
						html += "<td class=\"msg\">" + list[i].CHAT_ATCH_FILE_NM + "</td>";
					}
					html +=	"<td class=\"roomEl\">" + list[i].CHAT_REG_DATE + "</td>";
					html +=	"<td class=\"roomEl\">" + list[i].CNT + "</td>";
					html +=	"</tr>";			
				}
			
			html +=	"</tbody>";
			html +=	"</table>";
            html += "</div>";
            html+="	</form>                 ";
		}
	
	$(".contents_area").prepend(html);

	$("#chatLog").slimScroll({
		height: "calc(100% - 113px)"
	});
}
//채팅방대화
function drawChatShape(alia) {
	var html = "";
	console.log(alia);
	html += "<div id=\"chatWrap2\">";
    html += "<div id=\"chatHeader\">";
    html += "<input type=\"checkbox\" id=\"autoScroll\" checked=\"checked\" />";
    for(var i = 0; i < alia.length; i++) {
	    if(alia[i].EMP_NO != '${sEmpNo}') {
	    	html += alia[i].NAME;
	    }
    }
    html += "<input id =\"back\" type=\"button\" value=\"<\">";
    html += "<input id =\"out\" type=\"button\" value=\"나가기\">";
    
	html += "<div class=\"search_btn_area\">";
	html += "<input type=\"text\" placeholder=\"검색어\" />";
	html +=	"<input type=\"button\" value=\"검색\" />";
	html += "</div>";
	html += "</div>";
    
	html += "<div id=\"chatLog1\">";
	html += "</div>";

    html += "<form action=\"#\" id=\"chatForm\" method=\"post\">";
    html += "<input type=\"hidden\" id=\"chatroomno\" name=\"chatroomno\" value=\"${param.chatroomno}\"/>";
    html += "<input type=\"hidden\" name=\"sEmpNo\" id=\"sEmpNo\" value=\"${sEmpNo}\" />";
    html += "<input type=\"hidden\" name=\"chatcont\" id=\"chatcont\" value=\"${sEmpNo}\" />";
    html += "<input type=\"hidden\" name=\"chatatchfilenm\" id=\"chatatchfilenm\" />";
    html += "</form>";

    html += "<div class=\"ChatFrom\">";
    html += "<input type=\"text\" id=\"message1\" name=\"message1\" autocomplete=\"off\" size=\"30\" placeholder=\"메시지를 입력하세요\" onkeydown=\"enterCheck();\" />";
    html += "<input id=\"sendBt\" name=\"sendBt\" type=\"button\" value=\"보내기\"/>";
    html += "</div>";
    
    html += "<form id=\"fileForm\" name=\"fileForm\" action=\"fileUploadAjax\" method=\"post\" enctype=\"multipart/form-data\">";
    html += "<input type=\"file\" name=\"attFile\" id=\"attFile\"/>";
    html += "</form>";
	html += "</div>";
	
	$("#chatWrap").remove();
	$(".contents_area").prepend(html);
	
	$("#chatLog1").slimScroll({
		height: "calc(100% - 113px)"
	});
	
	var scrollTo_int = $('#chatLog1').scrollTop($('#chatLog1')[0].scrollHeight);
	$('#chatLog1').slimScroll({
		scrollTo : scrollTo_int
	});
}
//채팅방대화
function drawChatDetail(chat) {
	if(chat.length != 0) {
		console.log(chat);
		var html = "";
	    for(var i = 0; i < chat.length; i++)  {
	    	if(chat[i].EMP_NO != '${sEmpNo}') {
			    html += "<div class=\"anotherMsg\" name=\"" + chat[i].CHAT_ROOM_NO + "\">";
			    html += "<span class=\"anotherName\">" + chat[i].EMP_NM + "</span>";
			   
			   	if (chat[i].CHAT_CONT != null && chat[i].CHAT_CONT != null) {
	    				html += "<span class=\"msg\">" + chat[i].CHAT_CONT + "</span>";
				}
	    		if (chat[i].CHAT_ATCH_FILE_NM != null && chat[i].CHAT_ATCH_FILE_NM != null) {
	    			html +="<a class=\"msg\" href=\"resources/upload/"+chat[i].CHAT_ATCH_FILE_NM+"\" download>"+chat[i].CHAT_ATCH_FILE_NM +"</a>";
				} 
	    		
			    html += "<span class=\"msgDate\">" + chat[i].CHAT_REG_DATE + "</span>";
			    html += "<span class=\"msgRead\">" + chat[i].CNT + "</span>";
				html += "</div>";
	    	} else {
	    		html += "<div class=\"myMsg\"  name=\"" + chat[i].CHAT_ROOM_NO + "\">";
			    html += "<span class=\"msgRead\">" + chat[i].CNT + "</span>";
			    html += "<span class=\"msgDate\">" + chat[i].CHAT_REG_DATE + "</span>";
			  
			    if (chat[i].CHAT_CONT != null && chat[i].CHAT_CONT != null) {
	    				html += "<span class=\"msg\">" + chat[i].CHAT_CONT + "</span>";
				}
	    		if (chat[i].CHAT_ATCH_FILE_NM != null && chat[i].CHAT_ATCH_FILE_NM != null) {
	    			html +="<a class=\"msg\" href=\"resources/upload/"+chat[i].CHAT_ATCH_FILE_NM+"\" download>"+chat[i].CHAT_ATCH_FILE_NM +"</a>";
				} 
				html += "</div>";
	    	}
	    }
		$("#chatLog1").append(html);
		
		var scrollTo_int = $('#chatLog1').scrollTop($('#chatLog1')[0].scrollHeight);
		$('#chatLog1').slimScroll({
			scrollTo : scrollTo_int
		});
		$("#lastChatNo").val(chat[chat.length - 1].CHAT_NO);
		$("#chatRoomNo").val(chat[chat.length - 1].CHAT_ROOM_NO);
		
		if($("#autoScroll").is(":checked")) {
			scrollDown();
		}
	}
}

function chatRead() {
	var params = $("#ChattingForm").serialize(); 
	
	$.ajax({
        type : "post",
        url : "chatReadCntAjax",
        dataType : "json",
        data : params,
        success : function(res) {
        	chatReadCnt(res.Cnt);
        	console.log(res.Cnt);
        },
        error : function(req, status, error) {
           console.log("code : " + req.status);
           console.log("message : " + req.responseText);
        }
     });
}

//채팅 알림 개수
function chatReadCnt(Cnt) {
	var html = "";
	console.log(Cnt);
	if(Cnt == 0) {
		$(".chat_cnt_on").attr("visibility", "hidden");
	} else {
		html += "<div class=\"chat_cnt_on\">" + Cnt + "</div>";
	}
	$(".top_chat_btn").html(html);
}



//알림
function notiList() {
	var params = $("#noticeForm").serialize(); 
	
	$.ajax({
        type : "post",
        url : "noticeAjax",
        dataType : "json",
        success : function(res) {
        	drawNoti(res.list, res.cnt);
        },
        error : function(req, status, error) {
           console.log("code : " + req.status);
           console.log("message : " + req.responseText);
        }
     });
}

//알림 목록
function drawNoti(list, cnt) {
	var html = "";
	
	html += "<div class=\"noti_area\">";
	html += 	"<div class=\"noti_header\">Notice</div>";
	html += 	"<div class=\"noti_wrap\">";
	html += 		"<table class=\"noti\">";
	html += 			"<col width=\"450px\">";
	html +=				"<tbody>"
	if(cnt == 0) {
		html += "<tr>";
		html += "<td>알림 내역이 없습니다.</td>";
		html += "</tr>";
	} else {
		for(var i = 0; i < list.length; i++) {
			//알림 구분
			if(list[i].NOTC_READ_WHET == 0) {
				html += "<tr id=\"" + list[i].NOTC_SORT + "\"name=\"" + list[i].NOTC_NO + "\" >";
				html += "<td>"
				html += "<div class=\"noti_title\">결재</div>";
				/* if(list[i].NOTC_SORT == 0) {
					html += "일정 : " + list[i].NOTC_CONT + "<span class=\"nDate\">" + list[i].NOTC_DATE + "</span></td>";
				} else  */
				if(list[i].NOTC_SORT == 1) {
					html += list[i].NOTC_CONT + "<span class=\"nDate\">" + list[i].NOTC_DATE + "</span></td>";
				}
				html += "</tr>";
			} 
		}
	}
	html += 			"</tbody>";
	html += 		"</table>";
	html +=		"</div>";
	html += "</div>"; 
		
	$(".contents_area").prepend(html);
	
	$(".noti_wrap").slimScroll({
		height: "calc(100% - 50px)"
	});
}

//알림 개수 Ajax
function notiRead() {
	var params = $("#noticeForm").serialize(); 
	
	$.ajax({
        type : "post",
        url : "readCntAjax",
        dataType : "json",
        success : function(res) {
        	notiReadCnt(res.cnt);
        },
        error : function(req, status, error) {
           console.log("code : " + req.status);
           console.log("message : " + req.responseText);
        }
     });
}

//알림 개수
function notiReadCnt(cnt) {
	var html = "";
	
	if(cnt == 0) {
		$(".noti_cnt_on").attr("visibility", "hidden");
	} else {
		html += "<div class=\"noti_cnt_on\">" + cnt + "</div>";
	}
	$(".top_noti_btn").html(html);
}

</script>
<script type="text/javascript">
</script>
<input type="hidden" id="athrType" name="athrType" value="${athrTypeNo}" />
<form action="#" id="locationForm" method="post">
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
</form>

<form action="#" id="ChattingForm" method="post">
	<input type="hidden" id="chatroom" name="chatroom" value="${param.chatroom}" />
	<input type="hidden" name="sEmpNo" id="sEmpNo" value="${sEmpNo}" />
	<input type="hidden" name="lastChatNo" id="lastChatNo" value="${maxNo}" />
	<input type="hidden" name="lastchatno" value="${lastChatNo}" />
	<input type="hidden" name="chatRoomNo" id="chatRoomNo" value="${chat.CHAT_ROOM_NO}" />
</form>

<form action="#" id="noticeForm" method="post">
	<input type="hidden" name="notcno" id="notcno" value="${notice.NOTC_NO}"/>
	<input type="hidden" name="sEmpNo" id="sEmpNo" value="${sEmpNo}" />
</form>
<!-- Top Bar -->
	<div class="top_area">
		<div class="logo"></div>
		<div class="top_menu_area">
			<c:forEach var="menu" items="${topMenu}">
				<div class="top_menu" topno="${menu.MENU_NO}" menuno="${menu.MENU_APARAM}" addr="${menu.MENU_ADDR}">
					<div class="top_menu_txt">${menu.MENU_NM}</div>
				</div>
			</c:forEach>
		</div>
		<div class="info_area">
			<div class="info_wrap">
				<div class="photo">
					<c:choose>
						<c:when test="${!empty sPhotoAddr}">
							<img alt="사진" src="resources/upload/${sPhotoAddr}">
						</c:when>
						<c:otherwise>
							<img alt="사진" src="resources/images/sample/photo.jpg">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="info_txt">
					${sDeptNm}<br />${sPosnNm} ${sEmpNm}
				</div>
				<div class="top_chat_btn">
					
				</div>
				<div class="top_noti_btn">
					
				</div>
				<div class="logout_btn">
					<div class="logout_btn_txt">로그아웃</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Left Menu -->
	<div class="left_area">
	</div>
	<!-- Contents -->
	<div class="contents_area">
		<div class="gnb">
			<div class="gnb_txt"></div>
		</div>