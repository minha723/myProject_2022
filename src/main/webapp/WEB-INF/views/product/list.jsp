<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        .product-list {
            padding-bottom: 10px;
            max-width: 900px;
            margin-left: 400px;
        }


        .small {
            color: #51585e;
        }

        .product-list a {
            background-color: transparent;
            text-decoration: none;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="container text-end center">
    <button class="btn btn-sm" onclick="starList()">별점순으로 목록보기</button>
</div>

<div class="product-list">

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="product" items="${productList}">
            <div class="col table-hover">
                <div class="card"><a href="/product/detail?page=${paging.page}&id=${product.id}">
                    <img src="${pageContext.request.contextPath}/productUpload/${product.productFileName}"
                         class="card-img-top"
                         alt="..." width="216" height="162" loading="lazy">
                    <div class="card-body">
                        <p class="card-text small">${product.vendorId}</p>
                        <h5 class="card-title fw-bold text-black">${product.productName}</h5>
                        <p class="card-text text-end text-black">${product.productPrice}원</p>
                        <p class="card-text text-end small">별점: ${product.productStar}점</p>
                    </div>
                </a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


<div class="container">
    <ul class="pagination justify-content-center">
        <c:choose>
            <c:when test="${paging.page<=1}">
                <li class="page-item disabled">
                    <a class="page-link">[이전]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <c:choose>
                        <c:when test="${star eq 'star'}">
                            <a class="page-link" href="/product/findAllStar?page=${paging.page-1}">[이전]</a>
                        </c:when>
                        <c:otherwise>
                            <a class="page-link" href="/product/findAll?page=${paging.page-1}">[이전]</a>
                        </c:otherwise>
                    </c:choose>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <c:when test="${i eq paging.page}">
                    <li class="page-item active">
                        <a class="page-link">${i}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <c:choose>
                            <c:when test="${star eq 'star'}">
                                <a class="page-link" href="/product/findAllStar?page=${i}">${i}</a>
                            </c:when>
                            <c:otherwise>
                                <a class="page-link" href="/product/findAll?page=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link">[다음]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <c:choose>
                        <c:when test="${star eq 'star'}">
                            <a class="page-link" href="/product/findAllStar?page=${paging.page+1}">[다음]</a>
                        </c:when>
                        <c:otherwise>
                            <a class="page-link" href="/product/findAll?page=${paging.page+1}">[다음]</a>
                        </c:otherwise>
                    </c:choose>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>

<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>
<script>
    const starList = () => {
        location.href = "/product/findAllStar";
    }
</script>
</html>
