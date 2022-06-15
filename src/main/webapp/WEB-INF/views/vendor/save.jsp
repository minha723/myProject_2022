<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 4:29
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
            width: 500px;
            margin: 0 auto;
            padding: 45px 0;
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
            border-radius: 10px;
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
            background: #333 !important;
            border-radius: 3px;
            border: none;
            min-width: 140px;
        }

        .signup-form .btn:hover,
        .signup-form .btn:focus {
            background: darkgray !important;
        }

        .signup-form a {
            color: #333;
            text-decoration: none;
        }

        .signup-form a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="signup-form text-center">
    <form action="/vendor/save" method="post" name="vSignUpForm" enctype="multipart/form-data">
        <p class="lead" style="font-weight: bolder;">전문가님 정보를 입력해주세요</p>
        <div class="form-group">
            <input class="form-control" type="text" onblur="duplicateCheck()" id="vendorId" name="vendorId"
                   placeholder="아이디" required="required">
            <p id="dup-check-result" style="font-size: small"></p>
        </div>
        <div class="form-group">
            <input class="form-control mb-0" type="password" onblur="regExpPw()" id="vendorPassword"
                   name="vendorPassword" placeholder="비밀번호" required="required">
            <p id="pw-exp-check-result" style="font-size: small"></p>
        </div>
        <div class="form-group">
            <input class="form-control" type="text" name="vendorName" placeholder="이름" required="required">
        </div>
        <div class="form-group">
            <input class="form-control" type="text" name="vendorEmail" placeholder="이메일">
        </div>
        <div class="form-group">
            <input class="form-control mb-0" type="text" onblur="regExpMo()" id="vendorMobile" name="vendorMobile"
                   placeholder="전화번호">
            <p id="mo-exp-check-result" style="font-size: small"></p>
        </div>
        <div class="form-group">
            <input class="form-control mb-0" type="file" onblur="regExpMo()" name="vendorFile">
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block btn-lg" onclick="signUp()">Sign up</button>
        </div>
    </form>
    <div class="text-center">Already have an account? <a href="/vendor/login">Login here</a></div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>

<script>
    const signUp = () => {
        vSignUpForm.submit();
    }
    const duplicateCheck = () => {
        const vendorId = document.getElementById("vendorId").value;
        const checkResult = document.getElementById("dup-check-result");
        $.ajax({
            type: "post", // http request method
            url: "/vendor/duplicate-check", // 요청주소(컨트롤러 주소값)
            data: {"vendorId": vendorId}, //전송하는 파라미터
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
        let vendorPassword = document.getElementById("vendorPassword").value;
        const pwExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
        const checkResult = document.getElementById("pw-exp-check-result");
        if (!pwExp.test(vendorPassword)) {
            checkResult.innerText = "최소 8 자, 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자 입력";
            checkResult.style.color = "red";
        } else {
            checkResult.innerText = "";
        }
    }

    const regExpMo = () => {
        let vendorMobile = document.getElementById("vendorMobile").value;
        const moExp = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
        const checkResult = document.getElementById("mo-exp-check-result");
        if (!moExp.test(vendorMobile)) {
            checkResult.innerText = "전화번호 형식을 확인해주세요";
            checkResult.style.color = "red";
        } else {
            checkResult.innerText = "";
        }
    }
</script>
</html>
