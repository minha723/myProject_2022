<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

    <style>
        .robyn {
            font-family: 'Pacifico', cursive;
            margin-top: -30px;
            margin-left:-140px;
        }

        .search input {
            /*position: absolute;*/
            height: 42px;
            /*width: calc(100%- 50px);*/
            border-radius: 5px 0 0 5px;
            border: 1px solid #ccc;
            padding: 0 13px;
            font-size: 16px;
            outline: none;
            margin-right: -5px;
        }

        .search button {
            width: 47px;
            height: 42px;
            border: none;
            outline: none;
            color: #fff;
            background: #333;
            cursor: pointer;
            font-size: 17px;
            border-radius: 0 5px 5px 0;
        }

        .nav .nav-link {
            color: black;
            font-weight: bold;
            border-color: white;
        }

        .nav .nav-link:hover {
            color: darkgray;
            font-weight: bold;
            border-color: white;
        }

        .nav .nav-link:active {
            color: darkgray;;
            font-weight: bold;
            border-color: white;
            --bs-accordion-active-bg: darkgray;
        }

        .nav .nav-link:focus {
            color: darkgray;;
            font-weight: bold;
            border-color: white;
        }

        .nav-pills {
            padding-top: 14px;
        }

        .nav-pills .left {
            padding-left: 0px;
        }

        .nav-pills .dropdown-toggle {
            padding-left: 0px;
        }

        .nav .dropdown-menu {
            min-width: 6rem;
            text-align: center;
        }
        .category{
            align-self: flex-end;
            font-size: 10px;
        }


    </style>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
            crossorigin="anonymous"></script>
</head>
<body>

<header>
    <h1 class="visually-hidden">Robyn's Market</h1>
    <div class="container">
        <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">

            <a class="nav-link dropdown-toggle fw-bold category " href="#" id="category" role="button"
               data-bs-toggle="dropdown" aria-expanded="false"> <i class="bi bi-list"></i> 전체 카테고리 </a>
            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="category">
                <li><a class="dropdown-item small" href="/product/findAll?productCategory=1">영상·사진·음향</a></li>
                <li><a class="dropdown-item small" href="/product/findAll?productCategory=2">심리상담·운세</a></li>
                <li><a class="dropdown-item small" href="/product/findAll?productCategory=3">문서·글쓰기</a></li>
                <li><a class="dropdown-item small" href="/product/findAll?productCategory=4">디자인</a></li>
                <li><a class="dropdown-item small" href="/product/findAll?productCategory=5">IT·프로그래밍</a></li>
                <li><a class="dropdown-item small" href="/product/findAll?productCategory=6">비지니스컨설팅</a></li>
                <li><a class="dropdown-item small" href="/product/findAll?productCategory=7">취업·입시</a></li>
                <li><a class="dropdown-item small" href="/product/findAll?productCategory=8">마케팅</a></li>
                <li><a class="dropdown-item small" href="/product/findAll?productCategory=9">생활서비스</a></li>
                <li><a class="dropdown-item small" href="/product/findAll?productCategory=0">기타</a></li>
            </ul>

            <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                <span class="fs-4 robyn">Robyn's Market</span>
            </a>


            <ul class="nav nav-pills">
                <%--                <li class="nav-item"><a href="/" class="nav-link active" aria-current="page">Home</a></li>--%>
                <li class="nav-item search">
                    <form action="/product/search" method="get">
                        <input type="text" name="q" placeholder="서비스를 검색해 보세요">
                        <button type="submit"><i class="bi bi-search"></i></button>
                    </form>
                </li>
                    <c:choose>
                    <c:when test="${sessionScope.loginClientId != null}">
                        <li class="nav-item"><a href="/client/update?id=${sessionScope.loginCId}" class="nav-link">회원정보 수정</a></li>

                        <li class="nav-item"><a href="/client/point?id=${sessionScope.loginCId}"
                                                class="nav-link left">포인트충전</a></li>
                        <li class="nav-item"><a href="/client/logout" class="nav-link left">로그아웃</a></li>
                    </c:when>
                    <c:when test="${sessionScope.loginVendorId != null}">
                        <li class="nav-item"><a href="/product/save" class="nav-link">서비스 등록</a></li>
                        <li class="nav-item"><a href="/vendor/update?id=${sessionScope.loginVId}" class="nav-link">회원정보 수정</a></li>
                        <li class="nav-item"><a href="/vendor/logout" class="nav-link left">로그아웃</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item"><a href="/vendor/login" class="nav-link">서비스 등록</a></li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="loginDropbox" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                로그인
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="loginDropbox">
                                <li><a class="dropdown-item small" href="/client/login">고객</a></li>
                                <li><a class="dropdown-item small" href="/vendor/login">전문가</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                회원가입
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                                <li><a class="dropdown-item small" href="/client/save">고객</a></li>
                                <li><a class="dropdown-item small" href="/vendor/save">전문가</a></li>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>

        </header>
    </div>


</header>


<div class="b-example-divider"></div>

</body>

</html>
