<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="登陆">
    <meta name="description" content="登陆界面">
    <title>登陆</title>
    <jsp:include page="/views/resources"/>
    <link rel='stylesheet' type="text/css" href="/css/login/login.css">
    <script src="/js/login/login.js"></script>
</head>
<body>
    <form class="content layui-form" method="post" target="_parent" enctype="multipart/form-data">
        <div class="text-center">
            <h3>登录</h3>
        </div>
        <div>
            <input type="text" class="layui-input" lay-verify="required|phoneOrEmail" placeholder="手机号/邮箱" id="accountNumber" value="15259207770">
        </div>
        <div>
            <input type="password" class="layui-input" lay-verify="required|pass"  placeholder="密码" id="password" value="disueb11">
        </div>
        <div>
            <button type="submit" lay-submit lay-filter="*" class="layui-btn layui-btn-sm" lay-event="*" style="width: 100%" >登录</button>
        </div>
        <div>
            <p class="text-muted text-center"> <a class="a" href="/views/changePassword">忘记密码了？</a> | <a class="a" href="/views/register">注册一个新账号</a>
        </div>
    </form>

<%@ include file="/WEB-INF/views/fixed/footer.jsp"%>
</body>
<script>
    layui.use('form',function () {
        var form = layui.form;

        form.on("submit(*)",function (data) {
            var accountNumber = $('#accountNumber').val(),
                password = $('#password').val();
            if(/^1\d{10}$/.test(accountNumber)){
                data={
                    phoneNumber:accountNumber,
                    password:password
                }
            }
            else {
                data={
                    mailbox:accountNumber,
                    password:password
                }
            }
            $.ajax({
                url:'/user/isLogin',
                data:data,
                type:'post',
                success:function (res) {
                    if(res.flag){
                        layer.msg("登录成功",{icon:1})
                        setTimeout(function () {
                            location.href='/views/home'
                        },1500)
                    }
                    else{
                        layer.msg(res.msg,{icon:2})
                    }
                }
            })
            return false;
        })

        //自定义表单验证
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
                    }
                }
            }
            //我们既支持上述函数式的方式，也支持下述数组的形式
            //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
        });
    })
</script>
</html>