<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>대시보드관리</title>
<style type="text/css">
/* 개별 css는 여기에 */

.search_area{
	display: inline-block;
	width: 1100px;
	height: 32px;
} 
.search{
	width: 200px;
	height: 28px;
	font-size: 14px;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	margin: 0 3px;
	padding: 1px 2px;
	outline: none;
	vertical-align: top;
}
.search_button{
	width: 32px;
	height: 32px;
	border: 0px;
	border-radius: 3px;
	vertical-align: top;
	outline: none;
	cursor: pointer;
}
.filter{
	background-color: #f7f7f7;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	font-size: 14px;
	width: 70px;
	height: 32px;
	margin: 0 3px;
	padding: 1px 2px;
	outline: none;
	vertical-align: top;
}

tr td{
	border-bottom: 1px solid #c2c2c2;
}

.button_area{
	display: inline-block;
	width: 300px;
	height: 32px;
	float: right;
}

.page_button_area{
	display: inline-block;
	width: 1100px;
	height: 30px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
}


.dasb_area{
	display: inline-block;
	width: 100%;
	height: 700px;
	background-color: #eaeaea;
}

.dasb_set_area, .widg_set_area{
	display: inline-block;
	width: calc(100% - 40px);
	height: 40px;
	margin-top: 20px;
	margin-left: 20px;
	/* background-color: white; */
}

.dasb_selc{
	display: inline-block;
	margin-top: 5px;
	margin-left: 5px;
	border: 0px;
	background-color: #eaeaea;
	font-size: 20px;
	font-weight: bold;
}

.dasb_set_name, .widg_set_name{
	display:inline-block;
	font-size: 15px;
	border: 1px solid ;
	margin-left: 5px;
}

.dasb_set_btn_area, .widg_set_btn_area{
	display: inline-block;
	margin-left: 5px;
}

.dash_add_btn{
	display: inline-block;
	margin-left: 5px;
}

.widg_state{
	display: inline-block;
	font-size: 15px;
	
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
	reloadList();
	
	function reloadList(){
		var params = $("#sampleForm").serialize();
		
		$.ajax({
			type : "post",
			url : "adasbListAjax",
			dataType : "json",
			data : params,
			success: function(res){
				drawList(res.list, res.cnt);
				drawPaging(res.pb);
			},
			error : function(req, status, error){
				console.log("code : " + req.status);
				console.log("message : " + req.responseText);
			}
		});
	}
	
	function drawList(list, cnt){
		var html = "";
		
		if(cnt == 0){
			html += "<tr>";
			html += "<td colspan=\"5\">데이터가 없습니다.</td>";
			html += "</tr>";
		}else{
			for(var i = 0; i < list.length; i++){
				html += "<tr name=\"" + list[i].REQS_NO + "\">";
				html += "<td>" + list[i].REQS_NO + "</td>";
				html += "<td>" + list[i].REQS_TITLE + "</td>";
				html += "<td>" + list[i].EMP_NM + "</td>";
				html += "<td>" + list[i].REQS_DATE + "</td>";
				html += "<td>" + list[i].PROC_CODE + "</td>";
				html += "</tr>";
			}
		}
		
		$(".request_area tbody").html(html);
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
		<div class="contents_header_txt">대시보드관리</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="sampleForm" method="post">
		<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
	
		</form>
		
		<div class="dasb_area">
			<div class="dasb_set_area">
				<div class="dasb_set_name">대시보드</div>
				
				<select class="dasb_selc">
					<option>영업팀 대시보드</option>
					<option>재무 대시보드</option>
					 
				</select>
				
				<div class="dasb_set_btn_area">
					<input type="button" class="dash_up_btn" value="수정" id="dasb_updateBtn">
					<input type="button" class="dash_add_btn" value="추가" id="dasb_addBtn">
				</div>
				
				
			</div>
			
			<div class="widg_set_area">
				<div class="widg_set_name">위젯</div>
				
				<div class="widg_state">
					등록된 위젯 
				</div>
				
				<div class="widg_set_btn_area">
					<input type="button" class="widg_settingbtn" value="설정" id="widg_settingBtn">
					
				</div>
				
				
			</div>
			
			
		</div>
		
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>