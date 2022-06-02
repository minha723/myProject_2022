<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오전 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<h2>main</h2>

<button class="btn btn-outline-primary" onclick="logOut()">로그아웃</button>

</body>
<script>
    const logOut = () => {
     location.href="/client/logout";
    }
</script>
</html>
