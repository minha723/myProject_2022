<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 9:24
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
            <th>전문가 번호</th>
            <th>전문가 아이디</th>
            <th>전문가 이름</th>
        </tr>

        <c:forEach var="vendor" items="${vendorList}">
            <tr>
                <td> ${vendor.id} </td>
                <td><a href="/vendor/detail?id=${vendor.id}"> ${vendor.vendorId} </a></td>
                <td> ${vendor.vendorName}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>
</html>
