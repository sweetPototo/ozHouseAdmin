<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- 공지사항 수정 -->
<link rel="stylesheet" type="text/css" href="resources/css/board_style.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin_management_top.jsp" %>
<%@ include file="../board/admin_board_top.jsp" %>

<%@ include file="notice_top.jsp" %>
<div class="container">
	<form name="f" action="admin_notice_update.do" method="post"> 
			<div class="content-container">
	<h1 class="board-header">공지사항 수정</h1>
		<c:forEach var="dto" items="${noticeContent}">
	        <input type="hidden" name="notice_num" value="${dto.notice_num}">
		<div class="flex-container">
			<div class="flex-row">
												
				<div class="flex-cell">제목</div>
				<div class="flex-cell-sub">
				<input type="text" name="notice_title" class="box" size="40"
								value="${dto.notice_title}"></div>
								</div>
			<div class="flex-row">
			<div class="flex-cell">내용</div>
			<div class="flex-cell-sub">
				<input type="text" name="notice_content" class="box" size="60"
								value="${dto.notice_content}"></div>
								</div>
			<div class="button-group">
					<input type="submit" value="수정">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="window.location='notice_admin.do'">
				</div>
				</div>
				</div>
				</c:forEach>
				</div>
	</form>
					</div>
	








