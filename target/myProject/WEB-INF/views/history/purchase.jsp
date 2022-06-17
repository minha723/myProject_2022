<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: 오후 2:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    <style>
        .form-purchase {
            margin: auto;
            max-width: 650px;
            border: 1px solid darkgray;
            border-radius: 10px;
        }
        .table .ftd{
            width: 200px;
        }
        .form-purchase .table{
            caption-side: top;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="form-purchase">
    <table class="table">
        <caption class="text-center fw-bold">구매 페이지</caption>
        <tr>
            <td class="ftd">구매할 서비스: </td>
            <td>${product.productName}</td>
        </tr>
        <tr>
            <td>구매할 서비스 비용: </td>
            <td>${product.productPrice} 원 </td>
        </tr>
        <tr>
            <td>나의 포인트 조회: </td>
            <td class="input-group"><input id="pointResult" readonly> <button onclick="pointAmount()">조회</button> </td>
        </tr>
        <tr>
            <td>사용할 포인트 입력: </td>
            <td class="input-group"><input type="text" id="pointUse"><button onclick="pointUse()">사용</button> </td>
        </tr>
        <tr>
            <td>총 결제할 금액: </td>
            <td class="input-group"><input id="payAmount" readonly> </td>
        </tr>
    </table>
<p class="text-center"><a class="btn btn-secondary" onclick="pay()">결제</a></p>
</div>

<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>

<script>
    const pointAmount = () => {
        const pointResult = document.getElementById("pointResult");
        const id = '${sessionScope.loginCId}'

        $.ajax({
            type: "post",
            url: "/client/pointAmount",
            data: {
                "id": id,
            },
            dataType: "json",
            success: function (result) {
                pointResult.value = result.clientPoint;
            }, error: function () {
                alert("오타체크");
            }
        });
    }

    const pointUse = () => {
        const point = document.getElementById("pointResult").value;
        const pointUse = document.getElementById("pointUse").value;
        const payAmount = document.getElementById("payAmount");

        if (point >= pointUse) {
            payAmount.value = '${product.productPrice}' - pointUse;
        } else if (point < pointUse) {
            alert("포인트 부족");
        }
    }

    const pay = () => {
        const IMP = window.IMP;
        IMP.init('imp08571709');
        const pointUse = document.getElementById("pointUse").value;
        const paymentAmount = document.getElementById("payAmount").value;
        console.log(paymentAmount);

        IMP.request_pay({
                pg: 'kakao',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: '${product.productName}',
                amount: paymentAmount,
                buyer_tel: '${sessionScope.loginClientId}',
            }, function (rsp) {
                console.log(rsp);
                if (rsp.success) {
                    msg = '결제가 완료되었습니다.';
                    msg += '고유ID : ' + rsp.imp_uid;
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;

                    $.ajax({
                        type: "POST",
                        url: "/product/purchase", //충전 금액값을 보낼 url 설정
                        data: {
                            "id": ${product.id},
                        },
                    });

                    $.ajax({
                        type: "POST",
                        url: "/client/pointUse",
                        data: {
                            "id": '${sessionScope.loginCId}',
                            "clientPoint": pointUse,
                        },
                    });
                } else {
                    msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
                alert(msg);
                document.location.href = "/client/detail?id=${sessionScope.loginCId}"; //alert창 확인 후 이동할 url 설정

            }
        )
    }

</script>

</html>
