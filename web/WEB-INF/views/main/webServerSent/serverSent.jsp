<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta type="text/html">
    <title>服务器发送</title>
    <jsp:include page="/views/resources"/>
    <style>
    </style>
</head>
<body>
<jsp:include page="/views/head"/>

<div>
    <div>
        <span>id：</span><span id="id"></span>
    </div>
    <div>
        <span>type：</span><span id="type"></span>
    </div>
    <div>
        <span>data：</span><span id="data"></span>
    </div>
</div>
</body>
<script>
    const id = document.getElementById("id");
    const type = document.getElementById("type");
    const data = document.getElementById("data");

    if(typeof EventSource !== "undefined"){
        let source=new EventSource("/serverSent/sentData");
        //建立连接事件
        source.addEventListener("open", function (e) {

        })

        source.addEventListener("message", function (e) {
            console.log(JSON.parse(e.data.toString()))
            id.innerText = e.lastEventId;
            type.innerText = e.type;
            data.innerText = e.data;
        })
    }
    else{
        alert("浏览器不支持EventSource！！！")
    }







/*    setInterval(function(){
        ++count_one;
        main.innerHTML = count_one;
    },500)
    setInterval(function(){
        ++count_two;
        worker.innerHTML = count_one;
    },500);*/



</script>
</html>