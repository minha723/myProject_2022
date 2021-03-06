<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 1:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        .table-container {
            max-width: 800px;
            margin: auto;
            margin: auto;
            border: 1px solid darkgray;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="table-container">

    <table class="table">
        <tr>
            <th>고객 번호</th>
            <th>고객 아이디</th>
            <th>고객 이름</th>
        </tr>

        <c:forEach var="client" items="${clientList}">
            <tr>
                <td> ${client.id} </td>
                <td><a href="/client/detail?id=${client.id}"> ${client.clientId} </a></td>
                <td> ${client.clientName}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>
</html>
