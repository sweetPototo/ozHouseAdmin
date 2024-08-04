<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="resources/css/info_style.css">

<%@ include file="../admin_management_top.jsp" %>
<%@ include file="admin_top.jsp" %>
<head>
<meta charset="UTF-8">
<title>관리자 인증</title>
<script type="text/javascript">
function check(id, pw){
    var merIdInput = document.getElementsByName("admin_id")[0];
    var merPwInput = document.getElementsByName("admin_passwd")[0];

    if(merIdInput.value != id){
        alert("아이디와 로그인정보가 일치하지 않습니다.");
        return;
    }
    if(merPwInput.value != pw){
        alert("비밀번호가 일치하지 않습니다.");
        return;
    }
    
    if (!merIdInput || !merPwInput) {
        alert("ID와 비밀번호를 입력해주세요.");
        return;
    }
    
    document.f.submit();
}
    </script>
</head>
<body style="background-color: #F4F4F4">
    <div class="center-wrapper">
    <div class="container">
	<form name="f" action="admin_update_check.do" method="post">
				<div class="find-id">관리자 인증</div>
				<span class="title">ID</span>
					<input type="text" name="admin_id" class="box">
            <span class="title">PW</span>
					<input type="password" name="admin_passwd" class="box">
					<input type="hidden" name="mode" value="${mode}">
					<input type="hidden" name="admin_num" value="${loginMember.admin_num}"><!-- login 연결되면 수정 -->
					<button type="button" onclick="check('${loginMember.admin_id}', '${loginMember.admin_pw}');">
					인증</button>
				</div>
			</div>
		</div>
	</form>
	</div>
</div>
</body>