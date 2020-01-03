
$().ready(function () {
    layui.use("layer",function () {

    })
    //表单验证
    $('#registerForm').validate({
        rules:{
            accountNumber:{
                required:true,
                remote:{
                    url: "/login/isRegister",
                    type: "post",
                    dataType: "json",
                    data: {
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
                url:'/login/isPass',
                type:'post',
                data:{
                    accountNumber:$('#accountNumber').val(),
                    password:$('#password').val()
                },
                success:function (res) {
                    res ? form.submit() : layer.msg("密码错误")
                }
            })
        },
        //debug:true,
        errorPlacement:function (error, element) {
            error.appendTo(element.parent());
        }
    })
})