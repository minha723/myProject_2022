<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-07
  Time: 오전 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
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
            width: 800px;
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
            border-radius: 8px;
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
            color: #19aa8d;
            text-decoration: none;
        }

        .signup-form a:hover {
            text-decoration: underline;
        }
        .ft-sm-size{
            font-size: 0.75rem;
            font-weight: bold;
            color: #9a9ba7;
            text-align: center;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="signup-form text-center">
    <form action="/product/update" method="post" name="pUpdateForm">
        <p class="lead" style="font-weight: bolder;">수정 정보를 입력해주세요</p>
        <input type="text" hidden="hidden" name="id" value="${updateProduct.id}">
        <input type="text" hidden="hidden" name="productStar" value="${updateProduct.productStar}">
        <div class="form-group">
            <input class="form-control" type="text" id="vendorId" name="vendorId"
                   value="${sessionScope.loginVendorId}" readonly>
        </div>
        <div class="form-group form-floating">
            <input class="form-control" type="text" id="pwConfirm">
            <label for="pwConfirm">비밀번호를 입력해주세요</label>
        </div>
        <div class="form-group form-floating">
            <input class="form-control" type="text" id="productName"
                   name="productName" value="${updateProduct.productName}">
            <label for="productName">상품이름</label>
        </div>
        <div class="form-group form-floating">
            <textarea class="form-control" id="productDesc" name="productDesc">${updateProduct.productDesc}</textarea>
            <label for="productDesc">상품설명</label>
        </div>
        <div class="form-group form-floating">
            <input class="form-control" type="text" id="productPrice"
                   name="productPrice" value="${updateProduct.productPrice}">
            <label for="productPrice">상품가격</label>
        </div>
        <div class="form-group">
            <img src="${pageContext.request.contextPath}/productUpload/${updateProduct.productFileName}" alt="img" width="100"
                 height="100" class="mb-2">
        </div>

        <div class="form-group">
            <input type="button" onclick="productUpdate()" class="btn btn-primary" value="수정">
            <input type="button" onclick="productDelete()" class="btn btn-primary" value="상품삭제">
        </div>
    </form>
    <div class="text-center ft-sm-size">상품 승인은 영업일 기준 1-2일 소요됩니다.</div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>

<script>
    const productUpdate = () => {
        const pwConfirm = document.getElementById("pwConfirm").value;
        const pwDB = '${updateVendor.vendorPassword}';
        if (pwConfirm == pwDB) {
            pUpdateForm.submit();
        } else {
            alert("비밀번호를 확인해주세요.")
        }
    }
    const productDelete = () => {
        const pwConfirm = document.getElementById("pwConfirm").value;
        const pwDB = '${updateVendor.vendorPassword}';
        if (pwConfirm == pwDB) {
            location.href = "/product/delete?id=${updateProduct.id}";
        } else {
            alert("비밀번호를 확인해주세요.")
        }
    }
</script>
</body>
</html>
