<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_management_top.jsp" %>
<%@ include file="admin_top.jsp" %>
<link rel="stylesheet" type="text/css" href="resources/css/change_pass_style.css">

<head>
<title>OZ의 집 : 나의 정보</title>
<script type="text/javascript">
	function check(){
		var hp1 = f.admin_hp1.value;
		var hp2 = f.admin_hp2.value;
		var hp3 = f.admin_hp3.value;
		
		if( hp1== '' || hp2 == '' || hp3 == ''){
			alert("전화번호를 입력해주세요.");
			return;
		}
		
		var hpExptext = /^[0-9]+/;
		if(hpExptext.test(hp1)==false || 
				hpExptext.test(hp2)==false || hpExptext.test(hp3)==false){
			alert("전화번호에는 숫자만 입력 가능합니다.");
			return;
		}
		
		if(f.admin_email.value == ''){
			alert("E-mail을 입력해주세요.");
			return;
		}
		document.f.submit();
	}
</script>
</head>
<body>
	<div align="center">
<h1>나의 정보 수정</h1> 

	<form name="f" action="admin_updateOk.do" method="post">
	<input type="hidden" name="admin_num" value="${loginMember.admin_num}">
		<div class="flex-container">
			<div class="flex-row">
			 	<div class="flex-header">
			 		이름
			 	</div>
			 	<div class="flex-content">
			 		${adminUpdate.admin_name}
			 	</div>
			 </div>
			 <div class="flex-row">
			 	<div class="flex-header">
			 		관리자ID
			 	</div>
			 	<div class="flex-content">
			 		${adminUpdate.admin_id}
			 	</div>
			 </div>
			 <div class="flex-row">
			 	<div class="flex-header">
			 		핸드폰
			 	</div>
			 	<div class="flex-content">
			 		<input type="text" name="admin_hp1" value="${adminUpdate.admin_hp1}" maxlength="3"><span>-</span>
			 		<input type="text" name="admin_hp2" value="${adminUpdate.admin_hp2}" maxlength="4"><span>-</span>
			 		<input type="text" name="admin_hp3" value="${adminUpdate.admin_hp3}" maxlength="4">
			 	</div>
			 </div>
			  <div class="flex-row">
			 	<div class="flex-header">
			 		E-mail
			 	</div>
			 	<div class="flex-content">
			 		<input type="text" name="admin_email" value="${adminUpdate.admin_email}">
			 	</div>
			 	</div>

<div class="button-container">
    <button type="button" class="sub" onclick="check()">완료</button>
    <button type="button" class="rese" onclick="location.href='admin_update.do'">취소</button>
</div>
		</form>
				</div>
							 </div>
				
	</div>
</div>
