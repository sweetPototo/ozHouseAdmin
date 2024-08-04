<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="resources/css/info_style.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../admin_management_top.jsp" %>
<%@ include file="../../store_top.jsp" %>
<style>
input[type="submit"] {
    width: 100%;
    padding: 10px;
    background-color: #50E5B4;
    border: none;
    border-radius: 5px;
    color: white;
    font-size: 1em;
    cursor: pointer;
    margin-top: 15px;
    }
</style>
<head>
<meta charset="UTF-8">
<title>관리자 인증</title>
</head>
<body style="background-color: #F4F4F4">
<c:if test="${mode eq 'delete'}">
<h1>상점 사용중지</h1>
</c:if>
<c:if test="${mode eq 'approve'}">
<h1>상점 승인</h1>
</c:if>
<c:if test="${mode eq 'cancel'}">
<h1>상점 승인 거절</h1>
</c:if>
    <div class="center-wrapper">
    <div class="container">
	<form name="f" action="storeList_adminOk_check.do" method="post">
		<div class="find-id">관리자 인증</div>
				<span class="title">ID</span>
					<input type="text" name="admin_id" class="box">
            <span class="title">PW</span>
			<input type="password" name="admin_passwd" class="box">
					<input type="hidden" name="mode" value="${mode}">
					<input type="hidden" name="mer_num" value="${mer_num}">
					<input type="hidden" name="admin_num" value="${loginMember.admin_num}"><!-- login 연결되면 수정 -->
					<input type="submit" value="인증">
				</div>
			</div>
		</div>
	</form>
</div>
</body>