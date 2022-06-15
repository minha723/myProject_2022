<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 2:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">

    <style>
        .card {
            max-width: 350px;
            margin: auto;
            text-align: center;
        }
    </style>
</head>
<body>

<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>


<div class="card">
    <div class="card-body bg-white mt-0 shadow">
        <span style="font-size: small">${client.clientName}님의 현재 잔여 포인트: ${client.clientPoint} 원</span>
        <p style="font-weight: bold">카카오페이 포인트 충전</p>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span> 5,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="10000"><span> 10,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="15000"><span> 15,000원</span></label><br>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="20000"><span> 20,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="25000"><span> 25,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="30000"><span> 30,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="35000"><span> 35,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="40000"><span> 40,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="50000"><span> 50,000원</span></label>
        <p style="color: #ac2925; margin-top: 30px; font-size: small">카카오페이의 최소 충전금액은 5,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p>
        <button type="button" class="btn btn-danger btn-lg btn-block btn-custom" id="charge_kakao">충 전 하 기</button>
    </div>
</div>

<script>
    $('#charge_kakao').click(function () {
        const IMP = window.IMP;
        IMP.init('imp08571709');
        const money = $('input[name="cp_item"]:checked').val();
        console.log(money);
        let msg = "";

        IMP.request_pay({
            pg: 'kakao',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '포인트 충전',
            amount: money,
            buyer_email: '${client.clientEmail}',
            buyer_name: '${client.clientName}',
            buyer_tel: '${client.clientMobile}',
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                $.ajax({
                    type: "POST",
                    url: "/client/point", //충전 금액값을 보낼 url 설정
                    data: {
                        "id": ${sessionScope.loginCId},
                        "clientPoint": money
                    },
                });
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
            document.location.href = "/client/detail?id=${client.id}"; //alert창 확인 후 이동할 url 설정
        });
    });
</script>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>

</html>
