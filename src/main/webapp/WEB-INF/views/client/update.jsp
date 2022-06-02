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
</head>
<body>
<h2>client/update.jsp</h2>

<div class="container">
    <div class="py-5 text-center">
        <form action="/client/update" method="post" name="updateForm">
            <input hidden class="form-control mb-2" type="text" name="id" value="${updateClient.id}" readonly><br>
            clientId: <input class="form-control mb-2" type="text" name="clientId" value="${updateClient.clientId}" readonly><br>
            clientPassword: <input class="form-control mb-2" type="text" id="pwConfirm" name="clientPassword" placeholder="비밀번호를 입력하세요" ><br>
            clientName: <input class="form-control mb-2" type="text" name="clientName" value="${updateClient.clientName}"><br>
            clientEmail: <input class="form-control mb-2" type="text" name="clientEmail" value="${updateClient.clientEmail}"><br>
            clientMobile: <input class="form-control mb-2" type="text" name="clientMobile" value="${updateClient.clientMobile}"><br>
            <input type="button" onclick="clientUpdate()" class="btn btn-primary" value="정보수정">
            <input type="button" onclick="clientDelete()" class="btn btn-primary" value="회원탈퇴">
        </form>
    </div>
</div>
</body>

<script>
    const clientUpdate = () => {
        const pwConfirm = document.getElementById("pwConfirm").value;
        const pwDB = '${updateClient.clientPassword}';
        if(pwConfirm == pwDB){
            updateForm.submit();
        }else {
            alert("비밀번호를 확인해주세요.")
        }
    }
    const clientDelete = () => {
        const pwConfirm = document.getElementById("pwConfirm").value;
        const pwDB = '${updateClient.clientPassword}';
        if(pwConfirm == pwDB){
            location.href="/member/delete?id=${updateClient.id}";
        }else {
            alert("비밀번호를 확인해주세요.")
        }
    }
</script>
</html>
