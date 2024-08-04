<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_management_top.jsp" %>
<%@ include file="admin_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="resources/css/change_pass_style.css">
<title>OZ의 집 : 비밀번호 변경</title>
<script type="text/javascript">

function isValidPassword(password) {
    //  최소 8자리 이상 영문 대소문자, 숫자, 특수문자가 각각 1개 이상 
    let regex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/
    return regex.test(password);
}

function check(pw){
    var nowPw = document.f.now_pw.value;
    var merPw1 = document.f.admin_pw.value;
    var merPw2 = document.f.admin_pw2.value;
    
    if(nowPw == '' || merPw1 == '' || merPw2 == ''){
        alert("모든 칸을 입력하여 주시기 바랍니다.");
        return;
    }

    if(nowPw != pw){
        alert("현재 비밀번호와 일치하지 않습니다.");
        return;
    }
    if(merPw1 != merPw2){
        alert("비밀번호가 일치하지 않습니다.");
        return;
    }
    if(merPw1 == pw){
        alert("이전 비밀번호와 동일합니다.");
        return;
    }
    if (!isValidPassword(merPw1)) {
    	alert("비밀번호는 8자리 이상 영문 대소문자, 숫자, 특수문자가 각각 1개 이상이어야 합니다.");
    	return;
    }
   
    document.f.submit();
}
</script>
<body>
<div align="center">
<h1 class="board-header">비밀번호 변경하기</h1>
	<form name="f" action="admin_updatePass.do" method="post">
		<input type="hidden" name="admin_num" value="${loginMember.admin_num}">
		<input type="hidden" name="admin_id" value="${loginMember.admin_id}">
		<div class="flex-container">
			<div class="flex-row">
			 	<div class="flex-header">
			 		현재 비밀번호
			 	</div>
			 	<div class="flex-content">
			 		<input type="password" tabindex="3" name="now_pw" placeholder="비밀번호를 입력해 주세요." class="box" placeholder="Enter password" id="password">
			 	</div>
			 </div>
			 <div class="flex-row">
			 	<div class="flex-header">
			 		변경할 비밀번호
			 	</div>
			 	<div class="flex-content">
			 		<input type="password" tabindex="3" name="admin_pw" placeholder="비밀번호를 입력해 주세요." class="box" placeholder="Enter password" id="password">
			 	</div>
			 </div>
			 <div class="flex-row">
			 	<div class="flex-header">
			 		비밀번호 확인
			 	</div>
			 	<div class="flex-content">
			 		<input type="password" tabindex="4" placeholder="비밀번호를 정확하게 입력해 주세요." name="admin_pw2" class="box" placeholder="Enter passwordCheck" id="passwordCheck">
			 	</div>
			 </div>
			 <div class="button-container">
			<input type="button" value="변경" class="sub" onclick="check('${loginMember.admin_pw}')">
			<input type="button" value="취소" class="rese"
				onclick="location.href='admin_update.do'">
		</div>
		</div>
	</form>
</div>
</body>
