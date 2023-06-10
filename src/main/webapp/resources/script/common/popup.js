/**
 * popup.js
 * create date : 2021.01.21
 * create by : YS.Lee
 */

/**
 * makeAlert(depth, title, contents)
 * : 알림창 생성
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 * title - 제목
 * contents - 내용
 * event - 팝업 닫을 시 이벤트(없을경우 null입력)
 */
function makeAlert(depth, title, contents, event) {
	if(popupCheck(depth)) {
		//팝업 존재 시
	} else {
		var html = "";
		
		html += "<div class=\"popup_bg_clear\" id=\"popup" + depth + "Bg\"></div>";
		
		html += "<div class=\"popup\" id=\"popup" + depth + "\">";
		html += "<div class=\"popup_title\">";
		html += "<div class=\"popup_title_txt\">" + title + "</div>";
		html += "</div>";
		html += "<div class=\"popup_contents\">";
		html += contents;
		html += "</div>";
		html += "<div class=\"popup_btn\">";
		html += "<input type=\"button\" value=\"확인\" id=\"popup" + depth + "Btn1\" />";
		html += "</div>";
		html += "</div>";
		
		$("body").prepend(html);
		
		$("#popup" + depth).css("z-index", depth * 120);
		$("#popup" + depth + "Bg").css("z-index", depth * 110);
		
		$("#popup" + depth).hide();
		
		$("#popup" + depth).fadeIn("fast");
		

		$("#popup" + depth + "Btn1").off("click");
		$("#popup" + depth + "Btn1").on("click", function(){
			if(event != null) {
				event.call();
			}
			
			closePopup(depth);
		});
		
		$("#popup" + depth + "Bg").off("click");
		$("#popup" + depth + "Bg").on("click", function(){
			closePopup(depth);
		});
	}
}


/**
 * makeBtn1Popup(depth, title, contents, bgFlag, width, height, contentsEvent, btn1Title, btn1Event)
 * : 팝업 생성
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 * title - 제목
 * contents - 내용
 * bgFlag - 백그라운드 존재여부(true : 존재, flase : 비존재)
 * contentsEvent - 내용 추가이벤트(없을경우 null입력)
 * btn1Title - 버튼1 텍스트
 * btn1Event - 버튼1 추가이벤트(없을경우 null입력), 완료 후 팝업닫을 경우 closePopup(depth)호출
 */
function makeBtn1Popup(depth, title, contents, bgFlag, width, height, contentsEvent, btn1Title, btn1Event) {
	if(popupCheck(depth)) {
		//팝업 존재 시
	} else {
		var html = "";
		
		if(bgFlag) {
			html += "<div class=\"popup_bg\" id=\"popup" + depth + "Bg\"></div>";
		} else {
			html += "<div class=\"popup_bg_clear\" id=\"popup" + depth + "Bg\"></div>";
		}
		
		html += "<div class=\"popup\" id=\"popup" + depth + "\">";
		html += "<div class=\"popup_title\">";
		html += "<div class=\"popup_title_txt\">" + title + "</div>";
		html += "</div>";
		html += "<div class=\"popup_contents\">";
		html += contents;
		html += "</div>";
		html += "<div class=\"popup_btn\">";
		html += "<input type=\"button\" value=\"" + btn1Title + "\" id=\"popup" + depth + "Btn1\" />";
		html += "</div>";
		html += "</div>";
		
		$("body").prepend(html);
		
		if(contentsEvent != null) {
			contentsEvent.call();
		}
		
		$("#popup" + depth).css("z-index", depth * 120);
		$("#popup" + depth + "Bg").css("z-index", depth * 110);
		$("#popup" + depth).css("width", width + "px");
		$("#popup" + depth).css("height", height + "px");
		$("#popup" + depth).css("left", "calc(50% - " + (width / 2) + "px");
		$("#popup" + depth).css("top", "calc(50% - " + (height / 2) + "px");
		
		$("#popup" + depth).hide();
		
		$("#popup" + depth).fadeIn("fast");
		

		$("#popup" + depth + "Btn1").off("click");
		$("#popup" + depth + "Btn1").on("click", function(){
			if(btn1Event != null) {
				btn1Event.call();
			}
		});
		
		//if(bgFlag) {
			$("#popup" + depth + "Bg").off("click");
			$("#popup" + depth + "Bg").on("click", function(){
				closePopup(depth);
			});
		//}
	}
}
 
