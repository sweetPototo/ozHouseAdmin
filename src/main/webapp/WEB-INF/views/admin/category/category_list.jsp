<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 카테고리 리스트-->
<link rel="stylesheet" type="text/css"
	href="resources/css/category_style.css">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin_management_top.jsp" %>
<%@ include file="../store_top.jsp" %>
<%@ include file="category_top.jsp" %>
<head>
<div class="container">
	<div class="content-container">
	<div class="scroll flex-container content-table">
       <div class="flex-row header-row">
        <div class="flex-cell">카테고리 번호</div>
        <div class="flex-cell">카테고리 코드</div>
        <div class="flex-cell">카테고리 이름</div>
        <div class="flex-cell">수정</div>
    </div>
    <c:if test="${empty cateList}">
        <div class="flex-row">
            <div class="flex-cell" colspan="4">검색 결과가 없습니다.</div>
        </div>
    </c:if>
    <c:forEach var="dto" items="${cateList}">
        <div class="flex-row" align="center">
            <div class="flex-cell">${dto.category_num }</div>
            <div class="flex-cell">${dto.category_code }</div>
            <div class="flex-cell">${dto.category_name }</div>
            <div class="flex-cell">
				<input type="button" class="update-button" style="background-color: #50E5B4; color: white;" value="수정" onclick="window.location='admin_cate_update.do?category_num=${dto.category_num }'">
            
            </div>
        </div>
    </c:forEach>
</div>
</div>
</div>
</head>