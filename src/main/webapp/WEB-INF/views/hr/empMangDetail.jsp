<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>

<style type="text/css">
/* 검색영역 가로변경 시 */
.default_search_area {
	width: 800px;
}

/* 목록영역 가로변경 시 */
.default_board {
	width: 800px;
}

/* 개별 css는 여기에 */
#updateBtn {
	display: inline-block;
	min-width: 80px;
	height: 32px;
	color: #000;
	background-color: #f7f7f7;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	cursor: pointer;
	margin-right: 10px;
	margin-left: 720px;
	padding : 1px 2px;
}

#deleteBtn:hover {
	color: #fff;
	background-color: #022859;
	border: 1px solid #022859;
}

#deleteBtn {
	display: inline-block;
	min-width: 80px;
	height: 32px;
	color: #000;
	background-color: #f7f7f7;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	cursor: pointer;
	margin-right: 10px;
	padding : 1px 2px;
}

#updateBtn:hover {
	color: #fff;
	background-color: #022859;
	border: 1px solid #022859;
}

table {
	margin-top: 20px;
	font-size: 14px;
	text-align: center;
}

table tr {
	height: 43px;
	font-size: 10pt;
	border-top: 1px solid #9aa9bd;
	
}

.table_name {
	font-size: 16px;
	font-weight: bold;
	background-color: #e4eaf2;

}

#listBtn:hover {
	color: #fff;
	background-color: #022859;
	border: 1px solid #022859;
}

#listBtn {
	display: inline-block;
	min-width: 80px;
	height: 32px;
	color: #000;
	background-color: #f7f7f7;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	cursor: pointer;
	margin-right: 10px;
	padding : 1px 2px;
}


.familyrelt {
	font-size: 13pt;
}
</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->

