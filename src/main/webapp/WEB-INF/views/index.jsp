<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-31
  Time: 오후 4:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    <style>
        body {
            background: #ebebeb;
            font-family: "Open Sans", sans-serif;
        }

        .carousel {
            margin: 30px auto 60px;
            padding: 0 80px;
        }

        .carousel .carousel-item {
            text-align: center;
            overflow: hidden;
        }

        .carousel .carousel-item h4 {
            font-family: 'Varela Round', sans-serif;
        }

        .carousel .carousel-item img {
            max-width: 100%;
            display: inline-block;
        }

        .carousel .carousel-item .btn {
            border-radius: 0;
            font-size: 12px;
            text-transform: uppercase;
            font-weight: bold;
            border: none;
            background: #333;
            padding: 6px 15px;
            margin-top: 5px;
        }

        .carousel .carousel-item .btn:hover {
            background: lightgray;
        }

        .carousel .carousel-item .btn i {
            font-size: 14px;
            font-weight: bold;
            margin-left: 5px;
        }

        .carousel .thumb-wrapper {
            margin: 5px;
            text-align: left;
            background: #fff;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
        }

        .carousel .thumb-wrapper .img-fluid {
            height: 239.19px;

        }

        .carousel .thumb-content {
            padding: 15px;
            font-size: 13px;
        }

        .carousel-control-prev, .carousel-control-next {
            height: 44px;
            width: 44px;
            background: none;
            margin: auto 0;
            border-radius: 50%;
            border: 3px solid rgba(0, 0, 0, 0.8);
        }

        .carousel-control-prev i, .carousel-control-next i {
            font-size: 36px;
            position: absolute;
            top: 50%;
            display: inline-block;
            margin: -19px 0 0 0;
            z-index: 5;
            left: 0;
            right: 0;
            color: rgba(0, 0, 0, 0.8);
            text-shadow: none;
            font-weight: bold;
        }

        .carousel-control-prev i {
            margin-left: -3px;
        }

        .carousel-control-next i {
            margin-right: -3px;
        }

        .carousel-indicators {
            bottom: -50px;
            margin-bottom: -20px;
        }

        .carousel-indicators li, .carousel-indicators li.active {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            margin: 4px;
            border: none;
        }

        .carousel-indicators li {
            background: #ababab;
        }

        .carousel-indicators li.active {
            background: #555;
        }

        .carousel .indicator{
            margin-bottom: -20px;
        }

    </style>
</head>
<body>
<jsp:include page="./layout/header.jsp" flush="false"></jsp:include>

