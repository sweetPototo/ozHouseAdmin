<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- 문의 답변 수정 -->
<link rel="stylesheet" type="text/css"
	href="resources/css/category_style.css">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin_management_top.jsp" %>
<%@ include file="../store_top.jsp" %>
<%@ include file="category_top.jsp" %>
<div class="container">
	<form name="f" action="admin_cate_update.do" method="post"> 
			<div class="content-container">
	<h1 class="board-header">카테고리 수정</h1>
		<c:forEach var="dto" items="${cateContent}">
	        <input type="hidden" name="category_num" value="${dto.category_num}">
		<div class="flex-container">
			<div class="flex-row">
				<div class="flex-cell header-cell custom-label">코드</div>
				<div class="flex-cell input-cell">
				<input type="text" name="category_code" class="box" size="40"
								value="${dto.category_code}"></div>
								</div>
			<div class="flex-row">
			<div class="flex-cell header-cell custom-label">이름</div>
			<div class="flex-cell input-cell">
				<input type="text" name="category_name" class="box" size="60"
								value="${dto.category_name}"></div>
								</div>
		    <div class="flex-subrow custom-button-row">
   				<div class="button-container" align="center">
					<input type="submit" value="수정">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="window.location='category_admin.do'">
				</div>
				</div>
				</div>
				</c:forEach>
				</div>
	</form>
					</div>
	








