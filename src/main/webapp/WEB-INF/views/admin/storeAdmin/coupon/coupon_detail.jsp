<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="resources/css/coupon_style.css">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../admin_management_top.jsp" %>
<%@ include file="../../store_top.jsp" %>
<head>
<meta charset="UTF-8">
<title>쿠폰 상세화면</title>
<script type="text/javascript">
	function check() {
		
	    document.f.submit();
	}
	
	function cancel(couponimage, couponnum) {
	    var reason = prompt("승인 거절 사유를 입력해주세요.");
	    if (reason != null && reason != "") {
	        if (window.confirm("승인을 거절하시겠습니까?")) {
	            location.href = "coupon_cancel.do?mer_couponimage=" + couponimage + "&mer_couponnum=" + couponnum + "&reason=" + encodeURIComponent(reason);
	        }
	    } else if (reason === "") {
	        alert("거절 사유를 입력해야 합니다.");
	    }
	}
	
	function couponDelete(couponimage, couponnum){
		if(window.confirm("승인된 쿠폰을 삭제합니다. 정말 삭제하시겠습니까?")){
			location.href = 
				"coupon_delete.do?mer_couponimage=" + couponimage + "&mer_couponnum=" + couponnum;
		}
	}
</script>
</head>
<body>
<div class="container">
        <h1 class="coupon-header">쿠폰 상세내용</h1>
<form name="f" action="coupon_detail.do" method="post">
<input type="hidden" name="mer_couponnum" value="${coupon.mer_couponnum}">
		<div class="coupon-detail">
			<div class="flex-cell-coupon">쿠폰번호</div>
			<div class="flex-cell-coupon-sub">${coupon.mer_couponnum}</div>
			<div class="flex-cell-coupon">승인여부</div>
			<div class="flex-cell-coupon-sub">${coupon.mer_isapproval}</div>
			<div class="flex-cell-coupon">쿠폰명</div>
			<div class="flex-cell-coupon-sub">${coupon.mer_couponname}</div>
			<div class="flex-cell-coupon">상점번호</div>
			<div class="flex-cell-coupon-sub">${coupon.mer_num}</div>
			<div class="flex-cell-coupon">상점명</div>
			<div class="flex-cell-coupon-sub">${coupon.mer_company}</div>
			<div class="flex-cell-coupon">사업자등록번호</div>
			<div class="flex-cell-coupon-sub">${coupon.mer_comnum1}-${coupon.mer_comnum2}-${coupon.mer_comnum3}</div>
			<div class="flex-cell-coupon">쿠폰 할인금액</div>
			<div class="flex-cell-coupon-sub"><fmt:formatNumber value="${coupon.mer_coupondiscount}" type="number" pattern="###,###원"/></div>
			<div class="flex-cell-coupon">사용 시작일</div>
			<div class="flex-cell-coupon-sub">${coupon.mer_couponusedate}</div>
			<div class="flex-cell-coupon">사용 만료일</div>
			<div class="flex-cell-coupon-sub">${coupon.mer_couponenddate}</div>
		</div>
		<div align="center">
		<c:if test="${coupon.mer_isapproval eq '승인중'}">
			<button type="button" style="WIDTH:120px;HEIGHT:40px" 
			onclick="check()">승인</button>
			<button type="button" style="WIDTH:120px;HEIGHT:40px" 
				onclick="cancel('${coupon.mer_couponimage}', '${coupon.mer_couponnum}')">승인거절
			</button>
		</c:if>
		<c:if test="${coupon.mer_isapproval eq '승인'}">

			<button type="button" style="WIDTH:120px;HEIGHT:40px" 
				onclick="couponDelete('${coupon.mer_couponimage}', '${coupon.mer_couponnum}')">쿠폰삭제
			</button>
		</c:if>
		</div>
	</div>
</form>
</div>
<div align="center">
<button type="button" style="background-color: #F4F4F4; color: black;" onclick="location.href='coupon_list.do'">목록으로</button>
</div>
</body>
</html>