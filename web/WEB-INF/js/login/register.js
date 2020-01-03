
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

    //避免浏览器自动填充
    $('.password').on('input', function () {
        $(this).val() === '' ? this.type ="text" : this.type = "password";
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
})