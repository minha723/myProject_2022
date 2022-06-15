<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오전 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        .width{
            max-width: 700px;
            margin: auto;
        }
    </style>
</head>

<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<table class="table width">
    <tr>
        <th>상품 이름</th>
        <th>상품 설명</th>
        <th>상품 가격</th>
        <th>상품 별점</th>
        <th>상품 판매자</th>
    </tr>
    <c:forEach var="product" items="${productList}">
        <tr>
            <td><a href="/product/detail?id=${product.id}"> ${product.productName} </a></td>
            <td> ${product.productDesc} </td>
            <td> ${product.productPrice}원</td>
            <td> ${product.productStar}</td>
            <td> ${product.vendorId}</td>
        </tr>
    </c:forEach>

</table>

<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>
</html>
