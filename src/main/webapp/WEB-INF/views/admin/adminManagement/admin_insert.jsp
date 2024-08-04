<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_management_top.jsp" %>
<%@ include file="admin_top.jsp" %>
<link rel="stylesheet" type="text/css" href="resources/css/join.css">
<head>
<meta charset="UTF-8">
<title>관리자 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
		var idMerChecked = false;
		
		function check(){
			if (f.admin_id.value == ""){
				alert("아이디를 입력해 주세요")
				f.id.focus()
				return
			}
			if (!idMerChecked) { // 중복 검사가 실행되지 않았으면
				alert("아이디 유효성을 확인해 주세요");
				return;
			}
			if (!f.admin_passwd.value){
				alert("비밀번호를 입력해 주세요")
				f.admin_pw.focus()
				return
			}
			if (!f.admin_pw2.value) {
				alert("비밀번호 확인을 해 주세요");
				f.admin_pw2.focus();
				return;
			}
			if (f.admin_passwd.value !== f.admin_pw2.value) {
				alert("비밀번호가 일치하지 않습니다.");
				f.admin_pw.focus();
				return;
			}
	        if (!isValidPassword($("#password").val())) {
	            alert("비밀번호 유효성을 확인해 주세요");
	            f.admin_passwd2.focus();
	            return;
	        }
	        var email = f.admin_email.value;
	    	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

	    	if(exptext.test(email)==false){
	    	//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우	
	    		alert("이메일형식이 올바르지 않습니다.");
	    		f.admin_email.focus();
	    		return;
	    	}
			document.f.submit();
		}
		
		function checkMerIdFalse() {
			idMerChecked = false;
		}

		$(function(){ 
		    $("#checkMerId").click(function(){
		        let mer_id = $("#admin_id").val();
		        $.ajax({
		            type:'post', //post 형식으로 controller 에 보내기위함!!
		            url:"mer_checkId.do", // 컨트롤러로 가는 mapping 입력
		            data: {"admin_id":mer_id}, // 원하는 값을 중복확인하기위해서  JSON 형태로 DATA 전송
		            success: function(data){ 
		             if (data == "N" ){ // 만약 성공할시
		                    result = "사용 가능한 아이디입니다.";
		                    $("#result_checkMerId").html(result).css("color", "green");
		                    $("#admin_pw").trigger("focus");
		                    idMerChecked = true; // 중복 검사를 실행했음을 기록
		             }else if(data == "E" ){
		                    result = "아이디를 입력해 주세요.";
		                    $("#result_checkMerId").html(result).css("color", "red");
		                    $("#admin_pw").trigger("focus");
		                    idMerChecked = false; // 중복 검사를 실행했음을 기록
		             }else if(data == "L" ){
		                    result = "아이디는 6-12자의 영문, 숫자, 기호( - _ )만 사용이 가능합니다";
		                    $("#result_checkMerId").html(result).css("color", "red");
		                    $("#admin_pw").trigger("focus");
		                    idMerChecked = false; // 중복 검사를 실행했음을 기록
		             }else if(data == "V" ){
		                    result = "아이디는 영문, 숫자, 기호( - _ )만 사용이 가능합니다";
		                    $("#result_checkMerId").html(result).css("color", "red");
		                    $("#admin_pw").trigger("focus");
		                    idMerChecked = false; // 중복 검사를 실행했음을 기록
		             }else{ // 만약 실패할시
		                 result="이미 사용중인 아이디입니다.";
		                     $("#result_checkMerId").html(result).css("color","red");
		                     $("#admin_id").val("").trigger("focus");
		                     idMerChecked = false; // 중복 검사를 실행하지 않았음을 기록
		             }
		         },
		            error : function(error){alert(error);}
		        });
		    });
		});
		
		
	</script>
<script>
    function isValidPassword(password) {
        //  최소 8자리 이상 영문 대소문자, 숫자, 특수문자가 각각 1개 이상 
        let regex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/
        return regex.test(password);
    }
	
    function checkPasswd2() {
    	let password = $("#password").val();
        if (!isValidPassword(password)) {
            $("#checkPasswd2").show();
        } else {
            $("#checkPasswd2").hide();
        }
    }
    
    function checkPasswd() {
        let password = $("#password").val();
        let passwordCheck = $("#passwordCheck").val();

        if (password !== passwordCheck) {
            $("#checkPasswd").show();
        } else {
            $("#checkPasswd").hide();
        }
    }

    $(document).ready(function() {
        $("#checkPasswd").hide();
    }); 
    
</script>
</head>
<body>
<h1 class="board-header">관리자 등록</h1>
        <div class="registration-form-container">
	<form name="f" method="post" id="login-form" action="admin_join.do">
				<div class="form-group">
            <span class="title">아이디</span>
            </div>
            <div class="form-group single-line-group">
            
            <input type="text" tabindex="1" placeholder="아이디를 입력해 주세요." id="admin_id" name="admin_id" class="box" oninput="checkMerIdFalse()">
					<div><span id="checkMerId"><input type="button" value="중복검사"></span></div>
        </div>
                    <div><span id="result_checkMerId" style="font-size:12px;"></span></div>
        
				<div class="form-group">
				<span class="title">비밀번호</span>
	            <input type="password" tabindex="3" name="admin_passwd" placeholder="비밀번호를 입력해 주세요." class="box" placeholder="Enter password" id="password" oninput="checkPasswd2()">
				<span class="title">비밀번호 확인</span>
				<input type="password" tabindex="4" placeholder="비밀번호를 정확하게 입력해 주세요." name="admin_pw2" class="box" placeholder="Enter passwordCheck" id="passwordCheck" oninput="checkPasswd()">
                    <div id="checkPasswd" class="error-message">
  						PASSWORD 가 동일하지 않습니다
					</div>
					<div id="checkPasswd2" class="error-message">
  						비밀번호는 8자리 이상 영문 대소문자, 숫자, 특수문자가 각각 1개 이상이어야 합니다
					</div>
</div>
        <div class="form-group">
            <span class="title">관리자 이름</span>
            <input type="text" name="admin_name" class="box">
        </div>

        <div class="form-group">
            <span class="title">전화 번호</span>
            <div class="phone-number-group">
                <input type="text" name="admin_hp1" class="box" maxlength="3"><span>-</span>
                <input type="text" name="admin_hp2" class="box" maxlength="4"><span>-</span>
                <input type="text" name="admin_hp3" class="box" maxlength="4">
            </div>
        </div>

        <div class="form-group">
            <span class="title">이메일</span>
            <input type="email" name="admin_email" class="box">
        </div>
				<div class="button-group">								
				<input type="button" value="회원가입" onclick="javascript:check()">
				<input type="reset" value="reset">
</div>
	</form>
	</div>
</body>