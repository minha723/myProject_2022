<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 1:39
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
        <form action="/client/update" method="post" name="updateForm">
            <p class="lead" style="font-weight: bolder;">${sessionScope.loginClientId}님의 회원정보</p>
            <input hidden class="form-control mb-2" type="text" name="id" value="${updateClient.id}" readonly>
            <div class="form-floating">
                <input class="form-control mb-2" id="clientId" type="text" name="clientId"
                       value="${updateClient.clientId}" readonly>
                <label for="clientId">아이디</label>
            </div>
            <div class="form-floating">
                <input class="form-control mb-2" type="text" id="pwConfirm" name="clientPassword"
                       placeholder="비밀번호를 입력하세요">
                <label for="pwConfirm">비밀번호</label>
            </div>
            <div class="form-floating">
                 <input id="clientName" class="form-control mb-2" type="text" name="clientName"
                          value="${updateClient.clientName}">
                <label for="clientName">이름</label>
            </div>
            <div class="form-floating">
                <input id="clientEmail" class="form-control mb-2" type="text" name="clientEmail"
                       value="${updateClient.clientEmail}">
                <label for="clientEmail">이메일주소</label>
            </div>
            <div class="form-floating">
                <input id="clientMobile" class="form-control mb-2" type="text" name="clientMobile"
                       value="${updateClient.clientMobile}">
                <label for="clientMobile">전화번호</label>
            </div>
            <div class="form-floating">
                <input id="clientPoint" class="form-control mb-2" type="text" name="clientPoint"
                       value="${updateClient.clientPoint}"
                       readonly>
                <label for="clientPoint">잔여포인트</label>
            </div>
            <input type="button" onclick="clientUpdate()" class="btn btn-secondary" value="정보수정">
            <input type="button" onclick="clientDelete()" class="btn btn-secondary" value="회원탈퇴">
        </form>
    </div>
</div>
</body>

<script>
    const clientUpdate = () => {
        const pwConfirm = document.getElementById("pwConfirm").value;
        const pwDB = '${updateClient.clientPassword}';
        if (pwConfirm == pwDB) {
            updateForm.submit();
        } else {
            alert("비밀번호를 확인해주세요.")
        }
    }
    const clientDelete = () => {
        const pwConfirm = document.getElementById("pwConfirm").value;
        const pwDB = '${updateClient.clientPassword}';
        if (pwConfirm == pwDB) {
            location.href = "/client/delete?id=${updateClient.id}";
        } else {
            alert("비밀번호를 확인해주세요.")
        }
    }
</script>
</html>
