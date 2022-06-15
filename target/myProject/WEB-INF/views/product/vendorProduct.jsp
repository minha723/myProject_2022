<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 11:32
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

<div class="container">
    <table class="table table-hover">
        <tr>
            <th>상품번호</th>
            <th>상품이름</th>
            <th>상품평점</th>
            <th>전문가</th>
        </tr>

        <c:forEach var="product" items="${productList}">
            <c:if test="${sessionScope.loginVendorId eq product.vendorId}">
                <tr>
                    <td> ${product.id} </td>
                    <td><a href="/product/detail?page=${paging.page}&id=${product.id}"> ${product.productName}</td>
                    <td>${product.productStar}</td>
                    <td>${product.vendorId}</td>
                </tr>
            </c:if>
        </c:forEach>

    </table>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>
</html>
