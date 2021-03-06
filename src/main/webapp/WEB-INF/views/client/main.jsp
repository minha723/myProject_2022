<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오전 11:44
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

<div class="container text-center">
<button class="btn btn-outline-primary" onclick="logOut()">로그아웃</button>
<button class="btn btn-outline-primary" onclick="update()">회원정보 수정</button>
<c:if test="${sessionScope.loginClientId != null}">
    <button class="btn btn-outline-primary" onclick="point()">포인트 충전</button>
</c:if>
<c:if test="${sessionScope.loginClientId eq 'admin'}">
    <button class="btn btn-outline-primary" onclick="findAllClient()"> 고객목록 보기</button>
    <button class="btn btn-outline-primary" onclick="findAllVendor()"> 전문가목록 보기</button>
</c:if>
</div>

</body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>

    const logOut = () => {
        window.Kakao.init("bb7bb13a26ef2108634f4d54a66d6588");
        if (!Kakao.Auth.getAccessToken()) {
            location.href="/client/logout";
        }
        Kakao.Auth.logout(function(response) {
            alert(response +' logout');
            location.href="/client/logout";
        });
    }

    const findAllClient = () => {
      location.href="/client/findAll";
    }
    const findAllVendor = () => {
        location.href="/vendor/findAll";
    }
    const update = () => {
      location.href="/client/update?id=${sessionScope.loginCId}";
    }

    const point = () => {
      location.href="/client/point?id=${sessionScope.loginCId}";
    }

</script>
</html>
