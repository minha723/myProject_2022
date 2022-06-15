<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-14
  Time: 오전 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
    <title>Title</title>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        .table-container{
            max-width: 800px;
            margin: auto;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="table-container">
    <table class="table">
        <tr>
            <th>판매 번호</th>
            <th>서비스 번호</th>
            <th>구매자 아이디</th>
            <th>판매 날짜</th>
            <th>판매 가격</th>
        </tr>
        <c:forEach var="history" items="${historyList}">
        <c:if test="${sessionScope.loginVendorId eq history.vendorId}">
                <tr>
            <td> ${history.id} </td>
            <td> ${history.productId} </td>
            <td> ${history.clientId}</td>
            <td> <fmt:formatDate value="${history.historyCreatedTime}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate>
            </td>
            <td> ${history.productPrice}원</td>
        </tr>
        </c:if>
        </c:forEach>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