/**
 * makeBtn2Popup(depth, title, contents, bgFlag, width, height, contentsEvent, btn1Title, btn1Event, btn2Title, btn2Event)
 * : 팝업 생성
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 * title - 제목
 * contents - 내용
 * bgFlag - 백그라운드 존재여부(true : 존재, flase : 비존재)
 * contentsEvent - 내용 추가이벤트(없을경우 null입력)
 * btn1Title - 버튼1 텍스트
 * btn1Event - 버튼1 추가이벤트(없을경우 null입력), 완료 후 팝업닫을 경우 closePopup(depth)호출
 * btn2Title - 버튼1 텍스트
 * btn2Event - 버튼1 추가이벤트(없을경우 null입력), 완료 후 팝업닫을 경우 closePopup(depth)호출
 */
function makeBtn2Popup(depth, title, contents, bgFlag, width, height, contentsEvent, btn1Title, btn1Event, btn2Title, btn2Event) {
	if(popupCheck(depth)) {
		//팝업 존재 시
	} else {
		var html = "";
		
		if(bgFlag) {
			html += "<div class=\"popup_bg\" id=\"popup" + depth + "Bg\"></div>";
		} else {
			html += "<div class=\"popup_bg_clear\" id=\"popup" + depth + "Bg\"></div>";
		}
		
		html += "<div class=\"popup\" id=\"popup" + depth + "\">";
		html += "<div class=\"popup_title\">";
		html += "<div class=\"popup_title_txt\">" + title + "</div>";
		html += "</div>";
		html += "<div class=\"popup_contents\">";
		html += contents;
		html += "</div>";
		html += "<div class=\"popup_btn\">";
		html += "<input type=\"button\" value=\"" + btn1Title + "\" id=\"popup" + depth + "Btn1\" />";
		html += "<input type=\"button\" value=\"" + btn2Title + "\" id=\"popup" + depth + "Btn2\" />";
		html += "</div>";
		html += "</div>";
		
		$("body").prepend(html);
		
		if(contentsEvent != null) {
			contentsEvent.call();
		}
		
		$("#popup" + depth).css("z-index", depth * 120);
		$("#popup" + depth + "Bg").css("z-index", depth * 110);
		$("#popup" + depth).css("width", width + "px");
		$("#popup" + depth).css("height", height + "px");
		$("#popup" + depth).css("left", "calc(50% - " + (width / 2) + "px");
		$("#popup" + depth).css("top", "calc(50% - " + (height / 2) + "px");
		
		$("#popup" + depth).hide();
		
		$("#popup" + depth).fadeIn("fast");
		
		$("#popup" + depth + "Btn1").off("click");
		$("#popup" + depth + "Btn1").on("click", function(){
			if(btn1Event != null) {
				btn1Event.call();
			}
		});
		
		$("#popup" + depth + "Btn2").off("click");
		$("#popup" + depth + "Btn2").on("click", function(){
			if(btn2Event != null) {
				btn2Event.call();
			}
		});
		
		//if(bgFlag) {
			$("#popup" + depth + "Bg").off("click");
			$("#popup" + depth + "Bg").on("click", function(){
				closePopup(depth);
			});
		//}
	}
}

/**
 * makeBtn3Popup(depth, title, contents, bgFlag, width, height, contentsEvent, 
 *               btn1Title, btn1Event, btn2Title, btn2Event, btn3Title, btn3Event)
 * : 팝업 생성
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 * title - 제목
 * contents - 내용
 * bgFlag - 백그라운드 존재여부(true : 존재, flase : 비존재)
 * contentsEvent - 내용 추가이벤트(없을경우 null입력)
 * btn1Title - 버튼1 텍스트
 * btn1Event - 버튼1 추가이벤트(없을경우 null입력), 완료 후 팝업닫을 경우 closePopup(depth)호출
 * btn2Title - 버튼2 텍스트
 * btn2Event - 버튼2 추가이벤트(없을경우 null입력), 완료 후 팝업닫을 경우 closePopup(depth)호출
 * btn3Title - 버튼3 텍스트
 * btn3Event - 버튼3 추가이벤트(없을경우 null입력), 완료 후 팝업닫을 경우 closePopup(depth)호출
 */
