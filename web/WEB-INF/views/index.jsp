<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <script src="../js/base.js"></script>
    <style>
        body{
            overflow: hidden;
        }
        .content{
            width: 100%;
            height: 100%;
            border: 1px red solid;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .content-body{
            width: 300px;
            height: 300px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            background-color: #f1f1f1;
            border-radius: 10px;
            box-shadow: 10px 10px 5px #888888;
        }
        .content-body-text{
            width: 90%;
            display: flex;
            
        }
    </style>
</head>
<body>
<div>
    <a href="/book/query">book</a>
    <a href="/webURL/webURL">webURL</a>
</div>
<div class="content">
    <div class="content-body">
        <div class="content-body-text">
            <img src="../icon/account.svg">
            <input type="text">
        </div>
        <div class="content-body-text">
            <img src="../icon/password.svg">
            <input type="password">
        </div>
        <div class="content-body-bottom">

        </div>
    </div>

</div>


<script>
    /*location.href='/book/query'*/
</script>
</body>
</html>