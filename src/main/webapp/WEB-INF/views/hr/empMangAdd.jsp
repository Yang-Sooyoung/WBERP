<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록</title>

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
#addBtn {
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

#cancelBtn:hover {
	color: #fff;
	background-color: #022859;
	border: 1px solid #022859;
}

#cancelBtn {
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

#addBtn:hover {
	color: #fff;
	background-color: #022859;
	border: 1px solid #022859;
}

#ponuBtn{
	display: inline-block;
	min-width: 80px;
	height: 32px;
	color: #000;
	background-color: #f7f7f7;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	cursor: pointer;

}
#ponuBtn:hover {
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

th{
	font-size: 17px;
}


</style>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" >


    
	$(document).ready(function() {


		$("#ponuBtn").on("click", function() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            $("#posttxt").val(data.address);
		        }
		    }).open();
		});
		
		$("#cancelBtn").on("click", function() {
			$("#actionForm").attr("action", "empMang");
			$("#actionForm").submit();
		});
		
				
				$.ajax({
				        type : "post",
				        url : "empMangAddAjax",
				        dataType : "json",
				        data : params, 
				        success : function(res) {
				        	if(res.res == "SUCCESS"){
				        		
				        		$("#actionForm").attr("action", "empMang");
				        		$("#actionForm").submit();
				        		
				        } else {
				        	$("#alert").attr("title", "알림");
				        	$("#alert p").html("등록에 실패하였습니다.");
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
			<input type="button" value="등록하기" id="addBtn" />
			<input type="button" value="취소" id="cancelBtn" />
		</form>
		<!-- 메뉴 끝 -->
		<!-- 목록 시작 -->
		<div >
		<table>
					<colgroup>
				<col width="100px"/>
				<col width="100px"/>
				<col width="100px"/>	
				<col width="100px"/>
				<col width="100px"/>
			</colgroup>
			<tbody>
				<tr>
					<td class="table_name">성명</td>
					<td><input type="text" style="height:34px;"></td>
					<td></td>
					<td class="table_name">생년월일</td>
                    <td><input id="birth" type="date" style="height: 38px;
                    						width:176px;"></td>
                    <td style="padding-right: 100px;">
                    
      <label><input type="checkbox" value="남">남</label>
      <label><input type="checkbox" value="여">여</label>
                    
                    </td>
				<tr>
					<td class="table_name">사원번호</td>
					<td><input type="text" style="height:34px;"></td>
					<td></td>
					<td class="table_name">내/외국인</td>
					<td><select name="local" style="height: 38px;
                    						width:176px;">
				    <option value="">내/외국인</option>
				    <option value="내국인">내국인</option>
				    <option value="외국인">외국인</option>
				</select></td>					
				</tr>
				<tr>	
					<td class="table_name">우편번호</td>
					<td><input type="text" id="posttxt" style="height:34px;"></td>
					<td><input type="button" value="우편번호찾기" id="ponuBtn" style="height:40px;" /></td>
					<td class="table_name">전화번호</td>
					<td><input type="text" style="height:34px;"></td>
				</tr>
				<tr>	
					<td class="table_name">주소</td>
					<td><input type="text" style="height:34px;"></td>
					<td></td>
					<td class="table_name">H.P</td>
					<td><input type="text" style="height:34px;"></td>
				</tr>
				<tr>	
					<td class="table_name">상세주소</td>
					<td><input type="text" style="height:34px;"></td>
					<td></td>
					<td class="table_name">이메일</td>
				<td><input type="text" style="height:34px;"></td>
				<td><select name="email" style="height: 38px;
                    						width:176px;">
				    <option value="">이메일입력</option>
				    <option value="@naver.com">@naver.com</option>
				    <option value="@nate.com">@nate.com</option>
				    <option value="@daum.com">@daum.com</option>
				    <option value="@gmail.com">@gmail.com</option>
				</select></td>
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

				<th>은행</th>			

				<tr>
					<td class="table_name">은행명</td>
                    <td><select name="bank" style="height: 38px;
                    						width:176px;">
				    <option value="">은행선택</option>
				    <option value="기업은행">기업은행</option>
				    <option value="신한은행">신한은행</option>
				    <option value="하나은행">하나은행</option>
				    <option value="카카오뱅크">카카오뱅크</option>
				    <option value="우리은행">우리은행</option>
				    <option value="신협은행">신협은행</option>
				</select></td>
				</tr>
				<tr>
					<td class="table_name">예금주</td>
                    <td><input type="text" style="height:34px;"></td>
					<td class="table_name">계좌명</td>
                    <td><input type="text" style="height:34px;"></td>
                </tr>
                
                <tr>
                </tr>
                
				<th>경력사항</th>				
				
				<tr>
					<td class="table_name">회사명</td>
					<td><input type="text" style="height:34px;"></td>
					<td class="table_name">담당업무</td>
					<td><input type="text" style="height:34px;"></td>
					<td class="table_name">직급</td>
					<td><input type="text" style="height:34px;"></td>
				</tr>
				
				<tr>
					<td class="table_name">업종분류</td>
					<td></td>
				</tr>
				
				<tr>
					<td class="table_name">고용형태</td>
					<td><select name="employ" style="height: 38px;
                    						width:176px;">
				    <option value="">고용형태</option>
				    <option value="계약직">계약직</option>
				    <option value="정직원">정직원</option>
				</select></td>
				</tr>

				<tr>
					<td class="table_name">시작일</td>
					<td><input id="start_day" type="date" style="height: 38px;
                    						width:176px;"></td>
					<td class="table_name">종료일</td>
					<td><input id="end_day" type="date" style="height: 38px;
                    						width:176px;"></td>					
				</tr>

			    <th>자격증</th>				
				
				<tr>
					<td class="table_name">자격증명</td>
					<td><input type="text" style="height:34px;"></td>
				</tr>

				<tr>
					<td class="table_name">발행처/기관</td>
					<td><input type="text" style="height:34px;"></td>
				</tr>

				<tr>
					<td class="table_name">취득/발급일</td>
					<td><input id="certificate" type="date" style="height: 38px;
                    						width:176px;"></td>
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
			
			<th>가족관계</th>
			
			
			<tr>
				<td class="table_name">관계</td>
				<td><select name="family" style="height: 38px;
                    						width:176px;">
				    <option value="">관계</option>
				    <option value="부">부</option>
				    <option value="모">모</option>
				    <option value="형제">형제</option>
				</select></td>

				<td class="table_name">성명</td>
				<td><input type="text" style="height:34px;"></td>

				<td class="table_name">생년월일</td>
				<td><input id="birth" type="date" style="height: 38px;
                    						width:176px;"></td>

				<td class="table_name">직업</td>
				<td><input type="text" style="height:34px;"></td>

				<td class="table_name">동거여부</td>
				<td><select name="family" style="height: 38px;
                    						width:176px;">
				    <option value="">동거여부</option>
				    <option value="동거">동거</option>
				    <option value="비동거">비동거</option>
				</select></td>
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