function makeBtn3Popup(depth, title, contents, bgFlag, width, height, contentsEvent, 
						   btn1Title, btn1Event, btn2Title, btn2Event, btn3Title, btn3Event) {
	if(popupCheck(depth)) {
		//팝업 존재 시
	} else {
		var html = "";
		
		if(bgFlag) {
			html += "<div class=\"popup_bg\" id=\"popup" + depth + "Bg\"></div>";
		} else {
			html += "<div class=\"popup_bg_clear\" id=\"popup" + depth + "Bg\"></div>";
		}
		
		html += "<div class=\"popup\" id=\"popup" + depth + "\">";
		html += "<div class=\"popup_title\">";
		html += "<div class=\"popup_title_txt\">" + title + "</div>";
		html += "</div>";
		html += "<div class=\"popup_contents\">";
		html += contents;
		html += "</div>";
		html += "<div class=\"popup_btn\">";
		html += "<input type=\"button\" value=\"" + btn1Title + "\" id=\"popup" + depth + "Btn1\" />";
		html += "<input type=\"button\" value=\"" + btn2Title + "\" id=\"popup" + depth + "Btn2\" />";
		html += "<input type=\"button\" value=\"" + btn3Title + "\" id=\"popup" + depth + "Btn3\" />";
		html += "</div>";
		html += "</div>";
		
		$("body").prepend(html);
		
		if(contentsEvent != null) {
			contentsEvent.call();
		}
		
		$("#popup" + depth).css("z-index", depth * 120);
		$("#popup" + depth + "Bg").css("z-index", depth * 110);
		$("#popup" + depth).css("width", width + "px");
		$("#popup" + depth).css("height", height + "px");
		$("#popup" + depth).css("left", "calc(50% - " + (width / 2) + "px");
		$("#popup" + depth).css("top", "calc(50% - " + (height / 2) + "px");
		
		$("#popup" + depth).hide();
		
		$("#popup" + depth).fadeIn("fast");
		
		$("#popup" + depth + "Btn1").off("click");
		$("#popup" + depth + "Btn1").on("click", function(){
			if(btn1Event != null) {
				btn1Event.call();
			}
		});
		
		$("#popup" + depth + "Btn2").off("click");
		$("#popup" + depth + "Btn2").on("click", function(){
			if(btn2Event != null) {
				btn2Event.call();
			}
		});
		
		$("#popup" + depth + "Btn3").off("click");
		$("#popup" + depth + "Btn3").on("click", function(){
			if(btn3Event != null) {
				btn3Event.call();
			}
		});
		
		//if(bgFlag) {
			$("#popup" + depth + "Bg").off("click");
			$("#popup" + depth + "Bg").on("click", function(){
				closePopup(depth);
			});
		//}
	}
}

/**
 * makeBtn4Popup(depth, title, contents, bgFlag, width, height, contentsEvent, 
 *               btn1Title, btn1Event, btn2Title, btn2Event, btn3Title, btn3Event, btn4Title, btn4Event)
 * : 팝업 생성
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 * title - 제목
 * contents - 내용
 * bgFlag - 백그라운드 존재여부(true : 존재, flase : 비존재)
 * contentsEvent - 내용 추가이벤트(없을경우 null입력)
 * btn1Title - 버튼1 텍스트
 * btn1Event - 버튼1 추가이벤트(없을경우 null입력), 완료 후 팝업닫을 경우 closePopup(depth)호출
 * btn2Title - 버튼2 텍스트
 * btn2Event - 버튼2 추가이벤트(없을경우 null입력), 완료 후 팝업닫을 경우 closePopup(depth)호출
 * btn3Title - 버튼3 텍스트
 * btn3Event - 버튼3 추가이벤트(없을경우 null입력), 완료 후 팝업닫을 경우 closePopup(depth)호출
 */
