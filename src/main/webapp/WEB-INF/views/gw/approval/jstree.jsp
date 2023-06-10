d<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/header"></c:import>
<link rel="stylesheet" href="resources/css/jstree/themes/default/style.min.css" />
<script type="text/javascript" src="resources/script/jquery/jstree.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
$('#tree').jstree({ 
  'core' : {
    'data' : [
      { "id" : "ajson1", "parent" : "#", "text" : "Simple root node" },
      { "id" : "ajson2", "parent" : "#", "text" : "Root node 2" },
      { "id" : "ajson3", "parent" : "ajson2", "text" : "Child 1" },
      { "id" : "ajson4", "parent" : "ajson2", "text" : "Child 2" },
    ]
  }
});
$('#tree').jstree({ //드래그앤드롭
	  'core' : {
	    'data' : [
	      { "id" : "ajson1", "parent" : "#", "text" : "Simple root node" },
	      { "id" : "ajson2", "parent" : "#", "text" : "Root node 2" },
	      { "id" : "ajson3", "parent" : "ajson2", "text" : "Child 1" },
	      { "id" : "ajson4", "parent" : "ajson2", "text" : "Child 2" },
	    ],
	    "check_callback" : true
	  },
	  "plugins" : ["dnd"]
	});
$('#tree').jstree({ 	//우클릭
    'core' : {
      'data' : [
        { "id" : "ajson1", "parent" : "#", "text" : "Simple root node" },
        { "id" : "ajson2", "parent" : "#", "text" : "Root node 2" },
        { "id" : "ajson3", "parent" : "ajson2", "text" : "Child 1" },
        { "id" : "ajson4", "parent" : "ajson2", "text" : "Child 2" },
      ],
      "check_callback" : true
    },
    'plugins' : ["contextmenu"]
  });
$('#tree').jstree({ 	//검색
	'core' : { 
		'data' : [
			{ "id" : "ajson1", "parent" : "#", "text" : "Simple root node" }, 
			{ "id" : "ajson2", "parent" : "#", "text" : "Root node 2" }, 
			{ "id" : "ajson3", "parent" : "ajson2", "text" : "Child 1" }, 
			{ "id" : "ajson4", "parent" : "ajson2", "text" : "Child 2" }, ] }, 
			'plugins' : ["search"], });

/* 
{
	  id : "string"    // node id로 사용되는데 필수값이다.
	  text  : "string"    // node text로 트리에서 node명 같은것이다.
	  icon : "string"    // node 좌측에 아이콘이 존재하는데 custom 아이콘 사용이다.
	  state : {
	    opened : boolean    // is the node open
	    disabled : boolean   // is the node disabled
	    selected : boolean    // is the node selected
	  },
	  children : []   // 자식 요소를 집어넣는 곳이다.
	  li_attr : {}    // attributes for the generated LI node
	  a_attr : {}    // attributes for the generated A node
	}

 */
});

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
		<div class="contents_header_txt">영업리스트</div>
	</div>
	<div class="contents">
		<div id="tree">
		
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>