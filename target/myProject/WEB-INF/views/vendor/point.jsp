<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오후 4:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

${vendor.vendorId} 님의 포인트는 ${vendor.vendorPoint}원 입니다.

<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>
</html>
