<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">

</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="container text-center">
    <button class="btn btn-outline-primary" onclick="logOut()">로그아웃</button>
    <button class="btn btn-outline-primary" onclick="update()">전문가 정보 수정</button>
    <c:if test="${sessionScope.loginVendorId != null and sessionScope.loginVendorId != 'admin'}">
        <button class="btn btn-outline-primary" onclick="saveProduct()">상품 등록 신청</button>
    </c:if>
    <c:if test="${sessionScope.loginVendorId eq 'admin'}">
        <button class="btn btn-outline-primary" onclick="findAllVendor()"> 전문가목록 보기</button>
        <button class="btn btn-outline-primary" onclick="findAllClient()"> 고객목록 보기</button>
    </c:if>
</div>

</body>
<script>
    const logOut = () => {
        location.href="/vendor/logout";
    }

    const findAllVendor = () => {
        location.href="/vendor/findAll";
    }

    const findAllClient = () => {
        location.href="/client/findAll";
    }

    const update = () => {
        location.href="/vendor/update?id=${sessionScope.loginVId}";
    }

    const saveProduct = () => {
        location.href="/product/save?id=${sessionScope.loginVId}";
    }

</script>
</html>
