<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- 문의 답변 수정 -->
<link rel="stylesheet" type="text/css" href="resources/css/board_style.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin_management_top.jsp" %>
<script>
	function validateForm() {
	  var admin_reQA_content = document.forms["f"]["admin_reQA_content"].value;
	  var admin_reQA_subject = document.forms["f"]["admin_reQA_subject"].value;
	  
	  if (admin_reQA_subject == null || admin_reQA_subject.trim() === "") {
	    alert("제목을 입력해주세요.");
	    return false; 
	  }
	  if (admin_reQA_content == null || admin_reQA_content.trim() === "") {
	    alert("내용을 입력해주세요.");
	    return false; 
	  }
	  return true;
	}
</script>

<div class="container">
	<div class="content-container">
	    <h1 class="board-header">관리자 문의 상세보기</h1>
		<div class="flex-container">
			<c:forEach var="dto" items="${adminContent}">
				<div class="flex-row">
					<div class="flex-cell">글번호</div>
					<div class="flex-cell">${dto.admin_QA_num}</div>
					<div class="flex-cell">문의 유형</div>
					<div class="flex-cell">${dto.admin_inquiry_type}</div>
				</div>
				<div class="flex-row">
					<div class="flex-cell">작성자</div>
					<div class="flex-cell">${dto.member_id}</div>
					<div class="flex-cell">작성일</div>
					<div class="flex-cell">${dto.admin_QA_date}</div>
				</div>
				<div class="flex-row">
					<div class="flex-cell">글제목</div>
					<div class="flex-cell-sub">${dto.admin_QA_subject}</div>
				</div>
				<div class="flex-row">
					<div class="flex-cell">글내용</div>
					<div class="flex-cell-sub">${dto.admin_QA_content }</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<form name="f" action="admin_reqa_update.do" method="post" onsubmit="return validateForm()">
		<div class="content-container">
			<h1 class="board-header">답변 수정</h1>
			<c:forEach var="redto" items="${adminReContent}">
		        <input type="hidden" name="admin_reQA_num" value="${redto.admin_reQA_num}">
				<div class="flex-container">
					<div class="flex-row">
						<div class="flex-cell">제 목</div>
						<div class="flex-cell-sub">
							<input type="text" name="admin_reQA_subject" class="box" size="40" value="${redto.admin_reQA_subject}">
						</div>
					</div>
					<div class="flex-row">
					<div class="flex-cell">내 용</div>
						<div class="flex-cell-sub"><textarea name="admin_reQA_content" rows="11" cols="40" class="box">${redto.admin_reQA_content}</textarea></div>
					</div>
		<div class="button-group">

							<input type="submit" value="글수정">
							<input type="reset" value="다시작성">
							<input type="button" value="목록보기" onclick="window.location='board_admin.do'">
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</form>
</div>
	








