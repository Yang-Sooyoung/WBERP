<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/header"></c:import>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function () {
	if("${res}" == "success") {
		
		$("#actionForm").submit();
	} else {
		alert("삭제중 문제가 발생하였습니다.");
		history.back();
	}
});

</script>
		
</head>
<body>
<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNo">${param.menuNo}</c:param>
	</c:import>
<form action="dasbMang" id="actionForm" method="post">
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
</form>
<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>