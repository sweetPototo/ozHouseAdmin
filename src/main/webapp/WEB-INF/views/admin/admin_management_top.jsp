<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 스토어관리 메인 top -->
<link rel="stylesheet" type="text/css" href="resources/css/top.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700|Montserrat:400,700&display=swap" rel="stylesheet">
<html>
<head>
    <script type="text/javascript">
		function logout(){
			if(window.confirm("로그아웃 하시겠습니까?")){
				location.href = 
					"merchant_logout.do";
			}
		}
	</script>
</head>
<body>
<header>
    <a href="admin_main.do">
    <img src="resources/img/ozlogo3.png" width="50" height="50">
        <img src="resources/img/oz3.png" width="50" height="50">
        <span class="partner-center">관리자 관리</span>
    </a>
    <div class="header-right">
        <nav>
       	 	<c:if test="${not empty loginMember.admin_num}">
            	<a href="javascript:logout()">로그아웃</a>
            </c:if>
        </nav>
    </div>
</header>
<div class="tab-navigation">
    <a href="member_list.do" class="tab-link">회원관리</a>
    <a href="category_admin.do" class="tab-link">상점관리</a>
    <a href="board_admin.do" class="tab-link">게시판 관리</a>
    <a href="admin_insert.do" class="tab-link">관리자 메뉴</a>
</div>
</body>

