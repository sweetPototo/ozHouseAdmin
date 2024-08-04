<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="resources/css/coupon_style.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin_management_top.jsp" %>
<head>
<title>회원 상세보기</title>
</head>
<div class="container">
        <h1 class="coupon-header">회원 상세보기</h1>
<div class="coupon-detail">
			<div class="flex-cell-coupon">회원 번호</div>
				<div class="flex-cell-coupon-sub">${dto.member_num}</div>
				<div class="flex-cell-coupon">회원ID</div>
				<div class="flex-cell-coupon-sub">div>${dto.member_id}</div>
				<div class="flex-cell-coupon">회원명</div>
				<div class="flex-cell-coupon-sub">${dto.member_name}</div>
				<div>
					<img src=""><!-- 이미지 주소 후 넣기 -->
				</div>
				<div class="flex-cell-coupon">전화번호</div>
				<div class="flex-cell-coupon-sub">${dto.member_hp1}-${dto.member_hp2}-${dto.member_hp3}</div>
				<div class="flex-cell-coupon">닉네임</div>
				<div class="flex-cell-coupon-sub">${dto.member_nickname}</div>
				<div class="flex-cell-coupon">주소</div>
				<div class="flex-cell-coupon-sub">${dto.member_address1}&nbsp;&nbsp;${dto.member_address2}&nbsp;&nbsp;${dto.member_address3}</div>
				<div class="flex-cell-coupon">우편번호</div>
				<div class="flex-cell-coupon-sub">${dto.member_postcode1}&nbsp;-&nbsp;${dto.member_postcode2}&nbsp;-&nbsp;${dto.member_postcode3}</div>
				<div class="flex-cell-coupon">담당자 이메일</div>
				<div class="flex-cell-coupon-sub">${dto.member_email}</div>
				<div class="flex-cell-coupon">포인트</div>
				<div class="flex-cell-coupon-sub">${dto.member_point}</div>
				<div class="flex-cell-coupon">가입일</div>
				<div class="flex-cell-coupon-sub">${dto.member_joindate}</div>
				<div class="flex-cell-coupon">등급</div>
				<div class="flex-cell-coupon-sub">${dto.member_level}</div>
				</div>
			</div>
		</div>
<div align="center">		
	<button type="button" onclick="location.href='member_list.do'">목록으로</button>
	</div>
</body>