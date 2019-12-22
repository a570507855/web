<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="注册">
    <meta name="description" content="注册界面">
    <title>注册</title>
    <link rel='stylesheet' type="text/css" href="/css/base.css">
    <link rel='stylesheet' type="text/css" href="/css/login/login.css">
    <script src="/js/login/login.js"></script>
    <script src="/js/base.js"></script>
</head>
<body>

<form class="register-content layui-form"  method="post" target="_parent" enctype="multipart/form-data">
    <div class="text-center">
        <h3>注册</h3>
    </div>
    <div class="tag">
        <div class="register-right text-center register-width"><b class="register click-this">手机号注册</b></div>
        <div class="text-center register-width"><b class="register not-click-color">邮箱注册</b></div>
    </div>
    <div>
        <input type="text" lay-verify="required|username" class="layui-input" placeholder="昵称" name="nickname">
    </div>
    <div>
        <input type="text" id="phone-email" class="layui-input" lay-verify="required|phone" placeholder="手机号" name="phoneNumber">
    </div>
    <div>
        <input type="password" class="layui-input" lay-verify="required|pass"  placeholder="密码" name="password">
    </div>
    <div>
        <input type="password" class="layui-input" lay-verify="required|passAgain"  placeholder="再次确认密码">
    </div>
    <div>
        <button type="submit" lay-submit lay-filter="*" class="layui-btn layui-btn-sm" lay-event="*" id="submit" style="width: 100%" >注册</button>
    </div>
    <div>
        <p class="text-muted text-center">已经有账户了？| <a class="a" href="/views/login">点此登录</a>
    </div>
</form>
</body>
<script>
    layui.use('form',function () {
        var form = layui.form

        form.on("submit(*)",function (data) {
            $.ajax({
                url:'/user/insert',
                data:data.field,
                type:'post',
                success:function (res) {
                    console.log(res)
                    if(res.flag){
                        layer.msg("注册成功",{icon:1,offset:['45%','45%']})
                        setTimeout(function () {
                            location.href='/views/login'
                        },3000)
                    }
                    else{
                        layer.msg("注册失败",{icon:2,offset:['45%','45%']})
                        setTimeout(function () {
                            location.href='/views/login'
                        },3000)
                    }
                }
            })
            return false
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
            ,passAgain:function (value, item) {
                var pass = $('input[name="password"]').val()
                if(value != pass){
                    return "两次输入的密码不一致"
                }
            }
        });
    })

    //注册方式切换
    $('.register').on('click',function () {
        if(!$(this).hasClass('click-this')){
            $('input').val('')
            $('.click-this').addClass('not-click-color')
            $('.register').removeClass('click-this')
            $(this).addClass('click-this')
            $(this).removeClass('not-click-color')
        }
        if($(this).html() == '手机号注册'){
            $('#phone-email').attr("placeholder", "手机号")
            $('#phone-email').attr("lay-verify", "required|phone")
            $('#phone-email').attr("name", "phoneNumber")
        }
        else {
            $('#phone-email').attr("placeholder", "邮箱")
            $('#phone-email').attr("lay-verify", "required|email")
            $('#phone-email').attr("name", "mailbox")
        }
    })
</script>
</html>