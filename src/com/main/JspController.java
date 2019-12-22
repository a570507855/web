package com.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("views")
public class JspController {

    //登录界面
    @RequestMapping("login")
    public String login(){
        return "login/login";
    }

    //注册界面
    @RequestMapping("register")
    public String register(){
        return "login/register";
    }

    //修改密码界面
    @RequestMapping("changePassword")
    public String changePassword(){
        return "login/changePassword";
    }

}
