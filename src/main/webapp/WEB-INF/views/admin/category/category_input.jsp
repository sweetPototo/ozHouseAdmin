<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 카테고리 등록 -->
<link rel="stylesheet" type="text/css"
	href="resources/css/category_style.css">
<%@ include file="../admin_management_top.jsp"%>
<%@ include file="../store_top.jsp"%>
<%@ include file="category_top.jsp"%>
<div class="container">
	<form name="f" action="admin_cate_input.do" method="post">
		<div class="content-container">
			<h1 class="board-header">카테고리 등록</h1>
			<div class="flex-container">
				<div class="flex-row">
					<div class="flex-cell header-cell custom-label">코드</div>
					<div class="flex-cell input-cell">
						<input type="text" name="category_code" class="box" size="40">
					</div>
				</div>
				<div class="flex-row">
					<div class="flex-cell header-cell custom-label">이름</div>
					<div class="flex-cell input-cell">
						<input type="text" name="category_name" class="box" size="60">
					</div>
				</div>
				<div class="flex-subrow custom-button-row">
					<div class="button-container" align="center">
						<input type="submit" value="등록"> <input type="reset"
							value="다시작성"> <input type="button" value="목록 보기"
							onclick="window.location='category_admin.do'">
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
