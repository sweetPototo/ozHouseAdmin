<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../admin_management_top.jsp" %>
<%@ include file="../../store_top.jsp" %>
<head>
<meta charset="UTF-8">
<title>쿠폰관리</title>
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
<div class="container">
	<div class="content-container">
<h1>쿠폰 현황</h1>		
<div class="status-container">
    <div class="status-item">
        <div>전체쿠폰</div><br>
        <div class="status-count">${allCount}</div>
    </div>
    <div class="status-item">
        <div>승인요청쿠폰</div><br>
        <div class="status-count">${appliCount}</div>
    </div>
    <div class="status-item">
        <div>승인완료쿠폰</div><br>
        <div class="status-count">${completeCount}</div>
    </div>
</div>		
<br>		
		<form name="f" action="coupon_listSearch.do" method="post" class="flex-container">
		   <div class="flex-row">
		       <div class="flex-cell header-cell">쿠폰 기간</div>
		       <div class="flex-cell input-cell">
		           <select name="date">
		               <option value="mer_couponusedate">시작일</option>
		               <option value="mer_couponenddate">종료일</option>
		           </select>
		           <input type="text" id="startDate" name="startDate"> ~
		           <input type="text" id="endDate" name="endDate">
		       </div>
		   </div>
		   <div class="flex-row">
		       <div class="flex-cell header-cell">승인여부</div>
		           <div class="flex-cell">
		           <input type="radio" name="mer_isapproval" value="all" checked="checked">전체
		           <input type="radio" name="mer_isapproval" value="t">완료
		           <input type="radio" name="mer_isapproval" value="f">미완료
		       </div>
		   </div>
		   <div class="flex-row">
		       <div class="flex-cell header-cell">검색&nbsp;&nbsp;&nbsp;</div>
		           		<div class="flex-cell">
		           <select name="search">
		               <option value="all">전체</option>
		               <option value="mer_couponname">쿠폰이름</option>
		               <option value="mer_couponnum">쿠폰번호</option>
		           </select>
		           <input type="text" name="searchString">
		       </div>
		   </div>
		    <div class="flex-subrow custom-button-row">
   				<div class="button-container">
		        	<input type="submit" value="검색">
		            <input type="reset" value="초기화">
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
		        <div class="flex-cell">상점번호</div>
		        <div class="flex-cell">상점ID</div>
		        <div class="flex-cell">상점명</div>
		        <div class="flex-cell">쿠폰번호</div>
		        <div class="flex-cell">쿠폰명</div>
		        <div class="flex-cell">할인금액</div>
		        <div class="flex-cell">승인 여부</div>
		    </div>
			<c:if test="${empty coupon}">
				<div class="flex-row">
		       		<div class="flex-cell" colspan="7">조회결과가 없습니다.</div>
				</div>
			</c:if>
			<c:forEach var="dto" items="${coupon}">
				<div class="flex-row" align="center">	
					 <div class="flex-cell">${count}</div>
					 <div class="flex-cell">${dto.mer_num}</div>
					 <div class="flex-cell">${dto.mer_id}</div>
					 <div class="flex-cell">${dto.mer_company}</div>
					 <div class="flex-cell">${dto.mer_couponnum}</div>
					 <div class="flex-cell">
						<a href="coupon_detail.do?mer_couponnum=${dto.mer_couponnum}">
							${dto.mer_couponname}
						</a>
					</div>
					 <div class="flex-cell">
						<fmt:formatNumber value="${dto.mer_coupondiscount}" type="number" pattern="###,###원"/>
					</div>
					 <div class="flex-cell">${dto.mer_isapproval}</div>
				</div>
			<c:set var="count" value="${count+1}"/>
			</c:forEach>	
		</div>
	</div>
</div>
</body>