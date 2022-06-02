<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오전 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        body {
            color: #999;
            background: #f5f5f5;
            font-family: 'Roboto', sans-serif;
        }

        .form-control,
        .form-control:focus{
            border-color: #e1e1e1;
            border-radius: 0;
        }

        .signup-form {
            width: 390px;
            margin: 0 auto;
            padding: 90px 0;
        }

        .signup-form h2 {
            color: #636363;
            margin: 0 0 15px;
            text-align: center;
        }

        .signup-form .lead {
            font-size: 14px;
            margin-bottom: 30px;
            text-align: center;
            font-weight: bolder;
        }

        .signup-form form {
            border-radius: 1px;
            margin-bottom: 15px;
            background: #fff;
            border: 1px solid #f3f3f3;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            padding: 30px;
        }

        .signup-form .form-group {
            margin-bottom: 20px;
        }

        .signup-form label {
            font-weight: normal;
            font-size: 13px;
        }

        .signup-form .form-control {
            min-height: 38px;
            box-shadow: none !important;
            border-width: 0 0 1px 0;
        }

        .signup-form .input-group-addon {
            max-width: 42px;
            text-align: center;
            background: none;
            border-bottom: 1px solid #e1e1e1;
            padding-left: 5px;
        }

        .signup-form .btn,
        .signup-form .btn:active {
            font-size: 16px;
            font-weight: bold;
            background: #34b7a7 !important;
            border-radius: 3px;
            border: none;
            min-width: 140px;
        }

        .signup-form .btn:hover,
        .signup-form .btn:focus {
            background: #179b81 !important;
        }

        .signup-form a {
            color: #19aa8d;
            text-decoration: none;
        }

        .signup-form a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2>client/save.jsp</h2>

<div class="container signup-form text-center">
    <form action="/client/save" method="post" name="cSignUpForm">
        <p class="lead" style="font-weight: bolder;">회원정보를 입력해주세요</p>
        <div class="form-group">
            <input class="form-control" type="text" onblur="duplicateCheck()" id="clientId" name="clientId"
                   placeholder="아이디" required="required">
            <p id="dup-check-result" style="font-size: small"></p>
        </div>
        <div class="form-group">
            <input class="form-control mb-0" type="password" onblur="regExpPw()" id="clientPassword"
                   name="clientPassword" placeholder="비밀번호" required="required">
            <p id="pw-exp-check-result" style="font-size: small"></p>
        </div>
        <div class="form-group">
            <input class="form-control" type="text" name="clientName" placeholder="이름" required="required">
        </div>
        <div class="form-group">
            <input class="form-control" type="text" name="clientEmail" placeholder="이메일">
        </div>
        <div class="form-group">
            <input class="form-control mb-0" type="text" onblur="regExpMo()" id="clientMobile" name="clientMobile"
                   placeholder="전화번호">
            <p id="mo-exp-check-result" style="font-size: small"></p>
        </div>
        <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block btn-lg" onclick="signUp()">Sign up</button>
        </div>
    </form>
    <div class="text-center">Already have an account? <a href="/client/login">Login here</a></div>
</div>
</body>

<script>
    const signUp = () => {
        cSignUpForm.submit();
    }
    const duplicateCheck = () => {
        const clientId = document.getElementById("clientId").value;
        const checkResult = document.getElementById("dup-check-result");
        $.ajax({
            type: "post", // http request method
            url: "/client/duplicate-check", // 요청주소(컨트롤러 주소값)
            data: {"clientId": clientId}, //전송하는 파라미터
            dataType: "text", //리턴받을 데이터 형식
            success: function (result) {
                if (result == "ok") {
                    checkResult.innerText = "사용 가능한 아이디";
                    checkResult.style.color = "green";
                } else {
                    checkResult.innerText = "이미 사용중인 아이디";
                    checkResult.style.color = "red";
                }
            }, error: function () {
                alert("오타체크");
            }
        })
    }

    const regExpPw = () => {
        let clientPassword = document.getElementById("clientPassword").value;
        const pwExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
        const checkResult = document.getElementById("pw-exp-check-result");
        if (!pwExp.test(clientPassword)) {
            checkResult.innerText = "최소 8 자, 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자 입력";
            checkResult.style.color = "red";
        } else {
            checkResult.innerText = "";
        }
    }

    const regExpMo = () => {
        let clientMobile = document.getElementById("clientMobile").value;
        const moExp = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
        const checkResult = document.getElementById("mo-exp-check-result");
        if (!moExp.test(clientMobile)) {
            checkResult.innerText = "전화번호 형식을 확인해주세요";
            checkResult.style.color = "red";
        } else {
            checkResult.innerText = "";
        }
    }
</script>
</html>
