<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">

</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="container">
    <div class="py-5 text-center">
        <form action="/vendor/update" method="post" name="vUpdateForm">
            <input hidden class="form-control mb-2" type="text" name="id" value="${updateVendor.id}" readonly>
            <input class="form-control mb-2" type="text" name="vendorId" value="${updateVendor.vendorId}" readonly>
            <input class="form-control mb-2" type="text" id="pwConfirm" name="vendorPassword" placeholder="비밀번호를 입력하세요">
            <input class="form-control mb-2" type="text" name="vendorName" value="${updateVendor.vendorName}">
            <input class="form-control mb-2" type="text" name="vendorEmail" value="${updateVendor.vendorEmail}">
            <input class="form-control mb-2" type="text" name="vendorMobile" value="${updateVendor.vendorMobile}">
<%--            <input hidden class="form-control mb-2" type="text" name="vendorFileName" value="${updateVendor.vendorFileName}">--%>
<%--            <img src="${pageContext.request.contextPath}/upload/${updateVendor.vendorFileName}" alt="img" width="100"--%>
<%--                 height="100" class="mb-2">--%>
<%--            <input type="file" class="form-control mb-2" name="vendorFile">--%>
            <input type="button" onclick="vendorUpdate()" class="btn btn-primary" value="정보수정">
            <input type="button" onclick="vendorDelete()" class="btn btn-primary" value="회원탈퇴">
        </form>
    </div>
</div>
</body>

<script>
    const vendorUpdate = () => {
        const pwConfirm = document.getElementById("pwConfirm").value;
        const pwDB = '${updateVendor.vendorPassword}';
        if (pwConfirm == pwDB) {
            vUpdateForm.submit();
        } else {
            alert("비밀번호를 확인해주세요.")
        }
    }
    const vendorDelete = () => {
        const pwConfirm = document.getElementById("pwConfirm").value;
        const pwDB = '${updateVendor.vendorPassword}';
        if (pwConfirm == pwDB) {
            location.href = "/vendor/delete?id=${updateVendor.id}";
        } else {
            alert("비밀번호를 확인해주세요.")
        }
    }
</script>
</html>