<div class="container-xl">
    <div class="row">
        <div class="col-md-10 mx-auto">
            <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="0">
                <!-- Carousel indicators -->
                <ol class="carousel-indicators indicator">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <!-- Wrapper for carousel items -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="thumb-wrapper">
                                    <div class="img-box">
                                        <img src="https://littledeep.com/wp-content/uploads/2019/04/littledeep_illustration_camera_style1.png"
                                             class="img-fluid" alt="">
                                    </div>
                                    <div class="thumb-content">
                                        <h4>영상·사진·음향</h4>
                                        <p>등록된 서비스를 확인해보세요.</p>
                                        <a href="/product/findAll?productCategory=1" class="btn btn-primary">서비스 보기<i
                                                class="fa fa-angle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="thumb-wrapper">
                                    <div class="img-box">
                                        <img src="https://img.freepik.com/free-vector/psychotherapy-session-patient-having-individual-psychological-therapy-and-counseling-with-therapist_505573-2.jpg?w=2000"
                                             class="img-fluid" alt="">
                                    </div>
                                    <div class="thumb-content">
                                        <h4>심리상담·운세</h4>
                                        <p>등록된 서비스를 확인해보세요.</p>
                                        <a href="/product/findAll?productCategory=2" class="btn btn-primary">서비스 보기<i
                                                class="fa fa-angle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="thumb-wrapper">
                                    <div class="img-box">
                                        <img src="https://us.123rf.com/450wm/vladwel/vladwel1606/vladwel160600265/59051079-%ED%8E%9C%EC%9C%BC%EB%A1%9C-%EB%B9%84%EC%A6%88%EB%8B%88%EC%8A%A4-%EC%82%AC%EB%9E%8C-%EC%86%90%EC%9D%84-%EC%9E%A1%EA%B3%A0-%EA%B3%84%EC%95%BD-%EA%B3%84%EC%95%BD-%EB%B2%A1%ED%84%B0-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8-%EB%A0%88%EC%9D%B4-%EC%85%98-%EC%84%9C%EB%AA%85-%EB%90%9C-%EC%A1%B0%EC%95%BD-%EC%A2%85%EC%9D%B4-%EC%8A%A4%ED%83%AC%ED%94%84-%EB%B2%95%EB%A5%A0-%EB%AC%B8%EC%84%9C-%EA%B8%B0%ED%98%B8-%EB%85%B9%EC%83%89-%EB%B0%B0%EA%B2%BD%EC%97%90-%EA%B3%A0%EB%A6%BD-%EB%90%9C-%EB%AC%B8%EC%84%9C-%ED%8F%89%EB%A9%B4-%EA%B8%B0%ED%98%B8-%ED%98%84%EB%8C%80%EC%A0%81%EC%9D%B8-%EB%94%94%EC%9E%90%EC%9D%B8.jpg?ver=6"
                                             class="img-fluid" alt="">
                                    </div>
                                    <div class="thumb-content">
                                        <h4>문서·글쓰기</h4>
                                        <p>등록된 서비스를 확인해보세요.</p>
                                        <a href="/product/findAll?productCategory=3" class="btn btn-primary">서비스 보기<i
                                                class="fa fa-angle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="carousel-item">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="thumb-wrapper">
                                    <div class="img-box">
                                        <img src="https://png.pngtree.com/element_our/20190601/ourmid/pngtree-designer-drawing-design-boy-character-material-image_1363988.jpg"
                                             class="img-fluid" alt="">
                                    </div>
                                    <div class="thumb-content">
                                        <h4>디자인</h4>
                                        <p>등록된 서비스를 확인해보세요.</p>
                                        <a href="/product/findAll?productCategory=4" class="btn btn-primary">서비스 보기<i
                                                class="fa fa-angle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="thumb-wrapper">
                                    <div class="img-box">
                                        <img src="https://t1.daumcdn.net/cfile/tistory/263E8C4D575E46BA28"
                                             class="img-fluid" alt="">
                                    </div>
                                    <div class="thumb-content">
                                        <h4>IT·프로그래밍</h4>
                                        <p>등록된 서비스를 확인해보세요.</p>
                                        <a href="/product/findAll?productCategory=5" class="btn btn-primary">서비스 보기<i
                                                class="fa fa-angle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="thumb-wrapper">
                                    <div class="img-box">
                                        <img src="https://us.123rf.com/450wm/macrovector/macrovector1601/macrovector160100212/50340720-%ED%9A%8C%EC%9D%98-%EB%B9%84%EC%A6%88%EB%8B%88%EC%8A%A4-%EA%B5%90%EC%9C%A1-%EB%B0%8F-%EC%84%B1%EA%B3%B5-%EB%B2%A1%ED%84%B0-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8-%EB%A0%88%EC%9D%B4-%EC%85%98%EC%9D%84-consultating%ED%95%98%EC%97%AC-%EB%B9%84%EC%A6%88%EB%8B%88%EC%8A%A4-%EA%B5%90%EC%9C%A1%EC%9D%98-%EC%A7%91%ED%95%A9-%ED%94%8C%EB%9E%AB-2-%C3%97-%EC%9D%B4%EB%AF%B8%EC%A7%80.jpg?ver=6"
                                             class="img-fluid" alt="">
                                    </div>
                                    <div class="thumb-content">
                                        <h4>비지니스컨설팅</h4>
                                        <p>등록된 서비스를 확인해보세요.</p>
                                        <a href="/product/findAll?productCategory=6" class="btn btn-primary">서비스 보기<i
                                                class="fa fa-angle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="thumb-wrapper">
                                    <div class="img-box">
                                        <img src="https://www.urbanbrush.net/web/wp-content/uploads/edd/2021/05/urbanbrush-20210514132004845628.jpg"
                                             class="img-fluid" alt="">
                                    </div>
                                    <div class="thumb-content">
                                        <h4>취업·입시</h4>
                                        <p>등록된 서비스를 확인해보세요.</p>
                                        <a href="/product/findAll?productCategory=7" class="btn btn-primary">서비스 보기<i
                                                class="fa fa-angle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="thumb-wrapper">
                                    <div class="img-box">
                                        <img src="https://media.istockphoto.com/vectors/refer-a-friend-vector-illustration-concept-group-of-young-man-and-vector-id1146517993?k=20&m=1146517993&s=170667a&w=0&h=OYB-d4cR8wsf5RX1AJVj_B9u6eCnBDwB55fu3UKHaWg="
                                             class="img-fluid" alt="">
                                    </div>
                                    <div class="thumb-content">
                                        <h4>마케팅</h4>
                                        <p>등록된 서비스를 확인해보세요.</p>
                                        <a href="/product/findAll?productCategory=8" class="btn btn-primary">서비스 보기<i class="fa fa-angle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="thumb-wrapper">
                                    <div class="img-box">
                                        <img src="https://img.freepik.com/free-vector/set-scenes-of-cleaning-service-workers-of-cleaning-service-with-equipments-illustration-design_24877-66863.jpg?w=2000"
                                             class="img-fluid" alt="">
                                    </div>
                                    <div class="thumb-content">
                                        <h4>생활서비스</h4>
                                        <p>등록된 서비스를 확인해보세요.</p>
                                        <a href="/product/findAll?productCategory=9" class="btn btn-primary">서비스 보기<i class="fa fa-angle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Carousel controls -->
                <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                    <i class="fa fa-angle-left"></i>
                </a>
                <a class="carousel-control-next" href="#myCarousel" data-slide="next">
                    <i class="fa fa-angle-right"></i>
                </a>
            </div>
        </div>
    </div>
</div>
<br>
<div class="container text-center">
</div>

<jsp:include page="./layout/footer.jsp" flush="false"></jsp:include>

</body>
<script>

    const chat = () => {
      location.href = "/client/chat";
    }
    const approveList = () => {
        location.href = "/product/approveList";
    }
    const cSignUp = () => {
        location.href = "/client/save";
    }
    const cLogIn = () => {
        location.href = "/client/login";
    }
    const vSignUp = () => {
        location.href = "/vendor/save";
    }
    const vLogIn = () => {
        location.href = "/vendor/login";

    }
    const findAllProduct = () => {
        location.href = "/product/findAll";
    }
    const findLikeProduct = () => {
        location.href = "/product/like?clientId=${sessionScope.loginClientId}";
    }
    const findHistory = () => {
        location.href = "/product/history?clientId=${sessionScope.loginClientId}";
    }
    const saveProduct = () => {
        location.href = "/product/save";
    }
    const vLogOut = () => {
        location.href = "/vendor/logout";
    }
    const cLogOut = () => {
        location.href = "/client/logout";
    }
    const findPoint = () => {
        location.href = "/vendor/point?id=${sessionScope.loginVId}";
    }
    const kakaoSignup = () => {
        location.href = "/client/kakaoSignup";
    }

</script>
</html>
