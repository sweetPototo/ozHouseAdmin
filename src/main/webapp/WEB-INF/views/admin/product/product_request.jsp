<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- 상품등록 -->
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
<style>
    .flex-cell button {
        background-color: #50E5B4;
        color: white;
        border: none;
        padding: 5px 10px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 0.9em;
        margin-right: 5px;
    }
</style>
<script>
function handleRejection(productNum, status) {
    var reason = prompt("반려 사유를 입력해주세요.");
    if (reason != null && reason != "") {
        if (confirm("정말로 반려하시겠습니까?")) {
            location.href = "admin_fre.do?product_num=" + productNum + "&reason=" + encodeURIComponent(reason) + "&product_approval_status=" + status;
        }
    }
}

function handleRejection2(productNum, status) {
    var reason = prompt("취소 사유를 입력해주세요.");
    if (reason != null && reason != "") {
        if (confirm("정말로 취소하시겠습니까?")) {
            location.href = "admin_fc.do?product_num=" + productNum + "&reason=" + encodeURIComponent(reason) + "&product_approval_status=" + status;
        }
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
	    <h1 class="stock-header">등록 요청 리스트</h1>
		
		<form name="f1" action="product_admin.do" class="flex-container" method="post">
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
		</form>
		<br>
		<div align="left" class="results-heading">
		    <font size="2">검색 결과</font>&nbsp;&nbsp;총 ${requestListCount} 건
		</div>
		<div class="scroll flex-container content-table">
		    <div class="flex-row header-row">
		        <div class="flex-cell">상품번호</div>
	        	<div class="flex-cell">상점명</div>
		        <div class="flex-cell">상품설명<div class="sub-header">상품명</div></div>
	        	<div class="flex-cell">카테고리</div>
		        <div class="flex-cell">대표이미지</div>
		        <div class="flex-cell">가격</div>
		        <div class="flex-cell">수량</div>
		        <div class="flex-cell">신청일</div>
		        <div class="flex-cell">상태</div>
		        <div class="flex-cell">승인</div>
		    </div>
		    <c:if test="${empty requestListProduct}">
		        <div class="flex-row">
		            <div class="flex-cell" colspan="10">등록된 상품이 없습니다.</div>
		        </div>
		    </c:if>
		    <c:forEach var="dto" items="${requestListProduct}">
		        <div class="flex-row">
		            <div class="flex-cell">${dto.product_num}</div>
					<div class="flex-cell">${dto.inbrand_company}</div>
		            <div class="flex-cell">[${dto.product_modifier}]
	            	<div class="sub-content">
	            		<a href="product_content.do?product_num=${dto.product_num}">
	            		${dto.product_name}
	            		</a>
	            	</div>
		            </div>
		            <div class="flex-cell">${dto.category_name}</div>
		            <div class="flex-cell">
            <img src="data:image/jpeg;base64,${dto.encodedImage}" width="40" height="40">
		            </div>
		            <div class="flex-cell"><fmt:formatNumber value="${dto.product_price}" pattern="###,###"/>원</div>
		            <div class="flex-cell">${dto.product_quantity}개</div>
		            <div class="flex-cell">${dto.product_input_date }</div>
		            <div class="flex-cell">
		                <c:choose>
		                    <c:when test="${dto.product_approval_status=='f'}">등록대기</c:when>
		                </c:choose>
		            </div>
<div class="flex-cell">
<c:if test="${dto.product_approval_status=='f'}">
    <button onclick="location.href='admin_fok.do?product_num=${dto.product_num }'">확인</button> 
    <button onclick="handleRejection(${dto.product_num},'${dto.product_approval_status}'); return false;">반려</button> 
    <button onclick="handleRejection2(${dto.product_num},'${dto.product_approval_status}'); return false;">취소</button>
</c:if>
</div>
</div>
		    </c:forEach>
		    </div>
	</div>
</div>