<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        .table-container {
            max-width: 850px;
            margin: auto;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="table-container">

    <table class="table">
        <tr>
            <c:if test="${sessionScope.loginVendorId eq 'admin' or sessionScope.loginClientId eq 'admin'}">
                <th>전문가번호</th>
            </c:if>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>이메일</th>
            <th>전화번호</th>
            <th>포인트</th>
            <th>사진</th>
            <c:if test="${sessionScope.loginVendorId eq 'admin' or sessionScope.loginClientId eq 'admin'}">
                <th>삭제</th>
            </c:if>

        </tr>
        <tr>
            <c:if test="${sessionScope.loginVendorId eq 'admin' or sessionScope.loginClientId eq 'admin'}">
                <td> ${vendor.id} </td>
            </c:if>
            <td> ${vendor.vendorId} </td>
            <td> ${vendor.vendorPassword}</td>
            <td> ${vendor.vendorName}</td>
            <td> ${vendor.vendorEmail}</td>
            <td> ${vendor.vendorMobile}</td>
            <td> ${vendor.vendorPoint}</td>
            <td><img src="${pageContext.request.contextPath}/upload/${vendor.vendorFileName}"
                     alt="" height="100" width="100"></td>
            <c:if test="${sessionScope.loginVendorId eq 'admin' or sessionScope.loginClientId eq 'admin'}">
                <td><a href="/vendor/delete?id=${vendor.id}">삭제</a></td>
            </c:if>
        </tr>
    </table>
</div>
</body>
</html>
