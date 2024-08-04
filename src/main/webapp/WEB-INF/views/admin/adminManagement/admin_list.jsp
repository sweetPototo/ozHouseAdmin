<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../admin_management_top.jsp" %>
<%@ include file="admin_top.jsp" %>
<head>
<meta charset="UTF-8">
<title>관리자 목록</title>
<link rel="stylesheet" type="text/css" href="resources/css/coupon_style.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {  //html화면이 열리면 function함수가 동작 준비를 함 =>$(document).ready(function(){});과 같
    $( "#startDate" ).datepicker({
    	changeMonth: true,
    	changeYear: true,
    	nextText: '다음 달',
    	prevText: '이전 달',
    	dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
    	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	dateFormat: "y/mm/dd",
    	maxDate: 0, //선택 가능한 최소날짜, 0: 오늘 이후 선택 불가
    	onClose: function( selectedDate ) {                          
    		//시작일(startDate) datepicker가 닫힐때                      
    		//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정                     
    		$("#endDate").datepicker( "option", "minDate", selectedDate );                 
    	}	
    });
  } );
  $( function() {
    $( "#endDate" ).datepicker({
    	changeMonth: true,
    	changeYear: true,
    	nextText: '다음 달',
    	prevText: '이전 달',
    	dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
    	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	dateFormat: "y/mm/dd",
    	maxDate: 0, //선택 가능한 최소날짜, 0: 오늘 이후 선택 불가
    	onClose: function( selectedDate ) {                          
    		//시작일(startDate) datepicker가 닫힐때                      
    		//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정                     
    		$("#endDate").datepicker( "option", "maxDate", selectedDate );                 
    	}
    });
  } );
  
  function check(admin_num){
	  if(window.confirm("삭제하시면 복구가 불가능합니다. 정말로 삭제하시겠습니까?")){
			location.href = 
				"admin_delete.do?admin_num="+ admin_num;
		}
  }
  </script>
  <style>
  .flex-cell {
    flex: 1;
    padding: 8px;
    font-size: 20px;
    align-items: center;
}
  </style>
</head>
<body>
<div class="container">
	<div class="content-container">
	<h1 class="board-header">관리자 목록</h1>
		<%-- <form name="f" action="admin_listSearch.do" method="post" class="flex-container">
		   <div class="flex-row">
		       <div class="flex-cell header-cell">가입일</div>
		       <div class="flex-cell input-cell">
		           <input type="text" id="startDate" name="startDate" value="${map.startDate}"> ~
		           <input type="text" id="endDate" name="endDate" value="${map.endDate}">
		       </div>
		   </div>
		   <div class="flex-row">
		       <div class="flex-cell header-cell">검색</div>
		           		<div class="flex-cell">
		           <select name="search">
		               ${setting}
		           </select>
		           <input type="text" name="searchString" value="${map.searchString}">
		       </div>
		   </div>
		   <div class="flex-row">
		        <div class="flex-cell button-cell" colspan="2">
		        	<input type="submit" value="검색">
		            <input type="button" value="초기화" onclick="resetForm();">
		        </div>
		    </div>
		</form> 
			<br>
		    <div align="left" class="results-heading">
		        <font size="3">검색 결과</font>
		    </div>--%>
		<c:set var="count" value="1"/>
			<div class="scroll flex-container content-table">
		        <div class="flex-row header-row">
		        <div class="flex-cell">순번</div>
		        <div class="flex-cell">관리자번호</div>
		        <div class="flex-cell">관리자ID</div>
		        <div class="flex-cell">E-mail</div>
		        <div class="flex-cell">가입일</div>
		        <div class="flex-cell">삭제</div>
		    </div>
			<c:if test="${empty admin}">
				<div class="flex-row" align="center">
		       		<div class="flex-cell" colspan="7">조회결과가 없습니다.</div>
				</div>
			</c:if>
			<c:forEach var="dto" items="${admin}">
				<div class="flex-row" align="center">	
					 <div class="flex-cell">${count}</div>
					 <div class="flex-cell">${dto.admin_num}</div>
					 <div class="flex-cell">${dto.admin_id}</div>
					 <div class="flex-cell">${dto.admin_email}</div>
					 <div class="flex-cell">${dto.admin_joindate}</div>
					 <div class="flex-cell">
            <button onclick="check(${dto.admin_num});" class="delete-button">삭제</button>
					 </div>
				</div>
			<c:set var="count" value="${count+1}"/>
			</c:forEach>	
		</div>
	</div>
</div>
</body>