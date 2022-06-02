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
<h2>main</h2>

<button class="btn btn-outline-primary" onclick="logOut()">로그아웃</button>
<button class="btn btn-outline-primary" onclick="update()">회원정보 수정</button>
<c:if test="${sessionScope.loginClientId eq 'admin'}">
    <button class="btn btn-outline-primary" onclick="findAllClient()"> 고객목록 보기</button>
</c:if>
</body>
<script>
    const logOut = () => {
     location.href="/client/logout";
    }

    const findAllClient = () => {
      location.href="/client/findAll";
    }

    const update = () => {
      location.href="/client/update?id=${sessionScope.loginCId}";
    }
</script>
</html>
