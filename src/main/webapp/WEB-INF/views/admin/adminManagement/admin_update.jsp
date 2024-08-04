<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_management_top.jsp" %>
<%@ include file="admin_top.jsp" %>
<head>
<title>OZ의 집 : 나의 정보</title>
<style>
.flex-container {
    background: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    margin: auto;
    width: 35%; 
    box-sizing: border-box;
}
.flex-row {
    display: flex;
    align-items: center;
    margin-bottom: 10px; 
}
.flex-header, .flex-content {
    flex: 1;
    padding: 10px;
}

.flex-content {
    font-size: 23px;
    text-align: left;
}

.flex-header {
    font-weight: bold; 
    text-align: center;
    font-size: 25px;
}
button {
    padding: 10px 15px;
    margin-top: 20px;
    margin-right: 10px;
    border: none;
    border-radius: 5px;
    background-color: #50E5B4; 
    color: white;
    cursor: pointer;
}

</style>
<script type="text/javascript">
	function setMode(mode){
		if(mode == 'pass'){
			f.mode.value='pass';
		}
		document.f.submit();
	}
	
</script>
</head>
<body>
	<div align="center">
<h1>나의 정보 보기</h1> 
	<form name="f" action="admin_update.do" method="post">
	<input type="hidden" name="mode" value="inform">
		<div class="flex-container">
			 <div class="flex-row">
			 	<div class="flex-header">
			 		이름
			 	</div>
			 	<div class="flex-content">
			 		${adminUpdate.admin_name}
			 		<input type="hidden" name="admin_name" value="${adminUpdate.admin_name}">
			 	</div>
			 </div>
			 <div class="flex-row">
			 	<div class="flex-header">
			 		관리자ID
			 	</div>
			 	<div class="flex-content">
			 		${adminUpdate.admin_id}
			 			<input type="hidden" name="admin_id" value="${adminUpdate.admin_id}">
			 	</div>
			 </div>
			 <div class="flex-row">
			 	<div class="flex-header">
			 		핸드폰
			 	</div>
			 	<div class="flex-content">
			 		${adminUpdate.admin_hp1}-${adminUpdate.admin_hp2}-${adminUpdate.admin_hp3}
			 		<input type="hidden" name="admin_hp1" value="${adminUpdate.admin_hp1}">
			 		<input type="hidden" name="admin_hp2" value="${adminUpdate.admin_hp2}">
			 		<input type="hidden" name="admin_hp3" value="${adminUpdate.admin_hp3}">
			 	</div>
			 </div>
			  <div class="flex-row">
			 	<div class="flex-header">
			 		E-mail
			 	</div>
			 	<div class="flex-content">
			 		${adminUpdate.admin_email}
			 		<input type="hidden" name="admin_email" value="${adminUpdate.admin_email}">
			 	</div>
			 </div>
		</div>
		<button type="button" onclick="setMode('inform');">정보수정</button>
		<button type="button" onclick="setMode('pass');">비밀번호 변경</button>
		</form>
	</div>
</div>
</body>
