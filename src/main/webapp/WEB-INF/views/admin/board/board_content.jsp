<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 문의 상세보기 -->
<link rel="stylesheet" type="text/css" href="resources/css/board_style.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin_management_top.jsp" %>
<script>
	function answerQuestion(adminQANum) {
	    var url = 'admin_reqa.do?admin_QA_num=' + adminQANum;
	    window.location.href = url;
	}
	function requestQuestion(adminQANum) {
	    var url = 'admin_reqa_update.do?admin_reQA_num=' + adminQANum;
	    window.location.href = url;
	}
</script>

<div class="container">
	<div class="content-container">
	    <h1 class="board-header">관리자 문의 상세보기</h1>
		<div class="flex-container">
			<c:forEach var="dto" items="${adminContent}">
				<form name="f" action="javascript:answerQuestion(${dto.admin_QA_num});" method="post">
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
					<c:if test="${empty adminReContent}">
						<h1 class="board-header">답변되지 않았습니다.</h1>
						<div class="button-group">
								<input type="submit" value="답변하기">
						</div>
					</c:if>
				</form>
			</c:forEach>
			<c:if test="${not empty adminReContent }">	
			    <h1 class="board-header">관리자 문의 답변보기</h1>
				<div class="flex-container">
					<c:forEach var="redto" items="${adminReContent}">
						<form name="f2" action="javascript:requestQuestion(${redto.admin_reQA_num});" method="post">
							<div class="flex-row">
								<div class="flex-cell">글제목</div>
								<div class="flex-cell">${redto.admin_reQA_subject}</div>
								<div class="flex-cell">작성일</div>
								<div class="flex-cell">${redto.admin_reQA_date}</div>
							</div>
							<div class="flex-row">
								<div class="flex-cell">글내용</div>
								<div class="flex-cell-sub">${redto.admin_reQA_content }</div>
							</div>
							<div class="button-right-align">
								    <input type="hidden" name="admin_reQA_num" value="${redto.admin_reQA_num}">
									<input type="submit" value="수정 하기">
								</div>
						</form>
					</c:forEach>
				</div>
			</c:if>
		</div>
		<div class="button-group">
				<input type="button" value="목록 보기" onclick="window.location='board_admin.do'">
			</div>
		</div>
</div>
		
