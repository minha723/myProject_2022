<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <script src="/resources/js/jquery.js"></script>

    <style>
        body {
            font-family: 'Varela Round', sans-serif;
        }

        .m-login {
            color: #636363;
            width: 350px;
        }

        .m-login .m-content {
            padding: 20px;
            border-radius: 5px;
            border: none;
        }

        .m-login .m-header {
            border-bottom: none;
            position: relative;
            justify-content: center;
        }

        .m-login h4 {
            text-align: center;
            font-size: 26px;
            margin: 30px 0 2px;
        }

        .m-login .form-control:focus {
            border-color: #70c5c0;
        }

        .m-login .form-control,
        .m-login .btn {
            min-height: 40px;
            border-radius: 3px;
        }

        .m-login .m-footer {
            background: #ecf0f1;
            border-color: #dee4e7;
            text-align: center;
            justify-content: center;
            margin: 0 -20px -20px;
            border-radius: 5px;
            font-size: 13px;
        }

        .m-login .m-footer a {
            color: #999;
        }

        .m-login.m-dialog {
            margin-top: 80px;
        }

        .m-login .btn,
        .m-login .btn:active {
            color: #fff;
            border-radius: 4px;
            background: #34b7a7 !important;
            text-decoration: none;
            transition: all 0.4s;
            line-height: normal;
            border: none;
        }

        .m-login .btn:hover,
        .m-login .btn:focus {
            background: #34b7a7 !important;
            outline: none;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group .form-control {
            min-height: 38px;
            box-shadow: none !important;
            border-width: 0 0 1px 0;
        }

        .login-form {
            width: 390px;
            margin: 0 auto;
            padding: 0;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="m text-center login-form">
    <div class="m-dialog m-login">
        <div class="m-content">

            <div class="m-header">
                <h4 class="m-title">로그인</h4>
            </div>

            <div class="m-body">

                <form action="/vendor/login" method="post" name="vLoginForm">
                    <div class="form-group">
                        <input type="text" class="form-control" name="vendorId" placeholder="아이디" required="required">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="vendorPassword" placeholder="비밀번호" required="required">
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary btn-lg btn-block login-btn" onclick="vLogin()" style="font-weight: bolder;"><p style="color: white;">로그인</p></button>
                    </div>
                </form>

            </div>

            <div class="m-footer">
                <a href="#">Forgot Password?</a>
                <a href="/vendor/save">Don't have an account?</a>
            </div>

        </div>
    </div>
</div>
</body>
<script>
    const vLogin = () => {
        vLoginForm.submit();
    }
</script>
</html>
