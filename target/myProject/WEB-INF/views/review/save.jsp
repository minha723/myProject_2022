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
        .form-control:focus {
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

        .custom-select{
            min-width: border-box;
        }
    </style>
</head>
<body>

<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="signup-form text-center">
    <form action="/review/save" method="post">
        <p class="lead" style="font-weight: bolder;">상품 후기를 입력해주세요</p>
        <input type="text" hidden="hidden" name="productId" value="${product.id}">
        <div class="form-group">
            <input class="form-control" type="text" name="clientId"
                   value="${sessionScope.loginClientId}" readonly>
        </div>
        <div class="form-group">
            <input class="form-control" type="text" value="${product.productName}" readonly>
        </div>
        <div class="form-group form-floating">
            <textarea class="form-control" id="reviewContents" name="reviewContents" required="required"></textarea>
            <label for="reviewContents">상품후기</label>
        </div>
        <div class="form-group input-group mb-3">
            <div class="input-group-prepend">
                <label class="input-group-text" for="reviewStar">상품별점</label>
            </div>
            <select class="custom-select" id="reviewStar" name="reviewStar">
                <option selected>점수 선택</option>
                <option value="1">1점</option>
                <option value="2">2점</option>
                <option value="3">3점</option>
                <option value="4">4점</option>
                <option value="5">5점</option>
            </select>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block btn-lg">상품 후기 작성</button>
        </div>

    </form>
</div>
</body>

</html>
