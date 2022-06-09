<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-09
  Time: 오전 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<ul>
    <li onclick="kakaoLogin();">
        <a href="javascript:void(0)">
            <span>카카오 로그인</span>
        </a>
    </li>
    <li onclick="kakaoLogout();">
        <a href="javascript:void(0)">
            <span>카카오 로그아웃</span>
        </a>
    </li>
</ul>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>

    window.Kakao.init("bb7bb13a26ef2108634f4d54a66d6588");

    console.log(Kakao.isInitialized()); // sdk초기화여부판단
    //카카오로그인
    function kakaoLogin() {
        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                        console.log(response)
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
    //카카오로그아웃
    function kakaoLogout() {
        if (Kakao.Auth.getAccessToken()) {
            Kakao.API.request({
                url: '/v1/user/unlink',
                success: function (response) {
                    console.log(response)
                },
                fail: function (error) {
                    console.log(error)
                },
            })
            Kakao.Auth.setAccessToken(undefined)
        }
    }
</script>

</body>
</html>
