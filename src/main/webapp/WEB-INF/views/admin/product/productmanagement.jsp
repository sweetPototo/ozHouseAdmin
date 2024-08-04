<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 전체 상품 -->
<link rel="stylesheet" type="text/css" href="resources/css/product_style.css">
<link rel="stylesheet" type="text/css" href="resources/css/delivery_style.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../admin_management_top.jsp" %>
<%@ include file="../store_top.jsp" %>
<%@ include file="product_top.jsp" %>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>


function handleDealClick(productNum) {
    $("#dealDate" + productNum).datepicker({
        dateFormat: "y/mm/dd",
        minDate: 0,
        onSelect: function(dateText) {
            if(window.confirm("선택한 날짜로 오늘의 딜 상품을 추가하겠습니까?")){
                $("#dealForm" + productNum).submit();
            }
            $("#dealDate" + productNum).hide();
        }
    });
    $("#dealDate" + productNum).show().focus();
}

function handleReleaseClick(productNum) {
    if(window.confirm("오늘의 딜 상품에서 제외하겠습니까?")){
        location.href = "productManagement_admin_todays_no.do?product_num="+productNum;
    }
}


$( function() {  //html화면이 열리면 function함수가 동작 준비를 함 =>$(document).ready(function(){});과 같
  $( "#startDate" ).datepicker({
  	changeMonth: true,
  	changeYear: true,
  	nextText: '다음 달',
  	prevText: '이전 달',
  	dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
  	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
  	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
   	dateFormat: "y/mm/dd",
  	maxDate: 0, //선택 가능한 최소날짜, 0: 오늘 이후 선택 불가
  	onClose: function( selectedDate ) {                          
	//시작일(startDate) datepicker가 닫힐때                      
	//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정                     
	$("#endDate").datepicker( "option", "minDate", selectedDate );                 
  	}	
  });
});
$( function() {
  $( "#endDate" ).datepicker({
  	changeMonth: true,
  	changeYear: true,
  	nextText: '다음 달',
  	prevText: '이전 달',
  	dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
  	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
  	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
   	dateFormat: "y/mm/dd",
  	maxDate: 0, //선택 가능한 최소날짜, 0: 오늘 이후 선택 불가
  	onClose: function( selectedDate ) {                          
	//시작일(startDate) datepicker가 닫힐때                      
	//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정                     
	$("#endDate").datepicker( "option", "maxDate", selectedDate );                 
  	}
  });
});

function resetForm() {
	document.forms["f1"].reset();  // 폼 초기화
    document.getElementById("startDate").value = "";
    document.getElementById("endDate").value = "";
    document.getElementById("searchString").value = "";
    document.getElementById("search").value = "all";
}

</script>
</head>
<div class="container">
	<div class="content-container">
	    <h1 class="stock-header">상품 관리</h1>
		<div class="flex-container">
			<form name="f1" action="productManagement_admin.do" class="flex-container" method="post">
					<div class="flex-row">
						<div class="flex-cell header-cell custom-label">기간</div>
			    	    <div class="flex-cell input-cell">
			            <input type="text" id="startDate" name="startDate" value="${param.startDate}">
			            ~
			            <input type="text" id="endDate" name="endDate" value="${param.endDate}">
			        </div>
		    </div>
		    <div class="flex-row">
		        <div class="flex-cell header-cell custom-label">검색</div>
		        <div class="flex-cell input-cell">
		            <select name="search" id="search">
							<option value="all" ${param.search == 'all' ? 'selected' : ''}>전체</option>
				                    <option value="product_num" ${param.search == 'product_num' ? 'selected' : ''}>상품번호</option>
	                    			<option value="inbrand_company" ${param.search == 'inbrand_company' ? 'selected' : ''}>상점명</option>
				                    <option value="product_name" ${param.search == 'product_name' ? 'selected' : ''}>상품명</option>
				                    <option value="category_name" ${param.search == 'category_name' ? 'selected' : ''}>카테고리</option>
		            </select>
			            <input type="text" id="searchString" name="searchString" value="${param.searchString}">
		        </div>
		    </div>
	<div class="flex-subrow custom-button-row">
   				<div class="button-container" align="center">
		        	<input type="submit" value="검색">
				                <input type="button" value="초기화" onclick="resetForm()">
		            		</div>
		        		</div>
       				</div>
				</form>
				<br>
	<div align="left" class="results-heading">
        <font size="2">검색 결과</font>&nbsp;&nbsp;총 ${ListCount} 건
    </div>
	<div class="scroll flex-container content-table">
       <div class="flex-row header-row">
       <div class="flex-cell">구분</div>
	        <div class="flex-cell">상품번호</div>
	        <div class="flex-cell">상점명</div>
	        <div class="flex-cell">상품설명<div class="sub-header">상품명</div></div>
	        <div class="flex-cell">카테고리</div>
	        <div class="flex-cell">대표이미지</div>
	        <div class="flex-cell">구매횟수</div>
	        <div class="flex-cell">스펙</div>
	        <div class="flex-cell">신청일</div>
        	<div class="flex-cell">추가</div>
        </div>
	    <c:if test="${empty Listproduct}">
	        <div class="flex-row">
	            <div class="flex-cell" colspan="9">검색된 결과가 없습니다.</div>
	        </div>
	    </c:if>    
		<c:forEach var="dto" items="${Listproduct}">
	        <div class="flex-row">
	        <div class="flex-cell">
	        <c:if test="${dto.product_today != '0' }">
	        	<img src="resources/img/todays.png" width="500" height="500"><br>
				        	<span style="font-size: 18px; color: #FF0000;">${dto.product_today}</span><span>의 딜</span>
	        </c:if>
	        </div>
				<div class="flex-cell">${dto.product_num}</div>
				<div class="flex-cell">${dto.inbrand_company}</div>
	            <div class="flex-cell">[${dto.product_modifier}]
	            	<div class="sub-content">${dto.product_name}</div>
	            </div>
	            <div class="flex-cell">${dto.category_name}</div>
	            <div class="flex-cell">
            <img src="data:image/jpeg;base64,${dto.encodedImage}" width="40" height="40">
	            </div>
	            <div class="flex-cell">${dto.product_purchases_count}</div>
	            <div class="flex-cell">
	            <c:if test="${dto.product_spec == 'best'}">
	            	BEST
	            </c:if>
	            <c:if test="${dto.product_spec == 'normal'}">
	            	NORMAL
	            </c:if>
            	</div>
	            <div class="flex-cell">${dto.product_input_date }</div>
	            <div class="flex-cell">
	<c:if test="${dto.product_today == '0' }">
    <form id="dealForm${dto.product_num}" action="productManagement_admin_todays.do" method="GET">
        <input type="hidden" name="product_num" value="${dto.product_num}">
        <input type="text" id="dealDate${dto.product_num}" name="dealDate" style="display:none;">
        <input type="button" value="딜" onclick="handleDealClick(${dto.product_num})">
    </form>
</c:if>
<c:if test="${dto.product_today != '0' }">
<input type="button" id="releaseButton" value="해제" onclick="handleReleaseClick(${dto.product_num})">
	            </c:if>
	            </div>
			</div>
		</c:forEach>
	</div>
</div>
