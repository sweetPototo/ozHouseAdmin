<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../admin_management_top.jsp" %>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
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
  
  function resetForm(){
		 document.f.startDate.value = null;
		 document.f.endDate.value = null;
		 document.f.searchString.value = null;
 }
  </script>
  
</head>
<body>
<div class="container">
	<div class="content-container">
	    <h1>회원목록</h1>
	    <div class="status-container">
    <div class="status-item">
		<div>전체 회원 수</div><br>
		<div class="status-count">${allCount}</div>
		</div>
		</div>
		<br>
		<form name="f" action="member_listSearch.do" method="post" class="flex-container">
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
		    <div class="flex-subrow custom-button-row">
   				<div class="button-container">
		        	<input type="submit" value="검색">
		            <input type="button" value="초기화" onclick="resetForm();">
		        </div>
		    </div>
		</form>
			<br>
		    <div align="left" class="results-heading">
		        <font size="3">검색 결과</font>
		    </div>
		<c:set var="count" value="1"/>
			<div class="scroll flex-container content-table">
		        <div class="flex-row header-row">
		        <div class="flex-cell">순번</div>
		        <div class="flex-cell">회원번호</div>
		        <div class="flex-cell">회원ID</div>
		        <div class="flex-cell">회원이름</div>
		        <div class="flex-cell">닉네임</div>
		        <div class="flex-cell">회원등급</div>
		        <div class="flex-cell">가입일</div>
		    </div>
			<c:if test="${empty member}">
				<div class="flex-row">
		       		<div class="flex-cell" colspan="7">조회결과가 없습니다.</div>
				</div>
			</c:if>
			<c:forEach var="dto" items="${member}">
				<div class="flex-row" align="center">	
					 <div class="flex-cell">${count}</div>
					 <div class="flex-cell">${dto.member_num}</div>
					 <div class="flex-cell">${dto.member_id}</div>
					 <div class="flex-cell">
					 	<a href="memberAdmin_detail.do?member_num=${dto.member_num}">
					 	${dto.member_name}
					 	</a>
					 </div>
					 <div class="flex-cell">${dto.member_nickname}</div>
					 <div class="flex-cell">
						${dto.member_level}
					</div>
					 <div class="flex-cell">${dto.member_joindate}</div>
				</div>
			<c:set var="count" value="${count+1}"/>
			</c:forEach>	
		</div>
	</div>
</div>
</body>