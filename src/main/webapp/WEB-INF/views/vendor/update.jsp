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
    <style>
        .update-form {
            max-width: 400px;
            padding: 20px;
            border-radius: 12px;
            border: 1px solid darkgray;
            margin: auto;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="update-form">
    <div class="py-3 text-center">
        <form action="/vendor/update" method="post" name="vUpdateForm">
            <p class="lead" style="font-weight: bolder;">${sessionScope.loginVendorId} 전문가님의 회원정보</p>
            <input hidden class="form-control mb-2" type="text" name="id" value="${updateVendor.id}" readonly>
            <div class="form-floating">
                <input class="form-control mb-2" id="vendorId" type="text" name="vendorId"
                       value="${updateVendor.vendorId}" readonly>
                <label for="vendorId">아이디</label>
            </div>
            <div class="form-floating">
                <input class="form-control mb-2" type="text" id="pwConfirm" name="vendorPassword"
                       placeholder="비밀번호를 입력하세요">
                <label for="pwConfirm">비밀번호</label>
            </div>
            <div class="form-floating">
                <input id="vendorName" class="form-control mb-2" type="text" name="vendorName"
                       value="${updateVendor.vendorName}">
                <label for="vendorName">이름</label>
            </div>
            <div class="form-floating">
                <input id="vendorEmail" class="form-control mb-2" type="text" name="vendorEmail"
                       value="${updateVendor.vendorEmail}">
                <label for="vendorEmail">이메일주소</label>
            </div>
            <div class="form-floating">
                <input id="vendorMobile" class="form-control mb-2" type="text" name="vendorMobile"
                       value="${updateVendor.vendorMobile}">
                <label for="vendorMobile">전화번호</label>
            </div>
            <div class="form-floating">
                <input id="vendorPoint" class="form-control mb-2" type="text" name="vendorPoint"
                       value="${updateVendor.vendorPoint}"
                       readonly>
                <label for="vendorPoint">잔여포인트</label>
            </div>
            <input type="button" onclick="vendorUpdate()" class="btn btn-secondary" value="정보수정">
            <input type="button" onclick="vendorDelete()" class="btn btn-secondary" value="회원탈퇴">
        </form>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

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
