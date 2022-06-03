<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오후 1:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="container text-center">

    <div class="list-group">
        <h5 class="mb-1 border fw-bold">${product.productName}</h5>
        <div class="d-flex border border-bottom-0 w-auto justify-content-between">
            <small>별점: ${product.productStar}</small>
        </div>
        <div class="border border-top-0 d-flex justify-content-between">
            <small> 판매자: ${product.vendorId}</small>
        </div>
        <p class="mb-xl-2 border">
            <br>${product.productDesc}<br> &nbsp;
            <img src="${pageContext.request.contextPath}/productUpload/${product.productFileName}"
                 alt="" height="100" width="100">
        </p>
    </div>

    <button class="btn btn-outline-info" onclick="findAll()">목록</button>

    <c:if test="${sessionScope.loginVendorId eq product.vendorId}">
        <button class="btn btn-outline-warning" onclick="productUpdate()">수정</button>
        <button class="btn btn-outline-danger" onclick="productDelete()">삭제</button>
    </c:if>

    <c:if test="${sessionScope.loginVendorId eq 'admin'}">
        <button class="btn btn-outline-danger" onclick="productDelete()">삭제</button>
        <button class="btn btn-outline-danger" onclick="approve()">승인</button>
    </c:if>
</div>
</body>
<script>
    const findAll = () => {
      location.href="/product/findAll";
    }
    const productUpdate = () => {
      location.href="/product/update";
    }
    const productDelete = () => {
      location.href ="/product/delete";
    }
    const approve = () => {
      location.href = "/product/approve?id=${product.id}";
    }
</script>
</html>
