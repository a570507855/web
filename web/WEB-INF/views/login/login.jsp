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
    <style>
        label.error{

            color: #ea330b;
        }
    </style>
</head>
<body>

    <form class="content " id="loginForm" action="/user/login" method="post" target="_parent" enctype="multipart/form-data">
        <div class="text-center">
            <h3>登录</h3>
        </div>
        <div class="text-center">
            <input type="text" class="form-control" placeholder="手机号/邮箱" id="accountNumber" value="15259207770" name="accountNumber">
        </div>
        <div class="text-center">
            <input type="password" class="form-control"  placeholder="密码" id="password" name="password" value="disueb11">
        </div>
        <div>
            <button type="submit" class="btn btn-primary"  style="width: 100%">登录</button>
        </div>
        <div>
            <p class="text-muted text-center"> <a class="a" href="/views/changePassword">忘记密码了？</a> | <a class="a" href="/views/register">注册一个新账号</a>
        </div>
    </form>
</body>
<script>
    $().ready(function () {
        layui.use("layer",function () {

        })
        //表单验证
        $('#loginForm').validate({
            rules:{
                accountNumber:{
                    required:true,
                    remote:{
                        url: "user/isRegister",     //后台处理程序
                        type: "post",               //数据发送方式
                        dataType: "json",           //接受数据格式
                        data: {                     //要传递的数据
                            accountNumber: function() {
                                return $("#accountNumber").val();
                            }
                        }
                    }
                },
                password:{
                    required:true,
                }
            },
            messages:{
                accountNumber:{
                    required:"请输入手机号",
                    remote:"该账号未注册"
                },
                password:{
                    required:"请输入密码",
                }
            },
            submitHandler:function(form){
                $.ajax({
                    url:'/user/isPass',
                    type:'post',
                    data:{
                        accountNumber:$('#accountNumber').val(),
                        password:$('#password').val()
                    },
                    success:function (res) {
                        if(res){
                            form.submit();
                        }
                        else {
                            layer.msg("密码错误")
                        }
                    }
                })

            },
            //debug:true,
            errorPlacement:function (error, element) {
                error.appendTo(element.parent());
            },

        })
    })
</script>
</html>