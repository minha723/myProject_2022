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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>    <script src="/resources/js/jquery.js"></script>
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

    <script>
        $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').trigger('focus')
        })
    </script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
    Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">--%>
<%--    Launch demo modal--%>
<%--</button>--%>

<%--<!-- Modal -->--%>
<%--<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                ...--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
<%--                <button type="button" class="btn btn-primary">Save changes</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<div class="container signup-form text-center">
    <form action="/client/save" method="post" name="cSignUpForm">
        <p class="lead" style="font-weight: bolder;">이 정보만 입력하면 회원가입 끝!</p>
        <div class="form-group">
            <input class="form-control" type="text" onblur="duplicateCheck()" id="clientId" name="clientId"
                   placeholder="닉네임" required="required">
            <p id="dup-check-result" style="font-size: small"></p>
        </div>
        <input hidden class="form-control" type="text" name="clientPassword" value="${kakaoId}" >
        <input hidden class="form-control" type="text" name="clientKakaoId" value="${kakaoId}">
        <div class="form-group">
            <input class="form-control" type="text" name="clientName" placeholder="이름" required="required">
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

</script>
</html>
