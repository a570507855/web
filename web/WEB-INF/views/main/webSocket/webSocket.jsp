<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>聊天室</title>
    <jsp:include page="/views/resources"/>
    <style>
        #charBg{
            height: 700px;
            background-color: #000000ba;
        }
        textarea{
            background: none;
            border: none;
            outline: none;
            resize: none;
            font-family: 'DejaVu Sans Mono', monospace;
            font-size: 12px;
            color: #e0e0e0;
            width: 100%;
            padding: 1em;
            box-sizing: border-box;
            overflow-y: hidden;
        }
    </style>
</head>
<body>
<jsp:include page="/views/head"/>
    <div id="charBg" class="container xyy-text-box " style="">
        <div class="xyy-text-box" style="overflow-y: auto;height: 580px" id="chatRecord">
        </div>
        <div class="xyy-text-box" style="height: 100px;" >
            <textarea  id="chatinput" autocomplete="off" autofocus></textarea>
        </div>
    </div>
<jsp:include page="/views/footer"/>
</body>
<script>
    const url = "ws://localhost:8080/ws";
    const chatinput = document.getElementById("chatinput");
    const chatRecord = document.getElementById("chatRecord");
    const charBg = document.getElementById("charBg");
    let socket;
    let username = '${sessionScope.username}';

    window.addEventListener("load", function () {
        socket = new WebSocket(url);


        socket.addEventListener("open", open);

        socket.addEventListener("message", message);

        socket.addEventListener("close", close);

        socket.addEventListener("error", error);
    });

    chatinput.addEventListener("keydown", function (e) {
        if(e.key === "Enter"){
            if(chatinput.value === ''){
                e.preventDefault()
                return false
            }
            socket.send(JSON.stringify({
                "cmd":"chat",
                "text":chatinput.value
            }));
            chatRecord.innerHTML += "<p style='color: #FFFFFF'>" + username + "：" + chatinput.value + "</p>";
            chatinput.value = '';
            chatRecord.scrollTop = chatRecord.scrollHeight
            e.preventDefault()
        }

    });

    function open() {
        console.log("连接成功");
        let userdata = {
            cmd:'join',
            username:"${sessionScope.username}"
        }
        socket.send(JSON.stringify(userdata))
    }
    
    function message(msg) {
        if (typeof msg.data == "string") {
            console.log(msg.data);
        }
        else {
            alert("非文本消息");
            console.log(msg.data);
        }
    }
    
    function close() {
        console.log("连接关闭")
    }

    function error(e) {
        console.log(e)
    }

/*    webSocket.readyState
    WebSocket.CONNECTING    0, 正在连接
    WebSocket.OPEN          1, 连接成功
    WebSocket.CLOSING       2, 正在关闭
    WebSocket.CLOSED        3, 已经关闭*/

</script>
</html>
