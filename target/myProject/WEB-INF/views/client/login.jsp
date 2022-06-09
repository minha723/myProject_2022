<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오전 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Title</title>
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
        }

        .m-login .form-control:focus {
            border-color: #333;
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
            margin: 10px -20px -20px;
            border-radius: 5px;
            font-size: 13px;
        }

        .m-login .m-footer a {
            color: #999;
        }

        /*.m-login .avatar {*/
        /*    position: absolute;*/
        /*    margin: 0 auto;*/
        /*    left: 0;*/
        /*    right: 0;*/
        /*    top: -70px;*/
        /*    width: 95px;*/
        /*    height: 95px;*/
        /*    border-radius: 50%;*/
        /*    z-index: 9;*/
        /*    background: #34b7a7;*/
        /*    padding: 15px;*/
        /*    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);*/
        /*}*/

        .m-login.m-dialog {
            margin-top: 30px;
        }

        .m-login .btn,
        .m-login .btn:active {
            color: #fff;
            border-radius: 4px;
            background: #333 !important;
            text-decoration: none;
            transition: all 0.4s;
            line-height: normal;
            border: none;
            height: 47px;
            width: 222px;
        }

        .m-login .btn:hover,
        .m-login .btn:focus {
            background: #333 !important;
            outline: none;
        }

        .ava {
            font-size: 60px;
            position: relative;
            left: 9px;
            top: -10px;
            color: #fff;
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

        .api-btn{
            margin-top: 10px;
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

                <form action="/client/login" method="post" name="cLoginForm">
                    <div class="form-group">
                            <input type="text" class="form-control" name="clientId" placeholder="아이디" required="required">
                    </div>
                    <div class="form-group">
                            <input type="password" class="form-control" name="clientPassword" placeholder="비밀번호" required="required">
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary btn-lg btn-block login-btn" onclick="cLogin()" style="font-weight: bolder;"><p style="color: white;">로그인</p></button>
                    </div>
                </form>
<%--                <a class="btn-outline-primary" href="/client/kakaoLogin">카카오</a>--%>
                <a id="custom-login-btn" href="javascript: kakaoLogin();"><img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" alt="카카오 로그인 버튼" width="222" height="50" ></a>
                <button class="api-btn" onclick="kakaoLogout()">카카오 로그아웃</button>
                <button class="api-btn" onclick="kakaoDelete()">카카오 탈퇴</button>
            </div>

            <div class="m-footer">
                <a href="#">Forgot Password?</a>
                <a href="/client/save">Don't have an account?</a>
            </div>

        </div>
    </div>
</div>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>

    window.Kakao.init("bb7bb13a26ef2108634f4d54a66d6588");

    console.log(Kakao.isInitialized()); // sdk초기화여부판단
    function kakaoLogin() {
        Kakao.Auth.login({
            scope: 'profile_nickname,account_email',
            success: function (response) {
                console.log(response)
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (res) {
                        console.log(res);
                        const kakao_id = res.id;
                        const kakao_account = res.kakao_account;
                        const kakao_account_email = res.kakao_account.email;
                        console.log(kakao_id);
                        console.log(kakao_account);
                        console.log(kakao_account_email);
                    },
                    fail: function (error) {
                        console.log(error)
                    },
                })
            },
            fail: function (error) {
                console.log(error)
            },
        })
    }

    function kakaoLogout() {
        if (!Kakao.Auth.getAccessToken()) {
            console.log('Not logged in.');
            return;
        }
        Kakao.Auth.logout(function(response) {
            alert(response +' logout');
            window.location.href='/'
        });
    }

    function kakaoDelete() {
        Kakao.API.request({
            url: '/v1/user/unlink',
            success: function(response) {
                console.log(response);
                //callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
                window.location.href='/'
            },
            fail: function(error) {
                console.log('탈퇴 미완료')
                console.log(error);
            },
        });
    };

</script>

</body>
<script>
    const cLogin = () => {
        cLoginForm.submit();
    }
</script>
</html>
