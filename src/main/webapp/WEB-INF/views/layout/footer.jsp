<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-14
  Time: 오전 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/footers/">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <!-- Bootstrap core CSS -->
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        .chat{
            cursor: pointer;
        }
        .ft-sm-size{
            font-size: 0.75rem;
            font-weight: bold;
            color: #9a9ba7;
            text-align: center;
        }

    </style>


    <!-- Custom styles for this template -->
    <link href="footers.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <footer class="py-3 my-4">
        <ul class="nav justify-content-center border-bottom pb-3 mb-3">
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
            <li class="nav-item"><a onclick="chat()" class="nav-link px-2 text-muted chat">1:1 문의</a></li>
        </ul>
        <p class="ft-sm-size text-muted">롸빈마켓은 통신판매중개자이며, 통신판매의 당사자가 아닙니다. 상품, 상품정보, 거래에 관한 의무와 책임은 판매회원에게 있습니다.</p>
        <p class="text-center text-muted ">&copy; 2022 Robyn's Market</p>
    </footer>
</div>

<div class="b-example-divider"></div>

</body>
<script>
    const chat = () => {
        let clientId = '${sessionScope.loginClientId}';
        let vendorId = '${sessionScope.loginVendorId}';
      if(clientId == '' || vendorId == 'admin'){
          alert("로그인 해야 가능한 기능입니다.");
          location.href="/client/login";
        }else {
          location.href="/client/chat";
      }
    }
</script>
</html>
