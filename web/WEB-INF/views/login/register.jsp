<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="注册">
    <meta name="description" content="注册界面">
    <title>注册</title>
    <jsp:include page="/views/resources"/>
    <link rel='stylesheet' type="text/css" href="/css/login/register.css">
    <script src="/js/login/register.js"></script>
</head>
<body>

<form class="content" id="registerForm" method="post" target="_parent" enctype="multipart/form-data" autocomplete="new-password">
    <div class="text-center">
        <h3>注册</h3>
    </div>
    <div class="tag">
        <div class="register-right text-center register-width"><b class="register click-this">手机号注册</b></div>
        <div class="text-center register-width"><b class="register not-click-color">邮箱注册</b></div>
    </div>
    <div class="text-center">
        <input type="text" class="form-control" placeholder="用户名" autocomplete="off">
    </div>
    <div class="text-center">
        <input type="text" id="phone-email"  class="form-control" name="phoneNumber" placeholder="手机号" autocomplete="off">
    </div>
    <div class="text-center">
        <input type="text" class="form-control password" name="password" placeholder="密码" autocomplete="off">
    </div>
    <div class="text-center">
        <input type="text" class="form-control password" placeholder="再次确认密码" autocomplete="off">
    </div>
    <div class="text-center">
        <button type="submit" class="btn btn-primary"  style="width: 100%">注册</button>
    </div>
    <div>
        <p class="text-muted text-center">已经有账户了？| <a class="a" href="/views/login">点此登录</a>
    </div>
</form>
</body>
<script>





       /* //自定义表单验证
        form.verify({
            username: function(value, item){ //value：表单的值、item：表单的DOM对象
                if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                    return '用户名不能有特殊字符';
                }
                if(/(^\_)|(\__)|(\_+$)/.test(value)){
                    return '用户名首尾不能出现下划线\'_\'';
                }
                if(/^\d+\d+\d$/.test(value)){
                    return '用户名不能全为数字';
                }
            }
            ,phoneOrEmail:function (value, item) {
                //如果全是数字则进行手机号判断
                if(/\D/.test(value)){
                    if(!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(value)){
                        return "邮箱格式不正确"
                    }
                }
                else{
                    if(!/^1\d{10}$/.test(value)){
                        return "请输入正确的手机号"
                    }||
                }
            }
            //我们既支持上述函数式的方式，也支持下述数组的形式
            //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
            ,passAgain:function (value, item) {
                var pass = $('input[name="password"]').val()
                if(value != pass){
                    return "两次输入的密码不一致"
                }
            }
        });*/


</script>
</html>