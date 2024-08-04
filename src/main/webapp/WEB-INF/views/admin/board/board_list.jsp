<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- 문의 -->
<link rel="stylesheet" type="text/css" href="resources/css/delivery_style.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin_management_top.jsp" %>
<%@ include file="admin_board_top.jsp" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
    $(function() {
        $( "#startDate" ).datepicker({
            changeMonth: true,
            changeYear: true,
            nextText: '다음 달',
            prevText: '이전 달',
            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dateFormat: "y/mm/dd",
            maxDate: 0, // 선택 가능한 최소 날짜, 0: 오늘 이후 선택 불가
            onClose: function( selectedDate ) {
                // 시작일(startDate) datepicker가 닫힐 때
                // 종료일(endDate)의 선택할 수 있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#endDate").datepicker( "option", "minDate", selectedDate );
            }
        });
    });
    $(function() {
        $( "#endDate" ).datepicker({
            changeMonth: true,
            changeYear: true,
            nextText: '다음 달',
            prevText: '이전 달',
            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dateFormat: "y/mm/dd",
            maxDate: 0, // 선택 가능한 최소 날짜, 0: 오늘 이후 선택 불가
            onClose: function( selectedDate ) {
                // 시작일(startDate) datepicker가 닫힐 때
                // 종료일(endDate)의 선택할 수 있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#endDate").datepicker( "option", "maxDate", selectedDate );
            }
        });
    });

    function answerQuestion(adminQANum) {
        var url = 'admin_reqa.do?admin_QA_num=' + adminQANum;
        window.location.href = url;
    }

    function requestQuestion(adminQANum) {
        var url = 'admin_reqa_update.do?admin_reQA_num=' + adminQANum;
        window.location.href = url;
    }
    
	function resetForm() {
		document.forms["f1"].reset();  // 폼 초기화
	    document.getElementById("startDate").value = "";
	    document.getElementById("endDate").value = "";
	    document.getElementById("searchString").value = "";
	    document.getElementById("search").value = "all";
	    document.getElementById("admin_QA_state").value = "all";
	    document.getElementById("admin_inquiry_type").value = "all";
	}
</script>
</head>

<div class="container">
    <div class="content-container">
        <h1 class="board-header">관리자 문의</h1>
        <div class="flex-container">
            <form name="f1" action="board_admin.do" class="flex-container" class="flex-container">
                <div class="flex-row">
                    <div class="flex-cell header-cell custom-label">답변 상태</div>
                    <div class="flex-cell input-cell">
                        <select name="admin_QA_state" id="admin_QA_state">
                            <option value="all">전체</option>
							<option value="answer_wait" ${param.order_QA_state == 'answer_wait' ? 'selected' : ''}>답변대기</option>
			                <option value="answer_complete" ${param.order_QA_state == 'answer_complete' ? 'selected' : ''}>답변완료</option>
						</select>
                    </div>
                </div>
                <div class="flex-row">
                    <div class="flex-cell header-cell custom-label">문의 유형</div>
                    <div class="flex-cell input-cell">
                        <select name="admin_inquiry_type" id="admin_inquiry_type">
                            <option value="all" ${param.admin_inquiry_type == 'all' ? 'selected' : ''}>전체</option>
                            <option value="order" ${param.admin_inquiry_type == 'order' ? 'selected' : ''}>주문</option>
                            <option value="size" ${param.admin_inquiry_type == 'size' ? 'selected' : ''}>사이즈</option>
                            <option value="delivery" ${param.admin_inquiry_type == 'delivery' ? 'selected' : ''}>배송</option>
                        </select>
                    </div>
                </div>
                <div class="flex-row">
                    <div class="flex-cell header-cell custom-label">기간&nbsp;&nbsp;&nbsp;&nbsp;</div>
                    <div class="flex-cell input-cell">
			            <input type="text" id="startDate" name="startDate" value="${param.startDate}">
			            ~
			            <input type="text" id="endDate" name="endDate" value="${param.endDate}">
			        </div>
                </div>
                <div class="flex-row">
                    <div class="flex-cell header-cell custom-label">검색&nbsp;&nbsp;&nbsp;&nbsp;</div>
                    <div class="flex-cell input-cell">
                        <select name="search" id="search">
                            <option value="all" ${param.search == 'all' ? 'selected' : ''}>전체</option>
                            <option value="admin_QA_subject" ${param.search == 'admin_QA_subject' ? 'selected' : ''}>글제목</option>
                            <option value="member_id" ${param.search == 'member_id' ? 'selected' : ''}>작성자ID</option>
                        </select>
			            <input type="text" id="searchString" name="searchString" value="${param.searchString}">
                    </div>
                </div>
	<div class="flex-subrow custom-button-row">
   				<div class="button-container">
                        <input type="submit" value="검색">
			            <input type="button" value="초기화" onclick="resetForm()">
                    </div>
                </div>
            </form>
            <br>
            <div align="left" class="results-heading">
                <font size="2">검색 결과</font>&nbsp;&nbsp;총 ${productqaCount} 건
            </div>
            <div class="scroll flex-container content-table">
                <div class="flex-row header-row">
                    <div class="flex-cell">번호</div>
                    <div class="flex-cell">제목</div>
                    <div class="flex-cell">작성자 ID</div>
                    <div class="flex-cell">문의 유형</div>
                    <div class="flex-cell">작성일</div>
                    <div class="flex-cell">답변 상태</div>
                    <div class="flex-cell">답변</div>
                </div>
                <c:if test="${empty adminQAList}">
                    <div class="flex-row">
                        <div class="flex-cell" colspan="7">검색 결과가 없습니다.</div>
                    </div>
                </c:if>
                <c:forEach var="dto" items="${adminQAList}">
                    <div class="flex-row">
                        <div class="flex-cell">${dto.admin_QA_num }</div>
                        <div class="flex-cell">
                            <a href="admin_qa_content.do?admin_QA_num=${dto.admin_QA_num }">
                                <c:choose>
                                    <c:when test="${fn:length(dto.admin_QA_subject) > 10}">
                                        ${fn:substring(dto.admin_QA_subject, 0, 10)}...
                                    </c:when>
                                    <c:otherwise>
                                        ${dto.admin_QA_subject}
                                    </c:otherwise>
                                </c:choose>
                            </a>
                        </div>
                        <div class="flex-cell">${dto.member_id }</div>
                        <div class="flex-cell">${dto.admin_inquiry_type }</div>
                        <div class="flex-cell">${dto.admin_QA_date }</div>
                        <div class="flex-cell">
                            <c:if test="${dto.admin_QA_state == 'f'}">
                                답변 대기
                            </c:if>
                            <c:if test="${dto.admin_QA_state == 't'}">
                                답변 완료
                            </c:if>
                        </div>
                        <div class="flex-cell">
                            <c:if test="${dto.admin_QA_state == 'f'}">
                            	<input type="button" class="update-button" style="background-color: #50E5B4; color: white;" value="답변" onclick="window.location='admin_reqa.do?admin_QA_num=${dto.admin_QA_num}'">
                            <!-- 
                                <a href="javascript:answerQuestion(${dto.admin_QA_num});">답변</a>
                                 -->
                            </c:if>
                            <c:if test="${dto.admin_QA_state == 't'}">
                            	 <input type="button" class="update-button" style="background-color: #50E5B4; color: white;" value="수정" onclick="window.location='admin_reqa_update.do?admin_reQA_num=${dto.admin_QA_num}'">
                            <!--                                 <a href="javascript:requestQuestion(${dto.admin_QA_num});">수정</a>
                                 -->
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
