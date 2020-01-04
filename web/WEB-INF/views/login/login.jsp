<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="登陆">
    <meta name="description" content="登陆界面">
    <title>登陆</title>
    <jsp:include page="/views/resources"/>
    <link rel='stylesheet' type="text/css" href="/css/login/loginRegister.css">
</head>
<body>
    <form class="content " id="loginForm" action="/login/login" method="post" target="_parent" enctype="multipart/form-data">
        <div class="text-center">
            <h3>登录</h3>
        </div>
        <div class="text-center">
            <input type="text" class="form-control" placeholder="手机号/邮箱" id="accountNumber" name="accountNumber">
        </div>
        <div class="text-center">
            <input type="password" class="form-control"  placeholder="密码" id="password" name="password">
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary"  style="width: 100%">登录</button>
        </div>
        <div>
            <p class="text-muted text-center"> <a class="a" href="/views/changePassword">忘记密码了？</a> | <a class="a" href="/views/register">注册一个新账号</a>
        </div>
    </form>
<script type="text/javascript" src="js/login/login.js" charset="UTF-8"></script>
</body>
</html>