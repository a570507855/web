<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta type="text/html">
    <title>测试</title>
    <jsp:include page="/views/resources"/>
    <style>
    </style>
</head>
<body>
<jsp:include page="/views/head"/>
<div>
    <div >
        <label>主线程：</label><span id="main"></span>
    </div>
    <div >
        <label>worker：</label><span id="worker"></span>
    </div>
</div>
</body>
<script>
    const main = document.getElementById("main");
    const worker_html = document.getElementById("worker");
    let count = 0;


    if(typeof Worker !== "undefined"){
        let worker = new Worker("/js/worker.js");
        worker.addEventListener('message',function (e) {
            worker_html.innerText = e.data;
        });
        worker.addEventListener('error', function (e) {
            console.log('error:line ' + e.lineno + ' in ' + e.filename + ' : ' + e.message);
        });
    }
    else {
        console.log("浏览器不支持worker")
    }
    let source=new EventSource("/ceshi/serverSent");
    source.addEventListener("message", function (e) {
            console.log(e.data)
    })




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