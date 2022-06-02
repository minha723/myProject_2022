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
</head>
<body>
    <h2>client/list.jsp</h2>

    <table class="table">

        <tr>
            <th>id</th>
            <th>clientId</th>
            <th>clientName</th>
        </tr>

        <c:forEach var="client" items="${clientList}">
            <tr>
                <td> ${client.id} </td>
                <td><a href="/client/detail?id=${client.id}"> ${client.clientId} </a></td>
                <td> ${client.clientName}</td>
            </tr>
        </c:forEach>

    </table>

</body>
</html>