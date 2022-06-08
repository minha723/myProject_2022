<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-31
  Time: 오후 4:21
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
<jsp:include page="./layout/header.jsp" flush="false"></jsp:include>

<div class="container text-center">

    <c:choose>
        <c:when test="${sessionScope.loginVendorId != null}">
            <button class="btn btn-outline-success" onclick="findAllProduct()"> 상품 목록</button>
            <button class="btn btn-outline-success" onclick="saveProduct()"> 상품 등록</button>
            <button class="btn btn-outline-success" onclick="findPoint()"> 포인트 보기</button>
            <button class="btn btn-outline-success" onclick="vLogOut()"> 로그아웃</button>
        </c:when>
        <c:when test="${sessionScope.loginClientId != null}">
            <button class="btn btn-outline-success" onclick="findAllProduct()"> 상품 목록</button>
            <button class="btn btn-outline-success" onclick="findLikeProduct()"> 찜한 상품 목록</button>
            <button class="btn btn-outline-success" onclick="findHistory()"> 결제한 상품</button>
            <button class="btn btn-outline-success" onclick="cLogOut()"> 로그아웃</button>
        </c:when>
        <c:otherwise>
            <button class="btn btn-outline-success" onclick="cSignUp()">고객 회원가입</button>
            <button class="btn btn-outline-success" onclick="vSignUp()">전문가 회원가입</button>
            <button class="btn btn-outline-success" onclick="cLogIn()">고객 로그인</button>
            <button class="btn btn-outline-success" onclick="vLogIn()">전문가 로그인</button>
            <button class="btn btn-outline-success" onclick="findAllProduct()">목록</button>
        </c:otherwise>
    </c:choose>

    <c:if test="${sessionScope.loginVendorId eq 'admin'}">
        <button class="btn btn-outline-success" onclick="approveList()">승인할 목록</button>
    </c:if>
</div>
</body>
<script>
    const approveList = () => {
      location.href="/product/approveList";
    }
    const cSignUp = () => {
        location.href = "/client/save";
    }
    const cLogIn = () => {
        location.href = "/client/login";
    }
    const vSignUp = () => {
        location.href = "/vendor/save";
    }
    const vLogIn = () => {
        location.href = "/vendor/login";

    }
    const findAllProduct = () => {
        location.href = "/product/findAll";
    }
    const findLikeProduct = () => {
        location.href = "/product/like?clientId=${sessionScope.loginClientId}";
    }
    const findHistory = () => {
        location.href = "/product/history?clientId=${sessionScope.loginClientId}";
    }
    const saveProduct = () => {
      location.href = "/product/save";
    }
    const vLogOut = () => {
      location.href="/vendor/logout";
    }
    const cLogOut = () => {
      location.href="/client/logout";
    }
    const findPoint = () => {
      location.href="/vendor/point?id=${sessionScope.loginVId}";
    }

</script>
</html>
