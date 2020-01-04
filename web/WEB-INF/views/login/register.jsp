<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="注册">
    <meta name="description" content="注册界面">
    <title>注册</title>
    <jsp:include page="/views/resources"/>
    <link rel='stylesheet' type="text/css" href="/css/login/loginRegister.css">
</head>
<body class="xyy-body-bgColor">

<form class="content" action="/login/register" id="registerForm" method="post" onsubmit="return false;" target="_parent" enctype="multipart/form-data" autocomplete="new-password">
    <div class="text-center">
        <h3>注册</h3>
    </div>
    <div class="text-center">
        <input type="text" class="form-control" id="username" name="username" placeholder="用户名" autocomplete="off">
    </div>
    <div class="text-center">
        <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="手机号" autocomplete="new-password">
    </div>
    <div class="text-center">
        <input type="text" class="form-control" id="mailbox" name="mailbox" placeholder="邮箱" autocomplete="new-password">
    </div>
    <div class="text-center">
        <input type="text" class="form-control password" id="password" name="password" placeholder="密码" autocomplete="new-password">
    </div>
    <div class="text-center">
        <input type="text" class="form-control password" id="confirmPassword" name="confirmPassword" placeholder="再次确认密码" autocomplete="new-password">
    </div>
    <div class="text-center">
        <button type="submit" class="btn btn-primary"  style="width: 100%">注册</button>
    </div>
    <div>
        <p class="text-muted text-center">已经有账户了？| <a class="a" href="/views/login">点此登录</a>
    </div>
</form>
<script type="text/javascript" src="/js/login/register.js" charset="UTF-8"></script>
</body>
</html>