<script type="text/javascript">
	$(document).ready(function() {
		$("#listBtn").on("click", function() {
			$("#actionForm").attr("action", "empMang");
			$("#actionForm").submit();
		});
		
		$("#updateBtn").on("click", function() {
			$("#actionForm").attr("action", "empMangUpdate");
			$("#actionForm").submit();
		});
		
		$("#deleteBtn").on("click", function() {
			if(confirm("삭제하시겠습니까?")) {
				$("#actionForm").attr("action", "empMangDelete");
				
				var params = $("#actionForm").serialize(); 
				
				$.ajax({
				        type : "post",
				        url : "empMangDeleteAjax",
				        dataType : "json",
				        data : params, 
				        success : function(res) {
				        	if(res.res == "SUCCESS"){
				        		
				        		$("#actionForm").attr("action", "empMang");
				        		$("#actionForm").submit();
				        		
				        } else {
				        	$("#alert").attr("title", "알림");
				        	$("#alert p").html("저장에 실패하였습니다.");
				        	$("#alert").dialog({
				        		buttons: {
				        			OK: function() {
				        				$(this).dialog("close");
				        			}
				        		}
				        	});
				        }
	
				        },
				        error : function(req,status,error) {
				           console.log("code : " + req.status);
				           console.log("message : " + req.responseText);
						}
				}); 
				
				
				
			}
		});
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
		<div class="contents_header_txt">사원등록 상세보기</div>
	</div>
	
	
	
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 메뉴시작 -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="actionForm" method="post">
		<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
            <input type="hidden" name="emp_no" id="emp_no" value="${param.emp_no}" />
			<input type="hidden" name="page" id="page" value="${param.page}" />
			<input type="button" value="수정" id="updateBtn" />
			<input type="button" value="삭제" id="deleteBtn" />
			<input type="button" value="목록" id="listBtn" />
		</form>
		<!-- 메뉴 끝 -->
		<!-- 목록 시작 -->
		<div >
		<table>
			<colgroup>
				<col width="150px"/>
				<col width="150px"/>
				<col width="150px"/>	
				<col width="150px"/>
				<col width="150px"/>
			</colgroup>
			<tbody>
				<tr>
					<td class="table_name">성명</td>
					<td>${empMang.EMP_NM}</td>
					<td class="table_name">생년월일</td>
					<td>${empMang.BIRTH}</td>
					<td class="table_name">성별</td>
					<td>${empMang.SEX_CODE}</td>
				</tr>
				<tr>
					<td class="table_name">사원번호</td>
					<td>${empMang.EMP_NO}</td>
					<td class="table_name">내/외국인</td>
					<td>${empMang.LOCAL_CODE}</td>					
				</tr>
				<tr>	
					<td class="table_name">우편번호</td>
					<td>${empMang.POST_NO}</td>
					<td class="table_name">전화번호</td>
					<td>${empMang.TEL_NO}</td>
				</tr>
				<tr>	
					<td class="table_name">주소</td>
					<td>${empMang.ADDR}</td>
					<td class="table_name">H.P</td>
					<td>${empMang.CELL_NO}</td>
				</tr>
				<tr>	
					<td class="table_name">상세주소</td>
					<td>${empMang.DETL_ADDR}</td>
					<td class="table_name">이메일</td>
					<td>${empMang.EMAIL}</td>
				</tr>				
			</tbody>
		</table>
		
			<table class="empMang">
				<colgroup>
					<col width="100px">
					<col width="100px">
					<col width="100px">
					<col width="100px">
					<col width="100px">
					<col width="100px">
				</colgroup>
				<tbody>
				
				<td class="familyrelt">은행</td>			
				
				<tr>
					<td class="table_name">은행명</td>
                    <td>${empMang.BANK_NM}</td>
				
					<td class="table_name">예금주</td>
                    <td>${empMang.ACNT_NM}</td>
					<td class="table_name">계좌명</td>
                    <td>${empMang.ACNT_NO}</td>
                </tr>
                
                <tr>
                </tr>
                
				<td class="familyrelt">경력사항</td>				
				
				<tr>
					<td class="table_name">회사명</td>
					<td>${empMang.COMPANY_NM}</td>
					<td class="table_name">담당업무</td>
					<td>${empMang.CHAG_TASK}</td>
					<td class="table_name">직급</td>
					<td>${empMang.POSN_NM}</td>
				</tr>
				
				<tr>
					<td class="table_name">업종분류</td>
					<td>${empMang.SECTORS_NO}</td>
				</tr>
				
				<tr>
					<td class="table_name">고용형태</td>
					<td>${empMang.EMPLOY_CODE}</td>
				</tr>

				<tr>
					<td class="table_name">시작일</td>
					<td>${empMang.START_DATE}</td>
					<td class="table_name">종료일</td>
					<td>${empMang.END_DATE}</td>					
				</tr>

				<tr>
				</tr>
				
			    <td class="familyrelt">자격증</td>				
				
				<tr>
					<td class="table_name">자격증명</td>
					<td>${empMang.CERT_NM}</td>
				
					<td class="table_name">발행처/기관</td>
					<td>${empMang.ISUD_AGNC}</td>
				
					<td class="table_name">취득/발급일</td>
					<td>${empMang.ISUD_DATE}</td>
				</tr>

			</tbody>
		</table>
		<table>
			
			<colgroup>
				<col width="70px"/>
				<col width="70px"/>
				<col width="70px"/>
				<col width="70px"/>
				<col width="70px"/>
			</colgroup>
			
			<td class="familyrelt">가족관계</td>
			
			<tr>
				<td class="table_name">관계</td>
				<td>${empMang.RELT_CODE}</td>

				<td class="table_name">성명</td>
				<td>${empMang.NM}</td>

				<td class="table_name">생년월일</td>
				<td>${empMang.BIRTH}</td>
			</tr>
			<tr>

				<td class="table_name">직업</td>
				<td>${empMang.JOB}</td>

				<td class="table_name">동거여부</td>
				<td>
				<c:if test="${empMang.COHB_WHET} eq 0"></c:if>
					동거
				</td>

			</tr>
			
			
		</table>
			<div class="page_wrap">
				<div class="page_nation"></div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>