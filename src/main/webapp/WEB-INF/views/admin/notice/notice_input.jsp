<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 공지사항 등록 -->
<link rel="stylesheet" type="text/css" href="resources/css/board_style.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin_management_top.jsp" %>
<%@ include file="../board/admin_board_top.jsp" %>

<%@ include file="notice_top.jsp" %>
<div class="container">
<form name="f" action="admin_notice_input.do" method="post">
	<div class="content-container">
	<h1 class="board-header">공지사항 등록</h1>
		<div class="flex-container">
			<div class="flex-row">
			
				<div class="flex-cell">제 목</div>
				<div class="flex-cell-sub">
				<input type="text" name="notice_title" class="box" size="40"></div>
				</div>
			<div class="flex-row">
			<div class="flex-cell">내 용</div>
				<div class="flex-cell-sub"><textarea name="notice_content" rows="11" cols="40" class="box"></textarea></div>
</div>
		<div class="button-group">
					<input type="submit" value="등록">
					<input type="reset" value="다시작성">
					<input type="button" value="목록 보기" onclick="window.location='notice_admin.do'">
				</div>
				</div>
				</div>
	</form>
</div>
