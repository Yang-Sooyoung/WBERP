<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업은행 WBERP 로그인</title>
<!-- 팝업 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<style type="text/css">
.big_login_area {
	height: 800px;
	text-align:center;
}

.login_blank{
	height: 130px;
}

.login_title {
	height: 50px;
	font-weight: bold;
	font-size : 25pt;
	margin-top: 10px;
	
}
.login_footer{
	height: 100px;
	font-weight: bold;
	font-size : 25pt;
	/* background-color:green; */
	margin-top : 30px;
}
.login_footer > div{
	display : inline-table;
	width : 300px;
	height : 50px;
	background-color : #022859;
	color: #F2F2F2;
	font-size:15pt;
	border-radius:5px;
}

.login_footer > div > div {
	display: table-cell;
	width: 300px;
	height: 50px;
	vertical-align: middle;
}

.login_footer > div:hover {
   background-color: #004c9d;
   color: #F2F2F2;
   cursor : pointer;
   border : none;
}
.login_id{
	width:300px;
	height: 50px;
	font-size:15pt;
	border-radius:5px;
	border : 2px solid #ccc;
	margin-top : 20px;
	padding-left : 10px;
}
.login_pw{
	width:300px;
	height: 50px;
	font-size:15pt;
	margin-top:10px;
	border-radius:5px;
	border : 2px solid #ccc;
	padding-left : 10px;
}
.login_id:focus{
	border: 2px solid #004c9d;
    box-shadow: none;
    outline: none;
}
.login_pw:focus{
	border: 2px solid #004c9d;
    box-shadow: none;
    outline: none;
}
.login_title  > span {
	color: #004c9d;
}
.login_title > img {
	width: 30px;
	height: 30px;
	vertical-align: middle;
}
</style>
<!-- jQuery js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- 팝업 js 파일 -->
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<!-- Util js 파일 -->
<script type="text/javascript" src="resources/script/common/util.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	if('${sEmpNo}' != '') {
		$("#locationForm").submit();
	}
	
	$(".login_footer > div").on("click", function() {
		if(checkEmpty(".login_id")) {
			makeAlert(1, "로그인 안내", "이메일을 입력해 주세요.", function() {
				$(".login_id").focus();
			});
		} else if(checkEmpty(".login_pw")) {
			makeAlert(1, "로그인 안내", "비밀번호를 입력해 주세요.", function() {
				$(".login_pw").focus();
			});
		} else {
			var params = $("#loginForm").serialize();
			
			$.ajax({
				type : "post",
				url : "loginAjax",
				dataType : "json",
				data : params,
				success : function(result) {
					if(result.res == "SUCCESS") {
						$("#locationForm").submit();
					} else if(result.res == "FAILED") {
						makeAlert(1, "로그인 실패", "아이디나 비밀번호가 틀렸습니다.", null);
					} else {
						makeAlert(1, "로그인 경고", "로그인 체크 중 문제가 발생하였습니다.", null);
					}
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}
			});
		}
	});
	
	$(".big_login_area").on("keypress", "input", function(event) {
		if(event.keyCode == 13) {
			$(".login_footer").click();
			return false;
		}
	});
});
</script>
</head>
<body>
<body>
	<form action="Sample" id="locationForm" method="post">
		<input type="hidden" id="top" name="top" value="1" />
		<input type="hidden" id="menuNo" name="menuNo" value="12" />
	</form>
	<div class="big_login_area">
		<div class="login_blank"></div>
		<div class="login_title">
			<img src="resources/images/common/ibk_logo.png"> <span>기업은행</span> WBERP
		</div>
		<form action="#" id="loginForm" method="post">
			<input type="text" class="login_id" name="id" placeholder="이메일" /> <br />
			<input type="password" class="login_pw" name="pw" placeholder="비밀번호" /> <br />
		</form>
		<div class="login_footer">
			<div><div>로그인</div></div>
		</div>
	</div>
</body>
</body>
</html>