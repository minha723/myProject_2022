<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-14
  Time: 오후 1:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
    <style>
        .chat-container{
            margin: auto;
        }
    </style>
</head>
<body>

<div class="container chat-container">
    <div class="col-6">
        <label class="text-lg-center"><b>1:1 문의 채팅방</b></label>
    </div>
    <div>
        <div id="msgArea" class="col">
        </div>
        <div class="col-6">
            <div class="input-group mb-3">
                <input type="text" id="msg" class="form-control" aria-label="Recipient's username"
                       aria-describedby="button-addon2">
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" onclick="sendBtn()" type="button" id="button-send">전송</button>
                </div>
            </div>
        </div>
    </div>
    <div class="col-6">
    </div>
<button class="btn btn-sm align-self-center" onclick="closeChat()">문의 종료하기</button>
</div>
</body>
<script>

    const closeChat = () => {
        if(!confirm('문의를 종료하시면 채팅기록은 삭제됩니다. 종료하시겠습니까?')){
          // alert("아니오를 눌렀습니다.");
        }else {
         location.href="/";
        }
    }
    
    const sendBtn = () => {
        sendMessage();
        $('#msg').val('');
    }
    //
    // $("#button-send").click(function () {
    //     sendMessage();
    //     $('#msg').val('');
    // });

    let sock = new SockJS("http://localhost:8081/chatting/");
    sock.onmessage = onMessage;
    sock.onclose = onClose;
    sock.onopen = onOpen;

    // 메시지 전송
    function sendMessage() {
        let sender = '${sessionScope.loginClientId}';
        sock.send(sender + ": " + $("#msg").val());
        $('#msg').val('');
    }

    // 서버로부터 메시지를 받았을 때
    function onMessage(msg) {
        const data = msg.data;
        let str = ''
        let arr = data.split(":");
        let logId = '${sessionScope.loginClientId}';

        console.log(logId);

        if(logId == arr[0]){

        str = "<div class='col-6 text-md-end'>";
        str += "<div class='alert alert-secondary'>";
        str += "<b>" + data + "</b>";
        str += "</div></div>";

        }else{
            str = "<div class='col-6'>";
            str += "<div class='alert alert-warning'>";
            str += "<b>" + data + "</b>";
            str += "</div></div>";
        }

        $("#msgArea").append(str);

    }

    // 서버와 연결을   끊었을 때
    function onClose(evt) {
        $("#msgArea").append("연결 끊김");

    }

    function onOpen(evt) {
        let user = '${sessionScope.loginClientId}';
        let str = user + "님이 입장하셨습니다.";
        sock.send(str);
    }

</script>
</html>
