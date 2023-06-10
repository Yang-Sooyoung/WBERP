/**
 * main.js
 */

$(document).ready(function() {
	$(".contents").slimScroll({
		height: "100%"
	});
	
	getLeftMenu();
	
	//Logout Button
	$(".logout_btn").on("click", function() {
		location.href = "logout";
	});
	
	//Logo Event
	$(".logo").on("click", function() {
		$("#top").val(1);
		
		$("#menuNo").val(12);
		
		$("#locationForm").attr("action", "gwSchDetail");
		
		$("#locationForm").submit();
	});
	
	//Left Menu Location Event
	$(".left_area").on("click", ".menu2_txt, .menu3_txt", function() {
		if($(this).parent().is("[addr]")) {
			$("#menuNo").val($(this).parent().attr("menuno"));
			
			$("#locationForm").attr("action", $(this).parent().attr("addr"));
			
			$("#locationForm").submit();
		} else {
			$(".menu2_wrap_on").attr("class", "menu2_wrap");
			
			$(this).parent().parent().attr("class", "menu2_wrap_on");
		}
	});
	
	//Top Menu Location Event
	$(".top_menu_area").on("click", ".top_menu", function() {
		$("#top").val($(this).attr("topno"));
		
		$("#menuNo").val($(this).attr("menuno"));
		
		$("#locationForm").attr("action", $(this).attr("addr"));
		
		$("#locationForm").submit();
	});
});

function getLeftMenu() {
	var params = $("#locationForm").serialize();
	
	$.ajax({
		type : "post",
		url : "leftMenuAjax",
		dataType : "json",
		data : params,
		success : function(result) {
			drawLeftMenu(result.leftMenu);			
		},
		error : function(request, status, error) {
			console.log("status : " + request.status);
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

function drawLeftMenu(menu) {
	var secDepthCheck = false;
	var html = "";
	
	for(var i = 0 ; i < menu.length ; i++) {
		if(menu[i].MENU_DEPTH == 1) {
			html += "<div class=\"menu1_title\" menuno=\"" + menu[i].MENU_NO + "\" addr=\"" + menu[i].MENU_ADDR + "\">";
			html += "<div class=\"menu1_txt\">" + menu[i].MENU_NM + "</div>";
			html += "</div>";
		} else if(menu[i].MENU_DEPTH == 2) {
			if(menu[i].CNT == 0) { // 하위메뉴 없을 시
				if(menu[i].MENU_NO == $("#menuNo").val()) {
					html += "<div class=\"menu2_wrap_on\">";
				} else {
					html += "<div class=\"menu2_wrap\">";
				}
				html += "<div class=\"menu2_title\" menuno=\"" + menu[i].MENU_NO + "\" addr=\"" + menu[i].MENU_ADDR + "\">";
				html += "<div class=\"menu2_txt\">" + menu[i].MENU_NM + "</div>";
				html += "</div>";
				html += "</div>";
			} else {
				html += "<div class=\"menu2_wrap\" menuno=\"" + menu[i].MENU_NO + "\">";
				html += "<div class=\"menu2_title\">";
				html += "<div class=\"menu2_txt\">" + menu[i].MENU_NM + "</div>";
				html += "</div>";
				html += "<div class=\"menu3_wrap\">";
				for(var j = 0 ; j < menu.length ; j++) {
					if(menu[i].MENU_NO == menu[j].HMENU_NO) {
						if(menu[j].MENU_NO == $("#menuNo").val()) { //현재 메뉴 구분
							secDepthCheck = true;
							html += "<div class=\"menu3_title_on\" menuno=\"" + menu[j].MENU_NO + "\" addr=\"" + menu[j].MENU_ADDR + "\">";
						} else {
							html += "<div class=\"menu3_title\" menuno=\"" + menu[j].MENU_NO + "\" addr=\"" + menu[j].MENU_ADDR + "\">";
						}
						
						html += "<div class=\"menu3_txt\">" + menu[j].MENU_NM + "</div>";
						html += "</div>";
					}
				}
				html += "</div>";
				html += "</div>";
			}
		}
	} // menu for end
	$(".left_area").html(html);

	var flow = [];
	
	for(var i = 0 ; i < menu.length ; i++) {
		if(menu[i].MENU_NO == $("#menuNo").val()) {
			flow = menu[i].MENU_FLOW.split(",");
			
			if(secDepthCheck) {
				$("[menuno='" + menu[i].HMENU_NO + "']").attr("class", "menu2_wrap_on");
			}
			break;
		}
	}
	
	var gnb = "Home";
	for(var i = 0 ; i < menu.length ; i++) {
		for(var j = 0 ; j < flow.length ; j++) {
			if(menu[i].MENU_NO == flow[j]) {
				gnb += " > " + menu[i].MENU_NM;
			}
		}
	}
	
	$(".gnb_txt").html(gnb);
}