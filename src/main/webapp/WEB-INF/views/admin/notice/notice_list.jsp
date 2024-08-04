<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 공지사항 리스트-->
<link rel="stylesheet" type="text/css" href="resources/css/delivery_style.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin_management_top.jsp" %>
<%@ include file="../board/admin_board_top.jsp" %>
<%@ include file="notice_top.jsp" %>
<head>
<div class="container">
	<div class="content-container">
	<div class="scroll flex-container content-table">
       <div class="flex-row header-row">
        <div class="flex-cell">공지사항 번호</div>
        <div class="flex-cell">공지사항 제목</div>
        <div class="flex-cell">등록일</div>
        <div class="flex-cell">수정 | 삭제</div>
    </div>
    <c:if test="${empty noticeList}">
        <div class="flex-row">
            <div class="flex-cell" colspan="4">등록된 결과가 없습니다.</div>
        </div>
    </c:if>
    <c:forEach var="dto" items="${noticeList}">
        <div class="flex-row">
            <div class="flex-cell">${dto.notice_num }</div>
            <div class="flex-cell">
            <a href="admin_notice_content.do?notice_num=${dto.notice_num }">${dto.notice_title }</a>
            </div>
            <div class="flex-cell">${dto.notice_date }</div>
            <div class="flex-cell">
            <div>
            <input type="button" class="update-button" style="background-color: #50E5B4; color: white; margin-battom: 10px;" value="수정" onclick="window.location='admin_notice_update.do?notice_num=${dto.notice_num }'">
             </div>
             <div>
             <input type="button" class="update-button" style="background-color: #F4F4F4; color: black; margin-top: 10px;" value="삭제" onclick="window.location='admin_notice_delete.do?notice_num=${dto.notice_num }'">
            </div>
            <!-- 
            <a href="admin_notice_update.do?notice_num=${dto.notice_num }">수정</a> | 
            <a href="admin_notice_delete.do?notice_num=${dto.notice_num }">삭제</a>
             -->
            </div>
        </div>
    </c:forEach>
</div>
</div>
</div>
</head>