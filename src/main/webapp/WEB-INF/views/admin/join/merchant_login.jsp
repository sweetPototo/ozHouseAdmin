<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/login_style.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<title>Login</title>
</head>
<body> 
	    <div class="container">
        <form method="post" action="admin_main.do" id="login-form" name="f">
         	 <font face="Roboto, sans-serif">관리자 사이트 로그인</font>
			<c:if test="${not empty cookie.saveId}">
            	<input type="text" name="admin_id" tabindex="1"  value="${cookie['saveId'].value}">
			</c:if>	
			<c:if test="${empty cookie.saveId}">
            	<input type="text" name="admin_id" tabindex="1" placeholder="아이디 입력">
            </c:if>	
            <input type="password" name="admin_pw" placeholder="비밀번호 입력" onkeypress="return pressEnter(event)">
            <label for="remember-check">
		<c:if test="${not empty cookie.saveId}">
            <input type="checkbox" name="saveId" checked>
		</c:if>	    
		<c:if test="${empty cookie.saveId}">     
            <input type="checkbox" name="saveId" id="remember-check">
		</c:if>	     
            <font face="Roboto, sans-serif">아이디 저장하기</font>
            </label>
            <input type="button" value="로그인"
            	  onclick="javascript:loginCheck()">
    </div>
</body>
</html>




