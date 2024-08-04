<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 공지사항 상세보기 -->
<link rel="stylesheet" type="text/css" href="resources/css/board_style.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin_management_top.jsp" %>
<%@ include file="../board/admin_board_top.jsp" %>

<%@ include file="notice_top.jsp" %>
<div class="container">
	<div class="content-container">
	    <h1 class="board-header">공지사항 상세보기</h1>
		<div class="flex-container">
	<c:forEach var="dto" items="${noticeContent}">
		<div class="flex-row">
			<div class="flex-cell">글번호</div>
			<div class="flex-cell">${dto.notice_num}</div>
			<div class="flex-cell">작성일</div>
			<div class="flex-cell">${dto.notice_date}</div>
		</div>
		<div class="flex-row">
			<div class="flex-cell">제목</div>
			<div class="flex-cell-sub">${dto.notice_title}</div>
		</div>
		<div class="flex-row">
			<div class="flex-cell">내용</div>
			<div class="flex-cell-sub">${dto.notice_content }</div>
		</div>
<div class="button-group">
				<input type="button" value="목록 보기" onclick="window.location='notice_admin.do'">
				<input type="button" value="수정" style="background-color: #50E5B4; color: white;" onclick="window.location='admin_notice_update.do?notice_num=${dto.notice_num}'"
>
			</div>			
			</div>
		</div>
		</c:forEach>
	</div>
</div>
