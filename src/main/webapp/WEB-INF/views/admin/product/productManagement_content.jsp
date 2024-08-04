<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 상품상세보기 -->
<link rel="stylesheet" type="text/css" href="resources/css/productManagementStyle.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../admin_management_top.jsp" %>
<%@ include file="../store_top.jsp" %>
<%@ include file="product_top.jsp" %>
<head>
<title>OZ의 집 : 상품상세보기</title>
<script type="text/javascript">

function handleRejection(productNum) {
    var reason = prompt("반려 사유를 입력해주세요.");
    if (reason != null && reason != "") {
        if (confirm("정말로 반려하시겠습니까?")) {
            location.href = "admin_fre.do?product_num=" + productNum + "&reason=" + encodeURIComponent(reason) + "&product_approval_status=" + status;
        }
    }
}

function handleRejection2(productNum) {
    var reason = prompt("취소 사유를 입력해주세요.");
    if (reason != null && reason != "") {
        if (confirm("정말로 취소하시겠습니까?")) {
            location.href = "admin_fc.do?product_num=" + productNum + "&reason=" + encodeURIComponent(reason) + "&product_approval_status=" + status;
        }
    }
}
    
    function handleRejection3(productNum) {
        var reason = prompt("반려 사유를 입력해주세요.");
        if (reason != null && reason != "") {
        	if (confirm("정말로 반려하시겠습니까?")) {
                location.href = "admin_reupdate.do?product_num=" + productNum + "&reason=" + encodeURIComponent(reason) + "&product_approval_status=" + status;
            }
        }
    }

    function handleRejection4(productNum) {
        var reason = prompt("취소 사유를 입력해주세요.");
        if (reason != null && reason != "") {
            if (confirm("정말로 취소하시겠습니까?")) {
                location.href = "admin_cancelupdate.do?product_num=" + productNum + "&reason=" + encodeURIComponent(reason) + "&product_approval_status=" + status;
            }
        }
    }
</script>
</head>
<body>
    <div class="container">
        <div class="content-container">
            <h1 class="stock-header">상품 상세보기</h1>
            <div class="form-container">
                <div class="section-header">
                    <h2>기본 정보</h2>
                </div>
                <div class="form-section">
                    <div class="form-group">
                        <label for="product_name">상품명</label>
                        <div>[${getProduct.product_modifier}]${getProduct.product_name}</div>
                    </div>
                    <div class="form-group">
                        <label for="categorySelect">카테고리</label>
                        <div>${getProduct.category_name}</div>
                    </div>
                    <div class="form-group">
                        <label>상품금액</label>
                        <div class="price-inputs">
                            <div>대표가 : <fmt:formatNumber value="${getProduct.product_price}" pattern="###,###"/>원</div>
                            <div>할인율 : <fmt:formatNumber value="${getProduct.product_discount_rate}" pattern="###,###"/>%</div>
                            <div>할인가 : <fmt:formatNumber value="${getProduct.product_discount_price}" pattern="###,###"/>원</div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="product_point">포인트</label>
                        <div class="input-flex">
                            <div>${getProduct.product_point}</div>
                            <span>point</span>
                        </div>
                    </div>
                </div>
                <div class="section-header">
                    <h2>이미지</h2>
                </div>
                <div class="form-section">
                    <div class="form-group">
                        <label>대표이미지</label>
                        <div><img src="data:image/jpeg;base64,${encodedImage}" width="800" height="800"></div>
                    </div>
                    <div class="form-group">
                        <label>상세이미지</label>
                        <div>
                            <c:forEach var="encodedImagePro" items="${encodedImagesPro}">
                                <div><img src="data:image/png;base64,${encodedImagePro}" width="800" height="800"></div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="section-header">
                    <h2>배송</h2>
                </div>
                <div class="form-section">
                    <div class="form-group">
                        <label for="product_assembly_cost">조립비(설치비)</label>
                        <div class="input-flex">
                            <div>${getProduct.product_assembly_cost}</div>
                            <span>원</span>
                        </div>
                    </div>
                </div>
            </div>
            <div>
            <c:if test="${dto.product_approval_status=='f'}">
            <div class="button-container">
<a href="admin_fok.do?product_num=${dto.product_num }">등록</a> | 
<a href="#" onclick="handleRejection(${dto.product_num},'${dto.product_approval_status}'); return false;">반려</a> |
<a href="#" onclick="handleRejection2(${dto.product_num},'${dto.product_approval_status}'); return false;">취소</a>
    </div>
    </c:if>
        <c:if test="${getProduct.product_approval_status=='ur' || getProduct.product_approval_status=='re'}">
    
    <h1 class="stock-header">상품 수정 상세보기</h1>
            <div class="form-container">
                <div class="section-header">
                    <h2>기본 정보</h2>
                </div>
                <div class="form-section">
                    <div class="form-group">
                        <label for="product_name">상품명</label>
                        <div>[${getreProduct.product_modifier}]${getreProduct.product_name}</div>
                    </div>
                    <div class="form-group">
                        <label for="categorySelect">카테고리</label>
                        <div>${getreProduct.category_name}</div>
                    </div>
                    <div class="form-group">
                        <label>상품금액</label>
                        <div class="price-inputs">
                            <div>대표가 : <fmt:formatNumber value="${getreProduct.product_price}" pattern="###,###"/>원</div>
                            <div>할인율 : <fmt:formatNumber value="${getreProduct.product_discount_rate}" pattern="###,###"/>%</div>
                            <div>할인가 : <fmt:formatNumber value="${getreProduct.product_discount_price}" pattern="###,###"/>원</div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="product_point">포인트</label>
                        <div class="input-flex">
                            <div>${getreProduct.product_point}</div>
                            <span>point</span>
                        </div>
                    </div>
                </div>
                <div class="section-header">
                    <h2>이미지</h2>
                </div>
                <div class="form-section">
                    <div class="form-group">
                        <label>대표이미지</label>
                        <div><img src="data:image/jpeg;base64,${encodedImage2}" width="800" height="800"></div>
                    </div>
                    <div class="form-group">
                        <label>상세이미지</label>
                        <div>
                            <c:forEach var="encodedImagePro2" items="${encodedImagesPro2}">
                                <div><img src="data:image/png;base64,${encodedImagePro2}" width="800" height="800"></div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="section-header">
                    <h2>배송</h2>
                </div>
                <div class="form-section">
                    <div class="form-group">
                        <label for="product_assembly_cost">조립비(설치비)</label>
                        <div class="input-flex">
                            <div>${getreProduct.product_assembly_cost}</div>
                            <span>원</span>
                        </div>
                    </div>
                </div>
            </div>
    </c:if>
		            </div>
		            <br>
		            <div align="center">
    	<input style="background-color: #c0c0c0; border: none; color: black; padding:7px 9px; border-radius: 4px;" 
    	type="button" value="목록보기" onclick="window.location='product_admin.do'">
    </div>
    </div>
</div>
</body>


