<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 허용되지 않은 접속</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<script type="text/javascript">
$(document).ready(function() {
	makeBtn1Popup(1, "알림", "접근이 허용되지 않은 경로입니다.", true, 400, 200,
	function() {
		setTimeout(function() {
			$("#locationForm").submit();
		}, 3000);
	}, "확인", function() {
		$("#locationForm").submit();
	});
});
</script>
</head>
<body>
<form action="gwSchDetail" id="locationForm" method="post">
	<input type="hidden" id="top" name="top" value="1" />
	<input type="hidden" id="menuNo" name="menuNo" value="12" />
</form>
</body>
</html>