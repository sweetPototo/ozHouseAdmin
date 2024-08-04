<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../admin_management_top.jsp" %>
<%@ include file="../../store_top.jsp" %>
<%@ include file="storeList_top.jsp" %>
<head>
<title>상점목록</title>
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
  </script>
</head>
<body>
<c:if test="${like eq 'all'}">
	<h1>전체상점목록</h1>
</c:if>
<c:if test="${like eq 'applicate'}">
	<h1>입점신청상점목록</h1>
</c:if>
<c:if test="${like eq 'complete'}">
	<h1>입점완료상점목록</h1>
</c:if>
<c:if test="${like eq 'delete'}">
	<h1>사용중지상점목록</h1>
</c:if>
<div class="container">
	<div class="content-container">
<h1>상점 승인 현황</h1>

	<div class="status-container">
    <div class="status-item">
    <div>전체상점</div><br>
    <div class="status-count">${allStoreCount}</div>
    </div>
    <div class="status-item">
    <div>입점신청상점</div><br>
    <div class="status-count">${appliStoreCount}</div>
    </div>
    <div class="status-item">
    <div>입점완료상점</div><br>
    <div class="status-count">${completeStoreCount}</div>
    </div>
    <div class="status-item">
    <div>사용중지상점</div><br>
    <div class="status-count">${deleteStoreCount}</div>
    </div>
</div>		
<br>	
	
	<form name="f" action="storeList_listSearch.do?like=${like}" method="post" class="flex-container">
	<div class="flex-row">
		       <div class="flex-cell header-cell">기간</div>
			<div class="flex-cell input-cell">
				<select name="date">
					<option value="mer_joindate">회원가입일</option>
					<option value="inbrand_applicationdate">입점신청일</option>
					<option value="inbrand_canceldate">입점신청취소일</option>
					<option value="mer_inbranddate">입점승인결과일</option>
				</select>
				<input type="text" id="startDate" name="startDate"> ~ 
				<input type="text" id="endDate" name="endDate">
			</div>
		</div>
		<div class="flex-row">
		       <div class="flex-cell header-cell">검색</div>
			<div class="flex-cell">
				<select name="search">
					<option value="all">전체</option>
					<option value="mer_company">상점명</option>
					<option value="mer_id">ID</option>
					<option value="mer_num">판매자 번호</option>
					<option value="mer_comnum">사업자등록번호</option>
				</select>
				<input type="text" name="searchString">
			</div>
			</div>
	<div class="flex-subrow custom-button-row">
   				<div class="button-container">
			<input type="submit" value="검색하기"/>
				<input type="reset" value="초기화">
			</div>
		</div>
	</div>
	</form>
	<c:set var="count" value="1"/>
	<div class="scroll flex-container content-table">
	<div class="flex-row header-row">
			<div class="flex-cell">순번</div>
			<div class="flex-cell">판매자번호</div>
			<div class="flex-cell">상점명</div>
			<div class="flex-cell">판매자ID</div>
			<div class="flex-cell">사업자등록번호</div>
			<div class="flex-cell">입점여부</div>
			<div class="flex-cell">입점 승인일</div>
		</div>
	<c:if test="${empty storeList}">
	<div class="flex-row">
	<div class="flex-cell" align="center">
		조회 결과가 없습니다.</div>
		</div>
	</c:if>
	<c:forEach var="dto" items="${storeList}">
		<div class="flex-row" align="center">
			<div class="flex-cell">${count}</div>
			<div class="flex-cell">${dto.mer_num}</div>
			<div class="flex-cell">
				<a href="storeList_detail.do?mer_num=${dto.mer_num}&like=${like}">
					${dto.mer_company}
				</a>
			</div>
			<div class="flex-cell">${dto.mer_id}</div>
			<div class="flex-cell">${dto.mer_comnum1}-${dto.mer_comnum2}-${dto.mer_comnum3}</div>
	<c:choose>
		<c:when test="${dto.mer_isbrand eq 't' and not empty dto.inbrand_num}">
			<div class="flex-cell">승인</div>
		</c:when>
		<c:when test="${dto.mer_isbrand eq 'f' and dto.inbrand_num eq '0'}">
			<div class="flex-cell">신청 전</div>
		</c:when>
		<c:otherwise>
			<div class="flex-cell">승인중</div>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${dto.mer_inbranddate eq '0'}">
			<div class="flex-cell">-</div>
		</c:when>
		<c:otherwise>
			<div class="flex-cell">${dto.mer_inbranddate}</div>
		</c:otherwise>
	</c:choose>
		</div>
		<c:set var="count" value="${count+1}"/>
	</c:forEach>
	</div>
</body>