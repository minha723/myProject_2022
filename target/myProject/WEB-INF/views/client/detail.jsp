<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 1:13
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

<table class="table">
    <tr>
        <c:if test="${sessionScope.loginClientId eq 'admin'}">
            <th>고객번호</th>
        </c:if>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>이름</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>잔여포인트</th>
        <c:if test="${sessionScope.loginClientId eq 'admin'}">
            <th>삭제</th>
        </c:if>

    </tr>
    <tr>
        <c:if test="${sessionScope.loginClientId eq 'admin'}">
            <td> ${client.id} </td>
        </c:if>
        <td> ${client.clientId} </td>
        <td> ${client.clientPassword}</td>
        <td> ${client.clientName}</td>
        <td> ${client.clientEmail}</td>
        <td> ${client.clientMobile}</td>
        <td> ${client.clientPoint}</td>
        <c:if test="${sessionScope.loginClientId eq 'admin'}">
            <td><a href="/client/delete?id=${client.id}">삭제</a></td>
        </c:if>
    </tr>
</table>

</body>
</html>
