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
        <c:when test="${sessionScope.loginId != null}">
            <button class="btn btn-outline-success" onclick="findAllProduct()">목록</button>
        </c:when>
        <c:otherwise>
            <button class="btn btn-outline-success" onclick="cSignUp()">고객 회원가입</button>
            <button class="btn btn-outline-success" onclick="vSignUp()">전문가 회원가입</button>
            <button class="btn btn-outline-success" onclick="cLogIn()">고객 로그인</button>
            <button class="btn btn-outline-success" onclick="vLogIn()">전문가 로그인</button>
            <button class="btn btn-outline-success" onclick="findAllProduct()">목록</button>
        </c:otherwise>
    </c:choose>
</div>
</body>
<script>
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

    }
</script>
</html>
