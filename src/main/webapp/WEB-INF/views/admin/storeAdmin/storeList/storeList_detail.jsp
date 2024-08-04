<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="resources/css/coupon_style.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../admin_management_top.jsp" %>
<%@ include file="../../store_top.jsp" %>
<%@ include file="storeList_top.jsp" %>

<head>
<title>상점 상세보기</title>
	<script type="text/javascript">
		function deleteStore(){
			if(window.confirm("상점을 삭제하시면 복구가 불가능합니다. 정말로 삭제하시겠습니까?")){
				f.mode.value = 'delete';
				document.f.submit
			}
		}
		
		function approve(){
			if(window.confirm("상점의 입점을 승인하시겠습니까?")){
				document.f.submit
			}
		}
		
		function cancel(){
			if(window.confirm("상점의 입점을 거절하시겠습니까?")){
				f.mode.value = 'cancel';
				document.f.submit
			}
		}
	</script>
</head>
<div class="container">
        <h1 class="coupon-header">상점 상세보기</h1>
	<form name="f" action="storeList_adminOk.do" method="post">
	<input type="hidden" name="mode" value="approve">
	<div class="coupon-detail">
			<div class="flex-cell-coupon">판매자 번호</div>
				<div class="flex-cell-coupon-sub">${dto.mer_num}</div>
				<input type="hidden" name="mer_num" value="${dto.mer_num}">
				<div class="flex-cell-coupon">사업자 등록번호</div>
				<div class="flex-cell-coupon-sub">${dto.mer_comnum1}-${dto.mer_comnum2}-${dto.mer_comnum3}</div>
				<div class="flex-cell-coupon">판매자ID</div>
				<div class="flex-cell-coupon-sub">${dto.mer_id}</div>
				<div class="flex-cell-coupon">상점명</div>
				<div class="flex-cell-coupon-sub">${dto.mer_company}</div>
				<div class="flex-cell-coupon">전화번호</div>
				<div class="flex-cell-coupon-sub">${dto.mer_hp1}-${dto.mer_hp2}-${dto.mer_hp3}</div>
				<div class="flex-cell-coupon">입점여부</div>
		<c:choose>
			<c:when test="${dto.mer_isbrand eq 't' and not empty dto.inbrand_num}">
				<div class="flex-cell-coupon-sub">승인</div>
			</c:when>
			<c:when test="${dto.mer_isbrand eq 'f' and dto.inbrand_num eq '0'}">
				<div class="flex-cell-coupon-sub">신청 전</div>
			</c:when>
			<c:otherwise>
				<div class="flex-cell-coupon-sub">승인중</div>
			</c:otherwise>
		</c:choose>
				<div class="flex-cell-coupon">회사소개</div>
				<div class="flex-cell-coupon-sub">${dto.mer_comintro}</div>
				<div class="flex-cell-coupon">홈페이지</div>
				<div class="flex-cell-coupon-sub">${dto.inbrand_homepage}</div>
				<input type="hidden" name="mer_homepage" value="${dto.inbrand_homepage}">
				<div class="flex-cell-coupon">영업담당자</div>
				<div class="flex-cell-coupon-sub">${dto.inbrand_manname}</div>
				<input type="hidden" name="mer_manname" value="${dto.inbrand_manname}">
				<div class="flex-cell-coupon">담당자 전화번호</div>
				<div class="flex-cell-coupon-sub">${dto.inbrand_manhp1}-${dto.inbrand_manhp2}-${dto.inbrand_manhp3}</div>
				<input type="hidden" name="mer_manhp1" value="${dto.inbrand_manhp1}">
				<input type="hidden" name="mer_manhp2" value="${dto.inbrand_manhp2}">
				<input type="hidden" name="mer_manhp3" value="${dto.inbrand_manhp3}">
				<div class="flex-cell-coupon">담당자 이메일</div>
				<div class="flex-cell-coupon-sub">${dto.inbrand_manemail}</div>
				<input type="hidden" name="mer_manemail" value="${dto.inbrand_manemail}">
				<div class="flex-cell-coupon">카테고리</div>
				<div class="flex-cell-coupon-sub">${resultCate}</div>
				<input type="hidden" name="mer_category" value="${dto.inbrand_category}">
				<div class="flex-cell-coupon">타입점 쇼핑몰</div>
				<div class="flex-cell-coupon-sub">
			<c:if test="${dto.inbrand_othershop eq '0'}">
				-
			</c:if>
			<c:if test="${!dto.inbrand_othershop eq '0'}">
				${dto.inbrand_othershop}
			</c:if>
			</div>
				<input type="hidden" name="mer_othershop" value="${dto.inbrand_othershop}">
				<div class="flex-cell-coupon">판매 관련 파일</div>
				<div class="flex-cell-coupon-sub">${dto.inbrand_file}</div>
				<input type="hidden" name="mer_file" value="${dto.inbrand_file}">
				<div class="flex-cell-coupon">회원가입일</div>
				<div class="flex-cell-coupon-sub">${dto.mer_joindate}</div>
				<div class="flex-cell-coupon">입점신청일</div>
		<c:choose>
			<c:when test="${dto.inbrand_applicationdate eq null}">
				<div class="flex-cell-coupon-sub">-</div>
			</c:when>
			<c:otherwise>
				<div class="flex-cell-coupon-sub">${dto.inbrand_applicationdate}</div>
			</c:otherwise>
		</c:choose>
				<div class="flex-cell-coupon">입점신청취소일</div>
		<c:choose>
			<c:when test="${dto.inbrand_canceldate eq null}">
				<div class="flex-cell-coupon-sub">-</div>
			</c:when>
			<c:otherwise>
				<div class="flex-cell-coupon-sub">${dto.inbrand_canceldate}</div>
			</c:otherwise>
		</c:choose>
				<div class="flex-cell-coupon">입점승인결과일</div>
		<c:choose>
			<c:when test="${dto.mer_inbranddate eq null}">
				<div class="flex-cell-coupon-sub">-</div>
			</c:when>
			<c:otherwise>
				<div class="flex-cell-coupon-sub">${dto.mer_inbranddate}</div>
			</c:otherwise>
		</c:choose>
			</div>
			<div>
				<div>
				<c:choose>
					<c:when test="${dto.mer_isbrand eq 't' and not empty dto.inbrand_num}">
						<div align="center">
							<button style="WIDTH:120px;HEIGHT:60px"
								onclick="deleteStore()">
								사용중지
							</button>
						</div>
					</c:when>
					<c:when test="${dto.mer_isbrand eq 'f' and dto.inbrand_num eq '0'}">
						<div></div>
					</c:when>
					<c:otherwise>
						<div class="button-container" align="center">
							<button style="WIDTH:120px;HEIGHT:60px"
								onclick="approve()">
								입점 승인
							</button>
							<button style="WIDTH:120px;HEIGHT:60px"
								onclick="cancel()">
								입점 거절
							</button>
						</div>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
	</div>
	</form>
</body>