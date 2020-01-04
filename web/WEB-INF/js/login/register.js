
$().ready(function () {
    //表单验证
    $('#registerForm').validate({
        rules:{
            username:{
                required:true,
                maxlength:10,
                minlength:4,
                remote:{
                    url: "/login/usernameAccountNumberNotExist",
                    type: "post",
                    dataType: "json",
                    data: {
                        username: function() {
                            return $("#username").val();
                        },
                    }
                }
            },
            phoneNumber:{
                required:true,
                digits:true,
                maxlength:11,
                minlength:11,
                remote:{
                    url: "/login/usernameAccountNumberNotExist",
                    type: "post",
                    dataType: "json",
                    data: {
                        phoneNumber: function() {
                            return $("#phoneNumber").val();
                        }
                    }
                }
            },
            mailbox:{
                required:true,
                email:true,
                remote:{
                    url: "/login/usernameAccountNumberNotExist",
                    type: "post",
                    dataType: "json",
                    data: {
                        mailbox : function() {
                            return $("#mailbox").val();
                        }
                    }
                }
            },
            password:{
                required:true,
                maxlength:10,
                minlength:6,
            },
            confirmPassword:{
                required:true,
                equalTo:"input[name=password]"
            }
        },
        messages:{
            username:{
                required:"请输入用户名",
                remote:"用户名已存在"
            },
            phoneNumber:{
                required:"请输入手机号",
                remote:"已注册"
            },
            mailbox:{
                required:"请输入邮箱",
                remote:"已注册"
            },
            password:{
                required:"请输入密码",
            },
            confirmPassword:{
                required:"请输入确认密码",
                equalTo:"两次输入的密码不一致"
            }
        },
        submitHandler:function(form){
            form.submit()
        },
        //debug:true,
        errorPlacement:function (error, element) {
            error.appendTo(element.parent());
        },
        onfocusout:false,
        onkeyup:false,
        onclick:false,
    })

    //避免浏览器自动填充
    $('.password').on('input', function () {
        $(this).val() === '' ? this.type ="text" : this.type = "password";
    })
})