function makeBtn4Popup(depth, title, contents, bgFlag, width, height, contentsEvent, 
						   btn1Title, btn1Event, btn2Title, btn2Event, btn3Title, btn3Event, btn4Title, btn4Event) {
	if(popupCheck(depth)) {
		//팝업 존재 시
	} else {
		var html = "";
		
		if(bgFlag) {
			html += "<div class=\"popup_bg\" id=\"popup" + depth + "Bg\"></div>";
		} else {
			html += "<div class=\"popup_bg_clear\" id=\"popup" + depth + "Bg\"></div>";
		}
		
		html += "<div class=\"popup\" id=\"popup" + depth + "\">";
		html += "<div class=\"popup_title\">";
		html += "<div class=\"popup_title_txt\">" + title + "</div>";
		html += "</div>";
		html += "<div class=\"popup_contents\">";
		html += contents;
		html += "</div>";
		html += "<div class=\"popup_btn\">";
		html += "<input type=\"button\" value=\"" + btn1Title + "\" id=\"popup" + depth + "Btn1\" />";
		html += "<input type=\"button\" value=\"" + btn2Title + "\" id=\"popup" + depth + "Btn2\" />";
		html += "<input type=\"button\" value=\"" + btn3Title + "\" id=\"popup" + depth + "Btn3\" />";
		html += "<input type=\"button\" value=\"" + btn4Title + "\" id=\"popup" + depth + "Btn4\" />";
		html += "</div>";
		html += "</div>";
		
		$("body").prepend(html);
		
		if(contentsEvent != null) {
			contentsEvent.call();
		}
		
		$("#popup" + depth).css("z-index", depth * 120);
		$("#popup" + depth + "Bg").css("z-index", depth * 110);
		$("#popup" + depth).css("width", width + "px");
		$("#popup" + depth).css("height", height + "px");
		$("#popup" + depth).css("left", "calc(50% - " + (width / 2) + "px");
		$("#popup" + depth).css("top", "calc(50% - " + (height / 2) + "px");
		
		$("#popup" + depth).hide();
		
		$("#popup" + depth).fadeIn("fast");
		
		$("#popup" + depth + "Btn1").off("click");
		$("#popup" + depth + "Btn1").on("click", function(){
			if(btn1Event != null) {
				btn1Event.call();
			}
		});
		
		$("#popup" + depth + "Btn2").off("click");
		$("#popup" + depth + "Btn2").on("click", function(){
			if(btn2Event != null) {
				btn2Event.call();
			}
		});
		
		$("#popup" + depth + "Btn3").off("click");
		$("#popup" + depth + "Btn3").on("click", function(){
			if(btn3Event != null) {
				btn3Event.call();
			}
		});
		
		$("#popup" + depth + "Btn4").off("click");
		$("#popup" + depth + "Btn4").on("click", function(){
			if(btn4Event != null) {
				btn4Event.call();
			}
		});
		
		//if(bgFlag) {
			$("#popup" + depth + "Bg").off("click");
			$("#popup" + depth + "Bg").on("click", function(){
				closePopup(depth);
			});
		//}
	}
}

/**
 * closePopup(depth)
 * : 팝업 닫기
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 */
function closePopup(depth) {
	$("#popup" + depth + "Bg").fadeOut("fast", function(){
		$("#popup" + depth + "Bg").remove();
	});
	
	$("#popup" + depth).fadeOut("fast", function(){
		$("#popup" + depth).remove();
	});
}

/**
 * popupCheck(depth)
 * : 팝업 존재여부
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 */
function popupCheck(depth) {
	if($("#popup" + depth).length > 0) {
		return true;
	} else {
		return false;
	}
}

 /**
  * popupContentsChange(depth, contents, contentsEvent)
  * : 팝업 존재여부
  * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
  * contents - 내용
  * contentsEvent - 내용 추가이벤트(없을경우 null입력)
  */
function popupContentsChange(depth, contents, contentsEvent) {
 	$("#popup" + depth + " .popup_contents").html(contents);
 	
 	if(contentsEvent != null) {
 		contentsEvent.call();
 	}
 }

 /**
  * popupBtnChange(depth, type, btnText, btnEvent)
  * : 팝업 존재여부
  * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
  * type - 버튼타입 (1 - 4번)
  * btnText - 버튼 텍스트
  * btnEvent - 버튼 변경 이벤트(없을경우 null입력)
  */
function popupBtnChange(depth, type, btnText, btnEvent) {
	$("#popup" + depth + "Btn" + type).val(btnText);
	
	if(btnEvent != null) {
		$("#popup" + depth + "Btn" + type).off("click");
		$("#popup" + depth + "Btn" + type).on("click", function(){
			if(btnEvent != null) {
				btnEvent.call();
			}
		});
	}
}