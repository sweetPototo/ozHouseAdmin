<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 스토어관리 메인 -->
<link rel="stylesheet" type="text/css"
	href="resources/css/login_style.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/managementStyle.css">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,700|Montserrat:400,700&display=swap"
	rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${path}/resources/css/login_style.css" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="resources/css/top.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700|Montserrat:400,700&display=swap" rel="stylesheet">
<script type="text/javascript">
	function searchMember(mode){
		window.open("searchMember.do?mode="+mode, "search", "width=640, height=400")
	}
	
	function pressEnter(e){
		if(e.keyCode == 13){
			loginCheck();
			}
	}
	
	function loginCheck(){
		if (f.admin_id.value == ""){
			alert("아이디를 입력해 주세요!!")
			f.admin_id.focus()
			return
		}
		if (f.admin_pw.value == ""){
			alert("비밀번호를 입력해 주세요!!")
			f.admin_pw.focus()
			return
		}
		document.f.submit()
	}
</script>
<style>
.management-container {
    max-width: 1500px;
    margin: 30 auto;
    padding: 20px;
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.grid-container {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-gap: 20px;
}

.management-section {
    background-color: #ffffff;
    padding: 15px;
    border: 1px solid #e0e0e0;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
}
.management-section p {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}

.management-section .dash {
    margin-right: 5px;
}
.centered-text {
	text-align: center;
	font-size: larger; 
}
</style>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<body>
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
	<c:if test="${empty loginMember}">
		<div class="container">
			<div class="center-section">
				<form method="post" action="merchant_login.do" id="login-form"
					name="f">
					<font face="Roboto, sans-serif">관리자 사이트 로그인</font>
					<c:if test="${not empty cookie.saveId}">
						<input type="text" name="admin_id" tabindex="1"
							value="${cookie['saveId'].value}">
					</c:if>
					<c:if test="${empty cookie.saveId}">
						<input type="text" name="admin_id" tabindex="1"
							placeholder="아이디 입력">
					</c:if>
					<input type="password" name="admin_pw" placeholder="비밀번호 입력"
						onkeypress="return pressEnter(event)"> <label
						for="remember-check"> <c:if
							test="${not empty cookie.saveId}">
							<input type="checkbox" name="saveId" checked>
						</c:if> <c:if test="${empty cookie.saveId}">
							<input type="checkbox" name="saveId" id="remember-check">
						</c:if> <font face="Roboto, sans-serif">아이디 저장하기</font>
					</label> <input type="button" value="로그인" onclick="javascript:loginCheck()">
			</div>
	</c:if>
<c:if test="${not empty loginMember}">
    <div class="management-container centered-text">
        <div class="grid-container">
            <div class="management-section">
				<p><b>회원관리</b></p>
                <p><span class="dash">-</span> <a href="member_list.do">회원목록</a></p>
                </div>
            <div class="management-section">
				<p><b>상점관리</b></p>
					<p><span class="dash">-</span> <a href="category_admin.do">카테고리 관리</a></p>
					<p><span class="dash">-</span> <a href="storeList_list.do?like=all">상점 목록</a></p>
					<p><span class="dash">-</span> <a href="product_admin.do">상품관리</a></p>
					<p><span class="dash">-</span> <a href="coupon_list.do">쿠폰관리</a></p>
					<p><span class="dash">-</span> <a href="sales_list.do?mode=day">정산관리</a></p>
			</div>
            <div class="management-section">
				<p><b>게시판관리</b></p>
					<p><span class="dash">-</span> <a href="board_admin.do">문의/답변</a></p>
					 <p><span class="dash">-</span> <a href="notice_admin.do">공지사항</a></p>
			</div>
            <div class="management-section">
				<p><b>관리자 메뉴</b></p> 
				<p><span class="dash">-</span> <a href="admin_insert.do">관리자 등록</a></p>
				<p><span class="dash">-</span> <a href="admin_list.do">관리자 목록</a></p>
				<p><span class="dash">-</span> <a href="admin_update.do">나의 정보 변경</a></p>
            </div>
        </div>
    </div>
</c:if>
</body>
